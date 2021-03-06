---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ljl.
--- DateTime: 2019/6/5 11:49
---
local UINewArtifactItem=BaseClass("UINewArtifactItem",UIWrapComponent)
local base = UIWrapComponent

local function OnCreate(self)
    base.OnCreate(self)
    --组建初始化
    self.icon_img = self:AddComponent(UIImage, "Icon", AtlasConfig.DynamicTex)
    self.frame_img = self:AddComponent(UIImage, "", AtlasConfig.DynamicTex)
    self.gray = self.frame_img:GetMat()
    self.btn = self:AddComponent(UIButton, "")
    self.btn:SetOnClick(function ()
       if self.single_data.art_state == 0 then
           local lv = ArtifactsData:GetInstance():GetArtUnLockInfo(self.single_data.art_id)
           if lv ~= nil then
               UISpecial:GetInstance():UITipText(string.format(DataUtil.GetClientText(100255),lv))
           end
           return
        end
        LJAudioManger:GetInstance():PlayVoice("UI_CommonClick")
        self.view.SetBodyDataList(self.view,self.transform,self.single_data,true)
    end)
    self.lockText = self:AddComponent(UIText, "Locked")
    self.redPoint = UIUtil.FindTrans(self.transform,"redPoint")
    self.lvObj = UIUtil.FindTrans(self.transform,"Level")
    self.lvText = self:AddComponent(UIText,"Level/LvText")
    self.maxText = self:AddComponent(UIText,"Level/MaxText")

end

-- 组件被复用时回调该函数，执行组件的刷新
local function OnRefresh(self,real_index)
   local data=self.view.artifact_data[real_index+1]
    if data==nil then
        return
    end
    self.single_data = data
    self.redPoint.gameObject:SetActive(ArtifactsData:GetInstance():GetArtifactRedPoint(data.art_fact_bodyList))
    self.lvObj.gameObject:SetActive(data.art_now_level ~= 0)
    self.lvText:SetText(data.art_now_level)
    self.icon_img:SetSpriteName(data.art_icon)
    self.frame_img:SetSpriteName(data.art_frame)
    self.lockText.gameObject:SetActive(data.art_state == 0)
    self.maxText.gameObject:SetActive(data.art_now_level == data.art_max_level)
    if data.art_now_level ~= 0 then
        self.icon_img:SetMat(nil)
        self.frame_img:SetMat(nil)
    else
        self.icon_img:SetMat(self.gray)
        self.frame_img:SetMat(self.gray)
    end
end

UINewArtifactItem.OnCreate = OnCreate
UINewArtifactItem.OnRefresh=OnRefresh

return UINewArtifactItem