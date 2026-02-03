%{
Contributor(s): Ben Adams
Course number: ASEN 3801
File name: Problem_3.m
Created: 01/27/2026
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Goal: plot the 3D position of both objects in frame N
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Methodology: draw the aerospace vehicle’s path
in solid blue and the target’s path in dashed red. Label all axes and 
include a legend. Be sure to follow
the plotting best practices presented in Lab 1.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
%}
% Get data (Frame E)
filename = '3801_Sec003_Test3.csv';
[t_vec, av_pos_inert_Eframe, av_att, tar_pos_inert_Eframe, tar_att] = LoadASPENData(filename);

% Convert E -> N Frame
% 𝑒1̂ = 𝚤𝚤1̂ , 𝑒𝑒̂ 2 = −𝚤𝚤2̂ , and 𝑒𝑒̂ 3 = −𝚤3
av_pos_inert_Nframe =  [av_pos_inert_Eframe(:,1),-av_pos_inert_Eframe(:,2), -av_pos_inert_Eframe(:,3)];
tar_pos_inert_Nframe =  [tar_pos_inert_Eframe(:,1),-tar_pos_inert_Eframe(:,2), -tar_pos_inert_Eframe(:,3)];


% Plot
figure("Name","Problem_3")
hold on
plot3(av_pos_inert_Nframe(:,1),av_pos_inert_Nframe(:,2),av_pos_inert_Nframe(:,3),Color='b',LineWidth=1.5)
plot3(tar_pos_inert_Nframe(:,1),tar_pos_inert_Nframe(:,2),tar_pos_inert_Nframe(:,3),Color='r',LineWidth=1.5,LineStyle='--')
view(164.2968, 34.9023)
xlabel('$$\hat{i}_1$$ [m]','Interpreter','Latex')
ylabel('$$\hat{i}_2$$ [m]','Interpreter','Latex')
zlabel('$$\hat{i}_3$$ [m]','Interpreter','Latex')
legend('AV','Target')
title('3D position plot')
hold off



