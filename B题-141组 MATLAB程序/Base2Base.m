function solution_new=Base2Base(solution,Dist)
solution_new=solution;
Base=find(solution_new(1,:)==1);
n=size(solution,2);
for i=1:n
    if solution_new(1,i)==1
        couldConnect= Dist(i,Base)<=50 & Dist(i,Base)>0;
        solution_new(2,Base(couldConnect))=i;
    end 
end