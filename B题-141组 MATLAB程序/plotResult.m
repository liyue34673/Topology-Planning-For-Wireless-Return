function plotResult(solution,location)
%�����������ӻ�
n=size(solution,2);                                  %��ȡվ�����
for k=1:n                                            %��������һ��վ����˵
    if solution(1,k)==0                              %�������վ
         x1=location(k,1);                           %��ȡ��վ�ĺ�����
        x2=location(solution(2,k),1);                %��ȡ��Ӧ����վ�ĺ�����
        y1=location(k,2);                            %��ȡ��վ��������
        y2=location(solution(2,k),2);                %��ȡ��Ӧ����վ��������
    plot([x1,x2],[y1,y2],'g-');                       %����
    plot(x1,y1,'b*');                                %������վ
    hold on;
    elseif solution(1,k)==1 && solution(2,k)~=-1     %����ǻ�վ��������
         x1=location(k,1);                           %��ȡ��վ1�ĺ�����
        x2=location(solution(2,k),1);                %��ȡ��վ2�ĺ�����
        y1=location(k,2);                            %��ȡ��վ1��������
        y2=location(solution(2,k),2);                %��ȡ��վ2��������
    plot([x1,x2],[y1,y2],'y--');                     %��վ֮������������
    plot(x1,y1,'ro');                                %���Ƹû�վ 
    hold on;
    else                                             %����ǻ�վ��������
        plot(location(k,1),location(k,2),'ro');      %ֱ�ӻ��ƻ�վͼ��
        hold on;
    end
end
    