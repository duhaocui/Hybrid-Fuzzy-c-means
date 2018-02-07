function [pred]= closest_centroid(X,cent)
    K = size(cent,1);
    pred = zeros(size(X,1), 1);
    temp=zeros(size(X,1),size(cent,1));
    for i=1:size(X,1)
        for j=1:K
            v=X(i,:)-cent(j,:);
            v=v*v';
            temp(i,j)=v;
        end
    end
    [id,pred]=min(temp,[],2);

end