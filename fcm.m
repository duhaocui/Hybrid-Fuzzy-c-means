%Fuzzy type 1 C-means algorithm
%Inputs:
%******c: Number of clusters
%******X: Data Matrix N_samples*N_features
%******U_up: U updating function 
%******fz: Fuzzifier as a real number
%******euclidean: Distance metric as a function (by default Euclidean)
%******Max: Maximum number of iterations
%******tol: Tolerance  
%***********************************************
%Outputs: 
%******prediction: Predicted labels of data
%******v: Center  of clusters as a matrix c*N_features
%***********************************************
function [prediction v] = fcm(c, X, Max, tol)
    fz=2;
    [n, no] = size(X);
    %v = repmat(max(X), c, 1).*rand([c, no]);
    v=zeros(c,no);
    U = rand([c, n]);

    for j = 1:n
          U(:, j) = U(:, j)./sum(U(:, j));      
    end  

    for i = 1:c
          v(i, :) = sum((X(:, :).*repmat(U(i, :)'.^fz, 1, no)),1)./sum(U(i, :).^fz);
    end
    k = 0;
    plot_cost = size(Max,1);
    plot_it = [1:Max];
    plot_count=1;
    while  (k<Max )
        for i = 1:c
            for j = 1:n
                nume = euclidean(v(i,:),X(j,:));
                tot=0;
                flag=0;
                for p = 1:c
                    temp=euclidean(v(p,:),X(j,:));
                    if(temp==0)
                        flag=1;
                        if p==i
                            U(i,j)=1;
                        else
                            U(i,j)=0;
                        end
                        break;
                    else
                        tot=tot+((nume/temp)^(2/(fz-1)));
                    end
                end
                if flag==0
                    U(i,j)=1/tot;
                end
            end
        end
        for i = 1:c
           v(i, :) = sum((X(:, :).*repmat(U(i, :)'.^fz, 1, no)), 1)./sum(U(i, :).^fz);  
        end
        J=0;
        for i = 1:c
            for j = 1:n
                J=J+((U(i,j)^fz)*(euclidean(v(i,:),X(j,:))^2));
            end
        end
        plot_cost(plot_count)=J;
        plot_count=plot_count+1;
        k = k+1;
    end
    prediction = zeros([1, n]);
    for i = 1:n
       [M, prediction(i)]=max(U(:, i));
    end
    %figure;
    %plot(plot_it,plot_cost,'-b','LineWidth',0.5);
end