function st = Dijkstra2(D)
    st=[];
    for st1 = 1:length(D)
        st=[st Dijkstra(st1,D)'];
    end
end