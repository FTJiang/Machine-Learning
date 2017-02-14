function error=error_compute()
load KNN.mat;
z = 0;
testdata = testdata;
traindata = traindata;
trainlabels = trainlabels;
count = 0;
errortest=zeros(1,11);
errortrain=zeros(1,11);
x =  [1 10 20 30 40 50 60 70 80 90 100];
for i = x
    resultTest = knnclassify(testdata,traindata,trainlabels,i,'cosine','nearest');
    for j=1:1:120
    if resultTest(j)~=testlabels(j)
        count = count + 1;
    end
    end
z=z+1;
errortest(z)=count/120*100;
count = 0;
end
z=0;
count = 0;
% for i = x
%     resultTrain(i) = knnclassify(traindata,traindata,1,'cosine','nearest');
%     for j=1:1:280
%     if resultTrain(j)~=trainlabels(j)
%         count = count + 1;
%     end
%     end
% z=z+1;
% errortrain(z)=count/120*100;
% end
% plot(x,errortrain,'-o')
% hold on
plot(x,errortest,'-+')
title('question #6','FontSize',16)
xlabel('k','FontSize',14)
ylabel('error percent %','FontSize',14)
legend('test error','train error','classify test error','Location','best')
hold off
