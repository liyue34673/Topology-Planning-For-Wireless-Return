function totalPLCost=calPLCost(solution,Dist)
F=900;                                               %∑¢…‰∆µ¬ 900MHz
totalPLCost=0;
n=size(solution,2);
for i=1:n
    if solution(1,i)==0
    totalPLCost=totalPLCost+32.5+20*log10(Dist(i,solution(2,i)))+20*log10(F);
    end
end
 