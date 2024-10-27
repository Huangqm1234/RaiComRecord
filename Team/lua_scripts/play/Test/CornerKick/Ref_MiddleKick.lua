--desc: 
gPlayTable.CreatePlay{
firstState = "Shoot",

["GetBall"] = {
	switch = function()
		if CBall2RoleDist("Receiver") < 20 then
			return "Shoot"
		end
	end,
	Kicker   = task.GoRecePos("Kicker"),
	Receiver = task.GetBall("Receiver","Receiver"),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "finish"
		end
	end,
	Receiver = task.Shoot("Receiver"),
	Kicker = task.RefDef("Kicker"),
	Goalie = task.Goalie()
},

name = "Ref_MiddleKick"
}