module(..., package.seeall)

function KickerTask(name_,posX,posY,dir_,kickflat_,kp_)
	 return KickerSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function ReceiverTask(name_,posX,posY,dir_,kickflat_,kp_)
	 return ReceiverSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function TierTask(name_,posX,posY,dir_,kickflat_,kp_)
	return TierSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function DefenderTask(name_,posX,posY,dir_,kickflat_,kp_)
	 return DefenderSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function MiddleTask(name_,posX,posY,dir_,kickflat_,kp_)
	return MiddleSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function GoalieTask(name_,posX,posY,dir_,kickflat_,kp_)
	return GoalieSkill{name=name_,pos_x=posX,pos_y = posY,dir=dir_,kickflat=kickflat_,kp=kp_}
end

function GetBall(runner_role,receive)
   return getball{role =runner_role, rec = receive}
end

function Goalie()
	return	goalie{}
end

function GoRecePos(role_name_)
	return goreceivepos{role_name = role_name_}
end	

function RobotHalt(role_name_)
	return halt{role_name = role_name_}
end

function NormalDef(role_name_)
	return normaldef{role_name = role_name_}
end

function PassBall(runner_role_,receive_)
	return passball{runner_role = runner_role_,receive = receive_}	
end

function ReceiveBall(role_name_)
	return receiveball{role_name = role_name_}
end

function Stop(role_name_,role_)
	return stop{exc_role = role_name_,role = role_}
end

function Shoot(role_name_)
	return shoot{role_name = role_name_}
end

function RefDef(role_name_)
	return refdef{role = role_name_}
end

function GotoPos(role_name_,x_,y_,dir_)
	return gotopos{role_name = role_name_, x = x_,y = y_, dir = dir_}
end

function PenaltyDef()
	return penaltydef{}
end

function PenaltyKick(role_name_)
	return penaltykick{role = role_name_}
end

function GetOppNums()
	return getoppnums{}
end

function GetPlaceX()
	return getplacex{}
end

function GetPlaceY()
	return getplacey{}
end
