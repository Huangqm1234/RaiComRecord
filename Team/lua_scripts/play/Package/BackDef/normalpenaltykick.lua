--desc: 
gPlayTable.CreatePlay{
firstState = "penaltykick",

["penaltykick"] = {
	switch = function()
		if CBall2RoleDist("Receiver") < 15 then
			return "Finish"
		end
	end,
	Kicker   = task.KickerTask("myshoot2"),
	Receiver = task.GotoPos("Receiver",0,0,0),
	Goalie   = task.Goalie()
	
},

["Finish"] ={
	switch = function()
		if Cbuf_cnt(true,120) then
			return "Finish"
		end
	end,
	Kicker  = task.RobotHalt("Kicker"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
},


name = "normalpenaltykick"
}