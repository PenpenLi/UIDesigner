--[[
output from excel card.卡牌表.xlsx
--note:
卡牌碎片的表
colums:
{ID,ID} ,{Name,名字} ,{Award[1].Id,奖励ID} ,{Award[1].Val,奖励数量}
primary key:
#0 [卡牌碎片]: ID
]]
local _T = LangUtil.Language
if ddt["card_debris"] ~= nil then
	return ddt["card_debris"]
end
local data = {
	[1701001] = {Name = "常服曹焱兵碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--常服曹焱兵碎片
	[1701002] = {Name = "曹玄亮碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--曹玄亮碎片
	[1701003] = {Name = "战斗夏铃碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--战斗夏铃碎片
	[1701004] = {Name = "项昆仑碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--项昆仑碎片
	[1701005] = {Name = "刘羽禅碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--刘羽禅碎片
	[1701006] = {Name = "红莲·缇娜碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--红莲缇娜碎片
	[1701007] = {Name = "战斗曹焱兵碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--战斗曹焱兵碎片
	[1701008] = {Name = "黑尔·坎普碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--黑尔坎普碎片
	[1701009] = {Name = "北落师门碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--北落师门碎片
	[1701010] = {Name = "盖文碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--盖文碎片
	[1701011] = {Name = "阎风吒碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--阎风吒碎片
	[1701012] = {Name = "南御夫碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--南御夫碎片
	[1701013] = {Name = "吉拉碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--吉拉碎片
	[1701014] = {Name = "吕仙宫碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--吕仙宫碎片
	[1701015] = {Name = "阎巧巧碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--阎巧巧碎片
	[1701016] = {Name = "秦王攻碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--秦王攻碎片
	[1701020] = {Name = "姬烟华碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--姬烟华碎片
	[1701022] = {Name = "幻碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--幻碎片
	[1701023] = {Name = "朱童碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--朱童碎片
	[1701026] = {Name = "貂灵芸碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--貂灵芸碎片
	[1701030] = {Name = "卢天佑碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--卢天佑碎片
	[1701041] = {Name = "都市青年碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--都市青年碎片
	[1701043] = {Name = "少年曹玄亮碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--少年曹玄亮碎片
	[1702001] = {Name = "关羽碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--关羽碎片
	[1702002] = {Name = "许褚碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--许褚碎片
	[1702003] = {Name = "典韦碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--典韦碎片
	[1702004] = {Name = "唐流雨碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--唐流雨碎片
	[1702005] = {Name = "李轩辕碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--李轩辕碎片
	[1702006] = {Name = "项羽碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--项羽碎片
	[1702007] = {Name = "天使·缇娜碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--天使缇娜碎片
	[1702008] = {Name = "夏侯渊碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--夏侯渊碎片
	[1702009] = {Name = "徐晃碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--徐晃碎片
	[1702010] = {Name = "张郃碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--张郃碎片
	[1702011] = {Name = "张飞碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--张飞碎片
	[1702012] = {Name = "夏侯惇碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--夏侯惇碎片
	[1702013] = {Name = "塞伯罗斯碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--塞伯罗斯碎片
	[1702014] = {Name = "石灵明碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--石灵明碎片
	[1702015] = {Name = "于禁碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--于禁碎片
	[1702016] = {Name = "西方龙碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--西方龙碎片
	[1702017] = {Name = "飞廉碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--飞廉碎片
	[1702018] = {Name = "噬日碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--噬日碎片
	[1702019] = {Name = "食火蜥碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--食火蜥碎片
	[1702020] = {Name = "高顺碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--高顺碎片
	[1702021] = {Name = "烈风螳螂碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--烈风螳螂碎片
	[1702023] = {Name = "异邦刀客碎片",Award = {[1] = {Id = 1401005,Val = 100}}},--异邦刀客碎片
	[1702024] = {Name = "朱仙碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--朱仙碎片
	[1702026] = {Name = "雷震子碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--雷震子碎片
	[1702028] = {Name = "吕布碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--吕布碎片
	[1702030] = {Name = "燕青碎片",Award = {[1] = {Id = 1401005,Val = 150}}},--燕青碎片
	[1702031] = {Name = "秦琼碎片",Award = {[1] = {Id = 1401005,Val = 350}}},--秦琼碎片
	[1702050] = {Name = "柠檬精碎片",Award = {[1] = {Id = 1401005,Val = 100}}}--柠檬精碎片
}
ddt["card_debris"] = data
SetLooseReadonly(data)
return data