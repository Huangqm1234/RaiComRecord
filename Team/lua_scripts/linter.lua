dofile("./lua_scripts/opponent/"..json.OPPONENT_NAME..".lua")
function RunRefPlay(name)
    if json.IS_TEST_MODE then
	    if name == "gameStop" then
		    print("IN GAME STOP")
			gFnishRefPlay = false
	        local filename = "./lua_scripts/play/Ref/"..name..".lua"
			dofile(filename)
		else
		    gCurrentPlay = json.gTestPlay
		end
    else
        if name == "gameStop"  then
        	gFirstField = ""
        	local filename = "./lua_scripts/play/Ref/"..name..".lua"
			dofile(filename)
		else 
			
				local filename = "./lua_scripts/play/Ref/"..name..".lua"
				dofile(filename)

			
        end
        
	    
	end
end

function SelectRefPlay()
	local curRefMsg --= CGetRefMsg()
	--print("cur msg"..curRefMsg)
	if curRefMsg ~= nil then
		if curRefMsg == "" then
		return false
	    end
	    RunRefPlay(curRefMsg)
	end
	return true
end


if SelectRefPlay() and not gFnishRefPlay  then
	 print("do ref "..gCurrentPlay)
else
	if json.IS_TEST_MODE then
		gCurrentPlay = json.gTestPlay
	else
	    if gFnishRefPlay then
			gCurrentPlay = json.gNormalPlay
		else
			if gLastPlay == "" then
			    gCurrentPlay = json.gNormalPlay
			else
			    gCurrentPlay = gLastPlay
			end
		end
	end
end


Run_Play(gCurrentPlay)
print("cur play： "..gCurrentPlay)