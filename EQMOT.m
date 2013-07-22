function statedot = EQMOT(t,state)
%
% Equations of motion for a simple, 1 degree of freedom system.
%
% Time dependence is the general case and so time is left as an input
% argument even though these specific equations of motion are independent
% of time.

%% System parameters
k = 5.0;
c = 0.25;

%% Unwrap the state vector:
x1 = state(1);   % x1 is like a position
x2 = state(2);   % x2 is like a velocity

%% Construct the time derivatives
% The first equation is kinematic and should contain only states.

xdot1 = x2;

% The second equation is dynamic and contains "forces"
% In this case, the k force is proportional to x1 (position) and so acts
% like a spring. The c force is proportional to x2 (velocity) and so acts
% like a dashpot (or friction), removing energy from the system.

xdot2 = -k*x1 - c*x2;

%% Put the derivatives into a column vector:
statedot = 0*state;
statedot(1,1) = xdot1;
statedot(2,1) = xdot2;

