library(dplyr)
library(ROI)
library(ROI.plugin.glpk)
library(ompr)
library(ompr.roi)
MIPModel() %>%
  add_variable(x[i], i = 1:2) %>%
  set_objective(3000 * x[1] + 2000 * x[2], "max") %>%
  add_constraint(x[1] <= 4) %>%
  add_constraint(2*x[2] <= 12) %>%
  add_constraint(3*x[1] + 2*x[2] <= 18) %>%
  set_bounds(x[i], lb = 0, i = 1:2) %>%
  solve_model(with_ROI(solver = "glpk", verbose = TRUE)) %>%
  get_solution(x[i]) %>%
  filter(value > 0)

