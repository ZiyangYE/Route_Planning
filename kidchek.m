function av = kidchek(kid,com)
    lens=size(kid);
    if lens(1)==1
        av1=kid-com;
    else
        av1=(sum(kid)-com);
    end
    av=all(av1(:)>=0);
end