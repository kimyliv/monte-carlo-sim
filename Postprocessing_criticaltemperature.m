
%%
%%---------------------------------------------------------------------%%
%%%%% Postprocessing of binder cumulant
%%%%% Used to find critical temperature
%%---------------------------------------------------------------------%%
clear all
close all

gbinder = zeros(4,6);

data = load('data_gbinder_2023-03-04_11-48-02.mat');
gbinder(1,:) = cell2mat(data.Data(5:10,2)');
gbinder(2,:) = cell2mat(data.Data(5:10,3)');
gbinder(3,:) = cell2mat(data.Data(5:10,4)');
gbinder(4,:) = cell2mat(data.Data(5:10,5)');
tempvec = cell2mat(data.Data(5:10,1)');
figure(1)
plot(tempvec,gbinder(1,:),'-o');
hold on
plot(tempvec,gbinder(2,:),'-o');
plot(tempvec,gbinder(3,:),'-o');
plot(tempvec,gbinder(4,:),'-o');
xline(0.89,'--');
xlabel('Temperature ($\tau$)','Interpreter','latex','FontSize',14)
ylabel('Binder cumulant ($g$)','Interpreter','latex','FontSize',14)
legend('$L = 12$','$L = 16$','$L = 20$','$L = 24$','$\tau_c \approx 0.89$','Interpreter','latex', 'Location','southwest' )
title('$g$ = $g(\tau)$','Interpreter','latex','FontSize',14)

