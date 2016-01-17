print("Hello " .. UnitName("player") .. ", you are so awesome...");
	
-- self:RegisterChatCommand("runs", "OnChatCommand")

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


 
print( "2The return is: " .. counter(50, 73) )
	kills = 0
    soFar = 0
print( "1The return is: "  .. counter(100, 45) )
	kills = 0
    soFar = 0
print( "7The return is: "  .. counter(10, 50) )
	kills = 0
    soFar = 0
print( "7The return is: "  .. counter(30, 90) )
 
 
local line = "33 90"
local list = {}
for i in string.gmatch(line, "[^%s]+") do  
   --if 0 < i and i < 100 then 
   table.insert(list, i)
   print("'"..i.."'")
end

print(list[1].." and "..list[2])
 print(string.format("%2.2f", list[1])/11)