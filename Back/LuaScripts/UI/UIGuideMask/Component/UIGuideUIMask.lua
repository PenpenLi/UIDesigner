---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by aaa.
--- DateTime: 2019/10/27 16:43
---
local UIGuideUIMask = BaseClass("UIGuideUIMask", UIBaseContainer)
local base = UIBaseContainer

local function OnCreate(self)
    base.OnCreate(self)
    -- 初始化各个组件
    self.bg = self:AddComponent(UIButton,"Bg")
    self.bg:SetOnClick(function()
        if self.load_extra then
            return
        end
        if self.mask_type == 1 and not self.data.hide_finger then
            if self.mask_func then
                self.mask_func()
            end
        else
            if self.btn_func then
                self.btn_func()
            end
        end
    end)

    local layer =  UIManager:GetInstance():GetLayer(UILayers.InfoLayer.Name)
    local rect=UIUtil.FindComponent(layer.transform,typeof(CS.UnityEngine.RectTransform))
    self.sceen_width =rect.sizeDelta.x
    self.sceen_height = rect.sizeDelta.y

    self.img = UIUtil.FindImage(self.transform,"MaskPic")
    self.click_box = self:AddComponent(UIButton,"Click")
    self.click_box:SetOnClick(function()
        if self.load_extra then
            return
        end
        if self.btn_func then
            self.btn_func()
        end
    end)
end


local function GetSkillClickPath(index)
    --获得教学关卡 技能对应点击位置
    local Str="UIRoot/NormalLayer/UIBattleIn/ReadyPage/RoleInfoModule/"
    if index<=3 then
        if index==1 then
            return Str.."Role1/Role1_Hero/Role1_Hero_Icon"
        else
            local num=index-1
            return Str.."Role1/Role1_Btn"..num.."/Role1_Btn"..num.."_Icon"
        end
    elseif index>3 and index<=6 then
        if index==4 then
            return Str.."Role2/Role2_Hero/Role2_Hero_Icon"
        else
            local num=index-4
            return Str.."Role2/Role2_Btn"..num.."/Role2_Btn"..num.."_Icon"
        end
    else
        if index==7 then
            return Str.."Role3/Role3_Hero/Role3_Hero_Icon"
        else
            local num=index-7
            return Str.."Role3/Role3_Btn"..num.."/Role3_Btn"..num.."_Icon"
        end
    end
end


--获得点击目标
local function SetTargetObj(self)
    if self.data.target == nil then
        return
    end
    local objpath = nil
    if self.data.click_skill then
        objpath= GetSkillClickPath( self.data.target)
    else
        objpath= self.data.target
    end
    self.m_target = CS.UnityEngine.GameObject.Find(objpath)
    if self.m_target == nil then
        Logger.LogError("路径问题".."--"..tostring(objpath))
        return
    end
end

--显示对话
local function ShowDialog(self)
    if self.data.des ~= nil then
        if self.data.talk_x ~= nil and self.data.talk_y ~= nil then
            GuideManager:GetInstance():ShowCommonDialog(self.data.des,self.data.talk_name,self.data.talk_icon,self.data.talk_x,self.data.talk_y,self)
        else
            local _x=self.click_box.transform.localPosition.x+self.click_box.rectTransform.sizeDelta.x/2
            local _y=self.click_box.transform.localPosition.y+self.click_box.rectTransform.sizeDelta.y/2
            GuideManager:GetInstance():ShowCommonDialog(self.data.des,self.data.talk_name,self.data.talk_icon,_x,_y,self,
                    {sceen_width = self.sceen_width,sceen_height = self.sceen_height,size_x = 0,
                     size_y = 0})
        end
    end
end

local function LoadRes(self)
    if self.data.mask_res ~= nil then
        --加载图片
        local path = "UI/Texture/"..self.data.mask_res..".png"
        ResourcesManager:GetInstance():LoadAsync(path, typeof(CS.UnityEngine.Texture), function(texure)
            if not IsNull(texure) then
                self.img.material:SetTexture("_AlphaMask",texure)
            end
        end)
    end
    if self.data.extra_pre ~= nil then
        self.load_extra = true
        GameObjectPool:GetInstance():GetGameObjectAsync(self.data.extra_pre,function(go)
            self.load_extra = false
            if not IsNull(go) then
                UIUtil.SetUIParent(go.transform,self.transform)
                self.extra_go = go
            end
        end)
    end
end

--获得UI之间的比例参数
local function GetBaseUIPID(self)
    local need_layer = 700
    if self.data.layer == "BackgroudLayer" then
        need_layer = 900
    elseif self.data.layer=="NormalLayer" then
        need_layer = 800
    elseif self.data.layer=="InfoLayer" then
        need_layer = 700
    elseif self.data.layer=="TipLayer" then
        need_layer = 600
    elseif self.data.layer=="TopLayer" then
        need_layer = 500
    end
    local cur_layer = 700
    local coe= cur_layer/need_layer
    return coe
end
--设置高光大小和遮罩
local function SetButtonPos(self)
    --点击 设置点击区域
    --local boxsize= self.mTarget:GetComponent(typeof(CS.UnityEngine.UI.Button))
    local box = nil
    if self.data.size_x~=0 or self.data.size_y~=0 then
        box=Vector2.New(self.data.size_x,self.data.size_y)
    else
        local target_rect = UIUtil.FindComponent(self.m_target.transform,typeof(CS.UnityEngine.RectTransform))
        if target_rect ~= nil then
            box = self.m_target.transform.sizeDelta
        end
    end
    if box ~= nil then
        self.click_box.gameObject:SetActive(true)
        self.click_box.transform.eulerAngles = Vector3.zero
        self.click_box.transform.localScale = self.m_target.transform.localScale;
        -- 位移 触发
        local coe =GetBaseUIPID(self)
        local pos = self.m_target.transform.position
        self.click_box.transform.position =Vector3.New(pos.x*coe,pos.y*coe,pos.z*coe)
        if self.data.offset_x~=0 or self.data.offset_y ~=0 then
            pos = self.click_box.transform.localPosition
            self.click_box.transform.localPosition=Vector3.New(pos.x+self.data.offset_x,pos.y+self.data.offset_y,0)
        end
        self.click_box.rectTransform.sizeDelta=box
    end
end

local function SetClick(self,mask_func,btn_func)
    self.btn_func = btn_func
    self.mask_func = mask_func
end

local function CreateMask(self,data,type)
    if not self.is_create then
        OnCreate(self)
        self.is_create = true
    end
    self.data = data
    LoadRes(self)
    SetTargetObj(self)
    self.mask_type = 1
    if type == 1 then
        self.click_box.gameObject:SetActive(true)
        SetButtonPos(self)
    else
        self.click_box.gameObject:SetActive(false)
    end

end

local function OnDestroy(self)
    base.OnDestroy(self)
    if not IsNull(self.extra_go) then
        CS.UnityEngine.GameObject.Destroy(self.extra_go)
        self.extra_go = nil
    end
end
UIGuideUIMask.CreateMask = CreateMask
UIGuideUIMask.ShowDialog = ShowDialog
UIGuideUIMask.SetClick = SetClick
UIGuideUIMask.OnDestroy = OnDestroy
return UIGuideUIMask