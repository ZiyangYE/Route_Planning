function lib = minrd_build(map,capicity)
% how to index a lib.
%     For exp, if the cap of a car is 4,
%         max point of map is 4
%         the car goes through 1 . 1 . 3 . 4
%         than the index is 134
%     the points should be less than 9
    stmap=Dijkstra2(map);
    lib = containers.Map;
    maxl = length(map);
    for i = 1:10^capicity
        pointlst = [];
        tempi=i;
        sptemp=1;
        while tempi*sptemp>0
            pointlst=[pointlst rem(tempi,10)];
            if or(rem(tempi,10)>length(map)-1,rem(tempi,10)==0)
                sptemp=0;
            end
            tempi=floor(tempi/10);
        end
        pointlst = unique(sort(pointlst));
        pointst=num2str(pointlst);
        if and(not(lib.isKey(pointst)),sptemp == 1)
            sdlw=num2str(pointlst*1000000);
            sdlwll=[];
            mmap1=[];
            mmap=[];
            for das = 1:length(pointlst)
                mmap1=[mmap1 (stmap(pointlst(das),:))'];
            end
            mmap1=[mmap1 stmap(maxl,:)'];
            for das = 1:length(pointlst)
                mmap=[mmap (mmap1(pointlst(das),:))'];
            end
            mmap=[mmap mmap1(maxl,:)'];
            mindst=10000;
            dwdsdwdwaf = perms(1:length(pointlst));
            [dwa1,~] = size(dwdsdwdwaf);
            for lsrt = 1:dwa1
                rt=dwdsdwdwaf(lsrt,:);
                dst=mmap1(length(pointlst)+1,rt(1));
                sdlwl=[0 rt(1)];
                for rt1=1:length(pointlst)-1
                    dst=dst+mmap1(rt(rt1),rt(rt1+1));
                    sdlwl=[sdlwl rt(rt1+1)];
                end
                dst=dst+mmap(rt(length(pointlst)),length(pointlst)+1);
                sdlwl=[sdlwl 0];
                if dst<mindst
                    mindst=dst;
                    sdlwll=sdlwl;
                end
            end
            for dwad=2:length(sdlwll)-1
                sdlwll(dwad)=pointlst(sdlwll(dwad));
            end
            lib(pointst)=mindst;
            lib(sdlw)=sdlwll;
        end
    end
end
    