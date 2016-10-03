function[]=errorNum_Stat(testNum,pntNum,nSize,learningRate)

    sprintf('Settings for this run:\nTest time:%d\nTest Points per time:%d\nSample size:%d\nLearning Rate:%f\n',testNum,pntNum,nSize,learningRate)
    errorNum = 0;
    for i=1:testNum
        [~,target,result] = Wrap_2D_PLA(nSize,learningRate);
        pntSet = 2*rand(pntNum,2)-1;
        pntSet(:,3) = 1;
        for j=1:pntNum
            if(target*pntSet(j,:)'*result*pntSet(j,:)'<0)
                errorNum = errorNum+1;
            end
        end
    end
    sprintf('Result:\nTotal Test:%d\nError rate:%f',pntNum*testNum,errorNum/pntNum/testNum)
