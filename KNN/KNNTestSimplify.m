function distance_matrix=KNNTestSimplify(indices,label_matrix,testlabels)
%input: indices:index matrix of neighbors after sorting
%       label_matrix: label of neighbors of training data for each point 
%       testlabels: labels of test data for error rate computing
xrow = 120;
k = [1 10 20 30 40 50 60 70 80 90 100];
%k = 1:2:100;
j = 1;
z = 1;
error=zeros(1,10);
for i = k
    %get nearest k neighbors' label matrix
    k_neighbor_labels=indices(:,1:i);
    class=zeros(xrow,1); %restore result of classification
    count = 0;
    %vote for class
    for j=1:1:xrow
        label = label_matrix(j,:);
        index = k_neighbor_labels(j,:);
        class(j,1)=mode(label(index)); 
    end
    %get number of error classification
    for j=1:xrow
        if class(j,1)~=testlabels(j)
            count=count+1;
        end
    end
    %compute error rate
    error(z) = count*100/xrow;
    z=z+1;
end
plot(k,error,'-*')
title('question #6','FontSize',16)
xlabel('k','FontSize',14)
ylabel('error percent %','FontSize',14)
legend('train error','test error','Location','best')
hold off
end
