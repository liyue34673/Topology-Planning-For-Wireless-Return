function solution_new=subReconnect(solution,Dist,BaseType)
if BaseType==0
    maxIn=6;
else
    maxIn=12;
end
solution_new=solution;
n=size(solution_new,2);                                                        %����վ�ĸ���
for k=1:n                                                                      %��������һ��վ
    if solution_new(1,k)==0                                                     %�������վ
        if solution_new(3,k)<2                                                  %���Ҹ���վֻ��һ������
            PossibleConnectStation=find(Dist(k,:)>0 & Dist(k,:)<=10 );       %������Χ��û�п������ӵ���վ
            oldConnectStation_location= PossibleConnectStation==solution_new(2,k);%�ڿ������ӵ���վ��ɾ���������ӵ�վ
            PossibleConnectStation(oldConnectStation_location)=[];
            if ~isempty(PossibleConnectStation)                               %��������������������ӵ���վ
                num=size(PossibleConnectStation,2);                           %�������ѡ��1��
                num=ceil(rand*num);
                if solution_new(1,PossibleConnectStation(num))==0
                    if solution_new(3,solution_new(5,PossibleConnectStation(num)))<maxIn             %�����վ���Ӧ�Ļ�վû��������
                        if solution_new(4,PossibleConnectStation(num))<3             %�����վ���Ӧ�ļ���С��3�����������
                            if solution_new(3,PossibleConnectStation(num))<2         %�����վ��λ��ĩ��
                                if solution_new(1,PossibleConnectStation(num))==0
                                    DistConnect2Base=Dist(PossibleConnectStation(num),solution(5,PossibleConnectStation(num)));
                                    DistCurrent2Base=Dist(k,solution(5,PossibleConnectStation(num)));
                                    if DistCurrent2Base>DistConnect2Base
                                    solution_new(2,k)=PossibleConnectStation(num);               %����վ�����ӵ�Ŀ����վ
                                    solution_new(3,k)=1;                                         %����վ�����Ӹ�����Ϊ1
                                    solution_new(4,k)=solution(4,PossibleConnectStation(num))+1; %����վ�㼶����Ϊ��һ�ȼ�����+1
                                    solution_new(5,k)=solution(5,PossibleConnectStation(num));   %����վ���վ��ΪĿ����վ�Ļ�վ
                                    solution_new(3,PossibleConnectStation(num))=solution_new(3,PossibleConnectStation(num))+1;%����վ�����ӵ�Ŀ����վ������վ������1
                                    t=solution_new(5,k);
                                    solution_new(1,PossibleConnectStation(num));
                                    temp=solution_new(3,t);%=solution_new(3,solution_new(5,k))+1;%����վ���Ӧ�Ļ�վ����վ������1
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

             
             
             