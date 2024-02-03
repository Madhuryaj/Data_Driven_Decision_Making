#===========================================
# This script solves the LP model for the 
# shampoo & conditioner production example  
# with infeasible constraints. 

#-------------------------------------------
# Import the ompr required packages. 

library(dplyr)
library(ROI)
library(ROI.plugin.glpk)
library(ompr)
library(ompr.roi)

#===========================================
# The LP Model:

MIPModel() %>%
  #-------------------------------------------
  # The Decision Variables:
  add_variable(x[i], i = 1:2) %>%
  #-------------------------------------------
  # The Objective Function:
  set_objective(3000 * x[1] + 5000 * x[2], "max") %>%
  #-------------------------------------------
  # The Constraints:
  add_constraint(x[1] <= 4) %>%
  add_constraint(2*x[2] <= 12) %>%
  add_constraint(3*x[1] + 2*x[2] <= 18) %>%
  add_constraint(3*x[1] + 5*x[2] >= 50) %>%
  set_bounds(x[i], lb = 0, i = 1:2) %>% 
  #-------------------------------------------
  # Solving the Model and Extracting the Solution:
  solve_model(with_ROI(solver = "glpk", verbose = TRUE)) %>% 
  get_solution(x[i]) %>% 
  filter(value > 0)
