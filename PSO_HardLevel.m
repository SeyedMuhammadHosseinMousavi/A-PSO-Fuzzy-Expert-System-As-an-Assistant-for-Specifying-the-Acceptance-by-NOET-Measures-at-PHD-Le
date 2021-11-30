%clc;
%clear;
%load DB
npop=100;
nvar=20;

w=1;
wdamp=0.99;

c1=2;
c2=2;

xxmin=min(easy);
xmin=[xxmin(1) xxmin(1) xxmin(2) xxmin(2) xxmin(3) xxmin(3) xxmin(4) xxmin(4) xxmin(5) xxmin(5)...
    xxmin(6) xxmin(6) xxmin(7) xxmin(7) xxmin(8) xxmin(8) xxmin(9) xxmin(9) xxmin(10) xxmin(10)];
xxmax=max(easy);
xmax=[xxmax(1) xxmax(1) xxmax(2) xxmax(2) xxmax(3) xxmax(3) xxmax(4) xxmax(4) xxmax(5) xxmax(5)...
    xxmax(6) xxmax(6) xxmax(7) xxmax(7) xxmax(8) xxmax(8) xxmax(9) xxmax(9) xxmax(10) xxmax(10)];
dx=xmax-xmin;

vmax=0.1*dx;

maxit=100;

empty_particle.position=[];
empty_particle.velocity=[];
empty_particle.cost=[];
empty_particle.pbest=[];
empty_particle.pbestcost=[];

particle=repmat(empty_particle,npop,1);

gbest=zeros(maxit,nvar);
gbestcost=zeros(maxit,1);

for it=1:maxit
    if it==1
        gbestcost(1)=inf;
        for i=1:npop
            particle(i).velocity=zeros(1,nvar);
            particle(i).position=xmin+(xmax-xmin).*rand(1,nvar);
            particle(i).cost=CostHard(particle(i).position,hard);
            
            particle(i).pbest=particle(i).position;
            particle(i).pbestcost=particle(i).cost;
            
            if particle(i).pbestcost<gbestcost(it)
                gbest(it,:)=particle(i).pbest;
                gbestcost(it)=particle(i).pbestcost;
            end
        end
    else
        gbest(it,:)=gbest(it-1,:);
        gbestcost(it)=gbestcost(it-1);
        for i=1:npop
            particle(i).velocity=w*particle(i).velocity...
                                +c1*rand*(particle(i).pbest-particle(i).position)...
                                +c2*rand*(gbest(it,:)-particle(i).position);
                            
            particle(i).velocity=min(max(particle(i).velocity,-vmax),vmax);
            
            particle(i).position=particle(i).position+particle(i).velocity;
            
            particle(i).position=min(max(particle(i).position,xmin),xmax);
            
            particle(i).cost=CostHard(particle(i).position,hard);
            
            if particle(i).cost<particle(i).pbestcost
                particle(i).pbest=particle(i).position;
                particle(i).pbestcost=particle(i).cost;

                if particle(i).pbestcost<gbestcost(it)
                    gbest(it,:)=particle(i).pbest;
                    gbestcost(it)=particle(i).pbestcost;
                end
            end
        end
    end
    
    disp(['Iteration ' num2str(it) ':   Best Cost = ' num2str(gbestcost(it))]);
    
    w=w*wdamp;
end

plot(gbestcost);
xlabel('iteration')
ylabel('fittness')
title('Accepted')

