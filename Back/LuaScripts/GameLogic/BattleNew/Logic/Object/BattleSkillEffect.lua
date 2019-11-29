---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by guoyu.
--- DateTime: 2018/12/12 14:16
---

local BattleSkillEffect=BaseClass("BattleSkillEffect")

local function __init(self)
    --所处角色
    self.owner=nil
    --效果ID
    self.effectId=0
    --层数
    self.layer=0
    --持续时间
    self.lastTime=0
    ----触发接口
    --self.release=nil
    self.value = 0
    self.maxValue = 0
    --三连击血条效果
    self.majorEffect=false
    --是否是初始效果
    self.isInitEffect=false
end
--非buff效果
local function ReleaseHandler(serverEffect)
    --Time.timeScale=0.5
    local result = nil
    if serverEffect.typeId==1 then--伤害
        result = {type = serverEffect.typeId,hurt = serverEffect.hp,crit = serverEffect.isCrit,hurtType = serverEffect.hurtType,effectId = serverEffect.effectId,show = true, majorEffect = serverEffect.majorEffect}
    elseif serverEffect.typeId==2 then--治疗
        result = {type = serverEffect.typeId,hurt = serverEffect.hp,crit = serverEffect.isCrit,hurtType = serverEffect.hurtType,effectId = serverEffect.effectId,show = serverEffect.hp ~= 0, majorEffect = serverEffect.majorEffect}
    elseif serverEffect.typeId==3 then--恢复水晶
        result = {type = serverEffect.typeId,teamId = serverEffect.crytal.targetTeam,entityId = serverEffect.crytal.target,
                  crytalType = serverEffect.crytal.type,crytalCount = serverEffect.crytal.count,effectId = serverEffect.effectId,show = false}
    end
    return result
end


local function OnInit(self,owner,serverEffect,init)
    self.owner=owner
    self.effectId=serverEffect.effectId
    self.layer=serverEffect.layer
    self.lastTime=serverEffect.lastTime
    self.value = serverEffect.value
    self.maxValue = serverEffect.maxValue
    self.majorEffect = serverEffect.majorEffect
    if init then
        self.isInitEffect=true
    else
        self.isInitEffect=false
    end
end

local function SyncByServer(self,serverEffect)
    self.effectId=serverEffect.effectId
    self.layer=serverEffect.layer
    self.lastTime=serverEffect.lastTime
    self.value = serverEffect.value
    self.maxValue = serverEffect.maxValue
    self.majorEffect = serverEffect.majorEffect
    self.isInitEffect=false
end


BattleSkillEffect.__init=__init
BattleSkillEffect.OnInit=OnInit
BattleSkillEffect.SyncByServer=SyncByServer
BattleSkillEffect.ReleaseHandler = ReleaseHandler
return BattleSkillEffect