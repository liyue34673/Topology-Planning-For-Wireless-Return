function plotResult(solution,location)
%将运算结果可视化
n=size(solution,2);                                  %获取站点个数
for k=1:n                                            %对于任意一个站点来说
    if solution(1,k)==0                              %如果是子站
         x1=location(k,1);                           %获取子站的横坐标
        x2=location(solution(2,k),1);                %获取对应宿主站的横坐标
        y1=location(k,2);                            %获取子站的纵坐标
        y2=location(solution(2,k),2);                %获取对应宿主站的纵坐标
    plot([x1,x2],[y1,y2],'g-');                       %连线
    plot(x1,y1,'b*');                                %绘制子站
    hold on;
    elseif solution(1,k)==1 && solution(2,k)~=-1     %如果是基站且有连接
         x1=location(k,1);                           %获取基站1的横坐标
        x2=location(solution(2,k),1);                %获取基站2的横坐标
        y1=location(k,2);                            %获取基站1的纵坐标
        y2=location(solution(2,k),2);                %获取基站2的纵坐标
    plot([x1,x2],[y1,y2],'y--');                     %基站之间用虚线连接
    plot(x1,y1,'ro');                                %绘制该基站 
    hold on;
    else                                             %如果是基站且无连接
        plot(location(k,1),location(k,2),'ro');      %直接绘制基站图标
        hold on;
    end
end
    