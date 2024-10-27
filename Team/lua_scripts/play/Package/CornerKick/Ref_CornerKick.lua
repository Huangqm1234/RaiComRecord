goto_x = function() 
	local x
	x = 180
	return x
end

goto_y  = function()
	local y 
	if CGetBallY() > 0 then
		y = -80
	else
		y = 80
	end
	return y
end

goto_dir = function()
	return CRole2OppGoalDir("Kicker")
end

gPlayTable.CreatePlay{
firstState = "GetBall",

["GetBall"] = {
	switch = function()
		if CBall2RoleDist("Receiver") < 30 and CIsGetBall("Receiver") then
			return "PassBall"
		end
	end,
	Kicker   = task.GotoPos("Kicker",goto_x,goto_y,goto_dir),
	Receiver = task.GetBall("Receiver","Receiver"),
	Goalie   = task.Goalie()
},

["PassBall"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Shoot"
		end
	end,
	Kicker   = task.GotoPos("Kicker",goto_x,goto_y,goto_dir),
	Receiver = task.PassBall("Receiver","Kicker"),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "finish"
		end
	end,
	Kicker = task.Shoot("Kicker"),
	Receiver = task.RefDef("Receiver"),
	Goalie = task.Goalie()
},

name = "Ref_CornerKick"
}