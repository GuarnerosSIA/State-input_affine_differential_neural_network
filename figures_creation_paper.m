% Load information

% X is the system model
% Xh is the input-state affine DNN
% Xd is the classical DNN
% DeltaAL is the error dynamics of the input-state affine DNN
% Delta DNN is the error dynamics of the classical DNN
% Cummulative error computation
% Cummulative error dynamics of the input-state affine DNN: dALDNN
% Cummulative error dynamics of the classical DNN: dDNN

load simulation_results.mat

rng(1)

% n_figs = 3;

statesSize = 12;

% dis_figs = randsample(12,n_figs);
pos1 = [0.2 0.2 0.6 0.6];
pos2 = [0.4 0.4 0.3 0.3];


%% Plotting states
for j = 1:statesSize
    figure
    %    i = dis_figs(j);
    i = j;
    
    % make a subplot for editing the figures
    ax1 = axes('Position', pos1);
    name_array = {'TickLabelInterpreter', 'FontSize'};
    value_array = {'latex', 20};
    % Its the same code  for both DNN
    plot(ax1, time, X(:,i),'LineWidth',8,LineStyle='-',Color='k')
    hold on
    plot(ax1, time, Xh(:,i),'LineWidth',4,LineStyle='--')
    % Input-state affine DNN is --
    plot(ax1, time, Xd(:,i),'LineWidth',4, 'LineStyle',':')
    % Classical DNN is :

    % annotation
    L = legend('Stewart platform','State-input affine DNN', 'Classical DNN');
    set(L,'Interpreter','latex')
    set(L,'FontSize',10)
    parameters = [.2 .5 .3 .3];
    str_params = {strcat('Max noise param: ', string(max_noise))};
    L = annotation('textbox',parameters,'String',str_params,'FitBoxToText','on');
    set(L,'Interpreter','latex')
    set(ax1, name_array, value_array)

    ax2 = axes('Position', pos2);
    plot(ax2, time, X(:,i),'LineWidth',8,LineStyle='-',Color='k')
    hold on
    plot(ax2, time, Xh(:,i),'LineWidth',4,LineStyle='--')
    % Input-state affine DNN is --
    plot(ax2, time, Xd(:,i),'LineWidth',4, 'LineStyle',':')
    % Classical DNN is :
    name_array = {'TickLabelInterpreter', 'FontSize'};
    value_array = {'latex', 10};
    set(ax2, name_array, value_array)
end


%% Plotting the error dynamics norm

figure
% The same process for the error dynamics

ax1 = axes('Position', pos1);
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 20};
    
plot(ax1,time, DeltaAL(:,1),'LineWidth',5,LineStyle='--')
% Delta AL is --
hold on
plot(time, DeltaDNN(:,1),'LineWidth',5, 'LineStyle',':')
% DeltaDNN is :
set(ax1, name_array, value_array)

ax2 = axes('Position', pos2);
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 10};


plot(ax2, time, DeltaAL(:,1),'LineWidth',5,LineStyle='--')
% Delta AL is --
hold on
plot(ax2, time, DeltaDNN(:,1),'LineWidth',5, 'LineStyle',':')
% DeltaDNN is :

% Annotations
L = legend('State-input affine DNN', 'Classical DNN');
set(L,'Interpreter','latex')
set(ax2, name_array, value_array)

%% Error dynamics norm intgral


figure

ax1 = axes('Position', pos1);
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 20};

plot(ax1,time, dALDNN(:,1),'LineWidth',4,LineStyle='--')
% input-state affine DNN is --
hold on
plot(ax1,time, dDNN(:,1),'LineWidth',4 , 'LineStyle',':')
% Classical DNN is :
set(ax1, name_array, value_array)


ax2 = axes('Position', pos2);
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 10};
plot(ax2,time, dALDNN(:,1),'LineWidth',4,LineStyle='--')
% input-state affine DNN is --
hold on
plot(ax2,time, dDNN(:,1),'LineWidth',4 , 'LineStyle',':')
% Classical DNN is :

% Annotations
L = legend('State-input affine DNN', 'Classical DNN');
set(L,'Interpreter','latex')
set(ax2, name_array, value_array)


L_AL = length(DeltaAL);
L_DNN = length(DeltaDNN);

Cum_sum_AL = sum(DeltaAL)/L_AL;
% Average dynamics error from the input-state affine DNN
Cum_sum_DNN = sum(DeltaDNN)/L_DNN;
% Average dynamics error from the classical DNN

disp('Cummulative norm error for the Input-State Affine DNN')
disp(Cum_sum_AL)

disp('Cummulative norm error for the Classical Affine DNN')
disp(Cum_sum_DNN)

%% Plotting the weights
figure
% make a subplot for editing the figures
ax1 = axes('Position', pos1);
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 20};
% Its the same code  for both DNN
plot(ax1, time, W1,'LineWidth',4,LineStyle='-')
set(ax1, name_array, value_array)
ax2 = axes('Position', pos2);
plot(ax2, time, W1,'LineWidth',4,LineStyle='-')
name_array = {'TickLabelInterpreter', 'FontSize'};
value_array = {'latex', 10};
set(ax2, name_array, value_array)





