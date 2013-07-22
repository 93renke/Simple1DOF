function nextstate = FOFEIntegrator(DerivFcn,t,state,dt)
%
% FOFEIntegrator
%
% DerivFcn  - Fcn Handle to eqns of motion: d/dt(state) = DerivFcn(t,state)
% t         - current time
% state     - current state
% dt        - time interval
% nextstate - state at time t+dt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Order Forward Euler Integration
%
% This integration routine propagates the state forward in time by using
% the derivative of the state (slope) at the current time. The next state
% is simply a projection forward using this slope (line):
%
% x1 = x0 + slope(x0)*dt
%
% where slope = d/dt(x)
%
% Recall the form of the EQNS of Motion: d/dt(x) = F(t,x)
% Therefore, F(t0,x0) is the slope at time 0. We use this slope to project
% forward and find the value of the state at the next time.
%
% x1 = x0 + F(t0,x0)*dt
%
% This integrator sucks. You have to use small timesteps.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


statedot = feval(DerivFcn,t,state);

nextstate = state + statedot*dt;