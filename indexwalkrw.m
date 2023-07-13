function [i, j] = indexwalkrw(i,j,N)

direction = randi(4);
switch(direction)
    case 1 % up

        j = j+1;

    case 2 % down

        j = j-1;

    case 3 % right

        i = i+1;

    case 4 % left
        
        i = i-1;
end

if i > N

    i = 1;

end

if j > N

    j = 1;

end

if i < 1

    i = N;

end

if j < 1 

    j = N;

end
