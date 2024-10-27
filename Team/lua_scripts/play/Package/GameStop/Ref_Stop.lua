
gPlayTable.CreatePlay{

firstState = "stop",

["stop"] = {
    switch = function()
		if CGameOn() then 
	        return "finish"
	    else
	    	return "stop"
	    end
	end,
	Kicker   = task.Stop("Kicker",1),
	Receiver = task.Stop("Receiver",3) ,
	Goalie   = task.Stop("Goalie",6)
},

name = "Ref_Stop"
}