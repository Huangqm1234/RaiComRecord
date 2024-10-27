-- 在进入每一个定位球时，需要在第一次进时进行保持
if gFirstField == "" then
	if CGetBallX() > 250 then
		gFirstField = "Corner"
		i = math.random(1,#gOppoConfig.CornerKick)
		dofile("./lua_scripts/play/Ref/Kick/CornerKick.lua")
	elseif CGetBallX() > 180 then
		gFirstField = "Front"
		i = math.random(1,#gOppoConfig.FrontKick)
		dofile("./lua_scripts/play/Ref/Kick/FrontKick.lua")
	elseif CGetBallX() > -180 then
		gFirstField = "Middle"
		print("---Enter OurIndirectKick---")
		i = math.random(1,#gOppoConfig.MiddleKick)
		dofile("./lua_scripts/play/Ref/Kick/MiddleKick.lua")
	else 
		gFirstField = "Back"
		i = math.random(1,#gOppoConfig.BackKick)
		print("size is "..#gOppoConfig.BackKick)
		print("i = "..i)
		dofile("./lua_scripts/play/Ref/Kick/BackKick.lua")
	end
else
	if gFirstField == "Corner" then
		print("---Enter OurIndirectKick Corner---")
		dofile("./lua_scripts/play/Ref/Kick/CornerKick.lua")
	elseif  gFirstField == "Front" then
		print("---Enter OurIndirectKick Front---")
		dofile("./lua_scripts/play/Ref/Kick/FrontKick.lua")
	elseif gFirstField == "Middel" then
		print("---Enter OurIndirectKick Middle---")
		dofile("./lua_scripts/play/Ref/Kick/MiddleKick.lua")
	elseif gFirstField == "Back" then
		print("---Enter OurIndirectKick Back---")
		dofile("./lua_scripts/play/Ref/Kick/BackKick.lua")
	end
end

