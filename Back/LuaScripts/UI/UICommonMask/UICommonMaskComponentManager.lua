---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/2/23 9:55
---

local UICommonMaskComponentManager = BaseClass("UICommonMaskComponentManager", Singleton)
local delay_timer = 1
--创建公用的动效遮罩预设
local function CreatCommonEffectMask(self,_parent_trans,_windowName)
    --首先查找对象是否存在，不存在就创建一个
    if IsNull(self.GameObject) then
        self.GameObject =  CS.UnityEngine.GameObject("UIEffectMask",typeof(CS.UnityEngine.UI.Image));
    end
    self.GameObject:SetActive(true)
    --同一个窗口重复开启
    if self.windowName == nil or self.windowName ~= _windowName then
        self.rectTrans = UIUtil.FindComponent(self.GameObject,typeof(CS.UnityEngine.RectTransform));
        self.windowName = _windowName

        self.GameObject.transform:SetParent(_parent_trans.transform);
        if self.imagemask ~= nil then
            self.parent_trans:RemoveComponent("UIEffectMask")
        end
        self.imagemask = nil
        self.parent_trans = _parent_trans
        self.imagemask = self.parent_trans:AddComponent(UIImage, "UIEffectMask")
    end
    if IsNull(self.rectTrans) then
        self.rectTrans = UIUtil.FindComponent(self.GameObject,typeof(CS.UnityEngine.RectTransform));
    end
    self.rectTrans.anchorMin = Vector2.New(0,0);
    self.rectTrans.anchorMax = Vector2.New(1,1);
    self.rectTrans.pivot = Vector2.New(0.5,0.5);
    self.rectTrans.anchoredPosition3D = Vector3.New(0,0,0);
    self.rectTrans.sizeDelta = Vector2.New(0,0);
    self.rectTrans.localScale = Vector3.New(1,1,1);

    self.imagemask:SetColor32(0,0,0)
    self.imagemask:SetAlphaVal(1)
    LuaTweener.UIFadeTo(self.imagemask,1,0,delay_timer,EaseFormula.OutQuad,function (image)
        if image and  not IsNull(image.gameObject) then
            image.gameObject:SetActive(false)
        end
    end)
end
local function OnDestroy(self)
    if not IsNull(self.GameObject) then
        CS.UnityEngine.GameObject.Destroy(self.GameObject)
    end
    self.GameObject = nil
    self.windowName = ""
    self.rectTrans = nil
    self.imagemask = nil
end
UICommonMaskComponentManager.CreatCommonEffectMask=CreatCommonEffectMask;
UICommonMaskComponentManager.OnDestroy=OnDestroy;
return UICommonMaskComponentManager;
