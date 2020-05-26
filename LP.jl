using JuMP, GLPK
using DelimitedFiles

function main(args)
  if 2 > length(args) > 2
    println("Error! You entered more than two inputs.")
  else
    m = parse(Int,args[1])
    n = parse(Int,args[2])
    model = Model(GLPK.Optimizer)

    # reading parameters
    c = readdlm("data/" * string(m) * "-" * string(n) * "/c.txt")
    A = readdlm("data/" * string(m) * "-" * string(n) * "/A.txt")
    b = readdlm("data/" * string(m) * "-" * string(n) * "/b.txt")

    @variable(model, x[1:size(c,2)] >= 0 )

    @objective(model, Max, sum(c*x) )

    @constraint(model, con, A*(x) .<= b )

    print(model)

    status = optimize!(model)

    println("Objective value: ", JuMP.objective_value(model))
    println("x[1] = ", JuMP.value(x[1]))
    println("x[2] = ", JuMP.value(x[2]))
  end
end

main(ARGS)
