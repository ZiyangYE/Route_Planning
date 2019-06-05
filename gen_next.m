function gens = gen_next(parents,com,lib)
    ct=parents.Count;
    genlib=[];
    for ge = 1:ct
        genlib=[genlib;parents(int2str(ge))];
    end
    refdst=0;
    for i = 1:1000
        refdst=[refdst vala(lib,genkid4g(genlib,com))];
    end
    refdst=sort(refdst);
    gens=containers.Map;
    for i = 1:ct
        newk=genkid4g(genlib,com);
        while vala(lib,newk)>refdst(50)
            newk=genkid4g(genlib,com);
        end
        gens(int2str(i))=newk;
    end
end