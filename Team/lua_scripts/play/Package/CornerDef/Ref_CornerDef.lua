gPlayTable.CreatePlay{
firstState = "doCornerDef",
switch = function()
	return "doCornerDef"
end,
["doCornerDef"] = {
	Kicker  = task.RefDef("Kicker"),
	Receive = task.RefDef("Receiver"),
	Goalie  = task.Goalie()
},

name = "Ref_CornerDef"
}