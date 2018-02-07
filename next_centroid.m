function [cent]=next_centroid(X,pred,K)
    [m n] = size(X);
    cent = zeros(K, n);
    for i=1:K
        v=(pred==i);
        v=find(v);
        tot=zeros(1,n);
        for j=1:size(v,1)
            tot=tot+X(v(j),:);
        end
        cent(i,:)=(1/size(v,1)).*tot;
    end
end