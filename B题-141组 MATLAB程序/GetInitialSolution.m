function solution=GetInitialSolution(location,BaseType,Dist)
%求一级连接初始解
%BaseType 0    Rural
%BaseType 1    蝴蝶站
if BaseType==0
    maxOneGradeIn=4;
    maxIn=6;
else
    maxOneGradeIn=8;
    maxIn=12;
end
n=size(location,1); 
solution=zeros(5,n)-1;
for k=1:n
if solution(1,k)==-1
    solution(1,k)=1;
    PossibleSub= find(Dist(k,:)<=20 &Dist(k,:)>0 &solution(1,:)==-1);
    numPossibleSub=size(PossibleSub,2);
    if numPossibleSub<=maxOneGradeIn
        solution(1,PossibleSub)=0;                  %确定子站站点类型
        solution(2,PossibleSub)=k;                  %确定子站站点连接位置
%       solution(3,PossibleSub)=numPossibleSub;     %子站记录自己基站连接的站点个数
        solution(3,k)=numPossibleSub;               %确定基站站点连接个数
        solution(3,PossibleSub)=1;                  %确定子站站点连接个数
        solution(4,PossibleSub)=1;                  %确定子站站点级跳等级
        solution(5,PossibleSub)=k;   %站点所在路线
%        totalDistance=sum(Dist(k,PossibleSub))+totalDistance;
    else
         solution(1,PossibleSub(1:maxOneGradeIn))=0;
         solution(2,PossibleSub(1:maxOneGradeIn))=k;
%        solution(3,PossibleSub(1:maxOneGradeIn))=maxOneGradeIn;
         solution(3,k)=maxOneGradeIn;
         solution(3,PossibleSub)=1;
         solution(4,PossibleSub(1:maxOneGradeIn))=1;
         solution(5,PossibleSub(1:maxOneGradeIn))=k;
%         totalDistance=sum(Dist(k,PossibleSub(1:4)))+totalDistance;
    end
end
end
    
    
    
    
    