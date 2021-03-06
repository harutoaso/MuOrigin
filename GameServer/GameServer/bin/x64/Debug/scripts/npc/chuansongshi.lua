-- kevinh - the following lines are part of our standard init
-- require("compat-5.1")
-- 传送员
function talk(luaMgr, client, params)
  return '<span class="title">城市地图：</span>\n'
		..'<span class="chuansong">'
       ..'<a href="event:tomap1">龙 隐 村</a>    <a href="event:tomap2">龙    城</a>    <a href="event:tomap6">传奇之野</a>\n'
       ..'<a href="event:tomap1011">三 清 观</a>\n'
		..'</span>\n'

       ..'<span class="title">练级地图：</span>\n'
		..'<span class="chuansong">'
       ..'<a href="event:tomap3">万 兽 谷</a>    <a href="event:tomap4">血林禁地</a>    <a href="event:tomap5">莫 邪 殿</a>\n'
       ..'<a href="event:tomap7">绝迹鬼道</a>    <a href="event:tomap8">浊世炼圣</a>    <a href="event:tomap9">仙踪魔狱</a>\n'
       ..'<a href="event:tomap10">中天走廊</a>    <a href="event:tomap11">创世冰原</a>    <a href="event:tomap12">天绝炼狱</a>\n'
       ..'<a href="event:tomap13">轮 回 道</a>    <a href="event:_tomap14">圣影魔穴</a>\n'
		..'</span>\n'
		
       ..'<span class="title">装备地图：</span>\n'
		..'<span class="chuansong">'
       ..'<a href="event:tomap6000">血林魔禁</a>    <a href="event:tomap6001">神剑广场</a>    <a href="event:tomap6002">浊世深渊</a>\n'
		..'</span>\n'

	..'<span class="title">挖矿地图：</span>\n'
		..'<span class="chuansong">'
       ..'<a href="event:tomap30">矿洞</a>\n'
		..'</span>\n'
end

function tomap1(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 1, 1)
end

function tomap2(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 15, 2)
end

function tomap6(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 30, 6)
end

function tomap1011(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 15, 1011)
end

-- 王城 35级
function tomap4400(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 35, 4400)
end

function tomap3(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 20, 3)
end

function tomap4(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 25, 4)
end

function tomap5(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 30, 5)
end

function tomap7(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 32, 7)
end

function tomap8(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 38, 8)
end

function tomap9(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 40, 9)
end

function tomap10(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 45, 10)
end

function tomap11(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 50, 11)
end

function tomap12(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 50, 12)
end

function tomap13(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 50, 13)
end

function _tomap14(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 60, 14)
end

function tomap6000(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 35, 6000)
end

function tomap6001(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 40, 6001)
end

function tomap6002(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 45, 6002)
end

function tomap30(luaMgr, client, params)
     return checkAndLetGo(luaMgr, client, 40, 30)
end
-- 检查和传送
function checkAndLetGo(luaMgr, client, level, mapid)
     if (not checkLevel(luaMgr, client, level)) then
        luaMgr:Error(client, '角色等级不够'..level..'，不能传送')
	return 'keepopen'
     end

     luaMgr:GotoMap(client, mapid)
     return 'closewindow'
end

-- 检查角色层级
function checkLevel(luaMgr, client, level)
     if (luaMgr:GetRoleLevel(client) < level) then
        return false
     end

     return true
end