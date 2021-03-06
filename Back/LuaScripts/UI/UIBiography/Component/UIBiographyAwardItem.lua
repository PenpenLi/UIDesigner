---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2019/9/10 20:19
---
local UIBiographyAwardItem = BaseClass("UIBiographyAwardItem", UIWrapComponent)
local base = UIWrapComponent

local StaticItemData = DataUtil.GetData("item")

local function OnCreate(self)
    base.OnCreate(self)
    self.frame_Img =self:AddComponent(UIImage,"Image",AtlasConfig.DynamicTex)
    self.icon_Img = self:AddComponent(UIImage,"Image/icon",AtlasConfig.DynamicTex)
    self.count_Text = self:AddComponent(UIText,"Image/num")
    self.info_iconPress=self:AddComponent(UIEventTrigger,"Image")
    self.info_iconPress:SetOnLongPress(function()
        UIManager:GetInstance():OpenWindow(UIWindowNames.UIItemTips,self.data.Id)
    end,(function()
        UIManager:GetInstance():CloseWindow(UIWindowNames.UIItemTips)
    end),true)
end

-- 组件被复用时回调该函数，执行组件的刷新
local function OnRefresh(self, real_index, check)
    self.realIndex=real_index + 1;
    self.cardID = BiographyData:GetInstance()._cardIdGroup[self.view.selectLeftIndex]
    self.data = BiographyData:GetInstance()._data[self.cardID][self.view.lookLevelIndex].KeyDropShow[self.realIndex]
    self.icon_Img:SetSpriteName(StaticItemData[self.data.Id].Icon)
    self.count_Text:SetText(self.data.Desc)
    self.frame_Img:SetSpriteName(SpriteDefine:GetItemQualityFrameByType(StaticItemData[self.data.Id].Quality))
end

UIBiographyAwardItem.OnCreate = OnCreate
UIBiographyAwardItem.OnRefresh = OnRefresh

return UIBiographyAwardItem