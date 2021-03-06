---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by guoyu.
--- DateTime: 2018/12/12 16:42
---
local BattleGroup=require "GameLogic.BattleNew.Logic.Object.BattleGroup"
local BattleRole=require "GameLogic.BattleNew.Logic.Object.BattleRole"
local BattlePlayer=BaseClass("BattlePlayer")

local function __init(self)
    --所属战场
    self.OneBattle=nil
    --阵营ID
    self.Id=0
    --阵营类型
    self.playerType=0
    --所有组
    self.groups={}
    --当前波次
    self.waveCount=0
    --最大波次
    self.maxWaveCount=0
    --阵容数据
    self.teamInfo=nil
    --所有水晶{1,2,3}三类水晶
    self.Crytals=nil
    --是否清除
    self.isRelease=false
end


local function OnInit(self,OneBattle,playerType,Id,teamInfo)
    self.OneBattle=OneBattle
    self.playerType=playerType
    self.Id=Id
    self.teamInfo=teamInfo
    self.isRelease=false
    self.groups={}
    self.Crytals={0,0,0}
end

local function CreateWaveRoles(self)
    self.waveCount=self.waveCount+1
    local info=self.teamInfo[self.waveCount]
    --先设置守护灵  守护灵初始不需要生成模型
    if info.shl ~= nil then
        for k,v in ipairs(info.shl) do
            local battleGroup=BattleGroup.New()
            battleGroup:OnInit(v.position+1,self)
            table.insert(self.groups,battleGroup)
            local role=BattleRole.New()
            role:OnInit(v,battleGroup)
            battleGroup:SetGuardianRole(role)
        end
    end

    if info.jlr ~= nil then
        for k,v in ipairs(info.jlr) do
            local battleGroup= self:GetGroupById(v.position+1)
            if battleGroup == nil then
                battleGroup = BattleGroup.New()
                battleGroup:OnInit(v.position+1,self)
                table.insert(self.groups,battleGroup)
            end
            local role=BattleRole.New()
            role:OnInit(v,battleGroup)
            battleGroup:SetMainRole(role)
            --coroutine.start(function()
            --    --发送显示层生成角色
            --    self.OneBattle.battleMessage:Broadcast(BattleEnum.BattleMessage.ADD_ROLE_VIEW,role,true)
            --    role:ChangeState(BattleEnum.BattleRoleState.IDLE)
            --    battleGroup:ChangeRoleShowPosition()
            --end)
            coroutine.yieldstart(function()
                --发送显示层生成角色
                self.OneBattle.battleMessage:Broadcast(BattleEnum.BattleMessage.ADD_ROLE_VIEW,role,true)
                role:ChangeState(BattleEnum.BattleRoleState.IDLE)
                battleGroup:ChangeRoleShowPosition()
                return coroutine.yieldbreak()
            end)
        end
    end

    return coroutine.yieldbreak()
end
--获取阵营战斗角色
local function GetBattleRoles(self)
    local roles={}
    for k,v in pairs(self.groups) do
        table.insert(roles,v.battleRole)
    end
    return roles
end

--获取所有角色
local function GetAllRoles(self)
    local roles={}
    for k,v in pairs(self.groups) do
        if v.mainRole~=nil then
            table.insert(roles,v.mainRole)
        end
        if v.guardianRole~=nil then
            table.insert(roles,v.guardianRole)
        end
    end
    return roles
end

local function GetGroupById(self,groupId)
    local group=nil
    for k,v in pairs(self.groups) do
        if v.groupId==groupId then
            group=v
        end
    end
    return group
end


--根据ID获取角色
local function GetRoleById(self,id)
    local role=nil
    --Logger.Log("阵营group数量"..table.count(self.groups))
    for k,v in pairs(self.groups) do
        --Logger.Log("阵营group Id"..v.groupId)
        if v:GetRoleById(id)~=nil then
            role=v:GetRoleById(id)
        end
    end
    return role
end
--根据寄灵人ID获取守护灵
local function GetGuardById(self,id)
    local role=nil
    --Logger.Log("阵营group数量"..table.count(self.groups))
    for k,v in pairs(self.groups) do
        --Logger.Log("阵营group Id"..v.groupId)
        if v:GetRoleById(id)~=nil then
            if v.guardianRole ~= nil then
                return v.guardianRole
            else
                return v.initGuardData
            end
        end
    end
    return role
end

--操作水晶
local function OpreateCrytals(self,type,count)
    if self.Crytals[type] ~= nil then
        self.Crytals[type]=self.Crytals[type]+count
    end
end

local function SetCrytalsTotal(self,type,count)
    self.Crytals[type]=count
end

local function Update(self)

    for i=table.count(self.groups),1,-1 do
        self.groups[i]:Update()

    end
end

local function isAllGroupCanBeAttacked(self)
    local bol=true
    for k,v in pairs( self.groups) do
        if v.state==BattleEnum.BattleGroupState.CANTBEATTACKED then
            bol=false
            break
        end
    end

   return bol
end


local function OnDestroy(self)
    for i = #self.groups, 1,-1 do
        self.groups[i]:OnDestroy()
    end

    self.groups={}
end

local function GetLiveRoleCount(self)
    local roles = self:GetAllRoles()
    local liveRoleCount=0
    for k,v in pairs(roles) do
        if v.currentHp>0 then
            liveRoleCount=liveRoleCount+1
        end
    end
    return liveRoleCount
end

BattlePlayer.__init=__init
BattlePlayer.OnInit=OnInit
BattlePlayer.Update=Update
BattlePlayer.CreateWaveRoles=CreateWaveRoles
BattlePlayer.GetGuardById = GetGuardById
BattlePlayer.OnDestroy=OnDestroy
BattlePlayer.GetBattleRoles=GetBattleRoles
BattlePlayer.GetRoleById=GetRoleById
BattlePlayer.SetCrytalsTotal = SetCrytalsTotal
BattlePlayer.OpreateCrytals=OpreateCrytals
BattlePlayer.GetGroupById=GetGroupById
BattlePlayer.GetAllRoles=GetAllRoles
BattlePlayer.GetLiveRoleCount = GetLiveRoleCount
BattlePlayer.isAllGroupCanBeAttacked=isAllGroupCanBeAttacked
return BattlePlayer