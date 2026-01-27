function DCM = RotationMatrix313(attitude313)
% Goal: use the Euler angles for the 3-1-3 rotation sequence to calculate the associated DCM.
% Inputs:
% attitude313: 3 x 1 vector with the 3-1-3 Euler angles in the form attitude313 = [𝛼𝛼, 𝛽𝛽, 𝛾𝛾]
% T
% Outputs:
% DCM: the rotation matrix calculated from the Euler angles.

%extracting Euler angles
alpha = attitude313(1);
beta = attitude313(2);
gamma = attitude313(3);

theta = alpha;

R3_1 = [cos(theta) , sin(theta), 0;
    -sin(theta), cos(theta), 0;
    0, 0, 1];

theta = beta;
R1 = [1, 0, 0;
    0, cos(theta), sin(theta);
    0, -sin(theta), cos(theta)];

theta = gamma;
R3_2 = [cos(theta) , sin(theta), 0;
    -sin(theta), cos(theta), 0;
    0, 0, 1];

DCM = R3_1 * R1 * R3_2;


end