#===========================================
# This script solves the LP model for the 
# shampoo & conditioner production example  
# with one optimal solution by the lpSolve 
# package. 

#-------------------------------------------
# Import the lpSolve package. 
installed.packages("lpSolve")
library(lpSolve)

#===========================================
# The LP Model:

#-------------------------------------------
# The Objective Function (vector of 
# coefficients):

objV <- c(	
  3000,	# pounds per batch of doors
  5000)	# pounds per batch of windows

#-------------------------------------------
# The Constraints (matrix of LHS 
# coefficients):

lhsM <- matrix(c(	
  1,0,				# plant-1, don't forget the hidden zero of x2 (windows)  
  0,2,				# plant-2, don't forget the hidden zero of x1 (doors)  
  3,2,				# plant-3   
  1,0,				# nonnegativity constraint for x1, don't forget the hidden zero of x2 (windows)  
  0,1),nrow=5,byrow=TRUE)	# nonnegativity constraint for x2, don't forget the hidden zero of x1 (doors)

#-------------------------------------------
# The Equality/inequlity Signs:

dirV <- c(	
  "<=",	# inequality sign of the 1st constraint (for plant-1)
  "<=",	# inequality sign of the 2nd constraint (for plant-2)
  "<=",	# inequality sign of the 3rd constraint (for plant-3)
  ">=",	# inequality sign of the 4th constraint (for x1)
  ">=")	# inequality sign of the 5th constraint (for x2)

#-------------------------------------------
# The Right Hand Side Parameters (Constants):

rhsV <- c(	
  4,	# RHS value of the 1st constraint 
  12,	# RHS value of the 2nd constraint 
  18,	# RHS value of the 3rd constraint 
  0,	# RHS value of the 4th constraint 
  0)	# RHS value of the 5th constraint 

#-------------------------------------------
# Mathematical Programming Setting:

lp(direction = "max", objV, lhsM, dirV, rhsV) 		     # Find opt obj value (max prof) 
lp(direction = "max", objV, lhsM, dirV, rhsV)$solution # Find opt sol (values of x1 & x2)






