#Goal Programming

install.packages("ompr")
install.packages("ompr.roi")
install.packages("ROI.plugin.glpk")

library(ompr)
library(ompr.roi)
library(ROI.plugin.glpk)
library(dplyr)
#objective function
obje_coefs <- c(1, 1, 1)

#constraints

constraints <- matrix(c(1, 0, 0, #Time constraint
                        0, 1, 0, #Cost constrant
                        0, 0, 1 #Stops constarint), nrow = 3, byrow = TRUE)
                        
                        rhs <- c(0, 0, 0) # minimize the deviations
                        
                        dir <- c("<=", "<=", "<=")
                        
                        #create_model
                        model <- MIPModel() %>%
                          #decion variable
                          add_variable(x[i], i = 1:3, type = "continuous") %>%
                          #objective function
                          set_objective(sum_expr(obje_coefs[i] * x[i], i = 1:3), "min") %>%
                          #define constriant
                          add_constraint(sum_expr(constraints[i, j] * x[j], j = 1:3) <= rhs[i], i =
                                           1:3)
                        
                        result <- solve_model(model, with_ROI(solver = "glpk"))
                        print(result)
