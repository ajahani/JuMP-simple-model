using JuMP, GLPK
using DelimitedFiles

m = Model(GLPK.Optimizer)

# Initialization the parameters
c= [1 2 3]
A= [9 8 7;6 5 4]
b = [10;11]

@variable(m, x[1:size(c,2)] >= 0 )

@objective(m, Max, sum(c*x) )

@constraint(m, con, A*(x) .<= b )

print(m)

status = optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x[1] = ", JuMP.value(x[1]))
println("x[2] = ", JuMP.value(x[2]))
