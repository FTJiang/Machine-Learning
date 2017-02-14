function distance_matrix=KNNTrainSimplify(train_indices,train_label_matrix,trainlabels)
%input: train_indices:index matrix of neighbors after sorting
%       train_label_matrix: label of neighbors of training data for each point 
%       trainlabels: labels of training data for error rate computing
xrow = 280;
k = [1 10 20 30 40 50 60 70 80 90 100];
%k = 1:2:100;
z = 1;
error=zeros(1,11);
for i = k
    %get nearest k neighbors' label matrix
    k_neighbor_labels=train_indices(:,1:i);
    class=zeros(xrow,1);  %restore result of classification
    count = 0;
    %vote for class
    for j=1:1:xrow
        label = train_label_matrix(j,:);
        index = k_neighbor_labels(j,:);
        class(j,1)=mode(label(index)); 
    end
    %get number of error classification
    for j=1:xrow
        if class(j,1)~=trainlabels(j)
            count=count+1;
        end
    end
    %compute error rate
    error(z) = count*100/xrow;
    z=z+1;
end
plot(k,error,'-o')
hold on
end
