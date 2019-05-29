--[[
--note:
客户端星级评分的表
colums:
{Id,ID} ,{Condition,条件} ,{Param[1],参数1} ,{Param[2],参数2} ,{Des,描述} ,{Mul,参数乘数}
primary key:
#0 [星级评分]: Id
]]
return{
	[1] = {Condition = 101,Param = {[1] = 1},Des = "消灭全部敌方单位",Mul = 1},--消灭全部敌人。参数: 1表示ture
	[2] = {Condition = 102,Param = {[1] = 0.5},Des = "己方剩余血量超过%s%%",Mul = 100},--己方剩余血量百分比。参数: 剩余血量的百分比
	[3] = {Condition = 102,Param = {[1] = 0.35},Des = "己方剩余血量超过%s%%",Mul = 100},--己方剩余血量百分比。参数: 剩余血量的百分比
	[4] = {Condition = 103,Param = {[1] = 7},Des = "战斗不超过%s回合",Mul = 1},--指定回合内消灭全部敌人。参数: 回合数值
	[5] = {Condition = 103,Param = {[1] = 8},Des = "战斗不超过%s回合",Mul = 1},--指定回合内消灭全部敌人。参数: 回合数值
	[6] = {Condition = 104,Param = {[1] = 1},Des = "无红色守护灵上阵",Mul = 1},--限制守护灵颜色。参数: 守护灵的颜色类型id
	[7] = {Condition = 104,Param = {[1] = 2},Des = "无黄色守护灵上阵",Mul = 1},--限制守护灵颜色。参数: 守护灵的颜色类型id
	[8] = {Condition = 104,Param = {[1] = 3},Des = "无蓝色守护灵上阵",Mul = 1}--限制守护灵颜色。参数: 守护灵的颜色类型id
}