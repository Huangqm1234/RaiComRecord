--desc: 蓝队进攻， Receiver 抢球后判断如果离对方球门近则直接射门，否则传球给 Kicker  ， Kicker 射门

--local Receiver_POS = CGeoPoint:new_local(100,150)
--local KICKER_POS1 = CGeoPoint:new_local(-100,-150)
--local KICKER_POS2 = CGeoPoint:new_local(200,-150)
--local Tier_POS = CGeoPoint:new_local(-200,50)
local Kickerdir2Tierdir = function()
	return COurRole2RoleDir("Kicker", "Tier")
end

local Tier2Kickerdir = function()
	return CRole2BallDir("Tier")
end

local Receiver2Kickerdir = function()
	return COurRole2RoleDir("Receiver", "Kicker")
end

local Kickerdir2Receiverdir = function()
	return COurRole2RoleDir("Kicker", "Receiver")
end

local Tierdir2Receiverdir = function()
	return COurRole2RoleDir("Tier", "Receiver")
end

gPlayTable.CreatePlay{

firstState = "xy",

["xy"] = {
	switch = function()
		if CGetBallX() > 220 then
			return "getshoot"
		elseif CGetBallY() > 0 then
			return "getball"
		else
			return "getball2"
		end
	end,
	Kicker   = task.Stop("Kicker",1),
	Receiver = task.Stop("Receiver",3) ,
	Goalie   = task.Stop("Goalie",6),
},


["getshoot"] = {
	switch = function()
		if CRole2TargetDist("Kicker")<10  and Cbuf_cnt(true, 50) then
			return "gshoot"
		end
	end,
	Receiver   = task.ReceiverTask("getball"),
	Kicker   = task.GotoPos("Kicker", 120,-30, Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

["gshoot"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "finish"
		elseif Cbuf_cnt(true, 300) then
			return "finish"
		end
	end,
	Kicker  = task.KickerTask("MarkingBallFake"),
	Receiver   = task.ReceiverTask("shoot"),
	Goalie   = task.goalie()
},

["getball"] = {
	switch = function()
		if CRole2TargetDist("Kicker")<10  and Cbuf_cnt(true, 50) then
			return "firstpass"
		end
	end,
	Receiver   = task.ReceiverTask("getball"),
	Kicker   = task.GotoPos("Kicker", 120,-150, Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

["firstpass"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "firstwait"
		elseif  Cbuf_cnt(true, 120) then
			return "firstwait"
		end
	end,
	Receiver   = task.PassBall("Receiver", "Kicker"),
	Kicker   = task.KickerTask("receiveball"),
	Goalie   = task.Goalie()
},

["firstwait"] = {
	switch = function()
		if  Cbuf_cnt(true, 150) then
			return "finalshoot"
		end
	end,
	Receiver = task.ReceiverTask("RefDefBad"),
	Kicker   = task.KickerTask("receiveball"),
	Goalie   = task.Goalie()
},

["finalshoot"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "finish"
		elseif Cbuf_cnt(true, 300) then
			return "finish"
		end
	end,
	Receiver = task.ReceiverTask("RefDefBad"),
	Kicker   = task.KickerTask("shoot"),
	Goalie   = task.goalie()
},


["getball2"] = {
	switch = function()
		if CRole2TargetDist("Kicker")<10  and Cbuf_cnt(true, 50) then
			return "firstpass2"
		end
	end,
	Receiver   = task.ReceiverTask("getball"),
	Kicker   = task.GotoPos("Kicker", 120,150, Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

["firstpass2"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "firstwait2"
		elseif  Cbuf_cnt(true, 120) then
			return "firstwait2"
		end
	end,
	Receiver   = task.PassBall("Receiver", "Kicker"),
	Kicker   = task.KickerTask("receiveball"),
	Goalie   = task.Goalie()
},

["firstwait2"] = {
	switch = function()
		if  Cbuf_cnt(true, 150) then
			return "finalshoot2"
		end
	end,
	Receiver = task.ReceiverTask("RefDefBad"),
	Kicker   = task.KickerTask("receiveball"),
	Goalie   = task.Goalie()
},

["finalshoot2"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "finish"
		elseif Cbuf_cnt(true, 300) then
			return "finish"
		end
	end,
	Receiver = task.ReceiverTask("RefDefBad"),
	Kicker   = task.KickerTask("shoot"),
	Goalie   = task.goalie()
},


name = "Ref_FrontKick_3v3"
}
