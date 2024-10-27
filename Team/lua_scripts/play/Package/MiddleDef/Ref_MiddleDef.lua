gPlayTable.CreatePlay{
firstState = "doMiddleDef",
switch = function()
	return "doMiddleDef"
end,
["doMiddleDef"] = {
	Kicker  = task.RefDef("Kicker"),
	Receive = task.RefDef("Receiver"),
	Goalie  = task.Goalie()
},

name = "Ref_MiddleDef"
}