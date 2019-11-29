---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/6/26 17:36
---

local UIExploreChapterWrapItem = BaseClass("UIExploreChapterWrapItem", UIWrapComponent)
local base = UIWrapComponent

local limitText_path="LimitObj/limitText";
local limitObj_path="LimitObj";
local select_bg_path="bgSelect";
local moto_img_path="motoImg";
-- 创建
local function OnCreate(self)
    base.OnCreate(self)
    self.titleName=self:AddComponent(UIText,"tagName");
    self.clickBtn=self:AddComponent(UIButton,"");
    self.selectBg=UIUtil.FindTrans(self.transform,select_bg_path);

    self.clickBtn:SetOnClick(function()
        if self.view.model.chapList[self.index].isOpen then
            UIManager:GetInstance():CloseWindow(UIWindowNames.UIExploreChapterList);
            UIManager:GetInstance():Broadcast(UIMessageNames.UI_MODEL_EXPLORE_CHANGE_CHAPTER,self.index);
        end
    end)
    self.limitText=self:AddComponent(UIText,limitText_path);
    self.limitObj=UIUtil.FindTrans(self.transform,limitObj_path);
    self.motoImg=UIUtil.FindTrans(self.transform,moto_img_path);
end

-- 组件被复用时回调该函数，执行组件的刷新
local function OnRefresh(self, real_index, check)
    self.index=real_index+1;
    self.selectBg.transform.gameObject:SetActive(self.view.model.curSelectChaId==self.index);
    self.motoImg.transform.gameObject:SetActive(self.view.model.curSelectChaId==self.index);
    self.titleName:SetText(self.view.model.chapList[self.index].name);
    self.limitObj.transform.gameObject:SetActive(not self.view.model.chapList[self.index].isOpen);
    if not self.view.model.chapList[self.index].isOpen then
        local chapIndex=math.floor((self.view.model.chapList[self.index].needLv/100)%100);
        local passLv=math.floor(self.view.model.chapList[self.index].needLv%100);
        local passType=math.floor(self.view.model.chapList[self.index].needLv/10000);--1=普通 2=困难
        local str=passType==1 and "普通" or "困难";
        self.limitText:SetText(string.format("通关%s%s-%s开启",str,chapIndex,passLv));
    end

end

UIExploreChapterWrapItem.OnCreate = OnCreate
UIExploreChapterWrapItem.OnRefresh = OnRefresh
return UIExploreChapterWrapItem