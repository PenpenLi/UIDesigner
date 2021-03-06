---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by guoyu.
--- DateTime: 2019/6/19 10:55
---

local UINationAllianceMemberPanel = BaseClass("UINationAllianceMemberPanel", UIBaseContainer)
local base = UIBaseContainer

local UINationAlianceMemberWrapItem = require "UI.UINationAliance.Component.UINationAlianceMemberWrapItem"
local UINationAllianceMemberCtrlPanel = require "UI.UINationAliance.Component.UINationAllianceMemberCtrlPanel"
local UINationAlliancePositionCtrlPanel = require "UI.UINationAliance.Component.UINationAlliancePositionCtrlPanel"
local NationUtil = require "GameLogic.Nation.NationUtil"
local utf8 = require("Common.Tools.utf8")

--字数限制，按字节限制，字母一个汉字两个
local function OnValueChangedByInput(self, type)
    if type == 1 then
        local str = self.mailTitleInput:GetText()
        if utf8.charactersLength(str) > 10 then
            self.mailTitleInput:SetText(self.curTitleText)
            return
        end
        self.curTitleText = str
    else
        local str = self.mailContentInput:GetText()
        if utf8.charactersLength(str) > 200 then
            self.mailContentInput:SetText(self.curContentText)
            return
        end
        self.curContentText = str
    end
end

local function OnClickSendMailBtn(self)
    local title = self.mailTitleInput:GetText()
    if isNilOrEmpty(title) then
        title = DataUtil.GetClientText(200252)
    end
    local content = self.mailContentInput:GetText()
    if isNilOrEmpty(content) then
        UISpecial:GetInstance():UITipText(DataUtil.GetClientText(200253))
        return
    end
    --替换输入的坐标，为超链接坐标
    content = NationUtil.ReplacePosPointText(content)
    --发送邮件
    self.view.ctrl:SendMailToAllMember(title, content)
    self.mailPanelObj:SetActive(false)
end

local function OnClickFindMyInfo(self)
    self.isShowTween = true
    local targetIndex = self.view.model.localPlayerIndex - 3
    if targetIndex < 0 then
        targetIndex = 0
    end
    self.wrapGroup:SetGridPositionByIndex(targetIndex)
    self.isShowTween = false
end

local function MemberSetClick(self)
    self.memberCtrlPanel:SetActive(true)
end

local function memberCtrlItemClick(self)
    self.memberCtrlPanel:SetActive(false)
    self:ResetScrollView(true)
end

local function memberPosCtrlItemClick(self)
    self.memberCtrlPanel:SetActive(false)
    self.postionCtrlPanel:SetActive(true)
end

local function memberPosManagerItemClick(self)
    self.postionCtrlPanel:SetActive(false)
    self:ResetScrollView(true)
end

local function ResetScrollView(self, needReset)
    self.sendMainBtn.gameObject:SetActive(self.view.model.hasAllMembersMail)
    self.wrapGroup:SetLength(#self.view.model.members)
    if needReset then
        self.wrapGroup:ResetToBeginning()
    else
        self.wrapGroup:WrapContent(true)
    end
end

--重新刷新界面
local function __OnMemberDataErrorReflush(self)
    if self.view.model.tabIndex == self.view.model.MAIN_FUNC_INDEX.MEMBER_LIST then
        self:ResetScrollView(true)
    end
end

local function OnCreate(self)
    base.OnCreate(self)

    self.sendMainBtn = self:AddComponent(UIButton, "SendMailBtn")
    self.sendMainBtn:SetOnClick(function()
        self.mailTitleInput:SetText("")
        self.mailContentInput:SetText("")
        self.mailPanelObj:SetActive(true)
    end)

    self.tittleText1 = self:AddComponent(UIText, "TitleObj/Text")
    self.tittleText1:SetText(DataUtil.GetClientText(200058))
    self.tittleText2 = self:AddComponent(UIText, "TitleObj/Text (1)")
    self.tittleText2:SetText(DataUtil.GetClientText(200254))
    self.tittleText3 = self:AddComponent(UIText, "TitleObj/Text (2)")
    self.tittleText3:SetText(DataUtil.GetClientText(200255))
    self.tittleText4 = self:AddComponent(UIText, "TitleObj/Text (3)")
    self.tittleText4:SetText(DataUtil.GetClientText(200059))
    self.tittleText5 = self:AddComponent(UIText, "TitleObj/Text (4)")
    self.tittleText5:SetText(DataUtil.GetClientText(200063))

    self.wrapGroup = self:AddComponent(UIWrapGroup3D, "Scrollrect/Grid", UINationAlianceMemberWrapItem)

    self.mineInfoBtnText = self:AddComponent(UIText, "MineInfoBtn/MineInfoBtnText")
    self.mineInfoBtnText:SetText(DataUtil.GetClientText(200256))
    self.mineInfoBtn = self:AddComponent(UIButton, "MineInfoBtn")
    self.mineInfoBtn:SetOnClick(function()
        OnClickFindMyInfo(self)
    end)

    self.memberCtrlPanel = UINationAllianceMemberCtrlPanel.New(self, "control")
    self.memberCtrlPanel:OnCreate()
    self.memberCtrlPanel:SetActive(false)

    self.postionCtrlPanel = UINationAlliancePositionCtrlPanel.New(self, "zhiweiguanli")
    self.postionCtrlPanel:OnCreate()
    self.postionCtrlPanel:SetActive(false)

    --邮件面板
    self.mailPanelObj = UIUtil.FindTrans(self.transform, "MailPanel").gameObject
    self.mailPanelObj:SetActive(false)
    self.panelTitleText = self:AddComponent(UIText, "MailPanel/Top/Title")
    self.panelTitleText:SetText(DataUtil.GetClientText(200257))
    self.receiverText = self:AddComponent(UIText, "MailPanel/Mid/ReceiverText")
    self.receiverText:SetText(DataUtil.GetClientText(200258))
    self.mailTitleText = self:AddComponent(UIText, "MailPanel/Mid/TitleText")
    self.mailTitleText:SetText(DataUtil.GetClientText(200259))
    self.receiverNameText = self:AddComponent(UIText, "MailPanel/Mid/NameText")
    self.receiverNameText:SetText(DataUtil.GetClientText(200260))
    self.sendMailBtn = self:AddComponent(UIButton, "MailPanel/Mid/SendButton")
    self.sendMailBtn:SetOnClick(function()
        OnClickSendMailBtn(self)
    end)
    self.closeMailBtn = self:AddComponent(UIButton, "MailPanel/Top/CloseButton")
    self.closeMailBtn:SetOnClick(function()
        self.mailPanelObj:SetActive(false)
    end)
    self.maskMailBtn = self:AddComponent(UIButton, "MailPanel/mask")
    self.maskMailBtn:SetOnClick(function()
        self.mailPanelObj:SetActive(false)
    end)

    self.mailTitleInput = self:AddComponent(UIInput, "MailPanel/Mid/TitleInput")
    self.mailTitleInput:SetOnValueChanged(function()
        OnValueChangedByInput(self, 1)
    end)
    self.mailTitleInput_placeholder = self:AddComponent(UIText, "MailPanel/Mid/TitleInput/Placeholder1")
    self.mailTitleInput_placeholder:SetText(DataUtil.GetClientText(200261))
    self.mailContentInput = self:AddComponent(UIInput, "MailPanel/Mid/ContentInput")
    self.mailContentInput:SetOnValueChanged(function()
        OnValueChangedByInput(self, 2)
    end)
    self.mailContentInput_placeholder = self:AddComponent(UIText, "MailPanel/Mid/ContentInput/Placeholder2")
    self.mailContentInput_placeholder:SetText(DataUtil.GetClientText(200262))
end

local function OnEnable(self)
    base.OnEnable(self)

    self:ResetScrollView(true)
    self:OnAddListener()
end

local function OnRefresh(self)
    if self.postionCtrlPanel:GetActive() then
        self.postionCtrlPanel:OnRefresh()
    end

    if self.memberCtrlPanel:GetActive() then
        self.memberCtrlPanel:OnRefresh()
    end
end

local function OnDisable(self)
    base.OnDisable(self)

    self:OnRemoveListener()
end

local function OnAddListener(self)
    self.func = {}
    self.func[1] = Bind(self, MemberSetClick)
    self.func[2] = Bind(self, memberCtrlItemClick)
    self.func[3] = Bind(self, memberCtrlItemClick)
    self.func[4] = Bind(self, memberCtrlItemClick)
    self.func[5] = Bind(self, memberPosCtrlItemClick)
    self.func[6] = Bind(self, memberPosManagerItemClick)
    self.func[7] = Bind(self, __OnMemberDataErrorReflush)

    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_SETBTN_CLICK, self.func[1])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_TICHU_CLICK, self.func[2])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_GRANT_CLICK, self.func[3])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_FANGQI_CLICK, self.func[4])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_POSITION_CLICK, self.func[5])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_POSITION_MANAGER_CLICK, self.func[6])
    UIManager:GetInstance():AddListener(UIMessageNames.ON_NATION_UNION_MEMBER_SUB_TAB_REFLUSH, self.func[7])
end

local function OnRemoveListener(self)
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_SETBTN_CLICK, self.func[1])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_TICHU_CLICK, self.func[2])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_GRANT_CLICK, self.func[3])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_FANGQI_CLICK, self.func[4])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_POSITION_CLICK, self.func[5])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_CTRL_POSITION_MANAGER_CLICK, self.func[6])
    UIManager:GetInstance():RemoveListener(UIMessageNames.ON_NATION_UNION_MEMBER_SUB_TAB_REFLUSH, self.func[7])
    self.func = nil
end

UINationAllianceMemberPanel.OnCreate = OnCreate
UINationAllianceMemberPanel.OnEnable = OnEnable
UINationAllianceMemberPanel.OnRefresh = OnRefresh
UINationAllianceMemberPanel.OnDisable = OnDisable
UINationAllianceMemberPanel.OnAddListener = OnAddListener
UINationAllianceMemberPanel.OnRemoveListener = OnRemoveListener
UINationAllianceMemberPanel.ResetScrollView = ResetScrollView

return UINationAllianceMemberPanel