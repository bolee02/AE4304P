% Filename : TimeDomainAnalysis (originally examp81c.m)
% From lecture notes ae4-304
%
% Bo Lee (5225604)
%%

% RUN PREVIOUS SCRIPTS
StabilityAnalysis;
close all;

dt = 0.01; T  = 60; t = 0:dt:T; N = length(t);
nn = zeros(1,N);

% TURBULENCE INPUTS
u_g = randn(1,N)/sqrt(dt);    % sqrt(dt) because of lsim characteristics
w_g = randn(1,N)/sqrt(dt);

% INPUT VECTORS
u1 = [nn' nn' u_g' nn'  nn'];     
u2 = [nn' nn' nn'  w_g' nn'];

% DEFINE OUTPUT MATRICES
C = [1 0 0 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0;
     V*yb V*yphi V*yp V*(yr+2*V/b) 0 0 0 0 V*ybg 0];
   
D = [0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 0 0];

C_r= [1 0 0 0 0 0 0 0;
      0 1 0 0 0 0 0 0;
      V*yb V*(yr+2*V/b) 0 0 0 0 V*ybg 0];

D_r = [0 0 0 0 0;
       0 0 0 0 0;
       0 0 0 0 0];

% RESPONSE to u_g
y1 = lsim(A_cl,B,C,D,u1,t);
y1_r = lsim(A_r,B_r,C_r,D_r,u1,t);

% RESPONSE to w_g
y2 = lsim(A_cl,B,C,D,u2,t);
y2_r = lsim(A_r,B_r,C_r,D_r,u2,t);

% RESPONSE to all together (linear system!)
yt = y1+y2;
yt_r = y1_r+y2_r;

% PLOT RESULTS
figure(4)
grid on
plot(t, yt)
xlabel('Time [s]')
ylabel('Response - y_{cl}')
set(gcf,'color','white')
export_fig('timedomain_ycl', '-png', '-r300', '-nocrop')

figure(5)
grid on
plot(t, yt(:,5))
xlabel('Time [s]')
ylabel('Lateral acceleration - a_{y_{cl}} [m/s^2]')
set(gcf,'color','white')
export_fig('timedomain_aycl', '-png', '-r300', '-nocrop')

figure(6)
grid on
plot(t, yt(:,1))
xlabel('Time [s]')
ylabel('Sidelip - \beta_{cl} [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_betacl', '-png', '-r300', '-nocrop')

figure(7)
grid on
plot(t, yt(:,4))
xlabel('Time [s]')
ylabel('rb/2V_{cl} [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_rbcl', '-png', '-r300', '-nocrop')

figure(8)
grid on
plot(t, yt(:,2))
xlabel('Time [s]')
ylabel('Roll - \phi [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_phicl', '-png', '-r300', '-nocrop')

figure(9)
grid on
plot(t, yt(:,3))
xlabel('Time [s]')
ylabel('pb/2V [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_pbcl', '-png', '-r300', '-nocrop')

figure(10)
grid on
plot(t, yt_r)
xlabel('Time [s]')
ylabel('Response - y_{r}')
set(gcf,'color','white')
export_fig('timedomain_yr', '-png', '-r300', '-nocrop')

figure(11)
grid on
plot(t, yt_r(:,3))
xlabel('Time [s]')
ylabel('Lateral acceleration - a_{y_{r}} [m/s^2]')
set(gcf,'color','white')
export_fig('timedomain_ayr', '-png', '-r300', '-nocrop')

figure(12)
grid on
plot(t, yt_r(:,1))
xlabel('Time [s]')
ylabel('Sidelip - \beta_{r} [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_betar', '-png', '-r300', '-nocrop')

figure(13)
grid on
plot(t, yt_r(:,2))
xlabel('Time [s]')
ylabel('rb/2V_{r} [rad/s]')
set(gcf,'color','white')
export_fig('timedomain_rbr', '-png', '-r300', '-nocrop')