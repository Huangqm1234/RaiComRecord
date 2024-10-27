--desc: 后场任意球

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
		if CGetBallY() > 0 then
			return "getball"
		else
			return "getball2"
		end
	end,
	Kicker   = task.Stop("Kicker",1),
	Receiver = task.Stop("Receiver",3) ,
	Goalie   = task.Stop("Goalie",6),
},

["getball"] = {
	switch = function()
		if CRole2TargetDist("Receiver")<10  and Cbuf_cnt(true, 50) then
			return "firstpass"
		end
	end,
	Kicker   = task.KickerTask("getball"),
	Receiver = task.GotoPos("Receiver", -30,-100, Receiver2Kickerdir),
	Goalie   = task.Goalie()
},

["firstpass"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "firstwait"
		elseif  Cbuf_cnt(true, 120) then
			return "firstwait"
		end
	end,
	Kicker   = task.PassBall("Kicker", "Receiver"),
	Receiver = task.ReceiverTask("receiveball"),
	Goalie   = task.Goalie()
},

["firstwait"] = {
	switch = function()
		if  Cbuf_cnt(true, 150) then
			return "backball"
		end
	end,
	Kicker   = task.GotoPos("Kicker", 100, 30, Kickerdir2Receiverdir),
	Receiver = task.ReceiverTask("receiveball"),
	Goalie   = task.Goalie()
},

["backball"] = {
	switch = function()
		if Cbuf_cnt(CRole2TargetDist("Kicker")<10, 60) then
			return "sidepass"
		--elseif bufcnt(true, 120) then
		--	return "sidepass"
		end
	end,
	Kicker   = task.GotoPos("Kicker", 100, 30, Kickerdir2Receiverdir),
	Receiver = task.ReceiverTask("getball"),
	Goalie   = task.Goalie()
},

["sidepass"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "sidewait"
		elseif  Cbuf_cnt(true, 120) then
			return "sidewait"
		end
	end,
	Kicker   = task.KickerTask("receiveball"),
	Receiver = task.PassBall("Receiver","Kicker"),
	Goalie   = task.Goalie()
},

["sidewait"] = {
	switch = function()
		if CBall2RoleDist("Kicker")<10 then
			return "finalshoot"
		elseif  Cbuf_cnt(true, 120) then
			return "finalshoot"
		end
	end,
	Receiver   = task.RefDef("Receiver"),
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
	Receiver   = task.RefDef("Receiver"),
	Kicker   = task.KickerTask("shoot"),
	Goalie   = task.Goalie()
},

["getball2"] = {
	switch = function()
		if CRole2TargetDist("Receiver")<10  and Cbuf_cnt(true, 50) then
			return "firstpass2"
		end
	end,
	Kicker   = task.KickerTask("getball"),
	Receiver = task.GotoPos("Receiver", -30,100, Receiver2Kickerdir),
	Goalie   = task.Goalie()
},

["firstpass2"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "firstwait2"
		elseif  Cbuf_cnt(true, 120) then
			return "firstwait2"
		end
	end,
	Kicker   = task.PassBall("Kicker", "Receiver"),
	Receiver = task.ReceiverTask("receiveball"),
	Goalie   = task.Goalie()
},

["firstwait2"] = {
	switch = function()
		if  Cbuf_cnt(true, 150) then
			return "backball2"
		end
	end,
	Kicker   = task.GotoPos("Kicker", 100,-30, Kickerdir2Receiverdir),
	Receiver = task.ReceiverTask("receiveball"),
	Goalie   = task.Goalie()
},

["backball2"] = {
	switch = function()
		if Cbuf_cnt(CRole2TargetDist("Kicker")<10, 60) then
			return "sidepass2"
		--elseif bufcnt(true, 120) then
		--	return "sidepass"
		end
	end,
	Kicker   = task.GotoPos("Kicker", 100,-30, Kickerdir2Receiverdir),
	Receiver = task.ReceiverTask("getball"),
	Goalie   = task.Goalie()
},

["sidepass2"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "sidewait2"
		elseif  Cbuf_cnt(true, 120) then
			return "sidewait2"
		end
	end,
	Kicker   = task.KickerTask("receiveball"),
	Receiver = task.PassBall("Receiver","Kicker"),
	Goalie   = task.Goalie()
},

["sidewait2"] = {
	switch = function()
		if CBall2RoleDist("Kicker")<10 then
			return "finalshoot2"
		elseif  Cbuf_cnt(true, 120) then
			return "finalshoot2"
		end
	end,
	Receiver   = task.RefDef("Receiver"),
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
	Receiver   = task.RefDef("Receiver"),
	Kicker   = task.KickerTask("shoot"),
	Goalie   = task.Goalie()
},

name = "BackKick_3v3"
}
