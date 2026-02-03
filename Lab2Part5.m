clc;
clear;
close all;

%% ASEN 3801 Lab 2(b) - Notation, Orientation, Rotation Matrices, and DCM.

% Inputs: attitude321 a 3x1 materix with all the Euler angles - (phi, theta, psi).
%
% Methodology: 
%
% Output: 

%% Function DCM 3-2-1 Start.
function DCM = RotationMatrix321(attitude321)

% here 'phi' = roll angle, 'theta' = pitch angle, 'psi' = yaw angle.
% All the angles are in Radians.

phi = attitude321(1);
theta = attitude321(2);
psi = attitude321(3);

R_1 = [1       0          0; 
       0 cos(phi) sin(phi); % 3 - roll
       0 -sin(phi) cos(phi)]; 

R_2 = [cos(theta) 0 -sin(theta);
       0          1           0; % 2 - pitch 
       sin(theta) 0 cos(theta)]; 

R_3 = [cos(psi) sin(psi) 0;
      -sin(psi) cos(psi) 0; % 1 - yaw
       0        0       1]; 

DCM = (R_1 * R_2 * R_3);
end

%% ASEN 3801 Lab 2(e) - Notation, Orientation, Rotation Matrices, and DCM.

% Inputs: attitude321 a 3x1 materix with all the Euler angles - (psi, theta, phi).
%
% Methodology: 
%
% Output: 


%% Function DCM 3-1-3 Euler Angles.

% the function to define the Euler Angle
function attitude313 = EulerAngles313(DCM)

gamma = atan(DCM(3,1)/(-DCM(3,2))); % Yaw
beta = acos(DCM(3,3)); %  Pitch 
alpha = atan(DCM(1,3)/DCM(2,3)); % Roll

attitude313 = [alpha; beta; gamma]; 
end


function [t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename)
    %filename = "3801_Sec003-Test3.csv";
    data = readmatrix(filename);

    data(1:5,:) = [];
    data(:,2) = [];

    t_vec = data(:,1);
    av_pos_inert = data(:, 11:13);
    av_att = data(:, 8:10);
    tar_pos_inert = data(:,5:7);
    tar_att = data(:,2:4);

    % Convert mm to m
    tar_pos_inert = tar_pos_inert/1000;
    av_pos_inert = av_pos_inert/1000;
    
   % [av_pos_inert, av_att, tar_pos_inert, tar_att] = ConvertASPENData(av_pos_inert, av_att, tar_pos_inert, tar_att);
    
end



% LAB 2 PART 5


%Read in file data and create state vector
filename = '3801_Sec003_Test3.csv';
[t_vec, av_pos_inert_Eframe, av_att, tar_pos_inert_Eframe, tar_att] = LoadASPENData(filename);


att_313_av = zeros(6463,3); %allocate attitude matrix 

for i = 1:size(av_att)
%Create 3-2-1 DCM's for drone
av_DCM = RotationMatrix321(av_att(i,:));

%Use DCM's to create new collection of 3-1-3 Euler Angles for drone
att_313_av(i,:) = EulerAngles313(av_DCM);
end


%Repeat above steps for target 
att_313_tar = zeros(6463,3); %allocate attitude matrix 

for j = 1:size(av_att)

%Create 3-2-1 DCM's for target
tar_DCM = RotationMatrix321(tar_att(j,:));

%Use DCM's to create new collection of 3-1-3 Euler Angles for target
att_313_tar(j,:) = EulerAngles313(tar_DCM);
end


tspan = (1:size(av_att)); % create time vector

figure; %Create figure

%Plot Psi Angles
subplot(3, 1, 1);
plot(tspan, att_313_av(:,1), 'b-', tspan, att_313_tar(:,1), 'r--'); % plot data
title('Psi Euler Angle for 3-1-3 Rotation');
xlabel('Time (Seconds)');
ylabel('Angle (Radians)');
legend('Drone', 'Target');
grid on;

%Plot Theta Angles
subplot(3, 1, 2); 
plot(tspan, att_313_av(:,2), 'b-', tspan, att_313_tar(:,2), 'r--'); % plot data
title('Theta Euler Angle for 3-1-3 Rotation');
xlabel('Time (Seconds)');
ylabel('Angle (Radians)');
legend('Drone', 'Target');
grid on;

%Plot Phi Angles
subplot(3, 1, 3); 
plot(tspan, att_313_av(:,3), 'b-', tspan, att_313_tar(:,3), 'r--'); % plot data
title('Phi Euler Angle for 3-1-3 Rotation');
xlabel('Time (Seconds)');
ylabel('Angle (Radians)');
legend('Drone', 'Target');
grid on;




























%% END 