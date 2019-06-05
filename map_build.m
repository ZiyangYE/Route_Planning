function [map] = map_build(size)
    map = rand(size);
    map = ceil(map * 10);
    for i = 1:size
        for j = i:size
            if i == j
                map(i,j) = 0;
            else
                map(j,i) = map(i,j);
            end
        end
    end
end
%最后一行列为出发点