function Dist=CalDist(location)
n=size(location,1);                                                          %计算站点个数
Dist=zeros(n,n);                                                             %确定目标矩阵维度
for i=1:n                                                                    %求任一一点到其他点的距离
    for j=i+1:n
        alpha1=location(i,2)*pi/180;                                         %角度转为弧度
        alpha2=location(j,2)*pi/180;
        beta1=location(i,1)*pi/180;
        beta2=location(j,1)*pi/180;
        temp=cos(beta1)*cos(beta2)*cos(alpha1-alpha2)+sin(beta1)*sin(beta2); %带入公式运算
        Dist(i,j)=6378*acos(temp);
        Dist(j,i)=Dist(i,j);
    end
end