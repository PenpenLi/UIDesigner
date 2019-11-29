--[[
output from excel 养成进度.xlsx
--note:
记录挂机关养成进度
colums:
{Lv[1],等级T1} ,{Lv[2],等级T2} ,{Lv[3],等级T3} ,{nCard,卡牌数量} ,{Cards[1],卡牌Id1} ,{Cards[2],卡牌Id2} ,{Cards[3],卡牌Id3} ,{Cards[4],卡牌Id4} ,{Cards[5],卡牌Id5} ,{Cards[6],卡牌Id6} ,{Cards[7],卡牌Id7} ,{Cards[8],卡牌Id8} ,{Cards[9],卡牌Id9} ,{Star[1],R星级} ,{Star[2],SR星级} ,{Star[3],SSR星级} ,{Star[4],UR星级} ,{Bk[1],1梯队突破} ,{Bk[2],2梯队突破} ,{Bk[3],3梯队突破} ,{Ghost[1],1梯队魂火} ,{Ghost[2],2梯队魂火} ,{Ghost[3],3梯队魂火} ,{EqpLv[1],1梯队装备等级} ,{EqpLv[2],2梯队装备等级} ,{EqpLv[3],3梯队装备等级} ,{Eqp[1].LvId,大哥装备等级} ,{Eqp[1].Qua,大哥装备品质} ,{Eqp[2].LvId,1梯队装备等级} ,{Eqp[2].Qua,1梯队装备品质} ,{Eqp[3].LvId,2梯队装备等级} ,{Eqp[3].Qua,2梯队装备品质} ,{Eqp[4].LvId,3梯队装备等级} ,{Eqp[4].Qua,3梯队装备品质}
primary key:
#0 [挂机养成进度]: ChaLoc
]]
local _T = LangUtil.Language
return{
	[0] = {Lv = {[1] = 0,[2] = 0,[3] = 0},nCard = 0,Cards = {[1] = 1102015,[2] = 1102050,[3] = 1102004},Star = {[1] = 1,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 1,[2] = 1,[3] = 1},Ghost = {[1] = 0,[2] = 0,[3] = 0},EqpLv = {[1] = 0,[2] = 0,[3] = 0},Eqp = {[1] = {LvId = 0,Qua = 0},[2] = {LvId = 0,Qua = 0},[3] = {LvId = 0,Qua = 0},[4] = {LvId = 0,Qua = 0}}},--未定义
	[1] = {Lv = {[1] = 7,[2] = 1,[3] = 1},nCard = 3,Cards = {[1] = 1102015,[2] = 1102050,[3] = 1102004},Star = {[1] = 1,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 2,[2] = 1,[3] = 1},Ghost = {[1] = 1,[2] = 1,[3] = 1},EqpLv = {[1] = 7,[2] = 0,[3] = 0},Eqp = {[1] = {LvId = 0,Qua = 0},[2] = {LvId = 0,Qua = 0},[3] = {LvId = 0,Qua = 0},[4] = {LvId = 0,Qua = 0}}},--挂机1章
	[2] = {Lv = {[1] = 15,[2] = 7,[3] = 1},nCard = 3,Cards = {[1] = 1102015,[2] = 1102050,[3] = 1102004},Star = {[1] = 1,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 3,[2] = 2,[3] = 1},Ghost = {[1] = 3,[2] = 1,[3] = 1},EqpLv = {[1] = 15,[2] = 7,[3] = 0},Eqp = {[1] = {LvId = 0,Qua = 0},[2] = {LvId = 0,Qua = 0},[3] = {LvId = 0,Qua = 0},[4] = {LvId = 0,Qua = 0}}},--挂机2章
	[3] = {Lv = {[1] = 25,[2] = 15,[3] = 7},nCard = 3,Cards = {[1] = 1102002,[2] = 1102050,[3] = 1102004},Star = {[1] = 1,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 4,[2] = 3,[3] = 2},Ghost = {[1] = 5,[2] = 2,[3] = 1},EqpLv = {[1] = 25,[2] = 10,[3] = 5},Eqp = {[1] = {LvId = 1,Qua = 4},[2] = {LvId = 1,Qua = 3},[3] = {LvId = 0,Qua = 0},[4] = {LvId = 0,Qua = 0}}},--挂机3章
	[4] = {Lv = {[1] = 30,[2] = 25,[3] = 15},nCard = 3,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102004},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 4,[2] = 4,[3] = 3},Ghost = {[1] = 6,[2] = 4,[3] = 3},EqpLv = {[1] = 30,[2] = 15,[3] = 7},Eqp = {[1] = {LvId = 1,Qua = 5},[2] = {LvId = 1,Qua = 4},[3] = {LvId = 0,Qua = 0},[4] = {LvId = 0,Qua = 0}}},--挂机4章
	[5] = {Lv = {[1] = 35,[2] = 30,[3] = 25},nCard = 4,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102004},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 5,[2] = 4,[3] = 4},Ghost = {[1] = 7,[2] = 5,[3] = 5},EqpLv = {[1] = 35,[2] = 25,[3] = 10},Eqp = {[1] = {LvId = 1,Qua = 5},[2] = {LvId = 1,Qua = 4},[3] = {LvId = 1,Qua = 3},[4] = {LvId = 0,Qua = 0}}},--挂机5章
	[6] = {Lv = {[1] = 40,[2] = 35,[3] = 30},nCard = 4,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102004},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 5,[2] = 5,[3] = 4},Ghost = {[1] = 9,[2] = 6,[3] = 6},EqpLv = {[1] = 40,[2] = 30,[3] = 15},Eqp = {[1] = {LvId = 1,Qua = 5},[2] = {LvId = 1,Qua = 4},[3] = {LvId = 1,Qua = 3},[4] = {LvId = 0,Qua = 0}}},--挂机6章
	[7] = {Lv = {[1] = 45,[2] = 40,[3] = 35},nCard = 4,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 6,[2] = 5,[3] = 5},Ghost = {[1] = 11,[2] = 8,[3] = 7},EqpLv = {[1] = 45,[2] = 35,[3] = 25},Eqp = {[1] = {LvId = 2,Qua = 5},[2] = {LvId = 2,Qua = 4},[3] = {LvId = 1,Qua = 3},[4] = {LvId = 1,Qua = 3}}},--挂机7章
	[8] = {Lv = {[1] = 50,[2] = 45,[3] = 40},nCard = 4,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 7,[2] = 6,[3] = 5},Ghost = {[1] = 13,[2] = 10,[3] = 9},EqpLv = {[1] = 50,[2] = 40,[3] = 30},Eqp = {[1] = {LvId = 2,Qua = 5},[2] = {LvId = 2,Qua = 4},[3] = {LvId = 1,Qua = 3},[4] = {LvId = 1,Qua = 3}}},--挂机8章
	[9] = {Lv = {[1] = 55,[2] = 50,[3] = 45},nCard = 5,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021,[5] = 1102014},Star = {[1] = 2,[2] = 1,[3] = 1,[4] = 1},Bk = {[1] = 8,[2] = 7,[3] = 6},Ghost = {[1] = 15,[2] = 12,[3] = 11},EqpLv = {[1] = 55,[2] = 45,[3] = 35},Eqp = {[1] = {LvId = 2,Qua = 5},[2] = {LvId = 2,Qua = 4},[3] = {LvId = 2,Qua = 3},[4] = {LvId = 1,Qua = 3}}},--挂机9章
	[10] = {Lv = {[1] = 60,[2] = 55,[3] = 50},nCard = 5,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021,[5] = 1102014},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 9,[2] = 8,[3] = 7},Ghost = {[1] = 17,[2] = 14,[3] = 13},EqpLv = {[1] = 60,[2] = 50,[3] = 40},Eqp = {[1] = {LvId = 2,Qua = 5},[2] = {LvId = 2,Qua = 4},[3] = {LvId = 2,Qua = 3},[4] = {LvId = 1,Qua = 3}}},--挂机10章
	[11] = {Lv = {[1] = 65,[2] = 60,[3] = 55},nCard = 5,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021,[5] = 1102014},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 10,[2] = 9,[3] = 8},Ghost = {[1] = 19,[2] = 16,[3] = 15},EqpLv = {[1] = 65,[2] = 55,[3] = 45},Eqp = {[1] = {LvId = 3,Qua = 5},[2] = {LvId = 3,Qua = 4},[3] = {LvId = 2,Qua = 3},[4] = {LvId = 2,Qua = 3}}},--挂机11章
	[12] = {Lv = {[1] = 70,[2] = 65,[3] = 60},nCard = 6,Cards = {[1] = 1102002,[2] = 1102005,[3] = 1102020,[4] = 1102021,[5] = 1102014,[6] = 1102015},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 10,[2] = 10,[3] = 9},Ghost = {[1] = 21,[2] = 18,[3] = 17},EqpLv = {[1] = 70,[2] = 60,[3] = 50},Eqp = {[1] = {LvId = 3,Qua = 5},[2] = {LvId = 3,Qua = 4},[3] = {LvId = 2,Qua = 3},[4] = {LvId = 2,Qua = 3}}},--挂机12章
	[13] = {Lv = {[1] = 75,[2] = 70,[3] = 65},nCard = 6,Cards = {[1] = 1102003,[2] = 1102005,[3] = 1102020,[4] = 1102002,[5] = 1102014,[6] = 1102021},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 11,[2] = 10,[3] = 10},Ghost = {[1] = 23,[2] = 20,[3] = 19},EqpLv = {[1] = 75,[2] = 65,[3] = 55},Eqp = {[1] = {LvId = 3,Qua = 5},[2] = {LvId = 3,Qua = 4},[3] = {LvId = 3,Qua = 3},[4] = {LvId = 2,Qua = 3}}},--挂机13章
	[14] = {Lv = {[1] = 80,[2] = 75,[3] = 70},nCard = 7,Cards = {[1] = 1102003,[2] = 1102005,[3] = 1102020,[4] = 1102002,[5] = 1102014,[6] = 1102017,[7] = 1102021},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 12,[2] = 11,[3] = 10},Ghost = {[1] = 25,[2] = 22,[3] = 21},EqpLv = {[1] = 80,[2] = 70,[3] = 60},Eqp = {[1] = {LvId = 3,Qua = 5},[2] = {LvId = 3,Qua = 4},[3] = {LvId = 3,Qua = 3},[4] = {LvId = 2,Qua = 3}}},--挂机14章
	[15] = {Lv = {[1] = 85,[2] = 80,[3] = 75},nCard = 7,Cards = {[1] = 1102003,[2] = 1102005,[3] = 1102020,[4] = 1102002,[5] = 1102014,[6] = 1102017,[7] = 1102021},Star = {[1] = 3,[2] = 2,[3] = 1,[4] = 1},Bk = {[1] = 12,[2] = 12,[3] = 11},Ghost = {[1] = 27,[2] = 24,[3] = 23},EqpLv = {[1] = 85,[2] = 75,[3] = 65},Eqp = {[1] = {LvId = 4,Qua = 5},[2] = {LvId = 4,Qua = 4},[3] = {LvId = 3,Qua = 3},[4] = {LvId = 3,Qua = 3}}},--挂机15章
	[16] = {Lv = {[1] = 90,[2] = 85,[3] = 80},nCard = 8,Cards = {[1] = 1102003,[2] = 1102005,[3] = 1102016,[4] = 1102020,[5] = 1102002,[6] = 1102014,[7] = 1102017,[8] = 1102021},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 13,[2] = 12,[3] = 12},Ghost = {[1] = 29,[2] = 26,[3] = 25},EqpLv = {[1] = 90,[2] = 80,[3] = 70},Eqp = {[1] = {LvId = 4,Qua = 5},[2] = {LvId = 4,Qua = 4},[3] = {LvId = 3,Qua = 3},[4] = {LvId = 3,Qua = 3}}},--挂机16章
	[17] = {Lv = {[1] = 95,[2] = 90,[3] = 85},nCard = 8,Cards = {[1] = 1102003,[2] = 1102005,[3] = 1102016,[4] = 1102020,[5] = 1102002,[6] = 1102014,[7] = 1102017,[8] = 1102021},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 14,[2] = 13,[3] = 12},Ghost = {[1] = 31,[2] = 28,[3] = 27},EqpLv = {[1] = 95,[2] = 85,[3] = 75},Eqp = {[1] = {LvId = 5,Qua = 5},[2] = {LvId = 5,Qua = 4},[3] = {LvId = 4,Qua = 3},[4] = {LvId = 3,Qua = 3}}},--挂机17章
	[18] = {Lv = {[1] = 100,[2] = 95,[3] = 90},nCard = 9,Cards = {[1] = 1102003,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102002,[7] = 1102014,[8] = 1102017,[9] = 1102021},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 14,[2] = 14,[3] = 13},Ghost = {[1] = 33,[2] = 30,[3] = 29},EqpLv = {[1] = 100,[2] = 90,[3] = 80},Eqp = {[1] = {LvId = 5,Qua = 5},[2] = {LvId = 5,Qua = 4},[3] = {LvId = 4,Qua = 3},[4] = {LvId = 3,Qua = 3}}},--挂机18章
	[19] = {Lv = {[1] = 105,[2] = 100,[3] = 95},nCard = 9,Cards = {[1] = 1102003,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102002,[7] = 1102014,[8] = 1102017,[9] = 1102021},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 15,[2] = 14,[3] = 14},Ghost = {[1] = 35,[2] = 32,[3] = 31},EqpLv = {[1] = 105,[2] = 95,[3] = 85},Eqp = {[1] = {LvId = 6,Qua = 5},[2] = {LvId = 6,Qua = 4},[3] = {LvId = 5,Qua = 3},[4] = {LvId = 4,Qua = 3}}},--挂机19章
	[20] = {Lv = {[1] = 110,[2] = 105,[3] = 100},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 16,[2] = 15,[3] = 14},Ghost = {[1] = 37,[2] = 34,[3] = 33},EqpLv = {[1] = 110,[2] = 100,[3] = 90},Eqp = {[1] = {LvId = 6,Qua = 5},[2] = {LvId = 6,Qua = 4},[3] = {LvId = 5,Qua = 3},[4] = {LvId = 4,Qua = 3}}},--挂机20章
	[21] = {Lv = {[1] = 115,[2] = 110,[3] = 105},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 4,[2] = 3,[3] = 2,[4] = 1},Bk = {[1] = 16,[2] = 16,[3] = 15},Ghost = {[1] = 39,[2] = 36,[3] = 35},EqpLv = {[1] = 115,[2] = 105,[3] = 95},Eqp = {[1] = {LvId = 7,Qua = 5},[2] = {LvId = 7,Qua = 4},[3] = {LvId = 6,Qua = 3},[4] = {LvId = 5,Qua = 3}}},--挂机21章
	[22] = {Lv = {[1] = 120,[2] = 115,[3] = 110},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 17,[2] = 16,[3] = 16},Ghost = {[1] = 41,[2] = 38,[3] = 37},EqpLv = {[1] = 120,[2] = 110,[3] = 100},Eqp = {[1] = {LvId = 7,Qua = 5},[2] = {LvId = 7,Qua = 4},[3] = {LvId = 6,Qua = 3},[4] = {LvId = 5,Qua = 3}}},--挂机22章
	[23] = {Lv = {[1] = 125,[2] = 120,[3] = 115},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 18,[2] = 17,[3] = 16},Ghost = {[1] = 43,[2] = 40,[3] = 39},EqpLv = {[1] = 125,[2] = 115,[3] = 105},Eqp = {[1] = {LvId = 8,Qua = 5},[2] = {LvId = 8,Qua = 4},[3] = {LvId = 7,Qua = 3},[4] = {LvId = 6,Qua = 3}}},--挂机23章
	[24] = {Lv = {[1] = 130,[2] = 125,[3] = 120},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 18,[2] = 18,[3] = 17},Ghost = {[1] = 45,[2] = 42,[3] = 41},EqpLv = {[1] = 130,[2] = 120,[3] = 110},Eqp = {[1] = {LvId = 8,Qua = 5},[2] = {LvId = 8,Qua = 4},[3] = {LvId = 7,Qua = 3},[4] = {LvId = 6,Qua = 3}}},--挂机24章
	[25] = {Lv = {[1] = 135,[2] = 130,[3] = 125},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 19,[2] = 18,[3] = 18},Ghost = {[1] = 47,[2] = 44,[3] = 43},EqpLv = {[1] = 135,[2] = 125,[3] = 115},Eqp = {[1] = {LvId = 9,Qua = 5},[2] = {LvId = 9,Qua = 4},[3] = {LvId = 8,Qua = 3},[4] = {LvId = 7,Qua = 3}}},--挂机25章
	[26] = {Lv = {[1] = 140,[2] = 135,[3] = 130},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 20,[2] = 19,[3] = 18},Ghost = {[1] = 49,[2] = 46,[3] = 45},EqpLv = {[1] = 140,[2] = 130,[3] = 120},Eqp = {[1] = {LvId = 9,Qua = 5},[2] = {LvId = 9,Qua = 4},[3] = {LvId = 8,Qua = 3},[4] = {LvId = 7,Qua = 3}}},--挂机26章
	[27] = {Lv = {[1] = 145,[2] = 140,[3] = 135},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 20,[2] = 20,[3] = 19},Ghost = {[1] = 51,[2] = 48,[3] = 47},EqpLv = {[1] = 145,[2] = 135,[3] = 125},Eqp = {[1] = {LvId = 10,Qua = 5},[2] = {LvId = 10,Qua = 4},[3] = {LvId = 9,Qua = 3},[4] = {LvId = 8,Qua = 3}}},--挂机27章
	[28] = {Lv = {[1] = 150,[2] = 145,[3] = 140},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 20,[2] = 20,[3] = 20},Ghost = {[1] = 52,[2] = 50,[3] = 49},EqpLv = {[1] = 150,[2] = 140,[3] = 130},Eqp = {[1] = {LvId = 10,Qua = 5},[2] = {LvId = 10,Qua = 4},[3] = {LvId = 9,Qua = 3},[4] = {LvId = 8,Qua = 3}}},--挂机28章
	[29] = {Lv = {[1] = 150,[2] = 150,[3] = 145},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 20,[2] = 20,[3] = 20},Ghost = {[1] = 52,[2] = 51,[3] = 51},EqpLv = {[1] = 150,[2] = 145,[3] = 135},Eqp = {[1] = {LvId = 11,Qua = 5},[2] = {LvId = 11,Qua = 4},[3] = {LvId = 10,Qua = 3},[4] = {LvId = 9,Qua = 3}}},--挂机29章
	[30] = {Lv = {[1] = 150,[2] = 150,[3] = 150},nCard = 9,Cards = {[1] = 1102012,[2] = 1102011,[3] = 1102016,[4] = 1102005,[5] = 1102020,[6] = 1102003,[7] = 1102014,[8] = 1102017,[9] = 1102002},Star = {[1] = 5,[2] = 4,[3] = 3,[4] = 2},Bk = {[1] = 20,[2] = 20,[3] = 20},Ghost = {[1] = 52,[2] = 52,[3] = 52},EqpLv = {[1] = 150,[2] = 150,[3] = 140},Eqp = {[1] = {LvId = 11,Qua = 5},[2] = {LvId = 11,Qua = 4},[3] = {LvId = 10,Qua = 3},[4] = {LvId = 9,Qua = 3}}}--挂机30章
}