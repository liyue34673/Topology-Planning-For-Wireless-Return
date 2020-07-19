function Dist=CalDist(location)
n=size(location,1);                                                          %����վ�����
Dist=zeros(n,n);                                                             %ȷ��Ŀ�����ά��
for i=1:n                                                                    %����һһ�㵽������ľ���
    for j=i+1:n
        alpha1=location(i,2)*pi/180;                                         %�Ƕ�תΪ����
        alpha2=location(j,2)*pi/180;
        beta1=location(i,1)*pi/180;
        beta2=location(j,1)*pi/180;
        temp=cos(beta1)*cos(beta2)*cos(alpha1-alpha2)+sin(beta1)*sin(beta2); %���빫ʽ����
        Dist(i,j)=6378*acos(temp);
        Dist(j,i)=Dist(i,j);
    end
end