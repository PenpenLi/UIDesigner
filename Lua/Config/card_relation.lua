--[[
output from excel card.卡牌表.xlsx
--note:
卡牌缘分表
colums:
{Id,ID} ,{Name,缘分名字} ,{RelationIds[1],羁绊1} ,{RelationIds[2],羁绊2} ,{RelationIds[3],羁绊3} ,{RelationIds[4],羁绊4} ,{RelationIds[5],羁绊5} ,{Prop[1].Id,属性Id1} ,{Prop[1].Val,属性值1} ,{Prop[2].Id,属性Id2} ,{Prop[2].Val,属性值2}
primary key:
#0 [缘分]: CardId,Loc
]]
local _T = LangUtil.Language
if ddt["card_relation"] ~= nil then
	return ddt["card_relation"]
end
local data = {
	[1101001] = {
		[1] = {Id = 1,Name = "末将于禁",RelationIds = {[1] = 1101001,[2] = 1102015},Prop = {[1] = {Id = 110,Val = 0.01}}},
		[2] = {Id = 2,Name = "虎痴悍将",RelationIds = {[1] = 1101001,[2] = 1102002},Prop = {[1] = {Id = 108,Val = 0.01}}},
		[3] = {Id = 3,Name = "忠勇护卫",RelationIds = {[1] = 1101001,[2] = 1102009},Prop = {[1] = {Id = 110,Val = 0.05}}}
	},
	[1101002] = {
		[1] = {Id = 4,Name = "暴雨梨花",RelationIds = {[1] = 1101002,[2] = 1102004},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1101003] = {
		[1] = {Id = 5,Name = "前世情缘",RelationIds = {[1] = 1101003,[2] = 1102005},Prop = {[1] = {Id = 110,Val = 0.06}}}
	},
	[1101004] = {
		[1] = {Id = 6,Name = "霸王无双",RelationIds = {[1] = 1101004,[2] = 1102006},Prop = {[1] = {Id = 108,Val = 0.07}}}
	},
	[1101005] = {
		[1] = {Id = 7,Name = "春秋之义",RelationIds = {[1] = 1101005,[2] = 1102001},Prop = {[1] = {Id = 108,Val = 0.05}}},
		[2] = {Id = 8,Name = "断桥怒吼",RelationIds = {[1] = 1101005,[2] = 1102011},Prop = {[1] = {Id = 110,Val = 0.05}}}
	},
	[1101006] = {
		[1] = {Id = 9,Name = "缇娜",RelationIds = {[1] = 1101006,[2] = 1102007},Prop = {[1] = {Id = 104,Val = 0.07}}}
	},
	[1101007] = {
		[1] = {Id = 10,Name = "古之恶来",RelationIds = {[1] = 1101007,[2] = 1102003},Prop = {[1] = {Id = 104,Val = 0.03}}},
		[2] = {Id = 11,Name = "刚烈将军",RelationIds = {[1] = 1101007,[2] = 1102012},Prop = {[1] = {Id = 108,Val = 0.04}}},
		[3] = {Id = 12,Name = "巧变破军",RelationIds = {[1] = 1101007,[2] = 1102010},Prop = {[1] = {Id = 115,Val = 0.03}}}
	},
	[1101008] = {
		[1] = {Id = 13,Name = "第九骑士",RelationIds = {[1] = 1101008,[2] = 1102013},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1101009] = {
		[1] = {Id = 14,Name = "仙猴奇缘",RelationIds = {[1] = 1101009,[2] = 1102014},Prop = {[1] = {Id = 104,Val = 0.05}}}
	},
	[1101010] = {
		[1] = {Id = 15,Name = "西方巨龙",RelationIds = {[1] = 1101010,[2] = 1102016},Prop = {[1] = {Id = 109,Val = 0.07}}}
	},
	[1101011] = {
		[1] = {Id = 16,Name = "风之旅",RelationIds = {[1] = 1101011,[2] = 1102017},Prop = {[1] = {Id = 115,Val = 0.05}}}
	},
	[1101012] = {
		[1] = {Id = 17,Name = "羽林悍将",RelationIds = {[1] = 1101012,[2] = 1102018},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1101013] = {
		[1] = {Id = 18,Name = "食火坦克",RelationIds = {[1] = 1101013,[2] = 1102019},Prop = {[1] = {Id = 109,Val = 0.05}}}
	},
	[1101014] = {
		[1] = {Id = 19,Name = "陷阵之志",RelationIds = {[1] = 1101014,[2] = 1102020},Prop = {[1] = {Id = 108,Val = 0.06}}}
	},
	[1101015] = {
		[1] = {Id = 20,Name = "风吹火起",RelationIds = {[1] = 1101015,[2] = 1102021},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1101020] = {
		[1] = {Id = 44,Name = "姬烟华",RelationIds = {[1] = 1101020,[2] = 1102026},Prop = {[1] = {Id = 108,Val = 0.06}}}
	},
	[1101022] = {
		[1] = {Id = 43,Name = "幻",RelationIds = {[1] = 1101022,[2] = 1102023},Prop = {[1] = {Id = 109,Val = 0.05}}}
	},
	[1101042] = {
		[1] = {Id = 21,Name = "人类本质",RelationIds = {[1] = 1101042,[2] = 1102050},Prop = {[1] = {Id = 106,Val = 0.1}}}
	},
	[1102001] = {
		[1] = {Id = 22,Name = "春秋大义",RelationIds = {[1] = 1102001,[2] = 1101005},Prop = {[1] = {Id = 108,Val = 0.07}}}
	},
	[1102002] = {
		[1] = {Id = 23,Name = "虎痴护卫",RelationIds = {[1] = 1102002,[2] = 1101001},Prop = {[1] = {Id = 108,Val = 0.06}}}
	},
	[1102003] = {
		[1] = {Id = 24,Name = "古之恶来",RelationIds = {[1] = 1102002,[2] = 1101001},Prop = {[1] = {Id = 104,Val = 0.06}}}
	},
	[1102004] = {
		[1] = {Id = 25,Name = "暴雨梨花",RelationIds = {[1] = 1102004,[2] = 1101002},Prop = {[1] = {Id = 104,Val = 0.05}}}
	},
	[1102005] = {
		[1] = {Id = 26,Name = "前世情缘",RelationIds = {[1] = 1102005,[2] = 1101003},Prop = {[1] = {Id = 110,Val = 0.06}}}
	},
	[1102006] = {
		[1] = {Id = 27,Name = "霸王无双",RelationIds = {[1] = 1102006,[2] = 1101004},Prop = {[1] = {Id = 108,Val = 0.07}}}
	},
	[1102007] = {
		[1] = {Id = 28,Name = "缇娜",RelationIds = {[1] = 1102007,[2] = 1101006},Prop = {[1] = {Id = 104,Val = 0.07}}}
	},
	[1102009] = {
		[1] = {Id = 29,Name = "忠勇护卫",RelationIds = {[1] = 1102009,[2] = 1101001},Prop = {[1] = {Id = 109,Val = 0.06}}}
	},
	[1102010] = {
		[1] = {Id = 30,Name = "巧变破军",RelationIds = {[1] = 1102010,[2] = 1101007},Prop = {[1] = {Id = 115,Val = 0.07}}}
	},
	[1102011] = {
		[1] = {Id = 31,Name = "断桥怒吼",RelationIds = {[1] = 1102011,[2] = 1101005},Prop = {[1] = {Id = 110,Val = 0.07}}}
	},
	[1102012] = {
		[1] = {Id = 32,Name = "刚烈护国",RelationIds = {[1] = 1102012,[2] = 1101007},Prop = {[1] = {Id = 108,Val = 0.07}}}
	},
	[1102013] = {
		[1] = {Id = 33,Name = "第九骑士",RelationIds = {[1] = 1102013,[2] = 1101008},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1102014] = {
		[1] = {Id = 34,Name = "仙猴奇缘",RelationIds = {[1] = 1102014,[2] = 1101009},Prop = {[1] = {Id = 104,Val = 0.06}}}
	},
	[1102015] = {
		[1] = {Id = 35,Name = "誓死护主",RelationIds = {[1] = 1102015,[2] = 1101001},Prop = {[1] = {Id = 109,Val = 0.05}}}
	},
	[1102016] = {
		[1] = {Id = 36,Name = "西方骑士",RelationIds = {[1] = 1102016,[2] = 1101010},Prop = {[1] = {Id = 109,Val = 0.07}}}
	},
	[1102017] = {
		[1] = {Id = 37,Name = "风之旅人",RelationIds = {[1] = 1102017,[2] = 1101011},Prop = {[1] = {Id = 115,Val = 0.05}}}
	},
	[1102018] = {
		[1] = {Id = 38,Name = "羽林悍将",RelationIds = {[1] = 1102018,[2] = 1101012},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1102019] = {
		[1] = {Id = 39,Name = "第五骑士",RelationIds = {[1] = 1102019,[2] = 1101013},Prop = {[1] = {Id = 109,Val = 0.05}}}
	},
	[1102020] = {
		[1] = {Id = 40,Name = "陷阵之志",RelationIds = {[1] = 1102020,[2] = 1101014},Prop = {[1] = {Id = 108,Val = 0.06}}}
	},
	[1102021] = {
		[1] = {Id = 41,Name = "风吹火起",RelationIds = {[1] = 1102021,[2] = 1101015},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1102023] = {
		[1] = {Id = 45,Name = "异邦刀客",RelationIds = {[1] = 1102023,[2] = 1101022},Prop = {[1] = {Id = 108,Val = 0.05}}}
	},
	[1102026] = {
		[1] = {Id = 46,Name = "雷震子",RelationIds = {[1] = 1102026,[2] = 1101020},Prop = {[1] = {Id = 106,Val = 0.1}}}
	},
	[1102050] = {
		[1] = {Id = 42,Name = "人类本质",RelationIds = {[1] = 1102050,[2] = 1101042},Prop = {[1] = {Id = 106,Val = 0.1}}}
	}
}
ddt["card_relation"] = data
SetLooseReadonly(data)
return data