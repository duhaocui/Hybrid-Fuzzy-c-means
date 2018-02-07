function [val] = inc(x,c,pred)
    val=0;
    for i = 1:(size(c,1))
        comp=(pred==i);
        pos=find(comp);
        for j= 1:(size(pos,1))
            val=val+sum((c(i,:)-x(j,:)).^2);
        end
    end
end