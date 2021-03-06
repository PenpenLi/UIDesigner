---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/2/27 15:15
---

local UISetMainView = BaseClass("UISetMainView", UIBaseView)
local base = UIBaseView


local left_btn_group_path="ParentLayout/LeftBtn";
local btn_select_path="ParentLayout/SelectImg";
local btn_select_text="ParentLayout/SelectImg/SelectText";
local head_frame_path="ParentLayout/LeftPlayerLayout/HeadBgImg";
local head_icon_path="ParentLayout/LeftPlayerLayout/Head";
local change_icon_btn_path="ParentLayout/LeftPlayerLayout/Head/ChangeText";
local player_level_text_path="ParentLayout/LeftPlayerLayout/Head/Lv/LvText";
local player_name_text_path="ParentLayout/LeftPlayerLayout/NameObj/NameBg/NameText";
local local_pos_text_path="ParentLayout/LeftPlayerLayout/PosObj/NameBg/PosText";
local id_text_path="ParentLayout/LeftPlayerLayout/IDObj/IDNumber";
local voice_btn_path="ParentLayout/LanguagePackageBtn";
local user_center_btn_path="ParentLayout/UserCenterBtn";
local close_btn_path="ParentLayout/CloseBtn";
local music_layout_path="ParentLayout/MusicAndPicLayout";
local inter_action_layout_path="ParentLayout/InterActionLayout";
local active_layout_path="ParentLayout/ActiveTip";
local copy_name_btn_path="ParentLayout/LeftPlayerLayout/CopyBtn";
local change_name_btn_path="ParentLayout/LeftPlayerLayout/NameObj/NameBg/ChangeNameBtn";
local geography_btn_path="ParentLayout/LeftPlayerLayout/PosObj/NameBg/geographyBtn";
local change_account_btn_path="ParentLayout/ChangeAccountBtn";
local mask_btn_path="ParentLayout/BgRoot/MaskBtn";

local time_btn_path="";
local type_btn_path="";
local select_type_obj="";
local select_type_text="";
--音画组件
local music_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YinYueComponent/MusicToggle";
local yinxiao_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YinXiaoComponent/YinxiaoToggle";
local yuyin_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YuYinComponent/YuyinToggle";
local music_slider_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YinYueComponent/MusicSlider";
local yinxiao_slider_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YinXiaoComponent/YinxiaoSlider";
local yuyin_slider_path="ParentLayout/MusicAndPicLayout/Parentlayout/MusicObj/YuYinComponent/YuyinSlider";
--画面质量
local huamian_quality_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/HuaMianQualityGroup";
local huamian_high_quality_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/HuaMianQualityGroup/Toggle1";
local huamian_low_quality_toggle_path="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/HuaMianQualityGroup/Toggle2";
--画面设置

local SetRTLit="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetRTLit";
local SetShadow="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetShadow";
local SetDirLM="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetDirLM";
local SceneEffect="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SceneEffect";
local SetPostProcessing ="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetPostProcessing";
local SetBloom  ="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetBloom";
local SetMSAA="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetMSAA";
local SetOutline="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetOutline";
local SetAO="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetAO";
local SetNormalMap="ParentLayout/MusicAndPicLayout/Parentlayout/PictureObj/YinYueComponent/Panel/SetNormalMap";

--交互
local voice_chat_toggle_path="ParentLayout/InterActionLayout/Parentlayout/VoiceChat";
local screenshot_toggle_path="ParentLayout/InterActionLayout/Parentlayout/ScreenShot";

--推送
local stamina_toggle_path="ParentLayout/ActiveTip/Parentlayout/Stamina";
local attackCity_toggle_path="ParentLayout/ActiveTip/Parentlayout/AttackCity";
local direct_paly_path="ParentLayout/ActiveTip/Parentlayout/DirectPlay";

--设置选中按钮的父物体
local function SetLeftBtnParent(self,index)
    self.btnSelectObj.transform:SetParent(self.btnList[index].obj.transform);
    self.btnSelectObj.localScale=Vector3.New(1,1,1);
    self.btnSelectObj.anchoredPosition=Vector2.New(0,0);
    self.btnSelectObj:SetAsLastSibling();
    self.btnSelectObj.gameObject:SetActive(true);
    self.btnSelectText:SetText(self.btnList[index].text:GetText());
end

--设置layout的显示
local function SetLayoutActive(self,index)
    for i = 1, #self.layoutList do
        self.layoutList[i].gameObject:SetActive(index==i);
    end
end



--左侧按钮点击
local function SingleLeftBtnClick(self,index)

    SetLeftBtnParent(self,index);
    SetLayoutActive(self,index);
    if index==1 then--音画按钮点击

    elseif index==2 then--交互按钮点击
        --UIUtil.RecyleComItem(self.itemList)
    elseif index==3 then--推送按钮点击

    end
end

--更换名字按钮点击
local function ChangeNameBtnClick(self)
    UIManager:GetInstance():OpenWindow(UIWindowNames.UINickNameTip);
end

--地理按钮点击
local function GeographyBtnClick(self)
    
end


--设置类型按钮的选中
local function SetTypeSelect(self,parentTrans,btnName)
    self.selectTypeObj:SetParent(parentTrans.transform);
    self.selectTypeObj.rectTransform.localScale=Vector3.New(1,1,1);
    self.selectTypeObj.rectTransform.anchoredPosition=Vector2.New(0,0);
    self.selectTypeObj:SetAsLastSibling();
    self.selectTypeObj.gameObject:SetActive(true);
    self.selectTypeText:SetText(btnName);
end


--时间类型按钮点击
local function OnTimeTypeBtnClick(self)
    SetTypeSelect(self,self.typeBtnList[1].btnObj,self.typeBtnList[1].text);
end

--类型按钮点击
local function OnTypeBtnClick(self)
    SetTypeSelect(self,self.typeBtnList[2].btnObj,self.typeBtnList[2].text);
end

local function OnCreate(self)
    base.OnCreate(self)
    self.leftBtnGroup=self:AddComponent(UIBaseContainer,left_btn_group_path);
    local btnLength=self.leftBtnGroup.transform.childCount;
    self.btnList={};
    for i = 0, btnLength-1 do
        local singleBtn=self.leftBtnGroup:AddComponent(UIButton,i);
        singleBtn:AddComponent(UIBaseContainer,"");
        local btn_index=i+1;
        singleBtn:SetOnClick(self,SingleLeftBtnClick,btn_index);
        table.insert(self.btnList,{obj=singleBtn.gameObject,text=singleBtn:AddComponent(UIText,"Text")});
    end
    self.btnSelectObj=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.RectTransform),btn_select_path);
    self.btnSelectText=self:AddComponent(UIText,btn_select_text);
    self.headFrame=self:AddComponent(UIImage,head_frame_path,AtlasConfig.DynamicTex);
    self.headIcon=self:AddComponent(UIImage,head_icon_path,AtlasConfig.DynamicTex);
    self.headIconBtn = self:AddComponent(UIButton,head_icon_path)
    self.headIconBtn:SetOnClick(self.ctrl.ChangeIconBtnClick)
    self.changeBtn=self:AddComponent(UIButton,change_icon_btn_path);
    self.changeBtn:SetOnClick(self.ctrl.ChangeIconBtnClick);
    self.copyNameBtn=self:AddComponent(UIButton,copy_name_btn_path);
    self.copyNameBtn:SetOnClick(self.ctrl.OnCopyNameBtnClick);
    self.playerNameText=self:AddComponent(UIText,player_name_text_path);
    self.playerLevelText=self:AddComponent(UIText,player_level_text_path);
    self.localPosText=self:AddComponent(UIText,local_pos_text_path);
    self.idText=self:AddComponent(UIText,id_text_path);
    self.voiceBtn=self:AddComponent(UIButton,voice_btn_path);
    self.voiceBtn:SetOnClick(function() self.ctrl.OnVoicePackageBtnClick() end);
    self.userCenterBtn=self:AddComponent(UIButton,user_center_btn_path);
    self.userCenterBtn:SetOnClick(self.ctrl.OnUserCenterBtnClick);
    self.maskBtn=self:AddComponent(UIButton,mask_btn_path);
    self.maskBtn:SetOnClick(function()
        LJAudioManger:GetInstance():PlayVoice("UI_Cancel")
        UIManager:GetInstance():CloseWindow(UIWindowNames.UISetMain);
    end)
    self.closeBtn=self:AddComponent(UIButton,close_btn_path);
    self.closeBtn:SetOnClick(function()
        LJAudioManger:GetInstance():PlayVoice("UI_Cancel")
        UIManager:GetInstance():CloseWindow(UIWindowNames.UISetMain);
    end)
    self.musicLayout=UIUtil.FindTrans(self.transform,music_layout_path);
    self.interActionLayout=UIUtil.FindTrans(self.transform,inter_action_layout_path);
    self.activeLayout=UIUtil.FindTrans(self.transform,active_layout_path);
    self.layoutList={};
    self.layoutList[1]=self.musicLayout;self.layoutList[2]=self.interActionLayout;self.layoutList[3]=self.activeLayout;
    self.changeAccountBtn=self:AddComponent(UIButton,change_account_btn_path);
    self.changeAccountBtn.transform.gameObject:SetActive(false);
    self.changeAccountBtn:SetOnClick(function()
        LJAudioManger:GetInstance():PlayVoice("UI_CommonClick")
        UIManager:GetInstance():CloseWindow(UIWindowNames.UISetMain);
        --SceneManager:GetInstance():SwitchScene(SceneConfig.LoginScene);
    end)
    self.musicSlider=self:AddComponent(UISlider,music_slider_path);
    self.musicSlider:SetOnValueChange(self,self.ctrl.OnMusicSliderValueChange);
    self.yinxiaoSlider=self:AddComponent(UISlider,yinxiao_slider_path);
    self.yinxiaoSlider:SetOnValueChange(self,self.ctrl.OnYinXiaoSliderValueChange);
    self.yuyinSlider=self:AddComponent(UISlider,yuyin_slider_path);
    self.yuyinSlider:SetOnValueChange(self,self.ctrl.OnYuYinSliderValueChange);

    self.musicToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),music_toggle_path);
    self.musicToggle.onValueChanged:AddListener(Bind(self,self.ctrl.OnMusicToggleValueChange,self.musicSlider));
    self.yinxiaoToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),yinxiao_toggle_path);
    self.yinxiaoToggle.onValueChanged:AddListener(Bind(self,self.ctrl.OnYinxiaoToggleValueChange,self.yinxiaoSlider))
    self.yuyinToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),yuyin_toggle_path);
    self.yuyinToggle.onValueChanged:AddListener(Bind(self,self.ctrl.OnYuYinToggleValueChange,self.yuyinSlider));

    self.huamianLowQualityToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),huamian_low_quality_toggle_path);
    self.huamianHighQualityToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),huamian_high_quality_toggle_path);
    self.huamianQualityToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),huamian_quality_toggle_path);
    self.huamianQualityToggle.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnHuamianQualityToggleValueChange));


    --self.ToggleSetRTLit=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetRTLit)
    --self.ToggleSetRTLit.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetRTLit))
    self.ToggleSetShadow=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetShadow)
    self.ToggleSetShadow.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetShadow))
    self.ToggleSetOutline=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetOutline)
    self.ToggleSetOutline.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetOutline))
    --self.ToggleSetDirLM=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetDirLM)
    --self.ToggleSetDirLM.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetDirLM))
    self.ToggleSceneEffect=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SceneEffect)
    self.ToggleSceneEffect.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSceneEffect))
    --self.ToggleSetPostProcessiMusicToggleng=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetPostProcessing)
    --self.ToggleSetPostProcessing.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetPostProcessing))
    self.ToggleSetBloom=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetBloom)
    self.ToggleSetBloom.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetBloom))
    self.ToggleSetMSAA=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetMSAA)
    self.ToggleSetMSAA.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetMSAA))
    --self.ToggleSetAO=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetAO)
    --self.ToggleSetAO.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetAO))
    --self.ToggleSetNormalMap=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),SetNormalMap)
    --self.ToggleSetNormalMap.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnModelValueChangeSetNormalMap))


    self.changeNameBtn=self:AddComponent(UIButton,change_name_btn_path);
    self.geographyBtn=self:AddComponent(UIButton,geography_btn_path);
    self.changeNameBtn:SetOnClick(function()
        LJAudioManger:GetInstance():PlayVoice("UI_CommonClick")
        ChangeNameBtnClick(self)
    end);
    self.geographyBtn:SetOnClick(function()
        LJAudioManger:GetInstance():PlayVoice("UI_CommonClick")
        GeographyBtnClick(self)
    end)
    --交互
    self.voiceChatToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),voice_chat_toggle_path);
    self.voiceChatToggle.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnVoiceChatToggleValueChange));
    self.screenShotToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),screenshot_toggle_path);
    self.screenShotToggle.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnScreenshotToggleValueChange));
    --推送
    self.staminaToggle=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),stamina_toggle_path);
    self.staminaToggle.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnStaminToggleValueChange));
    self.attackCity=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),attackCity_toggle_path);
    self.attackCity.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnAttackCityToggleValueChange));
    self.directPlay=UIUtil.FindComponent(self.transform,typeof(CS.UnityEngine.UI.Toggle),direct_paly_path);
    self.directPlay.onValueChanged:AddListener(BindCallback(self,self.ctrl.OnDirectPlayToggleValueChange));

--[[    self.timeBtn=self:AddComponent(UIButton,time_btn_path);
    self.typeBtn=self:AddComponent(UIButton,type_btn_path);
    self.timeBtn:SetOnClick(function() OnTimeTypeBtnClick(self)  end);
    self.typeBtn:SetOnClick(function () OnTypeBtnClick(self) end);
    self.typeBtnList={}
    self.typeBtnList[1]={btnObj=self.timeBtn,text=self.timeBtn:AddComponent(UIText,"TimeText")};
    self.typeBtnList[2]={btnObj=self.typeBtn,text=self.typeBtn:AddComponent(UIText,"TypeText")};]]

--[[    self.selectTypeObj=UIUtil.FindTrans(self.transform,select_type_obj);
    self.selectTypeText=self:AddComponent(UIText,select_type_text);]]
    
end

local function OnEnable(self)
    base.OnEnable(self);
    self:OnRefresh()

end
local function SelectItem(self,itemname,boo)



end
local function OnRefresh(self)
    -- 各组件刷新
    SetLeftBtnParent(self,1)
    SetLayoutActive(self,1)
    --local simple_three_state = CS.UnityEngine.PlayerPrefs.GetInt("simple_three_beat", 0)
    --if simple_three_state == 1 then
    --    self.simpleThreeToggle.isOn = true
    --else
    --    self.simpleThreeToggle.isOn = false
    --end
    self.initview = true
    self.playerNameText:SetText(UserData:GetInstance().name)
    self.playerLevelText:SetText(UserData:GetInstance().pLevel)
    self.headIcon:SetSpriteName(self.model.headImg)
    self.headFrame:SetSpriteName(self.model.frameImg)
    self.idText:SetText(ClientData:GetInstance().user_id)
    self.musicToggle.isOn = self.model.voicestate.music[1]
    self.yinxiaoToggle.isOn = self.model.voicestate.sound[1]
    self.yuyinToggle.isOn = self.model.voicestate.voice[1]
    self.musicSlider:SetValue(self.model.voicestate.music[2])
    self.yinxiaoSlider:SetValue(self.model.voicestate.sound[2])
    self.yuyinSlider:SetValue(self.model.voicestate.voice[2])
    self.musicSlider:SetInteractable(self.model.voicestate.music[1])
    self.yinxiaoSlider:SetInteractable(self.model.voicestate.sound[1])
    self.yuyinSlider:SetInteractable(self.model.voicestate.voice[1])
    --默认低画质
    if self.model.yinhuastate.cursel == 0 then
        self.huamianLowQualityToggle.isOn = true;
        --        QualityManager:GetInstance():SetToLowQuality();
    else
        self.huamianHighQualityToggle.isOn = true;
        --        QualityManager:GetInstance():SetToHighQuality();
    end


    -- self.ToggleSetRTLit.isOn = QualityManager:GetInstance():RTLitEnabled();
    self.ToggleSetShadow.isOn = self.model.yinhuastate.state[1];
    self.ToggleSetOutline.isOn = self.model.yinhuastate.state[2];
    -- self.ToggleSetDirLM.isOn = QualityManager:GetInstance():DirLMEnabled();
    self.ToggleSceneEffect.isOn = self.model.yinhuastate.state[3];
    -- self.ToggleSetPostProcessing.isOn = QualityManager:GetInstance():PostProcessingEnabled();
    self.ToggleSetBloom.isOn = self.model.yinhuastate.state[4];
    self.ToggleSetMSAA.isOn = self.model.yinhuastate.state[5];

    --  self.ToggleSetAO.isOn = QualityManager:GetInstance():AOEnabled();
    --  self.ToggleSetNormalMap.isOn = QualityManager:GetInstance():NormalMapEnabled();
    self.initview = false
end
local function OnAddListener(self)
    base.OnAddListener(self)
    -- UI消息注册
    self:AddUIListener(UIMessageNames.UI_SETTTING_ONREFRESH, OnRefresh)
end

local function OnRemoveListener(self)
    base.OnRemoveListener(self)
    -- UI消息注销
    self:RemoveUIListener(UIMessageNames.UI_SETTTING_ONREFRESH, OnRefresh)
end
UISetMainView.OnCreate = OnCreate
UISetMainView.OnEnable=OnEnable
UISetMainView.OnAddListener=OnAddListener
UISetMainView.OnRemoveListener=OnRemoveListener
UISetMainView.OnRefresh=OnRefresh
UISetMainView.SelectItem=SelectItem
return UISetMainView