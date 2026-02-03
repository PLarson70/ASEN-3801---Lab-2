% Contributors: Thomas Jureidini
% Course number: ASEN 3801
% File name: func_LoadASPENData.m
% Created: 1/27/2026
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Inputs: 
%       File name
% 
% ~~~~~~~~~~~~~~~~~
% Outputs: 
%           t_vec =1 x 𝑛𝑛 time vector in seconds where 𝑛𝑛 = the total number of frames from the dataset. The frame rate of the camera is 100 Hz so the frame number can be converted to time in seconds.
%           av_pos_inert = av_pos_inert: 3 x 𝑛 matrix of position vectors in meters for the aerospace vehicle in Frame 𝐸.
%           av_att = 3 x 𝑛 matrix of attitude vectors listing the 3-2-1 Euler angles in radians for the aerospace vehicle relative to Frame 𝐸.
%           tar_pos_inert = 3 x 𝑛 matrix of position vectors in meters for the target in Frame 𝐸𝐸.
%           tar_att = 3 x 𝑛 matrix of attitude vectors listing the 3-2-1 Euler angles in radians for the target relative to Frame 𝐸.
%
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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