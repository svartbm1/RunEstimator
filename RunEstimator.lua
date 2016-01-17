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


 
print( "2The return is: " .. counter(50.00, 73) )
	kills = 0
    soFar = 0
print( "1The return is: "  .. counter(100, 45) )
	kills = 0
    soFar = 0
print( "7The return is: "  .. counter(10, 50) )
	kills = 0
    soFar = 0
print( "7The return is: "  .. counter(30, 90) )
 
 

--for i in string.gmatch(line, "[^%s]+") do  
   --if 0 < i and i < 100 then 
  -- table.insert(list, i)
  -- print("'"..i.."'")
--end

--print(list[1].." and "..list[2])
 ---print(string.format("%2.2f", list[1])/11)
 
 local Estimator = function(input)
	local line = "33 90"
	local list = {}
	for i in string.gmatch(input, "[^%s]+") do  
		table.insert(list, i)
		print(i.." added")
	end
	print("'"..string.format("%2.2f", list[1]).."'")
	print("'"..string.format("%2.2f", list[2]).."'")
	local input1 = tonumber(string.format("%2.2f", list[1]))
	local input2 = tonumber(string.format("%2.2f", list[2]))
	kills = 0
    soFar = 0
	print( "7The return is: "  .. counter(30.00, 90.00))
	kills = 0
    soFar = 0
	print("RESULT: " .. counter(input1, input2))
	
 
 end
 
 SLASH_RUNESTIMATOR1 = "/runs"
 SLASH_RUNESTIMATOR2 = "/runestimator"
SlashCmdList["RUNESTIMATOR"] = function(msg)
	Estimator(msg)
end