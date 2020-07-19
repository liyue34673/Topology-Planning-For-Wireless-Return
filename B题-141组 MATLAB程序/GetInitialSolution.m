function solution=GetInitialSolution(location,BaseType,Dist)
%��һ�����ӳ�ʼ��
%BaseType 0    Rural
%BaseType 1    ����վ
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
        solution(1,PossibleSub)=0;                  %ȷ����վվ������
        solution(2,PossibleSub)=k;                  %ȷ����վվ������λ��
%       solution(3,PossibleSub)=numPossibleSub;     %��վ��¼�Լ���վ���ӵ�վ�����
        solution(3,k)=numPossibleSub;               %ȷ����վվ�����Ӹ���
        solution(3,PossibleSub)=1;                  %ȷ����վվ�����Ӹ���
        solution(4,PossibleSub)=1;                  %ȷ����վվ�㼶���ȼ�
        solution(5,PossibleSub)=k;   %վ������·��
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
    
    
    
    
    