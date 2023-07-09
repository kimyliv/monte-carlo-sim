% XY monecarlo - gbinder
%%---------------------------------------------------------------------%%
%%%%% Used to calcualte Gbinder and magnetic susceptibility for different
%%%%% systems sizes for the critical exponents.
%%%%% Data is save to files with a time stamp and type of data.
%%---------------------------------------------------------------------%%

clear all;
close all;

tic

trials = 5e7; % Total number of iterations (>2e7)
NumberofDatapoints = 25; % Number of datapoints + 1 for observable

Tmin = 0.5; % Min temp
Tmax = 1.6; % Max temp
Tstep = (Tmax-Tmin)/NumberofDatapoints; % Temperature stepsize
Samplerate = 2e2; % Sample rate when in equilibrium
StartSample = 5e4; % Number of iterations until equlibrium 

J = 1; % Ferromagnetic or Antiferromagnetic +1 or -1
n = 1;
CollectM = 0;

Averageindex = 0;

c1 = 1;
c5 = 1;
for N = 12:4:24 % Size of different gridsizes

    for T = Tmin:Tstep:Tmax
    
        c2 = 1;
        c = 0; % Counter for while-loop
        gridspins = initialcondXY(N); % Creates initialcondition
        control = gridspins;
 
        Mag2 = 0;
        Mag4 = 0;
        Mag = 0;
        
        En = 0;
        corr = 0;
        
        for j = 1:N
            for i = 1:N
        
                En = En + energyXY(gridspins,i,j,N,J); %% Calculates hamiltionian - systems total energy
        
            end
        end
        
        
        i = randi([1,N]);
        j = randi([1,N]);
        
        while c < trials 
    
            theta = 2*pi*rand(1);
            Energy = energydiffMCXY(gridspins,i,j,N,J,theta); % Calculates energydifference after spinflip
            p = exp(-Energy/T);
        
            if Energy <= 0 || rand(1) < p % if energy less than or equal to zero - flip spin - or test with boltzmann
    
                m1 = cos(gridspins(i,j));
                gridspins(i,j) = theta; % flip spin
                En = En + 2*Energy; % Calculates the new total energy after spin flip
    
            end
            
            if c > StartSample && corr > Samplerate
    
                CollectM = CollectM + magneticXY(gridspins,N);
                Averageindex = Averageindex + 1;
           
                if corr > Samplerate
    
                    Mag2 = Mag2 + ((CollectM/Averageindex)/(N^2))^2;
                    Mag4 = Mag4 + ((CollectM/Averageindex)/(N^2))^4;
                    Mag = Mag + ((CollectM/Averageindex)/(N^2));
    
                    corr = 0;
                    Averageindex = 0;
                    CollectM = 0;
    
                    c2 = c2 + 1;
                end     
            end
    
            [i,j] = indexwalkrw(i,j,N); % Simple random walk
            corr = corr + 1;
            c = c + 1;
    
        end
    
    Mag2mean = Mag2/(c2-1);
    Mag4mean = Mag4/(c2-1);
    Magmean = Mag/(c2-1);
    tempvec(c1) = T;
    gbinder(c5,c1) = 1 - Mag4mean/(3*Mag2mean^2);
    magsuspct(c5,c1) = (1/T)*(N^2)*(Mag2mean - (Magmean)^2);
    
    
    c1 = c1 + 1;
    
    end
c5 = c5 + 1;
c1 = 1;
end

figure(1)
plot(tempvec,gbinder(1,:),'-o');
hold on
plot(tempvec,gbinder(2,:),'-+');
plot(tempvec,gbinder(3,:),'-*');
plot(tempvec,gbinder(4,:),'-x');
title('Gbinder')

figure(2)
plot(tempvec,magsuspct(1,:),'-o');
hold on
plot(tempvec,magsuspct(2,:),'-+');
plot(tempvec,magsuspct(3,:),'-*');
plot(tempvec,magsuspct(4,:),'-x');
title('Magsusceptibility')

% Save data
header = {'Tempvec','Gbinder12','Gbinder16','Gbinder20','Gbinder24'};
Data = [header; num2cell(tempvec') num2cell(gbinder(1,:)') num2cell(gbinder(2,:)') num2cell(gbinder(3,:)') num2cell(gbinder(4,:)')];
timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
filename = sprintf('data_gbinder_%s.mat', timestamp);
save(filename, 'Data');


header = {'Tempvec','Magmean12','Magmean16','Magmean20','Magmean24'};
Data = [header; num2cell(tempvec') num2cell(magsuspct(1,:)') num2cell(magsuspct(2,:)') num2cell(magsuspct(3,:)') num2cell(magsuspct(4,:)')];
timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
filename = sprintf('data_magsuscpt_%s.mat', timestamp);
save(filename, 'Data');



toc