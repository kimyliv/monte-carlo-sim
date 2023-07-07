function dE = energydiffMCXY(gridspins,i,j,N,J,theta)

    if i == 1 && j == 1
        
        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(N,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,N)) + cos(theta - gridspins(i,j+1)));

        dE = E2-E1;

    elseif i == 1 && j == N 

        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));
        E2 = -J*(cos(theta - gridspins(N,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,j-1)) + cos(theta - gridspins(i,1)));
        
        dE = E2-E1;
    
    elseif i == N && j == N

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta - gridspins(1,j)) + cos(theta - gridspins(i,j-1)) + cos(theta - gridspins(i,1)));
        
        dE = E2-E1;

    elseif i == N && j == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta - gridspins(1,j)) + cos(theta - gridspins(i,N)) + cos(theta - gridspins(i,j+1)));
        
        dE = E2-E1;

    elseif i == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(N,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(N,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,j-1)) + cos(theta - gridspins(i,j+1)));

        dE = E2-E1;

    elseif i == N

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta  - gridspins(1,j)) + cos(theta  - gridspins(i,j-1)) + cos(theta  - gridspins(i,j+1)));

        dE = E2-E1;

    elseif j == 1

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,N)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,N)) + cos(theta - gridspins(i,j+1)));

        dE = E2-E1;

    elseif j == N

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,j-1)) + cos(theta - gridspins(i,1)));

        dE = E2-E1;

    else 

        E1 = -J*(cos(gridspins(i,j) - gridspins(i-1,j)) + cos(gridspins(i,j) - gridspins(i+1,j)) + cos(gridspins(i,j) - gridspins(i,j-1)) + cos(gridspins(i,j) - gridspins(i,j+1)));
        E2 = -J*(cos(theta - gridspins(i-1,j)) + cos(theta - gridspins(i+1,j)) + cos(theta - gridspins(i,j-1)) + cos(theta - gridspins(i,j+1)));

        dE = E2-E1;

    end