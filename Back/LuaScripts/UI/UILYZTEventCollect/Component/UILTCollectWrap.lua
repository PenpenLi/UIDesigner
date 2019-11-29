---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by aaa.
--- DateTime: 2019/10/17 19:51
---
local UILTCollectWrap = BaseClass("UILTCollectWrap", UIWrapComponent)
local base = UIWrapComponent
local function OnCreate(self)
    base.OnCreate(self)
    self.desc_name = self:AddComponent(UIText,"DescName")
    self.address_text = self:AddComponent(UIText,"Address/AddText")
    self.desc_text = self:AddComponent(UIText,"Desc/DescText")
    self.icon = self:AddComponent(UIImage,"Icon",AtlasConfig.DynamicTex)
end

local function OnRefresh(self, real_index)
    local data = self.view.model.event_list[real_index+1]
    if data ~= nil then
        self.desc_name:SetText(data.name)
        self.address_text:SetText(data.address)
        self.desc_text:SetText(data.desc)
        self.icon:SetSpriteName(data.icon)
    end
end

UILTCollectWrap.OnCreate = OnCreate
UILTCollectWrap.OnRefresh = OnRefresh
return UILTCollectWrap