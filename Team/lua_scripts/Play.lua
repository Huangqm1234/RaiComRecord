table_meta={}
function table_meta.merge(a,b)
	if type(b) == "string" then
		if b ~= nil and b ~= "" then
			table.insert(a, b)
		end
	else
		for _,v in ipairs(b)do
			table.insert(a, v)
		end
	end
	return a
end

gPlay = {}
table_meta.merge(gPlay,json.gRefPlayTable)
table_meta.merge(gPlay,json.gBayesPlayTable)
table_meta.merge(gPlay,json.gTestPlayTable)

key = ""
function PrintTable(table , level)
  level = level or 1
  local indent = ""
  for i = 1, level do
    indent = indent.."  "
  end

  if key ~= "" then
    print(indent..key.." ".."=".." ".."{")
  else
    print(indent .. "{")
  end

  key = ""
  for k,v in pairs(table) do
     if type(v) == "table" then
        key = k
        PrintTable(v, level + 1)
     else
        local content = string.format("%s%s = %s", indent .. "  ",tostring(k), tostring(v))
      print(content)  
      end
  end
  print(indent .. "}")

end
PrintTable(gPlay)

gPlayTable = {}
function gPlayTable.CreatePlay(playmetatable)
	gPlayTable[playmetatable.name] = playmetatable
	--local ta = string.format("%s",tostring(playmetatable))
	--print(ta)
end

gCurrentState = ""
gCurrentPlay = ""
gLastState = ""
gLastPlay = ""
gRealState = ""
gFnishRefPlay = false
gFirstField = ""
gStateChanged = ""
gNotExtYet = true

function Run_Play(play_name)
	local cur_play = gPlayTable[play_name]
	--print("Run_Play: " ..play_name)
	--if cur_play ~=nil then
		--PrintTable(cur_play)
	--end
	if cur_play ~= nil then
		if play_name ~= gLastPlay then
			if cur_play.firstState ~= nil then
				print("enter 1")
				gCurrentState = cur_play.firstState
				CGetLuaState(play_name, gCurrentState)
			else
				print("play not init firstState")
			end
		end
		local cur_state
		local state_one 
		local state_two 
	    --if cur_play[gCurrentState] == nil then
	        --print("^^^^^^^gCurrentState:"..gCurrentState)
	    --end
		if cur_play.switch ~= nil then
			state_one = cur_play:switch()
		elseif cur_play[gCurrentState].switch ~=nil then
			state_two = cur_play[gCurrentState]:switch()
		end
		if state_one ~= nil then
			--print("Enter state_one"..state_one)
			if state_one == "finish" then
				gFnishRefPlay = true
			else
				gFnishRefPlay = false
				cur_state = state_one
			end
		elseif state_two ~= nil then
			if state_two ~= "finish" then
				--print("Enter state_two ".. state_two)
				cur_state = state_two
				gFnishRefPlay = false
			else
				gFnishRefPlay = true
			end			
		end

		if cur_state ~=nil and cur_state ~= gLastState then
			CISStateSwitch(true)
			gStateChanged = true	
		else
			CISStateSwitch(false)
			gStateChanged = false
		end
		if cur_state ~= nil then
			gLastState = gCurrentState 
			gCurrentState = cur_state
		end
	gLastPlay = play_name
	if gCurrentState == "exit" or gCurrentState == "finish" then
		gRealState = gLastState
	else
		gRealState = gCurrentState
	end

	if gStateChanged then
		print("enter 2")
		CGetLuaState(play_name, gCurrentState)
	end

	for role,v in pairs(cur_play[gRealState])do
		local task = cur_play[gRealState][role]
		if task ~= nil then
			task()
		else
			print("no task")
		end
	end
	else
		print(" run play error , script have syntax error  or script name variable not same with file name in " ..play_name )
	end
end

function Play_Exit(play_name)
	if(gPlayTable[play_name] ~= nil) then
		if gCurrentState == "finish" or gCurrentState == " exit" then
			return true
		else
			return false
		end
	else 
		print("skill error")
	end
end


