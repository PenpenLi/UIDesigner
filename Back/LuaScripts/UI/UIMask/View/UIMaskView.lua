---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by aaa.
--- DateTime: 2018/11/26 13:59
---

local UIMask = BaseClass("UIMask", UIBaseView)
local base = UIBaseView

local function OnCreate(self)
    base.OnCreate(self)
    self.canvas_group = UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.CanvasGroup),"BG")
end

local function ShowMask(self)
    self.canvas_group.alpha = 1
    self.timer = nil
end
local function OnEnable(self)
    base.OnEnable(self)
    self.canvas_group.alpha = 0
    self.timer = TimerManager:GetInstance():GetTimer(2, ShowMask , self,true)
    self.timer:Start()
end

local function OnDestroy(self)
    base.OnDestroy(self)
end

local function OnDisable(self)
    if self.timer ~= nil then
        self.timer:Stop()
        self.timer = nil
    end
end

UIMask.OnDisable = OnDisable
UIMask.OnCreate = OnCreate
UIMask.OnEnable = OnEnable
UIMask.OnDestroy = OnDestroy

return UIMask