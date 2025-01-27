%DICe result reader, N. Boechler (1/2023)
%put this in a folder with your DICe_solution_0*.txt files

clc;
clear all;
close all;

mydata=readmatrix('DICe_solution_30.txt');


strain_yy=mydata(:,12);
xpos=mydata(:,2);
ypos=mydata(:,3);

figure(01)
scatter(xpos,ypos,[],strain_yy,'filled')
colorbar
xlabel('x')
ylabel('y')
set(gca,'fontsize',20,'linewidth',2)



%% looking at data for x = 1005 +- 15 , y = 600 +- 15 
files = dir('/Users/kaustubhkanagalekar/dice_working_dir/MAE171a/results/*.txt'); % List all .txt files
num_files = length(files)-1;

num_points = 1384;
data_all = zeros(num_points, 12, num_files); % Preallocate for speed
%dir('/Users/kaustubhkanagalekar/dice_working_dir/MAE171a/results/DICe_solution_00.txt')

for i = 1:(num_files)
    file_path = fullfile('/Users/kaustubhkanagalekar/dice_working_dir/MAE171a/results', files(i).name);

    % Read the file and store the data
    data = readtable(file_path, 'Delimiter', ',', 'HeaderLines', 1); % Adjust headers if needed
    
    % Convert table to array and exclude SUBSET_ID
    data_all(:, :, i) = table2array(data(:, 2:end)); % Exclude SUBSET_ID


end


%test 1 sample 1 (frame 2 .txt results) 
% (990,600)529
strain_xx_99_6_1_2= -7.9494E-03;
strain_yy_99_6_1_2= 4.2617E-03;
strain_xy_99_6_1_2=-3.3087E-03;

% (1005,600) 572
strain_xx_105_6_1_2 =0.0000E+00;
strain_yy_105_6_1_2 =0.0000E+00;
strain_xy_105_6_1_2 =0.0000E+00;

%(1020,600) 643
strain_xx_102_6_1_2= -6.1113E-04;
strain_yy_102_6_1_2= 1.2042E-02;
strain_xy_102_6_1_2= -7.2023E-03;


%test 1 sample 1 (frame 30 .txt results) 
% (990,600)529
strain_xx_99_6_1_30= -3.7297E-02;
strain_yy_99_6_1_30= 1.1651E-01;
strain_xy_99_6_1_30 = -1.0459E-02;

% (1005,600) 572
strain_xx_105_6_1_30 =0.0000E+00;
strain_yy_105_6_1_30=0.0000E+00;
strain_xy_105_6_1_30 =0.0000E+00;

%(1020,600) 643
strain_xx_102_6_1_30= 0;
strain_yy_102_6_1_30= 0;
strain_xy_102_6_1_30= 0;



dyy_9_6_2_30 = -strain_yy_99_6_1_2+ strain_yy_99_6_1_30
dyy_105_6_2_30 = -strain_yy_105_6_1_2 + strain_yy_105_6_1_30
dyy_102_6_2_30 = -strain_yy_102_6_1_2 + strain_yy_102_6_1_30