function distance_matrix=KNNtrain(k,y,label)
%input:   k: k nearest neighbor
%		y: traindata matrix
%		label: traindata label matrix
%usage:	KNNtrain(1,traindata,trainlabels);
z = 1;
count = 0;
[yrow,ycol]=size(y);
distance_matrix = zeros(yrow,yrow);
%compute distance matrix of all the points to each point
for i = 1:1:yrow
    for j = 1:1:yrow
        distance_matrix(i,j)=cosineDistance(y(i,:),y(j,:));
        z=z+1;
    end
end
%get label matrix of all neighbors of each point
label_matrix = zeros(yrow,yrow);
for i = 1:1:yrow
    label_matrix(i,:) = label;
end

%vote for class of point
%assignin('base', 'train_label_matrix', label_matrix);
[after_sorting,indices] = sort(distance_matrix,2);
%assignin('base', 'trainindex', indices);
k_neighbor_labels=indices(:,1:k);
class=zeros(yrow,1);
for i=1:1:yrow
    label = label_matrix(i,:);
    index = k_neighbor_labels(i,:);
    class(i,1)=mode(label(index)); 
end
%compute train error rate
for i=1:yrow
    if class(i,1)~=label(i)
        count=count+1;
    end
end
error = count/yrow*100
end
