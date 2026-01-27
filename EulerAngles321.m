function attitude321 = EulerAngles321(DCM)
% Goal: use the DCM to extract the 3-2-1 Euler angles
% Inputs:
% • DCM: a rotation matrix
% Outputs:
% • attitude321: 3 x 1 vector with the 3-2-1 Euler angles in the form attitude321 = [𝛼, 𝛽, 𝛾]T 
% (InASEN 3728 notation, this would be equivalent to [𝜙,𝜃,𝜓]T).

psi=atan(DCM(2,3)/DCM(3,3));
theta= -asin(DCM(1,3));
phi= atan(DCM(1,2)/DCM(1,1));

attitude321 = [psi, theta, phi]';
end