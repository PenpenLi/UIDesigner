local LeagueChatWrap = BaseClass("LeagueChatWrap", UIWrapComponent)
local base = UIWrapComponent
local NationUtil = require "GameLogic.Nation.NationUtil"
local itemData = DataUtil.GetData("item")
local function LinkTextCallBack(self, LinkKey)

    local paramList = UIUtil.StringSplitByChar(LinkKey, "_")
    if paramList[1] == "JumpToPos" then
        if paramList[2] then
            paramList[2] = tonumber(paramList[2])
        end
        if paramList[3] then
            paramList[3] = tonumber(paramList[3])
        end
        if paramList[4] then
            paramList[4] = tonumber(paramList[4])
        end
        self.view.ctrl:CloseSelf()
        NationUtil.TurnToOnePositionByPointData(paramList[2], paramList[3] or nil, paramList[4] or nil)
    end
end

-- 创建
local function OnCreate(self)
    base.OnCreate(self)
    -- 组件初始化
    self.left_right = { { game = false, name = false, nameRect = false, icon = false, level = false, rankBg = false, rankIcon = false, rankImageText = false, bg = false, content = false, pre = "left" },
                        { game = false, name = false, nameRect = false, icon = false, level = false, rankBg = false, rankIcon = false, rankImageText = false, bg = false, content = false, pre = "right" } }
    for i, v in ipairs(self.left_right) do
        v.game = UIUtil.FindTrans(self.transform, v.pre).gameObject
        v.name = self:AddComponent(UIText, v.pre .. "/" .. v.pre .. "name")
        v.nameRect = UIUtil.FindComponent(self.transform, typeof(CS.UnityEngine.RectTransform), v.pre .. "/" .. v.pre .. "name")
        v.icon = self:AddComponent(UIImage, v.pre .. "/" .. v.pre .. "icon", AtlasConfig.DynamicTex)
        v.level = self:AddComponent(UIText, v.pre .. "/lvframe/" .. v.pre .. "lv")
        v.rankBg = self:AddComponent(UIImage, v.pre .. "/" .. v.pre .. "danBg", AtlasConfig.DynamicTex)
        v.rankIcon = self:AddComponent(UIImage, v.pre .. "/" .. v.pre .. "danBg/" .. v.pre .. "danImg", AtlasConfig.DynamicTex)
        v.rankImageText = self:AddComponent(UIImage, v.pre .. "/" .. v.pre .. "danBg/" .. v.pre .. "danName", AtlasConfig.Language)
        v.bg = UIUtil.FindComponent(self.transform, typeof(CS.UnityEngine.RectTransform), v.pre .. "/" .. v.pre .. "bg")
        v.content = self:AddComponent(UIText, v.pre .. "/" .. v.pre .. "bg" .. "/" .. v.pre .. "content")
        v.frame=self:AddComponent(UIImage,v.pre.."/"..v.pre.."frame",AtlasConfig.DynamicTex)
        v.content:SetLinkClick(self, LinkTextCallBack)
    end
    local btn = self:AddComponent(UIButton, "left/leftframe")
    btn:SetOnClick(function()
        --UIManager:GetInstance():OpenWindow(UIWindowNames.UIPlayerFunc, self.id)
    end)
end

-- 组件被复用时回调该函数，执行组件的刷新
local function OnRefresh(self, real_index)
    local data = self.view.league_list[real_index]
    local comp = nil
    self.id = data.id
    if data.is_mine then
        self.left_right[1].game:SetActive(false)
        comp = self.left_right[2]
    else
        self.left_right[2].game:SetActive(false)
        comp = self.left_right[1]
    end
    comp.game:SetActive(true)
    comp.icon:SetSpriteName(itemData[data.head].Icon)
    comp.frame:SetSpriteName(SpriteDefine:GetItemQualityFrameByType(itemData[data.head].Quality))
    comp.name:SetText(data.name)
    comp.content:SetText(data.content)
    --comp.icon:SetSpriteName(data.headIcon)
    comp.level:SetText(data.lv)

    local hellInfo = data.hellInfo
    --{Pic[1],名称图片} ,{Pic[2],底板图片} ,{Pic[3],图标图片}
    comp.rankImageText:SetSpriteName(hellInfo.Pic[1], true)
    --comp.rankImageText.transform.
    comp.rankBg:SetSpriteName(hellInfo.Pic[2], true, false, function ()
        if data.is_mine then
            comp.nameRect.anchoredPosition = Vector2.New(-comp.rankBg.rectTransform.sizeDelta.x / 2 - 150, -10)
        else
            comp.nameRect.anchoredPosition = Vector2.New(comp.rankBg.rectTransform.sizeDelta.x / 2, -10)
        end
    end)
    comp.rankIcon:SetSpriteName(hellInfo.Pic[3], true)
    comp.bg.sizeDelta = data.size
end

LeagueChatWrap.OnCreate = OnCreate
LeagueChatWrap.OnRefresh = OnRefresh
return LeagueChatWrap