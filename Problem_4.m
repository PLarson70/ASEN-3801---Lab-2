%{ Problem 4
Contributor(s): Paris Larson
Course number: ASEN 3801
File name: Problem_4.m
Created: 02/01/2026
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Goal: Plot the position vector in frame E (xE,yE,zE) as a function of time of the aerospace
        vehicle and target, as well as plot the 3-2-1 Euler angles (in degrees) 
        as a function of time of the aerospace vehicle and target.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Methodology: Plot the components of the position vector as a function of time / 3-2-1 Euler angles. One
subplot for each x,y,z component on one figure and one subplot for alpha, beta, gamma component on the aother figure.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
%}
filename = '3801_Sec003_Test3.csv';

[t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename);

figure(Name="Problem 4.1")
subplot(3,1,1)
    hold on
    %x_E position
    plot(t_vec, av_pos_inert(:,1), 'b', 'LineWidth', 1.5);
    plot(t_vec, tar_pos_inert(:,1), 'r', 'LineWidth', 1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('x_E [mm]');
    %legend('Drone', 'Target', 'Location','best');
   
subplot(3,1,2)
    hold on
    %y_E position
    plot(t_vec, av_pos_inert(:,2),'b','LineWidth',1.5);
    plot(t_vec,tar_pos_inert(:,2), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('y_E [mm]');
    

subplot(3,1,3)
    %z_E position
    hold on;
    plot(t_vec, av_pos_inert(:,3),'b','LineWidth',1.5);
    plot(t_vec,tar_pos_inert(:,3), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('z_E [mm]');

legend('Drone', 'Target', 'Location','best');
sgtitle('Problem 4: Position Components in Frame E vs Time');

%converting to degrees
deg_av_att = rad2deg(av_att);
deg_tar_att = rad2deg(tar_att);

figure(Name="Problem 4.2")
hold on
subplot(3,1,1)
    %Euler position (alpha)
    hold on;
    plot(t_vec, deg_av_att(:,1),'b','LineWidth',1.5);
    plot(t_vec,deg_tar_att(:,1), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('\alpha [deg]');

subplot(3,1,2)
    %Euler position (beta)
    hold on;
    plot(t_vec, deg_av_att(:,2),'b','LineWidth',1.5);
    plot(t_vec,deg_tar_att(:,2), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('\beta [deg]');
    legend('Drone', 'Target','Location','northwest');

subplot(3,1,3)
    %Euler position (gamma)
    hold on;
    plot(t_vec, deg_av_att(:,3),'b','LineWidth',1.5);
    plot(t_vec,deg_tar_att(:,3), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [ms]');
    ylabel('\gamma [deg]');

sgtitle('Problem 4: 3-2-1 Euler Angles in Frame E vs Time');

