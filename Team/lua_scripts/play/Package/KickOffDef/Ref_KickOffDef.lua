
gPlayTable.CreatePlay{

firstState = "start",

switch = function()
	 if CGameOn()then
		return "finish"
	 else
		return "start"
	 end	
end,

["start"] = {
	Kicker   = task.Stop("Kicker",1),
	Receiver = task.Stop("Receiver",3) ,
	Goalie   = task.Stop("Goalie",6)
},

name = "Ref_KickOffDef"
}