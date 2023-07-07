
%%
%%---------------------------------------------------------------------%%
%%%%% Postprocessing of magnetic susceptibility and binder cumulant
%%%%% Used to find critical exponents
%%---------------------------------------------------------------------%%
clear all
close all

gbinder = zeros(4,41);

data = load('data_gbinder12_2023-03-03_06-56-22.mat');
gbinder(1,:) = cell2mat(data.Data(2:42,2)');
data = load('data_gbinder16_2023-03-03_08-06-43.mat');
gbinder(2,:) = cell2mat(data.Data(2:42,2)');
data = load('data_gbinder20_2023-03-04_00-53-26.mat');
gbinder(3,:) = cell2mat(data.Data(2:42,2)');
data = load('data_gbinder24_2023-03-04_01-31-54.mat');
gbinder(4,:) = cell2mat(data.Data(2:42,2)');
tempvec = cell2mat(data.Data(2:42,1)');

figure(1)
plot(tempvec,gbinder(1,:),'-o');
hold on
plot(tempvec,gbinder(2,:),'-o');
plot(tempvec,gbinder(3,:),'-o');
plot(tempvec,gbinder(4,:),'-o');
xline(1,'--');
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Binder cumulant ($g$)','Interpreter','latex')
legend('$L = 12$','$L = 16$','$L = 20$','$L = 24$','$\tau_c \approx 1$','Interpreter','latex')
title('$g$ = $g(\tau)$','Interpreter','latex')

Tc = 1;
L1 = 12;
L2 = 16;
L3 = 20;
L4 = 24;

nu = 1;
gamma = 1.8;

t1 = L1^(1/nu)*((tempvec-Tc)/Tc);
t2 = L2^(1/nu)*((tempvec-Tc)/Tc);
t3 = L3^(1/nu)*((tempvec-Tc)/Tc);
t4 = L4^(1/nu)*((tempvec-Tc)/Tc);

figure(2)
plot(t1,gbinder(1,:),'-o');
hold on
plot(t2,gbinder(2,:),'-o');
plot(t3,gbinder(3,:),'-o');
plot(t4,gbinder(4,:),'-o');
xlabel('$L^{1/\nu} [\frac{\tau - \tau_c}{\tau_c}]$','Interpreter','latex')
ylabel('Binder cumulant ($g$)','Interpreter','latex')
legend('$L = 12$','$L = 16$','$L = 20$','$L = 24$','Interpreter','latex')
title('$g$ = $g(\tau)$','Interpreter','latex')


gbinder = zeros(4,41);

data = load('data_magsuscpt12_2023-03-03_06-56-31.mat');
gbinder(1,:) = cell2mat(data.Data(2:42,2)');
data = load('data_magsuscpt16_2023-03-03_08-07-07.mat');
gbinder(2,:) = cell2mat(data.Data(2:42,2)');
data = load('data_magsuscpt20_2023-03-04_00-55-17.mat');
gbinder(3,:) = cell2mat(data.Data(2:42,2)');
data = load('data_magsuscpt24_2023-03-04_01-32-14.mat');
gbinder(4,:) = cell2mat(data.Data(2:42,2)');
tempvec = cell2mat(data.Data(2:42,1)');


figure(3)
plot(tempvec,gbinder(1,:),'-^');
hold on
plot(tempvec,gbinder(2,:),'-^');
plot(tempvec,gbinder(3,:),'-^');
plot(tempvec,gbinder(4,:),'-^');
xlabel('Temperature ($\tau$)','Interpreter','latex')
ylabel('Magnetic Susceptibility ($\chi$)','Interpreter','latex')
legend('$L = 12$','$L = 16$','$L = 20$','$L = 24$','Interpreter','latex')
title('$\chi$ = $\chi(\tau)$','Interpreter','latex')

figure(4)
plot(t1,gbinder(1,:)/((L1)^(gamma/nu)),'-^');
hold on
plot(t2,gbinder(2,:)/((L2)^(gamma/nu)),'-^');
plot(t3,gbinder(3,:)/((L3)^(gamma/nu)),'-^');
plot(t4,gbinder(4,:)/((L4)^(gamma/nu)),'-^');
xlabel('$L^{1/\nu} [\frac{\tau - \tau_c}{\tau_c}]$','Interpreter','latex')
ylabel('$\frac{\chi}{L^(\gamma/\nu)}$','Interpreter','latex')
legend('$L = 12$','$L = 16$','$L = 20$','$L = 24$','Interpreter','latex')
title('$\chi$ = $\chi(\tau)$','Interpreter','latex')
