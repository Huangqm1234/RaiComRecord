gPlayTable.CreatePlay{
firstState = "doDef",

switch = function()
	return "doDef"
end,

["doDef"] = {
	Kicker  = task.RefDef("Kicker"),
	Receiver = task.RefDef("Receiver"),
	Goalie  = task.Goalie()
},

name = "Ref_BackDef"
}