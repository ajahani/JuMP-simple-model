In order to see a quick run of implemented optimization problem run on cmd
>> julia main.jl

In order to generate data with required dimensions (m and n) run
>>  julia Generat_data.jl m n

for example:

>> julia Generate_data.jl 2 3

In order to solveing the optimization problem with generated data (m and n) run
>> julia LP.jl m n

for example:

>> julia LP.jl 2 3

Note: You have to generate data with required m and n and then you can run a problem constructed by them, otherwise it will not run.
