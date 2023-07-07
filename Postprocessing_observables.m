%%---------------------------------------------------------------------%%
%%%%% Postprocessing of observables
%%---------------------------------------------------------------------%%

clear all
close all

load('data_2023-03-03_00-52-02.mat')
tempvec = cell2mat(Data(2:62,1)');
energmean = cell2mat(Data(2:62,2)');
magmean = cell2mat(Data(2:62,3)');
heatcap = cell2mat(Data(2:62,4)');
magsuspct = cell2mat(Data(2:62,5)');
gbinder = cell2mat(Data(2:62,6));

figure(1)
plot(tempvec,energmean,'-<','Color', [0 0.4470 0.7410]);
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Energy ($E$)','Interpreter','latex')
legend('$L = 24$','Interpreter','latex')
title('$E$ = $E(\tau)$','Interpreter','latex')
figure(2)
plot(tempvec,magmean,'-square','Color', [0.8500 0.3250 0.0980]);
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Magnetization ($M$)','Interpreter','latex')
legend('$L = 24$','Interpreter','latex')
title('$M$ = $M(\tau)$','Interpreter','latex')
figure(3)
plot(tempvec,heatcap,'-diamond','Color', [0.4940 0.1840 0.5560]);
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Specific Heat Capacity ($C_v$)','Interpreter','latex')
legend('$L = 24$','Interpreter','latex')
title('$C_v$ = $C_{v}(\tau)$','Interpreter','latex')

figure(4)
plot(tempvec,magsuspct,'-^','Color', [0.4660 0.6740 0.1880]);
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Magnetic Susceptibility ($\chi$)','Interpreter','latex')
legend('$L = 24$','Interpreter','latex')
title('$\chi$ = $\chi(\tau)$','Interpreter','latex')

figure(5)
plot(tempvec,gbinder,'-o','Color', [0.3010 0.7450 0.9330]);
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Binder cumulant ($g$)','Interpreter','latex')
legend('$L = 24$','Interpreter','latex')
title('$g$ = $g(\tau)$','Interpreter','latex')