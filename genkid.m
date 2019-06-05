function kids = genkid(com,cap)
    kids=[];
    while(not(kidchek(kids,com)))
        ct=cap;
        newkid=zeros(1,length(com));
        while(ct>0)
            inde=floor(unifrnd(1,length(com)+0.9999999999999));
            spltp=floor(unifrnd(1,ct+0.9999999999999));
            newkid(inde)=newkid(inde)+spltp;
            ct=ct-spltp;
        end
        kids=[kids;newkid];
    end
end