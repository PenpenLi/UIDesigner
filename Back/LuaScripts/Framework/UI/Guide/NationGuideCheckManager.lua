---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2019/3/18 15:46
--- 国战引导检测 中心
--- 尝试检测是否可以触发引导  GuideCheckBase  (各种类型引导检测 1 强制  2  软  3  闲置)
local NationGuideCheckManager = BaseClass("NationGuideCheckManager", Singleton)
-- 构造函数

--CHECKER_GUIDE_EVENT = {
--    BASE_UI_WINDOW_OPEN = 1, -- UI打开
--    BASE_UI_WINDOW_CLOSE = 5, -- UI关闭
--    SCENE_WINDOW_OPEN = 2, -- 场景打开
--    EVENT_TRIGGER = 3, -- 事件打开
--    GUIDE_OVER_TRIGGER = 4, --引导步骤结束打开
--},

local function __init(self)
    self.easyfunc = {}
    self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_OPEN] = Bind(self,self.UIWindowOpen)
    self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.SCENE_WINDOW_OPEN] = Bind(self,self.SceneWindowOpen)
    self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.EVENT_TRIGGER] = Bind(self,self.OnEventOpen)
    self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.GUIDE_OVER_TRIGGER] = Bind(self,self.GuideOverEvent)
    self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_CLOSE] = Bind(self,self.UIWindowClose)
end



--注册消息  绑定  无限等待事件
local function AddUIListener(self)
    UIManager:GetInstance():AddListener(UIMessageNames.UIFRAME_ON_WINDOW_OPEN,self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_OPEN])
    UIManager:GetInstance():AddListener(UIMessageNames.UIFRAME_ON_WINDOW_CLOSE,self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_CLOSE])
end

local function RemoveUIListener(self)
    UIManager:GetInstance():RemoveListener(UIMessageNames.UIFRAME_ON_WINDOW_OPEN, self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_OPEN])
    UIManager:GetInstance():RemoveListener(UIMessageNames.UIFRAME_ON_WINDOW_CLOSE, self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.BASE_UI_WINDOW_CLOSE])
end


local function AddSceneListener(self)
    DataManager:GetInstance():AddListener(DataMessageNames.ON_SCENE_CHANGE,  self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.SCENE_WINDOW_OPEN])
end

local function RemoveSceneListener(self)
    DataManager:GetInstance():RemoveListener(DataMessageNames.ON_SCENE_CHANGE, self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.SCENE_WINDOW_OPEN])
end


local function AddEventListener(self)
    local needEvent = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepNeedEvent()
    if needEvent ~=nil then
        DataManager:GetInstance():AddListener(needEvent,  self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.EVENT_TRIGGER])
    end
end

local function RemoveEventListener(self)
    local needEvent = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepNeedEvent()
    if needEvent ~= nil then
        DataManager:GetInstance():RemoveListener(needEvent,  self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.EVENT_TRIGGER])
    end
end

local function AddOverListener(self)
    local overEvent = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepOverEvent()
    if overEvent ~= nil then
        DataManager:GetInstance():AddListener(NationGuideGroup:GetInstance().CurGuideItem.OverEvent, self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.GUIDE_OVER_TRIGGER])
    end
end

local function RemoveOverListener(self)
    local overEvent = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepOverEvent()
    if overEvent ~= nil then
        DataManager:GetInstance():RemoveListener(NationGuideGroup:GetInstance().CurGuideItem.OverEvent, self.easyfunc[GuideDefine.CHECKER_GUIDE_EVENT.GUIDE_OVER_TRIGGER])
    end
end

local function UIWindowOpen(self,target)
    if not NationGuideGroup:GetInstance():IsCurrentGuideRunning() then
        return
    end
    local needUI = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepNeedUI()
    Logger.LogVars(" needUI : ",needUI, " target.Name  ： ",target.Name )
    if needUI ~=nil and  needUI == target.Name then
        NationGuideGroup:GetInstance():UIHandleFun(GuideDefine.GUIDE_SHEET_NeedUIType.UI_OPEN_EVENT)
    end
end

local function UIWindowClose(self,target)
    if not NationGuideGroup:GetInstance():IsCurrentGuideRunning() then
        return
    end
    local needUI = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepNeedUI()
    if needUI ~=nil and needUI == target.Name then
        NationGuideGroup:GetInstance():UIHandleFun(GuideDefine.GUIDE_SHEET_NeedUIType.UI_CLOSE_EVENT)
    end
end

local function SceneWindowOpen(self,target)
    if not NationGuideGroup:GetInstance():IsCurrentGuideRunning() then
        return
    end
    local needScene = NationGuideGroup:GetInstance():GetGuideSheetCurrentStepNeedScene()
    if needScene ~=nil and needScene == target then
        self:RemoveSceneListener()
        NationGuideGroup:GetInstance():SceneHandleFun()
    end
end

local function OnEventOpen (self,params)
    if not NationGuideGroup:GetInstance():IsCurrentGuideRunning() then
        return
    end
    Logger.LogVars("收到OnEventOpen111")
    self:RemoveEventListener()
    NationGuideGroup:GetInstance():EventHandleFun(params)
end

local function GuideOverEvent (self)
    if not NationGuideGroup:GetInstance():IsCurrentGuideRunning() then
        return
    end
    self:RemoveOverListener()
    NationGuideGroup:GetInstance():DoNextStep ()
    Logger.LogVars("NationGuideCheckManager GuideOverEvent 检测执行   "..NationGuideGroup:GetInstance().CurType.." _  "..NationGuideGroup:GetInstance().CurStep)
end

local function ClearAllListener(self)
    RemoveOverListener(self)
    RemoveEventListener(self)
    RemoveSceneListener(self)
    RemoveUIListener(self)
end

local function __delete(self)
    ClearAllListener(self)
    self.easyfunc = nil
end

NationGuideCheckManager.__delete = __delete
NationGuideCheckManager.__init = __init
NationGuideCheckManager.ClearAllListener = ClearAllListener
NationGuideCheckManager.AddUIListener = AddUIListener
NationGuideCheckManager.RemoveUIListener = RemoveUIListener
NationGuideCheckManager.UIWindowOpen = UIWindowOpen
NationGuideCheckManager.UIWindowClose = UIWindowClose
NationGuideCheckManager.SceneWindowOpen = SceneWindowOpen
NationGuideCheckManager.AddSceneListener = AddSceneListener
NationGuideCheckManager.RemoveSceneListener = RemoveSceneListener
NationGuideCheckManager.AddEventListener = AddEventListener
NationGuideCheckManager.RemoveEventListener = RemoveEventListener
NationGuideCheckManager.OnEventOpen = OnEventOpen
NationGuideCheckManager.AddOverListener =AddOverListener
NationGuideCheckManager.RemoveOverListener = RemoveOverListener
NationGuideCheckManager.GuideOverEvent = GuideOverEvent

return NationGuideCheckManager