function solution_new=seperatedBase2Sub(solution,Dist,BaseType)
if BaseType==0
    maxIn=6;
else
    maxIn=12;
end
solution_new=solution;
n=size(solution_new,2);                                      %����վ����Ŀ
for i=1:n                                                    %��������һ��վ��
   if solution_new(3,i)==0                                   %���������վ������վ����Ϊ0
       couldConnect=find(Dist(i,:)<=10 & Dist(i,:)>0 &solution_new(1,:)==0);       %��������ӵ��������վ
       if ~isempty(couldConnect)                             %�������
           [minDistance,location]=min(Dist(i,couldConnect)); %�����ֹһ����Ѱ����Щվ�������վ�������վ������
           if solution_new(1,couldConnect(location))==0
           if solution_new(4,couldConnect(location))<3       %�ж���Ҫ���ӵ���վ�Ƿ�Ϊ2�����������£������
               if solution_new(3,solution_new(5,couldConnect(location)))<maxIn  %�жϻ�վ����վ������Ƿ�С����������
                   
           solution_new(1,i)=0;                              %���û�վ������վ
           solution_new(2,i)=couldConnect(location);         %����վ���ӵ�Ŀ����վ
           solution_new(3,i)=1;                              %����վ����վ������Ϊ1
           solution_new(4,i)=solution_new(4,couldConnect(location))+1;%����վ������Ϊ��һվ�㼶����1
           solution_new(5,i)=solution_new(5,couldConnect(location));  %����վ��·��Ϊ��һ��վ��Ļ�վ
           solution_new(3,solution_new(5,i))= solution_new(3,solution_new(5,i))+1;%����վ��Ӧ������վ������1
           solution_new(3,couldConnect(location))= solution_new(3,couldConnect(location))+1;
               end
               end
           end
       end
   end
end