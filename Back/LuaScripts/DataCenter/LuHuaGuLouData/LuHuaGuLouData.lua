---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/1/8 15:18
---
---
local LuHuaGuLouData = BaseClass("LuHuaGuLouData", Singleton)
local isFirstRequstdata = true;
--初始化
local function __init(self)
    self.curFightId = 0;
end

--设置当前战斗id
local function SetCurFightId(self, fightId, _campIndex, _passIndex)
    self.curFightId = fightId;
    self.campIndex = _campIndex;
    self.passIndex = _passIndex;
end

--解析后端的芦花鼓楼数据
local function ParsedLhglDataFromServer(self, msg)
    local camps = msg.Packages.camp;
    self.campList = {};
    if not camps ._is_null then
        for i, v in ipairs(camps) do
            table.insert(self.campList, v);
        end
    end
end
--检测是否第一次请求后端数据
local function GetIsFirstRequestData(self)
    if isFirstRequstdata == true then
        __init(self);
    end
    return isFirstRequstdata;
end
--获取芦花鼓楼数据回复
local function GetReedTowerCallback(self, msg)

    if msg.OpCode == 0 then
        if isFirstRequstdata == true then
            isFirstRequstdata = false;
        end
        ParsedLhglDataFromServer(self, msg)
        DataManager:GetInstance():Broadcast(DataMessageNames.ON_GET_REED_TOWER_DATA);
    end
    ArtifactsData:GetInstance():RequestArtifactMessage()--请求神器(需要有背包数据来判断红点)
end

--发送获取芦花鼓楼请求
local function SendGetReedTowerRequest(self)
    local state, type, des = UnlockData:GetInstance():GetLockDataState(102)
    if not state then
        return
    end
    if self.have_send then
        Logger.LogError("已经请求过楼花鬼楼")
        return
    else
        self.have_send = true
    end
    local msd_id = MsgIDDefine.PBCHAPTER_GET_REED_TOWER_REQUEST
    NetManager:GetInstance():SendMessage(msd_id, nil, Bind(self, self.GetReedTowerCallback))
end
local function CheckLockData(self, type, lv, istip)
    --istip 是否检测刚刚通过
    if self.campList == nil then
        return false
    end
    for i = 1, #self.campList do
        if self.campList[i].camp == type then
            if istip then
                if self.campList[i].id - 1 == lv then
                    return true
                end
            else
                if self.campList[i].id - 1 >= lv then
                    return true
                end
            end

        end
    end
    return false
end

--更新芦花鼓楼数据
local function UpdateReedTowerData(self)
    local lhglXlsx = DataUtil.GetData("reed_tower");
    local campPassLength = #lhglXlsx[self.campIndex].Lvs;
    for i, v in ipairs(self.campList) do
        if v.camp == self.campIndex then
            v.id = v.id + 1;
        end
    end
end

LuHuaGuLouData.GetIsFirstRequestData = GetIsFirstRequestData;
LuHuaGuLouData.SendGetReedTowerRequest = SendGetReedTowerRequest;
LuHuaGuLouData.GetReedTowerCallback = GetReedTowerCallback;
LuHuaGuLouData.SetCurFightId = SetCurFightId;
LuHuaGuLouData.UpdateReedTowerData = UpdateReedTowerData;
LuHuaGuLouData.CheckLockData = CheckLockData
return LuHuaGuLouData;