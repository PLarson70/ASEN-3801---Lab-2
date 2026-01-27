clc;
clear;
close all;

%% ASEN 3801 Lab 2(b) - Notation, Orientation, Rotation Matrices, and DCM.

% Inputs: attitude321 a 3x1 materix with all the Euler angles - (psi, theta, phi).
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

%% END 