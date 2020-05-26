function main(args)
    if 2 > length(args) > 2
      println("Error! You entered more than two inputs.")
    else
      m = parse(Int,args[1])
      n = parse(Int,args[2])
      path = "data/" * string(m) * "-" * string(n);
      try
        mkdir(path)
      catch
      end

      io = open(path * "/c.txt", "w")
      result = rand(collect(1:100),1,n)
      for i=1:length(result)
        print(io, result[i])
        if i!= length(result)
          print(io, " ")
        end
      end
      close(io)

      io = open(path * "/b.txt", "w")
      result = rand(collect(1:100),m,1)
      for i=1:length(result)
        print(io, result[i])
        if i!= length(result)
          write(io, "\n")
        end
      end
      close(io)

    io = open(path * "/A.txt", "w")
    result = rand(collect(1:100),m,n)
    for i=1:size(result,1)
      for j=1:size(result,2)
        print(io, result[i,j])
        if j!= size(result,2)
          write(io, " ")
        end
      end
      if i!= size(result,1)
        write(io, "\n")
      end
    end
    close(io)

    end

end
main(ARGS)
