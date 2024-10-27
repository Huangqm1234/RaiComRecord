-- 在进入每一个定位球时，需要在第一次进时进行保持
math.randomseed(os.time())
if gFirstField == "" then
	if CGetBallX() < -250 then
		gFirstField = "Corner"
		i = math.random(1,#gOppoConfig.CornerDef)
		gCurrentPlay = gOppoConfig.CornerDef[i]
		--dofile("./lua_scripts/play/Ref/Def/CornerDef.lua")
	elseif CGetBallX() < -180 then
		gFirstField = "Front"
		i = math.random(1,#gOppoConfig.FrontDef)
		gCurrentPlay = gOppoConfig.FrontDef[i]
		--dofile("./lua_scripts/play/Ref/Def/FrontDef.lua")
	elseif CGetBallX() < 180 then
		gFirstField = "Middle"
		i = math.random(1,#gOppoConfig.MiddleDef)
		gCurrentPlay = gOppoConfig.MiddleDef[i]
		--dofile("./lua_scripts/play/Ref/Def/MiddleDef.lua")
	else
		gFirstField = "Back"
		i = math.random(1,#gOppoConfig.BackDef)
		gCurrentPlay = gOppoConfig.BackDef[i]
		--dofile("./lua_scripts/play/Ref/Def/BackDef.lua")
	end
else
	if gFirstField == "Corner" then
		i = math.random(1,#gOppoConfig.CornerDef)
		gCurrentPlay = gOppoConfig.CornerDef[i]
		--dofile("./lua_scripts/play/Ref/Def/CornerDef.lua")
	elseif  gFirstField == "Front" then
		i = math.random(1,#gOppoConfig.FrontDef)
		gCurrentPlay = gOppoConfig.FrontDef[i]
		--dofile("./lua_scripts/play/Ref/Def/FrontDef.lua")
	elseif gFirstField == "Middel" then
		i = math.random(1,#gOppoConfig.MiddleDef)
		gCurrentPlay = gOppoConfig.MiddleDef[i]
		--dofile("./lua_scripts/play/Ref/Def/MiddleDef.lua")
	elseif gFirstField == "Back" then
		i = math.random(1,#gOppoConfig.BackDef)
		gCurrentPlay = gOppoConfig.BackDef[i]
		--dofile("./lua_scripts/play/Ref/Def/BackDef.lua")
	end
end

