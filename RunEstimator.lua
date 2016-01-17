print("Hello " .. UnitName("player") .. ", you are so awesome...");

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
 print( "7The return is: "  .. counter(10, 50) )
 print( "7The return is: "  .. counter(30, 90) )
 