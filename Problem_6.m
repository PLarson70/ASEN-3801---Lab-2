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
%% Get data (Frame E)
filename = '3801_Sec003_Test3.csv';
[t_vec, av_pos_inert_Eframe, av_att, tar_pos_inert_Eframe, tar_att] = LoadASPENData(filename);

%% Calculate relative position
pos_relative = tar_pos_inert_Eframe - av_pos_inert_Eframe;

%% Plot
figure(Name="Problem 6")
sgtitle("Relative Position in E-Frame")
hold on
subplot(2,2,1)
plot(t_vec,pos_relative(:,1),"Color",'b',LineWidth=1)
title("x-position relative")
ylabel("Distance [m]")
xlabel("Time [s]")
ylim([-5 5])

subplot(2,2,2)
plot(t_vec,pos_relative(:,2),"Color",'b',LineWidth=1)
title("y-position relative")
ylabel("Distance [m]")
xlabel("Time [s]")
ylim([-5 5])

subplot(2,2,3)
plot(t_vec,pos_relative(:,3),"Color",'b',LineWidth=1)
title("z-position relative")
ylabel("Distance [m]")
xlabel("Time [s]")
ylim([-5 5])
hold off
