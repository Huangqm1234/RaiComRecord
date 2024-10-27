--desc: 

local Kickerdir2Receiverdir = function()
	return COurRole2RoleDir("Kicker", "Receiver")
end

gPlayTable.CreatePlay{
firstState = "GetBall",

["GetBall"] = {
	switch = function()
		if Cbuf_cnt(true, 100) then
			return "Passball"
		end
	end,
	Kicker   = task.GotoPos("Kicker",-300,200,Kickerdir2Receiverdir),
	Receiver = task.GotoPos("Receiver",-300,-200,Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

["Passball"] = {
	switch = function()
		if CIsBallKick("Goalie") then
			return "Passball"
		end
	end,
	Kicker   = task.GotoPos("Kicker",300,200,Kickerdir2Receiverdir),
	Receiver = task.GotoPos("Receiver",300,-200,Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

name = "Ref_PlaceBall_Demo1"
}