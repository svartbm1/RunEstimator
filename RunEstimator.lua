print("Run estimator is enabled.");
	
local counter
local kills = 0
local soFar = 0

counter = function(dropRate, desired)
	kills = kills + 1
	soFar = soFar + (100-soFar) * (dropRate/100)
	if soFar < desired then
		return counter(dropRate, desired)		
	else 	    
		return kills
	end
end


 
 local Estimator = function(input)
    if input == "" then 
		print("Type '/runs <drop chance> <desired probability>' to make calculation. Example: '/runs 18.5 90'") 
	else	
		local list = {}
		for i in string.gmatch(input, "[^%s]+") do  
			table.insert(list, i)			
		end
		
		local input1 = tonumber(string.format("%2.2f", list[1]))
		local input2 = tonumber(string.format("%2.2f", list[2]))
		if 0 < input1 and 100 >= input1 and 0 < input2 and 100 > input2 then
			kills = 0
			soFar = 0
			print("RESULT: You need to make " .. counter(input1, input2) .. " runs to get an item with the dropchance " .. input1 .. "% with " .. input2 .."% probability.")
		else print("Please enter numbers between 0 and 100. Example: '/runs 30 90'")
		end
	end
 end
 
 SLASH_RUNESTIMATOR1 = "/runs"
 SLASH_RUNESTIMATOR2 = "/runestimator"
SlashCmdList["RUNESTIMATOR"] = function(msg)
	Estimator(msg)
end