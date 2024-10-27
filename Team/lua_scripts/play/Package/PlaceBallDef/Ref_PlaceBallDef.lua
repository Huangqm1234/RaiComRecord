--desc: 
local placeX = function()
	return GetPlaceX()
end

local placeY = function()
	return GetPlaceY()
end

gPlayTable.CreatePlay{
firstState = "GetBall",
	
["GetBall"] = {
switch = function()
		if CPoint2RoleDist(GetPlaceX, GetPlaceY, "Kicker") > 50 then
			return "placeDone"
		end
	end,
	Kicker   = task.KickerTask("placeBall"),
	Receiver = task.GotoPos("Receiver", -100, 0, 0),
	Goalie   = task.Stop("Goalie",6)
},

["placeDone"] = {
	Kicker   = task.Stop("Kicker",1),
	Receiver = task.Stop("Receiver",3) ,
	Goalie   = task.Stop("Goalie",6)
},

name = "Ref_PlaceBallDef"
}