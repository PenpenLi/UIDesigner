---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2018/11/26 11:29
---
-- 窗口配置
local UISetMain = {
    Name = UIWindowNames.UISetMain,
    Layer = UILayers.BackgroudLayer,
    Model =require "UI.UISet.Model.UISetMainModel",
    Ctrl = require "UI.UISet.Controller.UISetMainCtrl",
    View =require "UI.UISet.View.UISetMainView",
    PrefabPath = "UI/Prefabs/View/UISetMain.prefab",
}
local UIHeadMain = {
    Name = UIWindowNames.UIHeadMain,
    Layer = UILayers.BackgroudLayer,
    Model =require "UI.UISet.Model.UIHeadMainModel",
    Ctrl = nil,
    View =require "UI.UISet.View.UIHeadMainView",
    PrefabPath = "UI/Prefabs/View/UIHeadMain.prefab",
}

local UINickNameTip = {
    Name = UIWindowNames.UINickNameTip,
    Layer = UILayers.BackgroudLayer,
    --Model =require "UI.UISet.Model.UIHeadMainModel",
    Model= nil,
    Ctrl = nil,
    View =require "UI.UISet.View.UINickNameView",
    PrefabPath = "UI/Prefabs/View/UINickNameTip.prefab",
}

return {
    -- 配置
    UISetMain = UISetMain,
    UIHeadMain=UIHeadMain,
    UINickNameTip=UINickNameTip,
}