% A seed is created for reproducibility purposes

rng(1)

% All figures are closed

close all

% Definition of the state size number: 6 legs posititions and velocities 
statesSize = 12;
% Definition of the input number: 6, one for each leg
inputSize = 6;

% Common parameters for the network

% Hurwitz matrix: It must contain all its eigenvalues in the left-side
% imaginary plane

A_scalar = 200;
A = -eye(statesSize)*A_scalar;
% estable = -I200

disp('Matriz A:')
disp(A_scalar)

% P Matrix, solution of the Riccatti equation. Proposed. Must be positive 
% definite

P_scalar = 1500;
P_DNN = eye(statesSize)*P_scalar;

% Estable = I1500

disp('Matriz P:')
disp(P_scalar)

% Learning matrices. Must be positive definite
K1 = eye(statesSize)*1;
K2 =  eye(statesSize)*1;
K3 =  eye(statesSize)*1;


% Number of neurons in each sigmoid function, namely, sigma_1, sigma_2 and
% sigma_3
r1 = 2;
r2 = 3;
r3 = 4;

dis_neuron_number = strcat('Sigma 1: ',string(r1),' , ', ...
    'Sigma 2:', string(r2), ' , ', 'Sigma 3:', string(r3));
disp(dis_neuron_number)


% Sigmoidal function parameters. Notice that is determined by the neuron
% number, the state size and the right multiplication matrix size.
% Remebering that some sigmoidal functions are multiply by the state and
% the input signals. 'c' corresponds to the vector multiplying the vectors
% of the input, that is, the states, and 'd' corresponds to the bias term.

c1 = rand(r1, statesSize, statesSize)*0.01;
c2 = rand(r2, statesSize, 1)*0.1;
c3 = rand(r3, statesSize, inputSize)*0.1;


d1 = (rand(r1, statesSize)-0.0)*1;
d2 = (rand(r2, 1)-0.0)*1;
d3 = (rand(r3, inputSize)-0.0)*1;

% DNNs initial weights. They are completely random, but the modification of the
% initia weights over the DNN proposal can be analyzed

W10 = (rand(statesSize,r1)-0.5)*0.001;
%Stable 0.00001
W20 = (rand(statesSize,r2)-0.5)*2;
W30 = (rand(statesSize,r3)-0.5)*2;

% DNN initial state parameters. Completely random,
xh0 = (rand(statesSize,1)-0.5)*2;

% Noise Generation
max_noise = 10;
S =  randi(max_noise,[36,1]);

% Simulation of the Stewart platform
sim('sm_stewart_platform_Identifier_2021Version_desktop.slx')

X = systemStates.Data;
% X is the system model
Xh = reshape(ALDNNStates.Data,12,[])';
% Xh is the input-state affine DNN
Xd = reshape(DNNStates.Data,12,[])';
% Xd is the classical DNN
DeltaAL = reshape(ALDNN_E.Data,1,[])';
% DeltaAL is the error dynamics of the input-state affine DNN
DeltaDNN = reshape(DNN_E.Data,1,[])';
% Delta DNN is the error dynamics of the classical DNN
time = reshape(systemStates.Time,[],1);

% Weights 
W1 = reshape(W1_dynamics.Data,24,[])';
W2 = reshape(W2_dynamics.Data,36,[])';
W3 = reshape(W3_dynamics.Data,48,[])';

% Cummulative error computation
dALDNN = cumsum(DeltaAL);
% Cummulative error dynamics of the input-state affine DNN
dDNN = cumsum(DeltaDNN);
% Cummulative error dynamics of the classical DNN

% Save the information

save simulation_results.mat Xh Xd X DeltaAL DeltaDNN dALDNN dDNN ...
    W1 W2 W3 time max_noise

