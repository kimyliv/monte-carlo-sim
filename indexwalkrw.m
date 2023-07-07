function [i, j] = indexwalkrw(i,j,N)

i = i + sign(randi([-N,N]));
j = j + sign(randi([-N,N]));

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
