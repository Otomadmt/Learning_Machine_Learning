% Cleaning
clc;
clf;

% Symbol Define
syms x y;

% Generating Sample Set
% nSize = input('Sample size:');
dimension = 2;
nSize = 500; %Testing
sample = 2*rand(nSize,dimension)-1;
sample(:,3)=1;

% Generating Target Line
tarPt = 2*rand(2,2)-1;
tar = [tarPt(2,2)-tarPt(1,2) tarPt(1,1)-tarPt(2,1) tarPt(1,2)*(tarPt(2,1)-tarPt(1,1))-tarPt(1,1)*(tarPt(2,2)-tarPt(1,2))];
tarLn = tar(1)*x+tar(2)*y+tar(3);

% Generating Result(Label) for Sample
result = zeros(nSize,1);
for i = 1:nSize
    if(tar(1)*sample(i,1)+tar(2)*sample(i,2)+tar(3)>0)
        result(i,1)=1;
        scatter(sample(i,1),sample(i,2),'r.')
        hold on;
    else
        result(i,1)=-1;
        scatter(sample(i,1),sample(i,2),'g.')
        hold on;
    end
end

% Drawing Target and Sample
scatter(tarPt(:,1),tarPt(:,2),'kx')
hold on;
ezplot(tarLn);
hold on;

% Training
w = zeros(1,dimension+1);
flag = false;
iteNum = 0;
while flag==false
    iteNum = iteNum+1;
    flag = true;
    for i = 1:nSize
        if((w*sample(i,:)'>0)&&(result(i)==-1))||((w*sample(i,:)'<=0)&&(result(i)==1))
            flag = false;
%             disp(strcat('Error Point:',num2str(i)))
%             disp(w)
            w = w + result(i)*sample(i,:);
            break;
        end 
    end 
end

%Display result
resLn = w(1)*x+w(2)*y+w(3);
axis([-1.2 1.2 -1.2 1.2])
handle = ezplot(resLn);
set(handle,'Color','r')
title('PLA 2-Dimension Demo');
disp(strcat('Iteration time:',num2str(iteNum)))
disp('Target:')
disp(vpa(tarLn,5))
disp('Result:')
disp(vpa(resLn,5))