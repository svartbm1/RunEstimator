print("Run Estimator is enabled. Type '/runs' for instuctions.");
	
local counter --creates function to enable the recursion
local kills = 0 --counts how many times the function ran
local soFar = 0 --counter for the % probability achieved so far

counter = function(dropRate, desired)
	kills = kills + 1
	soFar = soFar + (100-soFar) * (dropRate/100) --adds the chance to get the item this "run" to soFar
	if soFar < desired then
		return counter(dropRate, desired) -- recursively continues until desired dropchance is reached		
	else 	    
		return kills
	end
end

 local Estimator = function(input) --function that is called on by the chat command directly, see below   
	if input == "" then --help message
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
			--result print:
			print("RESULT: You need to make " .. counter(input1, input2) .. " runs to get an item with the dropchance " .. input1 .. "% with " .. input2 .."% probability.")
		else --error message
			print("Please enter numbers between 0 and 100. Example: '/runs 18.5 90'") 		
		end
	end
 end
 
 SLASH_RUNESTIMATOR1 = "/runs"
 SLASH_RUNESTIMATOR2 = "/runestimator"
SlashCmdList["RUNESTIMATOR"] = function(msg) --records user input after defined / commands
	Estimator(msg)
end
