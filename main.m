%这四个参数分别是地图有多少点，单车容量，各点需求量以及种群大小
map_size=9;%if this equals 10 or larger, the result will be unpredictable
capi=5;%if the cap is bigger than 5, it will run extremely slow
com=[1 2 3 4 5 6 7 8 9];
kids_size=1000;%larger, acts better, runs slower


%生成地图，具体map的值在右边工作区自取
map = map_build(map_size+1);
map = Dijkstra2(map);%这个才是真的map,上面那个是假的.



lib = minrd_build(map,capi);
refdst=0;
for i = 1:100
    refdst=[refdst vala(lib,genkid(com,capi))];
end
refdst=sort(refdst);
gens=containers.Map;
for i = 1:kids_size
    kids=genkid(com,capi);
    while vala(lib,kids)>refdst(10)
        kids=genkid(com,capi);
    end
    gens(num2str(i))=kids;
end
gen=gen_next(gens,com,lib);
gen=gen_next(gen,com,lib);
gen=gen_next(gen,com,lib);
gen=gen_next(gen,com,lib);
mindst=10000;
for i=1:kids_size
    v=vala(lib,gen(int2str(i)));
    if v<mindst
        mindst=v;
    end
end
for i=1:kids_size
    v=vala(lib,gen(int2str(i)));
    if v==mindst
        op1mat=gen(int2str(i));
    end
end
op1s=sum(op1mat);
[hs,~]=size(op1mat);
for i=1:map_size
    while op1s(i)>com(i)
        for j=1:hs
            if op1mat(j,i)>0
                op1mat(j,i)=op1mat(j,i)-1;
                break
            end
        end
        op1s=sum(op1mat);
    end
end
op1mat(all(op1mat ==0,2),:)=[];   
[hs,ls]=size(op1mat);
disp("在各点卸货量");
disp(op1mat);
disp("各车路径");
rds01=[];
for i=1:hs
    rd=[];
    for j=1:ls
        if op1mat(i,j)>0
            rd=[rd j];
        end
    end
    disp(lib(num2str(rd*1000000)));
end
disp("总路径长度");
disp(vala(lib,op1mat));