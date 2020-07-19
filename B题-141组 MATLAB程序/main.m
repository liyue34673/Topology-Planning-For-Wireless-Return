best_location=rand(1000,2)*5;                        %随机生成东经0-6，北纬0-6度的1000个坐标
tic;
T=1;q=0.95;Tend=1e-8;gen=1;
n=size(best_location,1);
BaseType=0;
Dist=CalDist(best_location);                                %计算任意两点间的距离
best_Solution=GetInitialSolution(best_location,BaseType,Dist);   %获得初始解
best_Solution=Base2Base(best_Solution,Dist);                     %基站之间的微波连接
best_avgBSCost=calAvgBuildStationCost(best_Solution);
best_totalBSCost=calBuildStationCost(best_Solution);
best_avgPLCost=calAvgPLCost(best_Solution,Dist);
best_totalPLCost=calPLCost(best_Solution,Dist);
best_avgCost=best_avgBSCost+best_avgPLCost;
avgCost(gen)=best_avgCost;
avgBSCost(gen)=best_avgBSCost;
avgPLCost(gen)=best_avgPLCost;
totalBSCost(gen)=best_totalBSCost;
totalPLCost(gen)=best_totalPLCost;
plotResult(best_Solution,best_location);
while T>Tend                                    
vector=randperm(n);
new_location=zeros(size(best_location));
for i=1:n;
    new_location(i,:)=best_location(vector(i),:);
end
new_Dist=CalDist(new_location);
new_Solution=GetInitialSolution(new_location,BaseType,new_Dist);
for i=1:30
new_Solution=seperatedBase2Sub(new_Solution,new_Dist,BaseType);
new_Solution=subReconnect(new_Solution,new_Dist,BaseType);
new_avgBSCost=calAvgBuildStationCost(new_Solution);
new_avgPLCost=calAvgPLCost(new_Solution,new_Dist);
new_totalBSCost=calBuildStationCost(new_Solution);
new_avgCost=new_avgBSCost+new_avgPLCost;
new_totalPLCost=calPLCost(new_Solution,new_Dist);
end
if new_avgCost<best_avgCost
    best_location=new_location;
    Dist=new_Dist;
    best_avgCost=new_avgCost;
    best_Solution=new_Solution;
    best_avgBSCost=new_avgBSCost;
    best_totalBSCost=new_totalBSCost;
    best_avgPLCost=new_avgPLCost;
    best_totalPLCost=new_totalPLCost;
elseif exp(-(new_avgCost-best_avgCost)/T)>rand
    best_location=new_location;
    Dist=new_Dist;
    best_avgCost=new_avgCost;
    best_Solution=new_Solution;
    best_avgBSCost=new_avgBSCost;
    best_totalBSCost=new_totalBSCost;
    best_avgPLCost=new_avgPLCost;
    best_totalPLCost=new_totalPLCost;
end

gen=gen+1;
avgCost(gen)=best_avgCost;
avgBSCost(gen)=best_avgBSCost;
avgPLCost(gen)=best_avgPLCost;
totalBSCost(gen)=best_totalBSCost;
totalPLCost(gen)=best_totalPLCost;
T=q*T;
end
figure(2);
best_Solution=Base2Base(best_Solution,Dist);
plotResult(best_Solution,best_location);
figure(3);
plot(avgCost);
Write2csv(best_Solution);
csvwrite('location.csv',best_location);
toc