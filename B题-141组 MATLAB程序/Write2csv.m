function Write2csv(solution)
%将solution矩阵按指定格式写入csv文件中
n=size(solution,2);
Graph=zeros(n,n);
BaseStop= solution(1,:)==1;
for i=1:n
    if solution(2,i)~=-1 && solution(1,i)==0
        Graph(i,solution(2,i))=1;
        Graph(solution(2,i),i)=1;
    end
    if solution(2,i)~=-1 && solution(1,i)==1
        Graph(i,solution(2,i))=2;
        Graph(solution(2,i),i)=2;
    end
end
strRow=1:n;
strCol=strRow';
stopType=[strCol,zeros(n,1)];
stopType(BaseStop,2)=1;
csvwrite('Posi.csv',stopType);
strCol=[0;strCol];
Graphcsv=[strRow;Graph];
Graphcsv=[strCol,Graphcsv];
csvwrite('Graph.csv',Graphcsv);


