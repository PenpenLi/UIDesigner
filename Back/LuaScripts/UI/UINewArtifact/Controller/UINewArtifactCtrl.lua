---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ljl.
--- DateTime: 2019/6/5 11:00
---
local allRelicBodyData = DataUtil.GetData("relic_body")
local UINewArtifactCtrl = BaseClass("UINewArtifactCtrl", UIBaseCtrl)


local function CloseSelf(self)
    UIManager:GetInstance():CloseWindow(UIWindowNames.UINewArtifact)
end


local function SendRequestLevelUp(self,_type,_relicData,_moduleData,_awardData,_take_num,_trans)
    local relic_level_up_id = MsgIDDefine.PBTEAM_RELIC_LEVEL_UP_REQUEST
    local relic_level_up =  (MsgIDMap[relic_level_up_id])()
    relic_level_up.relicId = _relicData.art_id
    relic_level_up.type = _type
    relic_level_up.moduleId = _moduleData.artifact_id
    GuideManager:GetInstance():SetGuideServerStep(relic_level_up)
    NetManager:GetInstance():SendMessage(relic_level_up_id,relic_level_up,function (msg_obj)
        if msg_obj.OpCode ~= 0 then
            Logger.Log("ERROR PBTEAM_RELIC_LEVEL_UP_RESPONSE~~")
            UISpecial:GetInstance():UITipText(msg_obj.Packages.msg)
            return
        else
            DataManager:GetInstance():Broadcast(DataMessageNames.UI_Guide_NeedEvent)
            for _, v in ipairs(_awardData) do
                BackpackData:GetInstance():UpdateItemData(v.id, -v.num)
            end
            if _take_num ~= nil and _take_num > 0 then
                BackpackData:GetInstance():UpdateItemData(1401002, -_take_num)
            end
            local relicListData = {}
            local relicData = {}
            relicData.id = _relicData.art_id
            if _type == 1 then
                relicData.level = _relicData.art_now_level + 1
            else
                relicData.level = _relicData.art_now_level
            end
            local relicModuleList = {}
            local relicModuleData = {}
            relicModuleData.id = _moduleData.artifact_id
            if _type == 2 then
                relicModuleData.level = _moduleData.artifact_level_now + 1
            else
                relicModuleData.level = _moduleData.artifact_level_now
            end
            table.insert(relicModuleList,relicModuleData)
            relicData.relicModules = relicModuleList
            table.insert(relicListData,relicData)
            ArtifactsData:GetInstance():UpdateData(relicListData,_trans)
        end
    end)

end


local function OpenArtifactShow(self,_id,_lv)
    for _, v in ipairs(allRelicBodyData) do
        if _id == v.Id then
            for i, m in ipairs(v.phaseBunus) do
                if _lv == m.Lv then
                    UIManager:GetInstance():OpenWindow(UIWindowNames.UIShenQiActive,_id,_lv,i)
                    break
                end
            end
            break
        end

    end

end

UINewArtifactCtrl.SendRequestLevelUp = SendRequestLevelUp
UINewArtifactCtrl.CloseSelf = CloseSelf
UINewArtifactCtrl.OpenArtifactShow = OpenArtifactShow

return UINewArtifactCtrl