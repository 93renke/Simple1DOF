% Clear the workspace variables, close all figures, clear the command window
clear
close all
clc

% Initial conditions
x1init = 1;
x2init = 0;

% Timestep
dt = 0.01;

% Total simulation time
tfinal = 5;

% Construct an array of time values
t = 0:dt:tfinal;

% Construct an array that will store the state history, initialize to zeros
state = zeros(2,numel(t));

% Place the initial conditions in the beginning of the state array:
state(1,1) = x1init;
state(2,1) = x2init;

% The integration loop
for idx = 2:numel(t)   
    % Construct current state using previous state and previous time
    state(:,idx) = FOFEIntegrator(@EQMOT,t(idx-1),state(:,idx-1),dt);        
end

% Plot the results
figure
hold on
plot(t,state(1,:),'-o')
plot(t,state(2,:),'-rd')
axis([0 5 -2.5 2])
grid on
xlabel('time')
legend('X1','X2')
title(['Timestep = ' num2str(dt)])

