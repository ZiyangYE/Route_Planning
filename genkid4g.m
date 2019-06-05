function kids = genkid4g(ges,com)
    sz=size(ges);
    kids=[];
    while(not(kidchek(kids,com)))
        kids=[kids;ges(ceil(rand(1)*sz(1)),:)];
    end
end