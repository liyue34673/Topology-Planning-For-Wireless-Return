function solution_new=subReconnect(solution,Dist,BaseType)
if BaseType==0
    maxIn=6;
else
    maxIn=12;
end
solution_new=solution;
n=size(solution_new,2);                                                        %计算站的个数
for k=1:n                                                                      %对于任意一个站
    if solution_new(1,k)==0                                                     %如果是子站
        if solution_new(3,k)<2                                                  %并且该子站只有一级连接
            PossibleConnectStation=find(Dist(k,:)>0 & Dist(k,:)<=10 );       %搜索周围有没有可以连接的子站
            oldConnectStation_location= PossibleConnectStation==solution_new(2,k);%在可以连接的子站中删除现在连接的站
            PossibleConnectStation(oldConnectStation_location)=[];
            if ~isempty(PossibleConnectStation)                               %如果还存在其他可以连接的子站
                num=size(PossibleConnectStation,2);                           %从中随机选出1个
                num=ceil(rand*num);
                if solution_new(1,PossibleConnectStation(num))==0
                    if solution_new(3,solution_new(5,PossibleConnectStation(num)))<maxIn             %如果该站点对应的基站没有连接满
                        if solution_new(4,PossibleConnectStation(num))<3             %如果该站点对应的级跳小于3，则可以连接
                            if solution_new(3,PossibleConnectStation(num))<2         %如果该站点位于末端
                                if solution_new(1,PossibleConnectStation(num))==0
                                    DistConnect2Base=Dist(PossibleConnectStation(num),solution(5,PossibleConnectStation(num)));
                                    DistCurrent2Base=Dist(k,solution(5,PossibleConnectStation(num)));
                                    if DistCurrent2Base>DistConnect2Base
                                    solution_new(2,k)=PossibleConnectStation(num);               %将该站点连接到目标子站
                                    solution_new(3,k)=1;                                         %将该站点连接个数设为1
                                    solution_new(4,k)=solution(4,PossibleConnectStation(num))+1; %将该站点级跳设为上一等级级跳+1
                                    solution_new(5,k)=solution(5,PossibleConnectStation(num));   %将该站点基站设为目标子站的基站
                                    solution_new(3,PossibleConnectStation(num))=solution_new(3,PossibleConnectStation(num))+1;%将该站点连接的目标子站的连接站点数加1
                                    t=solution_new(5,k);
                                    solution_new(1,PossibleConnectStation(num));
                                    temp=solution_new(3,t);%=solution_new(3,solution_new(5,k))+1;%将该站点对应的基站连接站点数加1
                                     solution_new(3,t)=temp+1;
                                    else
                                        
                                        
                                    end
                                    
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end

             
             
             