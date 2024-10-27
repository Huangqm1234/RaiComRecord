gPlayTable.CreatePlay{
firstState = "penaltykick",

["penaltykick"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "Finish"
		end
	end,
	Kicker   = task.KickerTask("myshoot"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie   = task.Goalie()
},

["Finish"] ={
	switch = function()
		if Cbuf_cnt(true,60) then
			return "Finish"
		end
	end,
	Kicker  = task.RobotHalt("Kicker"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
},
name = "penaltykick"
}