#??===========================================
# This script solves the MILP model for the 
# example about Christmas toys. 

#-------------------------------------------
# Import the lpSolve package. 

library(lpSolve)

#===========================================
# The MILP Model:

#-------------------------------------------
# Decision Variables Indexes:

int.vec <- c(1:2)	
binary.vec <- c(3:5)	

#-------------------------------------------
# The Objective Function:

objective.in <- c(10,15,-50000,-80000,0)	

#-------------------------------------------
# The Constraints:

M = 100000000

const.mat <- matrix(c(	1,      0,     -M,      0,      0,
				0,      1,      0,     -M,      0,
			     1/50, 1/40,      0,      0,     -M,
			     1/40, 1/25,      0,      0,      M 
				), nrow=4, ncol=5, byrow=TRUE)

#-------------------------------------------
# The Equality/inequlity Signs:

const.dir <- c("<=","<=","<=","<=")

#-------------------------------------------
# The Right Hand Side Parameters (Constants):

const.rhs <- c(0,0,500,700+M)

#-------------------------------------------
# Mathematical Programming Setting:

lp(direction="max",objective.in,const.mat,const.dir,const.rhs,
transpose.constraints=TRUE,int.vec,presolve=0,
compute.sens=0,binary.vec,all.int=TRUE,
all.bin=FALSE,scale=196) 		

lp(direction="max",objective.in,const.mat,const.dir,const.rhs,
transpose.constraints=TRUE,int.vec,presolve=0,
compute.sens=0,binary.vec,all.int=TRUE,
all.bin=FALSE,scale=196)$solution 	
