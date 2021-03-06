---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ljl.
--- DateTime: 2019/2/26 19:52
---
local TaskChildTabItem = BaseClass("TaskChildTabItem", UIBaseContainer)
local base = UIBaseContainer


local function OnCreate(self)
    base.OnCreate(self)
    self.select_Text = self:AddComponent(UIText,"Text")
    self.select_btn = self:AddComponent(UIButton,"")
    self.select_btn:SetOnClick(function ()
        LJAudioManger:GetInstance():PlayVoice("UI_CommonClick")
        self.view.OnClickSetAchievementData(self.view,self.transform,self.bodyData)
    end)
end

--刷新
local function Refresh(self,bodyData)
    self.bodyData=bodyData
    if bodyData == nil then
        return
    end
    self.select_Text:SetText(bodyData.name)
end
TaskChildTabItem.OnCreate=OnCreate
TaskChildTabItem.Refresh=Refresh
return TaskChildTabItem