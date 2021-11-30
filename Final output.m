%Plot the whole view
plotfis(pso);

%Plot each mf(input/output)
figure
[x,mf] = plotmf(pso,'input',1);
subplot(5,1,1), plot(x,mf);
xlabel('Membership Functions for  Ex-uni Length');

[x,mf] = plotmf(pso,'input',2);
subplot(5,1,2), plot(x,mf);
xlabel('Membership Functions for  Ex-uni Average');

[x,mf] = plotmf(pso,'input',3);
subplot(5,1,3), plot(x,mf);
xlabel('Membership Functions for  Olympiad Chosen');

[x,mf] = plotmf(pso,'input',4);
subplot(5,1,4), plot(x,mf);
xlabel('Membership Functions for  Ex-Uni Quality');

[x,mf] = plotmf(pso,'input',5);
subplot(5,1,5), plot(x,mf);
xlabel('Membership Functions for IELTS');
figure
[x,mf] = plotmf(pso,'input',6);
subplot(5,1,1), plot(x,mf);
xlabel('Membership Functions for Papers');

[x,mf] = plotmf(pso,'input',7);
subplot(5,1,2), plot(x,mf);
xlabel('Membership Functions for  Festival Chosen');

[x,mf] = plotmf(pso,'input',8);
subplot(5,1,3), plot(x,mf);
xlabel('Membership Functions for Compilation,Translation,Invention');

[x,mf] = plotmf(pso,'input',9);
subplot(5,1,4), plot(x,mf);
xlabel('Membership Functions for Msc Thesis Quality');

[x,mf] = plotmf(pso,'input',10);
subplot(5,1,5), plot(x,mf);
xlabel('Membership Functions for Interviews Test');

figure
[x,mf] = plotmf(pso,'output',1);
subplot(2,1,1), plot(x,mf);
xlabel('Membership Functions for Qualification(output)');