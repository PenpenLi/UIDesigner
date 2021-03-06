---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ZYC.
--- DateTime: 2019/6/12 20:08
---
local BattlePlayerManager = require "GameLogic.BattleNew.Logic.Manager.BattlePlayerManager"
local StoryOneBattle = BaseClass("StoryOneBattle")
local BattleRole=require "GameLogic.BattleNew.Logic.Object.BattleRole"
local function __init(self)
    --阵营的管理
    self.battlePlayerManager = nil
    --事件的管理
    self.battleMessage = nil
    --网络层管理
    self.netManager = nil
    --当前的回合
    self.round = 0
    --剧情触发器,在BattleProxy中创建
    self.storyTrigger = nil
end


--根据服务器消息回合前恢复水晶
local function ConvertCrytals(self, Packages)
    --同步角色状态
    local _actionFront = Packages.actionFront
    if _actionFront ~= nil and not _actionFront._is_null then
        local actionTargets = {}
        for k, v in ipairs(_actionFront) do
            local battleRole = self.battlePlayerManager:GetRoleByTeamAndId(v.teamId, v.entityId)
            local bloodView,effectView = battleRole:SyncByServerChange(v)
            if effectView ~= nil and #effectView > 0 then
                table.insert(actionTargets,{effect = effectView,teamId = v.teamId,entityId = v.entityId})
            end
        end
        self.battleMessage:Broadcast(BattleEnum.BattleMessage.NOTIFYPLAYSKILLEFFECT,actionTargets)
    end

    local addCrytal = { 0, 0, 0 }
    if Packages.crytal ~= nil then
        for k, v in ipairs(Packages.crytal) do
            addCrytal[v.type] = v.count
        end
    end

    if self.battlePlayerManager:isMineAttack() then
        --打开战斗UI
        local tempData = {}
        if Packages.crytalTotal ~= nil then
            for k, v in ipairs(Packages.crytalTotal) do
                self.battlePlayerManager.player1:SetCrytalsTotal(v.type,v.count)
                tempData[v.type] = v.count - addCrytal[v.type]
            end
        end
        self.battleMessage:Broadcast(BattleEnum.BattleMessage.NOTIFYROUNDDATATOUI, 1,nil,{cur = tempData,add = addCrytal})
    else
        local tempData = {}
        if Packages.crytalTotal ~= nil then
            for k, v in ipairs(Packages.crytalTotal) do
                self.battlePlayerManager.player2:SetCrytalsTotal(v.type,v.count)
                tempData[v.type] =v.count
            end
        end
        self.battleMessage:Broadcast(BattleEnum.BattleMessage.NOTIFYROUNDDATATOUI, 2,tempData)
        --self.netManager:SendPveActionRequest(self.battlePlayerManager.attackPlayer.Id,false,nil)
    end
end



--收到选择技能结果
local function ChooseSkillResponse(self, choose)
    local cryChangeMine = { ["reduce"] = {}, ["add"] = {} }
    local cryChangeEnemy = { ["reduce"] = {}, ["add"] = {} }
    local cryType = 0
    local success = 0
    for k, v in ipairs(choose) do
        --消耗水晶
        cryType = v.type

        if not v.cost._is_null then
            local player = self.battlePlayerManager:GetPlayerById(v.cost.teamId)
            player:OpreateCrytals(v.cost.type, -v.cost.count)
            if player.playerType == BattleEnum.BattlePlayerType.MINE then
                if cryChangeMine.reduce[v.cost.type] ~= nil then
                    cryChangeMine.reduce[v.cost.type] = cryChangeMine.reduce[v.cost.type] + v.cost.count
                else
                    cryChangeMine.reduce[v.cost.type] = v.cost.count
                end
            elseif player.playerType == BattleEnum.BattlePlayerType.ENEMY then
                if cryChangeEnemy.reduce[v.cost.type] ~= nil then
                    cryChangeEnemy.reduce[v.cost.type] = cryChangeEnemy.reduce[v.cost.type] + v.cost.count
                else
                    cryChangeEnemy.reduce[v.cost.type] = v.cost.count
                end
            end
        end
        --获得水晶
        if not v.crytalInSkill._is_null and table.ProtoRepeatedCount(v.crytalInSkill) > 0 then
            for j, z in ipairs(v.crytalInSkill) do
                local player = self.battlePlayerManager:GetPlayerById(z.teamId)
                player:OpreateCrytals(z.type, z.count)
                if player.playerType == BattleEnum.BattlePlayerType.MINE then
                    if cryChangeMine.add[z.type] ~= nil then
                        cryChangeMine.add[z.type] = cryChangeMine.add[z.type] + z.count
                    else
                        cryChangeMine.add[z.type] = z.count
                    end
                elseif player.playerType == BattleEnum.BattlePlayerType.ENEMY then
                    if cryChangeEnemy.add[z.type] ~= nil then
                        cryChangeEnemy.add[z.type] = cryChangeEnemy.add[z.type] + z.count
                    else
                        cryChangeEnemy.add[z.type] = z.count
                    end
                end
                if math.abs(z.count) > 0 then
                    success = 1
                end
            end
        end
    end

    --通知UI水晶改变
    local cryChangeData = { cryChangeMine, cryChangeEnemy, cryType, success }
    self.battleMessage:Broadcast(BattleEnum.BattleMessage.NOTIFYUICRYCHANGE, cryChangeData)

end

--获取StoryOneBattle中的战斗数据
local function PveAction(self, Packages)
    local skill_choose = Packages.choose
    if skill_choose ~= nil and not skill_choose._is_null and not self.battlePlayerManager:isMineAttack() then
        ChooseSkillResponse(self,skill_choose)
    end
    --组装显示层用的数据
    local action_data = {}
    local roundAction = Packages.roundAction
    if roundAction ~= nil and not roundAction._is_null then
        for i, v in ipairs(roundAction) do
            local battleRole = self.battlePlayerManager:GetRoleByTeamAndId(v.teamId,v.entityId)
            if v.actionType == 0 then
                local role= BattleRole.New()
                role:OnInit(v.callGuardian,battleRole.group)
                battleRole.group:CallGuardianRole(role)

                local tempTargets = {}
                for _, q in ipairs(v.callOthers) do
                    local tRole = self.battlePlayerManager:GetRoleByTeamAndId(q.teamId,q.entityId)
                    local bloodView,effectView = tRole:SyncByServerChange(q)
                    table.insert(tempTargets,{blood = bloodView,effect = effectView,teamId = q.teamId,entityId = q.entityId})
                end
                table.insert(action_data,{call = {teamId = role.teamId,entityId = role.entityId,data = role},
                                          teamId = v.teamId,entityId = v.entityId,type = 0,effectTargets = tempTargets})
            elseif v.actionType == 1 then
                local actSkill = v.actionSkill
                local tempCases = {}
                for m, n in ipairs(actSkill.cases) do
                    local tempTargets = {}
                    for _, q in ipairs(n.targets) do
                        local tRole = self.battlePlayerManager:GetRoleByTeamAndId(q.teamId,q.entityId)
                        local bloodView,effectView = tRole:SyncByServerChange(q)
                        table.insert(tempTargets,{blood = bloodView,effect = effectView,teamId = q.teamId,entityId = q.entityId,isUse = false})
                    end
                    table.insert(tempCases,tempTargets)
                end
                --检测是不是守护灵大招
                local isGuaidSkill = false
                if battleRole ~= nil and not battleRole:CheckIsMainRole() then
                    local skill_static = DataUtil.GetData("skill")
                    if skill_static[actSkill.skillId] ~= nil and skill_static[actSkill.skillId].SkillType == 1 then
                        isGuaidSkill = true
                    end
                end
                table.insert(action_data,{skillId = actSkill.skillId,doubleHit = actSkill.doubleHit,cases = tempCases,type = 1,
                                          teamId = v.teamId,entityId = v.entityId,isGuaidSkill = isGuaidSkill,intervener = actSkill.intervener})
            end
        end
    end
    local endTargets = nil
    local actionEnd = Packages.actionEnd
    if actionEnd ~= nil and not Packages.actionEnd._is_null then
        endTargets = {}
        for i, v in ipairs(Packages.actionEnd) do
            local tRole = self.battlePlayerManager:GetRoleByTeamAndId(v.teamId,v.entityId)
            local bloodView,effectView = tRole:SyncByServerChange(v)
            if effectView ~= nil and #effectView > 0 then
                table.insert(endTargets,{effect = effectView,teamId = v.teamId,entityId = v.entityId})
            end
        end
    end
    self.battlePlayerManager:CheckBattleRoleDead()
    if self.storyOver then
        self.isEnd = Packages.isEnd
    else
        self.localEnd = Packages.isEnd
    end
    self:ChangeRoundState(BattleEnum.BattleRoundState.ROUNDBATTLE)
    self.battleMessage:Broadcast(BattleEnum.BattleMessage.PVE_ACTION_PLAY, action_data,endTargets,self.battlePlayerManager:isMineAttack(),Packages.settlement,self.round)
end


--发送使用技能
local function SendPveActionRequest(self, data)
    if self.currentRoundState == BattleEnum.BattleRoundState.ROUNDFRONT then
        self.netManager:SendPveActionRequest(self.round,Bind(self,PveAction))
    end
end



--当有角色进行点击时,获取这个角色的所有信息
local function OnSomeOneOnClick(self, teamId, entityId)
    local role = self.battlePlayerManager:GetRoleByTeamAndId(teamId, entityId)
    local data = {}
    data.id = role.entityId
    data.level = role.level
    data.currentHp = role.currentHp
    data.skill = {}
    for k, v in pairs(role.skills) do
        data.skill[k] = { v.skillId, v.crytalType, v.crytalCount, v.level }
    end
    self.battleMessage:Broadcast(BattleEnum.BattleMessage.NOTIFYUIROLEDATA, data)
end


--为方法添加监听
local function AddEventListener(self)
    self.battleMessage:AddListener(BattleEnum.BattleMessage.NOTIFYGETROLEDATA, OnSomeOneOnClick, self)
    self.battleMessage:AddListener(BattleEnum.BattleMessage.NOTIFYBATTLESTART, SendPveActionRequest, self)
end
--移除方法的监听
local function RemoveEventListener(self)
    self.battleMessage:RemoveListener(BattleEnum.BattleMessage.NOTIFYGETROLEDATA,OnSomeOneOnClick)
    self.battleMessage:RemoveListener(BattleEnum.BattleMessage.NOTIFYBATTLESTART, SendPveActionRequest)
end

local function OnInit(self, battleMessage, myTeam, myGuard, battlePackages, netManager, storyTrigger,storyOver)
    self.round = 1
    self.battleMessage = battleMessage
    self.netManager = netManager
    self.storyTrigger = storyTrigger
    AddEventListener(self)

    self.battlePlayerManager = BattlePlayerManager.New()
    self.battlePlayerManager:OnInit(self, myTeam, myGuard, battlePackages,battlePackages.enemyTeam)
    self.storyOver = storyOver
end

--开始触发剧情
local function CoTryTriggerStory(self, msgId, posId,func)
    --触发剧情
    coroutine.start(function()
        if self.storyTrigger ~= nil and self.storyTrigger:CanTrigger(msgId) then
            local msgParam = {
                msgId = msgId,
                round = self.round,
                posId = posId
            }
            local res = self.storyTrigger:CoTrigger(msgParam)
            if res then
                --等待一帧后开始剧情播放
                coroutine.waitforframes(1)
                self.storyTrigger:CoPlayStory()
            end
        end
        if func ~= nil then
            func()
        end
    end)
end
--改变状态
local function ChangeRoundState(self,state)
    self.currentRoundState = state
    if self.currentRoundState == BattleEnum.BattleRoundState.ROUNDFRONT then
        CoTryTriggerStory(self,3,nil,function()
            self.netManager:SendConvertCrytalsRequest(self.round,Bind(self,ConvertCrytals))
        end)
    elseif self.currentRoundState == BattleEnum.BattleRoundState.ROUNDBATTLE then

    elseif self.currentRoundState == BattleEnum.BattleRoundState.ROUNDEND then
        --战斗结束执行下一关
        if self.localEnd then
            UIManager:GetInstance():Broadcast(UIMessageNames.UIBATTLE_RESET_ENTER)
            return
        end
        CoTryTriggerStory(self, 4, nil,function()
            self.battlePlayerManager:ChangeAttacker()
            self.round = self.round + 1
            self:ChangeRoundState(BattleEnum.BattleRoundState.ROUNDFRONT)
        end)
    end
end
--开始战斗
local function BeginBattle(self)
    CoTryTriggerStory(self, 1, -1,function()
        ChangeRoundState(self,BattleEnum.BattleRoundState.ROUNDFRONT)
    end)
end

local function OnDestroy(self)
    self.battlePlayerManager:OnDestroy()
    RemoveEventListener(self)
end

StoryOneBattle.__init = __init
StoryOneBattle.OnInit = OnInit
StoryOneBattle.OnDestroy = OnDestroy
StoryOneBattle.SendPveActionRequest = SendPveActionRequest
StoryOneBattle.BeginBattle = BeginBattle
StoryOneBattle.ChangeRoundState = ChangeRoundState
StoryOneBattle.CoTryTriggerStory = CoTryTriggerStory
return StoryOneBattle