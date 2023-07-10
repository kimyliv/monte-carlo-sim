% XY monecarlo
%%---------------------------------------------------------------------%%
%%%%% Used to calcualte different observables for the system
%%%%% Data is save to files with a time stamp and type of data.
%%---------------------------------------------------------------------%%

clear all;
close all;

tic

L = 24; % grid size
trials = 1e8; % Total number of iterations
NumberofDatapoints = 20; % Number of datapoints + 1 for observables

Tmin = 0.3; % Min temp
Tmax = 1.6; % Max temp
Tstep = (Tmax-Tmin)/NumberofDatapoints; % Temperature step
Samplerate = 2e2; % Sample rate when in equilibrium
StartSample = 5e4; % Number of iterations until equilibrium 

J = 1; % Ferromagnetic or antiferromagnetic +1 or -1
n = 1;
CollectE = 0;
CollectM = 0;

Averageindex = 0;
counter1 = 1;

gbinder = zeros(1,NumberofDatapoints+1);
tempvec = zeros(1,NumberofDatapoints+1);
energmean = zeros(1,NumberofDatapoints+1);
magmean = zeros(1,NumberofDatapoints+1);
magsuspct = zeros(1,NumberofDatapoints+1);
heatcap = zeros(1,NumberofDatapoints+1);

for T = Tmin:Tstep:Tmax

    counter2 = 1;
    counter = 0; % Needed for while-loop
    gridspins = initialcondXY(L); % Creates initialcondition
    Em = 0;
    Em2 = 0;
    Mag = 0;
    Mag2 = 0;
    Mag4 = 0;
    En = 0;
    corr = 0;
    
    for j = 1:L
        for i = 1:L
    
            En = En + energyXY(gridspins,i,j,L,J); %% Calculates Hamiltonian
    
        end
    end
      
    i = randi([1,L]);
    j = randi([1,L]);
    
    while counter < trials 

        theta = 2*pi*rand(1);
        Energy = energydiffMCXY(gridspins,i,j,L,J,theta); % Calculates energydifference if we flip a spin 
        p = exp(-Energy/T);
    
        if Energy <= 0 || rand(1) < p % If energy is less than or equal to 0 - flip spin - or boltzmann prob

            gridspins(i,j) = theta; % flip spin
            En = En + 2*Energy; % Calculates the new total energy of the system if we flip a spin

        end
        
        if counter > StartSample && corr > Samplerate

            CollectE = CollectE + En;
            CollectM = CollectM + magneticXY(gridspins,L);
            Averageindex = Averageindex + 1;
       
            if corr > Samplerate

                Em = Em + ((CollectE/Averageindex)/(L^2));
                Em2 = Em2 + ((CollectE/Averageindex)/(L^2))^2;
                Mag = Mag + (CollectM/Averageindex)/((L^2));

                Mag2 = Mag2 + ((CollectM/Averageindex)/(L^2))^2;
                Mag4 = Mag4 + ((CollectM/Averageindex)/(L^2))^4;


                corr = 0;
                Averageindex = 0;
                CollectE = 0;
                CollectM = 0;

                counter2 = counter2 + 1;
            end     
        end

        [i,j] = indexwalkrw(i,j,L); % Simple random walk
        corr = corr + 1;
        counter = counter + 1;

    end
if counter1 == 3
    control2 = gridspins;
end

if counter1 == 5
    control3 = gridspins;

end

Mag2mean = Mag2/(counter2-1);
Mag4mean = Mag4/(counter2-1);
gbinder(counter1) = 1-(1/3)*(Mag4mean/(Mag2mean^2));
tempvec(counter1) = T;
energmean(counter1) = Em/(counter2-1);
magmean(counter1) = abs(Mag/(counter2-1));
magsuspct(counter1) = (1/T)*(L^2)*(Mag2mean - (Mag/(counter2-1))^2);
heatcap(counter1) = ((1/(L*T))^2)*((Em2/(counter2-1) - ((Em/(counter2-1))^2)));

counter1 = counter1 + 1;

end

figure(1)
plot(tempvec,energmean,'-*');
xlabel('Temperature (T)')
ylabel('Energy')
figure(2)
plot(tempvec,magmean,'-*');
xlabel('Temperature (T)')
ylabel('Magnetism (M)')
figure(3)
plot(tempvec,heatcap,'-*');
xlabel('Temperature (T)')
ylabel('Heat capacity (Cv)')
figure(4)
plot(tempvec,magsuspct,'-*');
xlabel('Temperature (T)')
ylabel('Magnetic susceptibility (X)')
figure(5)
plot(tempvec,gbinder,'-*');
xlabel('Temperature (T)')
ylabel('Binder Cummulant')

% Save data

header = {'Temp ', 'Energy', 'Magnetism','Heatcap','MagneticSusp','Gbinder', 'size'};
Data = [header; num2cell(tempvec') num2cell(energmean') num2cell(magmean') num2cell(heatcap') num2cell(magsuspct') num2cell(gbinder') num2cell(L*ones(size(gbinder')))];
timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
filename = sprintf('data_%s.mat', timestamp);
save(filename, 'Data');

[X,Y] = meshgrid(1:L,1:L);
U = sin(control2);
V = cos(control2);
figure(6)
q = quiver(X,Y,U,V);
title(['Temperature T = ', num2str(tempvec(3)), ' '])

U = sin(control3);
V = cos(control3);
figure(7)
k = quiver(X,Y,U,V);
title(['Temperature T = ', num2str(tempvec(5)),' '])

toc
