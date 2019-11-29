---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by LJ095.
--- DateTime: 2019/8/12 10:49
---
local EquipData = BaseClass("EquipData", Singleton)
local EqpData=DataUtil.GetData("eqp");
local PropertyData=DataUtil.GetData("property");

local EqpLvData=DataUtil.GetData("eqp_lvup");

local EquipModuleData={
    equipId=0,
    equipTid=0,
    equipRandomProp={},
    equipForce=0,
    equipStrengthLv=0,
    cardId=0,
}
local EquipModuleData = DataClass("EquipModuleData", EquipModuleData)


--获得装备数据
local function GetSerEquipData(self)

    local equipMsg_id = MsgIDDefine.PBEQUIP_GET_ALL_EQUIP_REQUEST
    local equipMsg = (MsgIDMap[equipMsg_id])()
    equipMsg.equipIndex = 0
    --接收装备数据
    local function OnReceiveEquipData(self,msg_obj)
        if msg_obj.OpCode ~= 0 then
            Logger.Log("出错了~")
            return
        end
        self:ParseEquipListFromServer(msg_obj.Packages.equips)
        if msg_obj.Packages.equipIsFinish then
            --全部拉取完成
            --过去更新卡牌装备
            CardData:GetInstance():UpdateAllEquip()
        else
            local equipMsg_id = MsgIDDefine.PBEQUIP_GET_ALL_EQUIP_REQUEST
            local equipMsg = (MsgIDMap[equipMsg_id])()
            equipMsg.equipIndex = msg_obj.Packages.equipNextIndex
            NetManager:GetInstance():SendMessage(equipMsg_id, equipMsg,Bind(self,OnReceiveEquipData),nil,false)
        end
    end
    local state,type,des= UnlockData:GetInstance():GetLockDataState(313)
    if not state then
        return
    end
    if self.have_send then
        Logger.LogError("已经请求过装备")
        return
    else
        self.have_send=true
    end
    NetManager:GetInstance():InsetQueneMessage(equipMsg_id, equipMsg,Bind(self,OnReceiveEquipData));
end


local function __init(self)
    -- 背包物品列表
    self.isStrengthEquip=false;--是否已经强化过装备
    self.equipList= {}
    self.cacheEquipList={};--缓存装备列表
    self.cardForceDic={};--卡牌战斗力
    self.bagCount=0;
    self.maxBagCount=DataUtil.GetData("global")[203].valueN;
    self.maxTip=DataUtil.GetData("words")[100134];
end

--获取是否强化过装备
local function GetIsStrengthEquip(self)
    return self.isStrengthEquip;
end

-- 解析装备背包数据
local function ParseEquipListFromServer(self, _equipList)
    for _, v in ipairs(_equipList) do
        self:UpdateSingleEquipData(v.id,v);
    end
    if self.bagCount>self.maxBagCount then
        TimerManager:GetInstance():SimpleTimerArgs(0.8,function() Logger.Log("播放装备满提示"); UISpecial:GetInstance():UITipText(self.maxTip); end ,nil,true)
    end
    --检查卡牌红点
    --CardData:GetInstance():CheckALLRedByCard()
end

--更新背包数量
local function UpdateBagCount(self,_changeNum,_showTip)
    self.bagCount=self.bagCount+_changeNum;
    if _showTip and self.bagCount>self.maxBagCount then
        TimerManager:GetInstance():SimpleTimerArgs(0.8,function() Logger.Log("播放装备满提示"); UISpecial:GetInstance():UITipText(self.maxTip); end ,nil,true)
    end
end

--更新单个装备数据
local function UpdateSingleEquipData(self,_id,_serverData)
    local singleEquipData=self.equipList[_id];
    if singleEquipData~=nil then

    else
        if _serverData.cardId==0 then
            UpdateBagCount(self,1);
        end
        singleEquipData=EquipModuleData.New();
        singleEquipData.equipId=tonumber(_id);
        singleEquipData.equipTid=_serverData.templateId;
        singleEquipData.equipRandomProp=_serverData.randomPropertyMap;
        singleEquipData.equipForce=_serverData.fighting;
        singleEquipData.equipStrengthLv=_serverData.strengthenLv;
        singleEquipData.cardId=_serverData.cardId;
        self.equipList[_id]=singleEquipData;
        if self.isStrengthEquip==false and singleEquipData.equipStrengthLv>0 then
            self.isStrengthEquip=true;
        end
    end
end

--获取替换的装备id
local function GetReplaceEquipId(self,_id,_cardId)
    local equipId=0;
    if self.equipList[_id]~=nil then
        local cardHaveEquip= CardData:GetInstance():GetCardDataById(_cardId).equip;
        local cardEquipDic={};
        if cardHaveEquip~=nil then
            for i, v in ipairs(cardHaveEquip) do
                if self.equipList[v]~=nil then
                    local equipData=self.equipList[v];
                    local xlsxData=EqpData[equipData.equipTid];
                    cardEquipDic[xlsxData.Pos]=v;
                end
            end
        end
        local xlsxData=EqpData[self.equipList[_id].equipTid];
        if cardEquipDic[xlsxData.Pos]~=nil then
            equipId=cardEquipDic[xlsxData.Pos];
        end
    end
    return equipId;
end

--更新单个装备的穿戴
local function UpdateSingleEquipDataWear(self,_id,_cardId)
    if self.equipList[_id]~=nil then
        if _cardId~=0 then
            local replaceId=GetReplaceEquipId(self,_id,_cardId);
            if replaceId~=0 then
                self.equipList[replaceId].cardId=0;
                UpdateBagCount(self,1,true);
            end
        end
        self.equipList[_id].cardId=_cardId;
        if _cardId~=0 then
            UpdateBagCount(self,-1,true);
        else
            UpdateBagCount(self,1,true);
        end

    end
end

--卸下一张卡的所有装备
local function ClearSingleCardEquip(self,_cardId)
    local equipIds= CardData:GetInstance():GetCardDataById(_cardId).equip;
    for i, v in ipairs(equipIds) do
        if self.equipList[v]~=nil then
            self.equipList[v].cardId=0;
        end
    end
    UpdateBagCount(self,#equipIds,true);
end
--一键穿戴卸下装备
local function UpDateOneKeyEquipDataWear(self,_cardId,_equipIds,_isWear)
    ClearSingleCardEquip(self,_cardId);
    if _isWear then
        for i, v in ipairs(_equipIds) do
            UpdateSingleEquipDataWear(self,v,_cardId);
        end
        UpdateBagCount(self,-#_equipIds,true);
    end
end

--更新装备的强化等级
local function UpDateEquipStrength(self,_equips)
    for i, v in ipairs(_equips) do
        if self.equipList[v.id]~=nil then
            self.equipList[v.id].equipStrengthLv=v.strengthenLv;
            self.equipList[v.id].equipForce=v.fighting;
            if self.isStrengthEquip==false and v.strengthenLv>0 then
                self.isStrengthEquip=true;
            end
        end
    end
end

--获取单个的装备数据
local function GetEquipDataById(self,_id)
    return self.equipList[_id];
end

--获取单个装备的属性
local function GetEquipPropDataById(self,_id)

    local serverData=GetEquipDataById(self,_id);
    local xlsxData=EqpData[serverData.equipTid];
    local finalProp={};
    if serverData~=nil then
        for i, v in ipairs(xlsxData.Prop) do
            local fac=EqpLvData[xlsxData.StrengthenId][serverData.equipStrengthLv].Fac;
            local tempAddNum=v.Base+v.Up*fac;
            finalProp[v.Id]=tempAddNum;
        end
        for i, v in ipairs(serverData.equipRandomProp) do
            if finalProp[v.id]~=nil then
                finalProp[v.id]=finalProp[v.id]+v.value;
            else
                finalProp[v.id]=v.value;
            end
        end
    end
    return finalProp;
end

--清空选中id的装备背包
local function ClearEquipData(self,_equipIds)
    for i, v in ipairs(_equipIds) do
        if self.equipList[v]~=nil then
            self.equipList[v]=nil;
        end
    end
    UpdateBagCount(self,-#_equipIds,true);
end

--缓存装备数据
local function CacheEquipData(self,_equips)
    for i, v in ipairs(_equips) do
        if v~=nil then
            self.cacheEquipList[v.id]=v;
        end
    end
end

--将缓存的装备放入背包
local function PutCacheEquipsToBackpack(self,_id,_isAll)
    if _isAll then
        local count=0;
        for i, v in pairs(self.cacheEquipList) do
            if v~=nil then
                count=count+1;
                UpdateSingleEquipData(self,i,v);
            end
        end
        self.cacheEquipList={};
        UpdateBagCount(self,count,true);
    else
        if self.cacheEquipList[_id]~=nil then
            UpdateSingleEquipData(self,_id,self.cacheEquipList[_id]);
            self.cacheEquipList[_id]=nil;
            UpdateBagCount(self,1,true);
        end
    end

end

--更新所有装备的总战斗力
local function UpdateCardAllEqiupForce(self,_cardId,_force)
    self.cardForceDic[_cardId]=math.floor(_force);
end

--获取卡牌的战斗力
local function GetCardEquipForce(self,_cardId)
    local force=0;
    if self.cardForceDic[_cardId]~=nil then
        force=self.cardForceDic[_cardId];
    end
    return force;
end

--请求装备全部战斗力
local function SendCardGetAllEquipForce(self,_cardId)
    local msdId = MsgIDDefine.PBEQUIP_GET_CARD_ALL_EQUIP_FIGHTING_REQUEST
    local msdObj = MsgIDMap[msdId]()
    msdObj.cardId = _cardId
    NetManager:GetInstance():SendMessage(msdId,msdObj,function(msg_obj)
        if msg_obj.OpCode ~= 0 then
            UISpecial:GetInstance():UITipText(msg_obj.Packages.msg)
            return
        else
            UpdateCardAllEqiupForce(self,_cardId,msg_obj.Packages.fighting);
            UIManager:GetInstance():Broadcast(UIMessageNames.UI_CARD_ALL_EQUIP_FORCE_REFRESH);
        end
    end)
end

--获取一键装备的列表
local function GetOneKeyEquipList(self,_cardId)
    local cardHaveEquip=CardData:GetInstance():GetCardDataById(_cardId).equip;
    local cardType=CardData:GetInstance():GetCardDataById(_cardId).type;
    local cardHeroHaveEquipDic={};
    --获取英雄身上的装备  【位置，数据】
    if cardHaveEquip~=nil then
        for i, v in ipairs(cardHaveEquip) do
            if self.equipList[v]~=nil then
                local equipData=EquipData:GetInstance().equipList[v];
                local xlsxData=EqpData[equipData.equipTid];
                cardHeroHaveEquipDic[xlsxData.Pos]={eqpData=equipData,xlsx=xlsxData};
            end

        end
    end

    --获取全部装备(除去已穿装备)  【位置，数据】
    local allEquipDic={};
    for i, v in pairs(self.equipList) do
        if v.cardId==0 then
            local xlsxData=EqpData[v.equipTid];
            if xlsxData.Type==cardType then
                if allEquipDic[xlsxData.Pos]~=nil then
                    table.insert(allEquipDic[xlsxData.Pos],{serverData=v,xlsx=xlsxData});
                else
                    allEquipDic[xlsxData.Pos]={};
                    table.insert(allEquipDic[xlsxData.Pos],{serverData=v,xlsx=xlsxData});
                end
            end
        end
    end
    --排序所有位置 （按照Gs和战力）
    for i, v in pairs(allEquipDic) do
        table.sort(v,function(a,b)
            if a.xlsx.Gs==b.xlsx.Gs then
                return a.serverData.equipForce>b.serverData.equipForce;
            else
                return a.xlsx.Gs>b.xlsx.Gs;
            end
        end)
    end
    local finalEquipIds={};
    for i, v in pairs(allEquipDic) do
        --如果该位置英雄有装备
        if cardHeroHaveEquipDic[i]~=nil then
            if cardHeroHaveEquipDic[i].xlsx.Gs<v[1].xlsx.Gs then
                table.insert(finalEquipIds,{id=v[1].serverData.equipId,pos=i});
            elseif cardHeroHaveEquipDic[i].xlsx.Gs==v[1].xlsx.Gs and cardHeroHaveEquipDic[i].eqpData.equipForce<v[1].serverData.equipForce then
                table.insert(finalEquipIds,{id=v[1].serverData.equipId,pos=i});
            else
                --table.insert(finalEquipIds,{id=v[1].serverData.equipId,pos=i});
            end
        else
        --如果该位置英雄没有装备
            table.insert(finalEquipIds,{id=v[1].serverData.equipId,pos=i});
        end
    end
    return finalEquipIds;
end

--获取一键装备的列表
local function GetCardEquipRedState(self,_cardId)

    local cardHaveEquip=CardData:GetInstance():GetCardDataById(_cardId).equip;
    local cardType=CardData:GetInstance():GetCardDataById(_cardId).type;
    local cardHeroHaveEquipDic={};
    --获取英雄身上的装备  【位置，数据】
    if cardHaveEquip~=nil then
        for i, v in ipairs(cardHaveEquip) do
            if self.equipList[v]~=nil then
                local equipData=EquipData:GetInstance().equipList[v];
                local xlsxData=EqpData[equipData.equipTid];
                cardHeroHaveEquipDic[xlsxData.Pos]=equipData;
            end
        end
    end

    --获取全部装备(除去已穿装备)  【位置，数据】
    local allEquipDic={};
    for i, v in pairs(self.equipList) do
        if v.cardId==0 then
            local xlsxData=EqpData[v.equipTid];
            if xlsxData.Type==cardType then
                if allEquipDic[xlsxData.Pos]~=nil then
                    table.insert(allEquipDic[xlsxData.Pos],{serverData=v,xlsx=xlsxData});
                else
                    allEquipDic[xlsxData.Pos]={};
                    table.insert(allEquipDic[xlsxData.Pos],{serverData=v,xlsx=xlsxData});
                end
            end
        end
    end

    for i, v in pairs(allEquipDic) do
        --如果该英雄该位置有装备
        if cardHeroHaveEquipDic[i]==nil then
            return true;
        end
    end
    return false;
end

EquipData.GetIsStrengthEquip=GetIsStrengthEquip;
EquipData.GetCardEquipRedState=GetCardEquipRedState;
EquipData.GetOneKeyEquipList=GetOneKeyEquipList;
EquipData.UpdateCardAllEqiupForce=UpdateCardAllEqiupForce;
EquipData.SendCardGetAllEquipForce=SendCardGetAllEquipForce;
EquipData.GetCardEquipForce=GetCardEquipForce;
EquipData.CacheEquipData=CacheEquipData;
EquipData.PutCacheEquipsToBackpack=PutCacheEquipsToBackpack;
EquipData.GetReplaceEquipId=GetReplaceEquipId;
EquipData.ClearEquipData=ClearEquipData;
EquipData.UpDateEquipStrength=UpDateEquipStrength;
EquipData.UpDateOneKeyEquipDataWear=UpDateOneKeyEquipDataWear;
EquipData.GetEquipPropDataById=GetEquipPropDataById;
EquipData.__init = __init
EquipData.UpdateSingleEquipDataWear=UpdateSingleEquipDataWear;
EquipData.GetEquipDataById=GetEquipDataById;
EquipData.UpdateSingleEquipData=UpdateSingleEquipData;
EquipData.ParseEquipListFromServer=ParseEquipListFromServer;
EquipData.GetSerEquipData = GetSerEquipData
return EquipData;