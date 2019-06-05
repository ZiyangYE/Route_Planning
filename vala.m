function va = vala(lib,kids)
    vact=0;
    for kid = kids'
        kid1=kid';
        kid1(find(kid1==0))=[];
        vact=vact+minrd_search(lib,kid1);
    end
    va=vact;
end