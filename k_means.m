function [cent, pred]=k_means(k,X,MaxIt)
    [nPop,N]=size(X);
    rand_pos=randi(nPop,1,k);
    cent=zeros(k,N);
    for i = 1:k
        cent(i,:)=X(rand_pos(i),:);
    end
    pred=zeros(nPop,1);
    for i=1:MaxIt
        %{
        plot(cent(:,1),cent(:,2),'rx','MarkerSize',10,'LineWidth',2);
        fprintf('Press enter to continue.\n');
        pause;
        %}
        pred=closest_centroid(X,cent);
        cent=next_centroid(X,pred,k);
    end
    pred=pred';
end