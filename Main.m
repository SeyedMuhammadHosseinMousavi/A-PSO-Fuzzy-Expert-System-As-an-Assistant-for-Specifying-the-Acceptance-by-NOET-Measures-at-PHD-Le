clear
clc
close all
load DB
%%%%%%%%%%%%%%%%%%%%Optimization with PSO%%%%%%%%%%%%%%%%
disp('**********************************');
PSO_EasyLevel
EasyLevelRanges=gbest(end,:);
disp('**********************************');
disp(['**Rejected Level Ranges:   ' , num2str(EasyLevelRanges)]);
disp(['  fittness:   ',num2str(gbestcost(end))]);
figure
disp('**********************************');
PSO_ModerateLevel
ModerateLevelRanges=gbest(end,:);
disp('**********************************');
disp(['**Most Likely Level Ranges:   ' , num2str(ModerateLevelRanges)]);
disp(['  fittness:   ',num2str(gbestcost(end))]);
figure
disp('**********************************');
PSO_HardLevel
HardLevelRanges=gbest(end,:);
disp('**********************************');
disp(['**Accepted Level Ranges:   ' , num2str(HardLevelRanges)]);
disp(['  fittness:   ',num2str(gbestcost(end))]);
disp('**********************************');
%%%%%%%%%%%%%%%%%%%Fuzzy Step%%%%%%%%%%%%%%%%%%
easy =[easy(:,1)*(EasyLevelRanges(2)-EasyLevelRanges(1))/(max(easy(:,1))-min(easy(:,1)))...
       easy(:,2)*(EasyLevelRanges(4)-EasyLevelRanges(3))/(max(easy(:,2))-min(easy(:,2)))...
       easy(:,3)*(EasyLevelRanges(6)-EasyLevelRanges(5))/(max(easy(:,3))-min(easy(:,3)))...
       easy(:,4)*(EasyLevelRanges(8)-EasyLevelRanges(7))/(max(easy(:,4))-min(easy(:,4)))...
       easy(:,5)*(EasyLevelRanges(10)-EasyLevelRanges(9))/(max(easy(:,5))-min(easy(:,5)))...
       easy(:,6)*(EasyLevelRanges(12)-EasyLevelRanges(11))/(max(easy(:,6))-min(easy(:,6)))...
       easy(:,7)*(EasyLevelRanges(14)-EasyLevelRanges(13))/(max(easy(:,7))-min(easy(:,7)))...
       easy(:,8)*(EasyLevelRanges(16)-EasyLevelRanges(15))/(max(easy(:,8))-min(easy(:,8)))...
       easy(:,9)*(EasyLevelRanges(18)-EasyLevelRanges(17))/(max(easy(:,9))-min(easy(:,9)))...
       easy(:,10)*(EasyLevelRanges(20)-EasyLevelRanges(19))/(max(easy(:,10))-min(easy(:,10)))];


moderate =[moderate(:,1)*(ModerateLevelRanges(2)-ModerateLevelRanges(1))/(max(moderate(:,1))-min(moderate(:,1)))...
           moderate(:,2)*(ModerateLevelRanges(4)-ModerateLevelRanges(3))/(max(moderate(:,2))-min(moderate(:,2)))...
           moderate(:,3)*(ModerateLevelRanges(6)-ModerateLevelRanges(5))/(max(moderate(:,3))-min(moderate(:,3)))...
           moderate(:,4)*(ModerateLevelRanges(8)-ModerateLevelRanges(7))/(max(moderate(:,4))-min(moderate(:,4)))...
           moderate(:,5)*(ModerateLevelRanges(10)-ModerateLevelRanges(9))/(max(moderate(:,5))-min(moderate(:,5)))...
           moderate(:,6)*(ModerateLevelRanges(12)-ModerateLevelRanges(11))/(max(moderate(:,6))-min(moderate(:,6)))...
           moderate(:,7)*(ModerateLevelRanges(14)-ModerateLevelRanges(13))/(max(moderate(:,7))-min(moderate(:,7)))...
           moderate(:,8)*(ModerateLevelRanges(16)-ModerateLevelRanges(15))/(max(moderate(:,8))-min(moderate(:,8)))...
           moderate(:,9)*(ModerateLevelRanges(18)-ModerateLevelRanges(17))/(max(moderate(:,9))-min(moderate(:,9)))...
           moderate(:,10)*(ModerateLevelRanges(20)-ModerateLevelRanges(19))/(max(moderate(:,10))-min(moderate(:,10)))];
   
hard =[hard(:,1)*(HardLevelRanges(2)-HardLevelRanges(1))/(max(hard(:,1))-min(hard(:,1)))...
       hard(:,2)*(HardLevelRanges(4)-HardLevelRanges(3))/(max(hard(:,2))-min(hard(:,2)))...
       hard(:,3)*(HardLevelRanges(6)-HardLevelRanges(5))/(max(hard(:,3))-min(hard(:,3)))...
       hard(:,4)*(HardLevelRanges(8)-HardLevelRanges(7))/(max(hard(:,4))-min(hard(:,4)))...
       hard(:,5)*(HardLevelRanges(10)-HardLevelRanges(9))/(max(hard(:,5))-min(hard(:,5)))...
       hard(:,6)*(HardLevelRanges(12)-HardLevelRanges(11))/(max(hard(:,6))-min(hard(:,6)))...
       hard(:,7)*(HardLevelRanges(14)-HardLevelRanges(13))/(max(hard(:,7))-min(hard(:,7)))...
       hard(:,8)*(HardLevelRanges(16)-HardLevelRanges(15))/(max(hard(:,8))-min(hard(:,8)))...
       hard(:,9)*(HardLevelRanges(18)-HardLevelRanges(17))/(max(hard(:,9))-min(hard(:,9)))...
       hard(:,10)*(HardLevelRanges(20)-HardLevelRanges(19))/(max(hard(:,10))-min(hard(:,10)))];
   
Xin  = [easy;moderate;hard];
Xout = [ones(size(easy,1),1);2*ones(size(moderate,1),1);3*ones(size(hard,1),1)];

fismat = genfis3(Xin,Xout,'mamdani',10);

fismat = setfis(fismat, 'name', 'Sanjesh Expert System');

fismat = setfis(fismat,'output',1, 'name', 'Condition');

fismat = setfis(fismat,'input',1, 'name', 'Ex-uni Length');
fismat = setfis(fismat,'input',2, 'name', 'Ex-uni Average');
fismat = setfis(fismat,'input',3, 'name', 'Olympiad Chosen');
fismat = setfis(fismat,'input',4, 'name', 'Ex-Uni Quality');
fismat = setfis(fismat,'input',5, 'name', 'IELTS');
fismat = setfis(fismat,'input',6, 'name', 'Papers');
fismat = setfis(fismat,'input',7, 'name', 'Festival Chosen');
fismat = setfis(fismat,'input',8, 'name', 'Compilation,Translation,Invention');
fismat = setfis(fismat,'input',9, 'name', 'Msc Thesis Quality');
fismat = setfis(fismat,'input',10, 'name', 'Interviews Test');

fismat = setfis(fismat,'output',1,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'output',1,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'output',1,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',1,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',1,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',1,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',2,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',2,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',2,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',3,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',3,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',3,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',4,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',4,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',4,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',5,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',5,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',5,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',6,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',6,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',6,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',7,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',7,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',7,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',8,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',8,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',8,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',9,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',9,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',9,'mf', 3, 'name', 'H');

fismat = setfis(fismat,'input',10,'mf', 1, 'name', 'L');
fismat = setfis(fismat,'input',10,'mf', 2, 'name', 'M');
fismat = setfis(fismat,'input',10,'mf', 3, 'name', 'H');

figure
plotfis(fismat);


figure
[x,mf] = plotmf(fismat,'input',1);
subplot(5,1,1), plot(x,mf);
xlabel('Membership Functions for Ex-uni Length');

[x,mf] = plotmf(fismat,'input',2);
subplot(5,1,2), plot(x,mf);
xlabel('Membership Functions for Ex-uni Average');

[x,mf] = plotmf(fismat,'input',3);
subplot(5,1,3), plot(x,mf);
xlabel('Membership Functions for Olympiad Chosen');

[x,mf] = plotmf(fismat,'input',4);
subplot(5,1,4), plot(x,mf);
xlabel('Membership Functions for Ex-Uni Quality');

[x,mf] = plotmf(fismat,'input',5);
subplot(5,1,5), plot(x,mf);
xlabel('Membership Functions for IELTS');
figure
[x,mf] = plotmf(fismat,'input',6);
subplot(5,1,1), plot(x,mf);
xlabel('Membership Functions for Papers');

[x,mf] = plotmf(fismat,'input',7);
subplot(5,1,2), plot(x,mf);
xlabel('Membership Functions for Festival Chosen');

[x,mf] = plotmf(fismat,'input',8);
subplot(5,1,3), plot(x,mf);
xlabel('Membership Functions for Compilation,Translation,Invention');

[x,mf] = plotmf(fismat,'input',9);
subplot(5,1,4), plot(x,mf);
xlabel('Membership Functions for Msc Thesis Quality');

[x,mf] = plotmf(fismat,'input',10);
subplot(5,1,5), plot(x,mf);
xlabel('Membership Functions for Interviews Test');

figure
[x,mf] = plotmf(fismat,'output',1);
subplot(5,1,1), plot(x,mf);
xlabel('Membership Functions for Condition(output)');

fismat.defuzzMethod='centroid'; %or 'mom'
writefis(fismat,'expert system.fis');
ruleview('expert system')
showfis(fismat)
fuzzy(fismat)