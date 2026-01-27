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
filename = ;
[t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename);

% Convert E -> N Frame
% 𝑒1̂ = 𝚤𝚤1̂ , 𝑒𝑒̂ 2 = −𝚤𝚤2̂ , and 𝑒𝑒̂ 3 = −𝚤3



% Plot
figure("Name","Problem_3")
hold on
plot3()
view(45,45)
xlabel('i hat _1')
ylabel('i hat _2')
zlabel('i hat _3')
legend('AV','Target')
hold off



