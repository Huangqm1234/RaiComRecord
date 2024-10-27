gPlayTable.CreatePlay{

firstState = "halt",
--switch = function()
	--return "halt"
--end,

["halt"] = {
	Kicker    = task.RobotHalt("Kicker"),
	--Receiver  = task.RobotHalt("Receiver"),
	--Goalie    = task.RobotHalt("Goalie")
},

name = "Ref_Halt"
}
