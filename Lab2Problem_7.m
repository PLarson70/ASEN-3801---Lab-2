%{
ASEN 3801 – Problem 7

Goal:
  Compute and plot the position of the target relative to the aerospace
  vehicle, expressed in the BODY frame (B).

%}

clear; clc; close all;

%% 1) Read CSV file directly
file = '3801_Sec003_Test3.csv';

opts = detectImportOptions(file);
opts.VariableNamesLine = 4;    % headers
opts.DataLines = [6 Inf];      % numeric data
T = readtable(file, opts);
D = table2array(T);

%% 2) Extract data columns (based on your file format)
frame = D(:,1);          % frame number

phi   = D(:,3);          % roll  (rad)
theta = D(:,4);          % pitch (rad)
psi   = D(:,5);          % yaw   (rad)

av_pos_E  = D(:,6:8)   / 1000;    % AV position [mm → m]
tar_pos_E = D(:,12:14) / 1000;    % target position [mm → m]

%% 3) Relative position in E-frame
r_rel_E = tar_pos_E - av_pos_E;

%% 4) Convert relative position to B-frame
N = length(frame);
r_rel_B = zeros(N,3);

for k = 1:N
    ph = phi(k);
    th = theta(k);
    ps = psi(k);

    % Direction Cosine Matrix (3-2-1 Euler angles)
    C_EB = [ ...
        cos(th)*cos(ps),  cos(th)*sin(ps), -sin(th);
        sin(ph)*sin(th)*cos(ps)-cos(ph)*sin(ps), ...
        sin(ph)*sin(th)*sin(ps)+cos(ph)*cos(ps), ...
        sin(ph)*cos(th);
        cos(ph)*sin(th)*cos(ps)+sin(ph)*sin(ps), ...
        cos(ph)*sin(th)*sin(ps)-sin(ph)*cos(ps), ...
        cos(ph)*cos(th) ];

    C_BE = C_EB.';    % E → B
    r_rel_B(k,:) = (C_BE * r_rel_E(k,:).').';
end

%% 5) Plot (frame index on x-axis)
figure('Name','Relative Position in B-Frame')
sgtitle('Target Relative Position in Body Frame')

subplot(3,1,1)
plot(frame, r_rel_B(:,1), 'r', 'LineWidth', 0.75)
ylabel('x_B [m]')
grid on

subplot(3,1,2)
plot(frame, r_rel_B(:,2), 'r', 'LineWidth', 0.75)
ylabel('y_B [m]')
grid on

subplot(3,1,3)
plot(frame, r_rel_B(:,3), 'r', 'LineWidth', 0.75)
ylabel('z_B [m]')
xlabel('Frame')
grid on
