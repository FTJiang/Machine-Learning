function distance_matrix=KNNTest(k,x,y,label,testlabels)
%input:   k: k nearest neighbor
%		x: testdata
%		y: traindata
%		label: trainlabels
%		testlabels: label matrix of test data
%usage: 
%	KNNTest(1,testdata,traindata,trainlabels,testlabels);
z = 1;
count = 0;
[xrow,xcol]=size(x);
[yrow,ycol]=size(y);
distance_matrix = zeros(xrow,yrow);
%get distance matrix of each point with all points
for i = 1:1:xrow
    for j = 1:1:yrow
        distance_matrix(i,j)=cosineDistance(x(i,:),y(j,:));
        z=z+1;
    end
end
label_matrix = zeros(xrow,yrow);
%get label matrix of all points for each point
for i = 1:1:xrow
    label_matrix(i,:) = label;
end
%vote of nearest k neighbors
%assignin('base', 'label_matrix', label_matrix);
[after_sorting,indices] = sort(distance_matrix,2);
%assignin('base', 'index', indices);
k_neighbor_labels=indices(:,1:k);
class=zeros(xrow,1);
for i=1:1:xrow
    label = label_matrix(i,:);
    index = k_neighbor_labels(i,:);
    class(i,1)=mode(label(index)); 
end
%compute test error rate
for i=1:xrow
    if class(i,1)~=testlabels(i)
        count=count+1;
    end
end
error = count/xrow*100
end
