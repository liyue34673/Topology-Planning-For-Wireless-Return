 function totalBSCost=calBuildStationCost(solution)
BaseStation=find(solution(1,:)==1);
SubStation=find(solution(1,:)==0);
numBaseStation=size(BaseStation,2);
numSubStation=size(SubStation,2);
numSatellite=ceil(numBaseStation/8);

totalBSCost=numBaseStation*10+numSubStation*5+numSatellite*50;