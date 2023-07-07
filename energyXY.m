function E1 = energyXY(gridspins,i,j,N,J)


    if i == 1 && j == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    elseif i == 1 && j == N 

        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));

    elseif i == N && j == N

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));
   
    elseif i == N && j == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    elseif i == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    elseif i == N

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    elseif j == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    elseif j == N
        
        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));

    else 

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));

    end