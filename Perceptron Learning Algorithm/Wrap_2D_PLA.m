function[iteNum,tar,w]=Wrap_2D_PLA(nSize,learningRate)

    % Cleaning
    if(nSize>10000)
        error('Sample size too large.')
    end
    if(learningRate<=0)||(learningRate>1)
        error('learningRate not correct.')
    end

    % Symbol Define

    % Generating Sample Set
    dimension = 2;
    sample = 2*rand(nSize,dimension)-1;
    sample(:,dimension+1)=1;

    % Generating Target Line
    tarPt = 2*rand(2,2)-1;
    tar = [tarPt(2,2)-tarPt(1,2) tarPt(1,1)-tarPt(2,1) tarPt(1,2)*(tarPt(2,1)-tarPt(1,1))-tarPt(1,1)*(tarPt(2,2)-tarPt(1,2))];

    % Generating Result(Label) for Sample
    result = zeros(nSize,1);
    for i = 1:nSize
        if(tar(1)*sample(i,1)+tar(2)*sample(i,2)+tar(3)>0)
            result(i,1)=1;
        else
            result(i,1)=-1;
        end
    end

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
                w = w + learningRate*result(i)*sample(i,:);
                break;
            end 
        end 
    end