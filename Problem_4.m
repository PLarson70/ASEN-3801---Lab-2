%% Problem 4
filename = '3801_Sec003_Test3.csv';

[t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename);

figure(Name="Problem 4.1")
subplot(3,1,1)
    hold on
    %x_E position
    plot(t_vec, av_pos_inert(:,1), 'b', 'LineWidth', 1.5);
    plot(t_vec, tar_pos_inert(:,1), 'r', 'LineWidth', 1.5);
    grid on;
    xlabel('Time [s]');
    ylabel('x_E [mm]');
    %legend('Drone', 'Target', 'Location','best');
   
subplot(3,1,2)
    hold on
    %y_E position
    plot(t_vec, av_pos_inert(:,2),'b','LineWidth',1.5);
    plot(t_vec,tar_pos_inert(:,2), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [s]');
    ylabel('y_E [mm]');
    

subplot(3,1,3)
    %z_E position
    hold on;
    plot(t_vec, av_pos_inert(:,3),'b','LineWidth',1.5);
    plot(t_vec,tar_pos_inert(:,3), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [s]');
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
    xlabel('Time [s]');
    ylabel('\alpha [deg]');

subplot(3,1,2)
    %Euler position (beta)
    hold on;
    plot(t_vec, deg_av_att(:,2),'b','LineWidth',1.5);
    plot(t_vec,deg_tar_att(:,2), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [s]');
    ylabel('\beta [deg]');
    legend('Drone', 'Target','Location','northwest');

subplot(3,1,3)
    %Euler position (gamma)
    hold on;
    plot(t_vec, deg_av_att(:,3),'b','LineWidth',1.5);
    plot(t_vec,deg_tar_att(:,3), 'r','LineWidth',1.5);
    grid on;
    xlabel('Time [s]');
    ylabel('\gamma [deg]');

sgtitle('Problem 4: 3-2-1 Euler Angles in Frame E vs Time');
