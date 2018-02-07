function tot = f_measure(Y,tot_clus,pred)
    n=size(Y,1);
    ori_size=zeros(1,tot_clus);
    pred_size=zeros(1,tot_clus);
    N=zeros(tot_clus,tot_clus);
    P=zeros(tot_clus,tot_clus);
    R=zeros(tot_clus,tot_clus);
    F=zeros(tot_clus,tot_clus);
    for i=1:tot_clus
        p=(Y==i);
        pos=find(p);
        ori_size(i)=size(pos,1);
        p=(pred==i);
        pos=find(p);
        pred_size(i)=size(pos,1);
    end
    for i=1:size(Y,1)
        N(Y(i),pred(i))=N(Y(i),pred(i))+1;
    end
    for i= 1:tot_clus
        for j= 1:tot_clus
            P(i,j)=N(i,j)/pred_size(j);
            R(i,j)=N(i,j)/ori_size(i);
            F(i,j)=(2*P(i,j)*R(i,j))/(P(i,j)+R(i,j));
        end
    end
    tot=0;
    for i=1:tot_clus
        tot=tot+((ori_size(i)/n)*max(F(i,:)));
    end
end