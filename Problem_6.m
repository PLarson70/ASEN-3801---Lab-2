%{
Contributor(s): Ben Adams
Course number: ASEN 3801
File name: Problem_6.m
Created: 02/02/2026
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Goal: Calculate the position vector of the target (person) relate to the
        AV in the E frame.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Methodology: Plot the relative position vector as a function of time. One
subplot for each x,y,z component on one figure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
%}
% Get the position vector of AV
 % Get data (Frame E)
    filename = '3801_Sec003_Test3.csv';
    [t_vec, av_pos_inert_Eframe, av_att, tar_pos_inert_Eframe, tar_att] = LoadASPENData(filename);
