--desc: 

local Kickerdir2Receiverdir = function()
	return COurRole2RoleDir("Kicker", "Receiver")
end

gPlayTable.CreatePlay{
firstState = "GetBall",

["GetBall"] = {
	switch = function()
		if CIsBallKick("Goalie") then
			return "finish"
		end
	end,
	Kicker   = task.GotoPos("Kicker",0,200,Kickerdir2Receiverdir),
	Receiver = task.GotoPos("Receiver",0,-200,Kickerdir2Receiverdir),
	Goalie   = task.Goalie()
},

name = "Ref_BackKick_Demo1"
}