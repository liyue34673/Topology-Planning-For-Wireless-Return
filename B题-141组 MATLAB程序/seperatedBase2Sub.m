function solution_new=seperatedBase2Sub(solution,Dist,BaseType)
if BaseType==0
    maxIn=6;
else
    maxIn=12;
end
solution_new=solution;
n=size(solution_new,2);                                      %计算站点数目
for i=1:n                                                    %对于任意一个站点
   if solution_new(3,i)==0                                   %如果是宿主站且连接站点数为0
       couldConnect=find(Dist(i,:)<=10 & Dist(i,:)>0 &solution_new(1,:)==0);       %求可以连接的最近的子站
       if ~isempty(couldConnect)                             %如果存在
           [minDistance,location]=min(Dist(i,couldConnect)); %如果不止一个，寻找这些站点中离该站最近的子站相连接
           if solution_new(1,couldConnect(location))==0
           if solution_new(4,couldConnect(location))<3       %判断需要连接的子站是否为2级级跳或以下，如果是
               if solution_new(3,solution_new(5,couldConnect(location)))<maxIn  %判断基站连接站点个数是否小于连接上限
                   
           solution_new(1,i)=0;                              %将该基站换成子站
           solution_new(2,i)=couldConnect(location);         %将该站连接到目标子站
           solution_new(3,i)=1;                              %将该站连接站点数设为1
           solution_new(4,i)=solution_new(4,couldConnect(location))+1;%将该站级跳设为上一站点级跳加1
           solution_new(5,i)=solution_new(5,couldConnect(location));  %将该站线路设为上一级站点的基站
           solution_new(3,solution_new(5,i))= solution_new(3,solution_new(5,i))+1;%将基站对应的连接站点数加1
           solution_new(3,couldConnect(location))= solution_new(3,couldConnect(location))+1;
               end
               end
           end
       end
   end
end