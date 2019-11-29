---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/5/27 16:54
---

local LuglCardItemNew = BaseClass("LuglCardItemNew", UIWrapComponent);
local base = UIBaseContainer;

local function OnCreate(self)
    base.OnCreate(self);
    self.icon=self:AddComponent(UIImage,"CardHead/IconImg",AtlasConfig.DynamicTex);
    self.qualityImg=self:AddComponent(UIImage,"CardHead/QualityImg",AtlasConfig.DynamicTex);
    self.lvText=self:AddComponent(UIText,"CardHead/getObj/LevelText");
    self.frame=self:AddComponent(UIImage,"CardHead/Frame",AtlasConfig.DynamicTex);
    self.crystalBg=self:AddComponent(UIImage,"CardHead/getObj/Crystal",AtlasConfig.DynamicTex);
    self.crystalIcon=self:AddComponent(UIText,"CardHead/getObj/Crystal/CrystalNum");
    self.starGroup=self:AddComponent(UIBaseContainer,"CardHead/getObj/Star");
    self.haveObj=UIUtil.FindTrans(self.transform,"CardHead/getObj");
    self.notHaveText=self:AddComponent(UIText,"CardHead/TipText");
    self.notHaveText:SetText(DataUtil.GetClientText(100125));
    self.grayMat=self.icon:GetMat();
    self.starList={};
    local starCount=self.starGroup.transform.childCount;
    for i = 0, starCount-1 do
        local singleStarImg=self.starGroup:AddComponent(UIImage,i,AtlasConfig.DynamicTex);
        table.insert(self.starList,singleStarImg);
    end
end

--刷新
local function OnRefresh(self,real_index, check)
    local index=real_index+1;
    local dataList=self.view.cardType==1 and self.view.singlePassData.jlrCardRange or self.view.singlePassData.shlcardRange;
    local boxData=dataList[index];
    self.icon:SetSpriteName(boxData.icon);
    self.qualityImg:SetSpriteName(boxData.qualityImg);
    self.frame:SetSpriteName(boxData.frame);
    --self.isHaveObj.gameObject:SetActive(boxData.isHave==0);
    self.crystalBg:SetSpriteName(SpriteDefine:GetCrystalIconByType(boxData.crystalType));
    self.crystalIcon:SetText(math.floor(boxData.crystalNum));
    self.crystalBg.gameObject:SetActive(boxData.cardType==2);
    self.lvText:SetText(string.format("Lv%s",math.modf(boxData.lv))) ;
    self.haveObj.transform.gameObject:SetActive(boxData.isHave~=0);
    self.notHaveText.transform.gameObject:SetActive(boxData.isHave==0);
    UIUtil.SetHeroStar(1,self.starList);
    if boxData.isHave==0 then
        self.icon:SetMat(self.grayMat);
        self.qualityImg:SetMat(self.grayMat);
        self.frame:SetMat(self.grayMat);
    else
        self.icon:SetMat(nil);
        self.qualityImg:SetMat(nil);
        self.frame:SetMat(nil);
    end
end
LuglCardItemNew.OnCreate=OnCreate;
LuglCardItemNew.OnRefresh=OnRefresh;
return LuglCardItemNew;