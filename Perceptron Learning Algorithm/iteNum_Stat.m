function[]=iteNum_Stat(testNum,nSize,learningRate)

    sprintf('Settings for this run:\nTest time:%d\nSample size:%d\nLearning Rate:%f\n',testNum,nSize,learningRate)
    totalIte = 0;
    for i=1:testNum
        [iteNum,~,~] = Wrap_2D_PLA(nSize,learningRate);
        totalIte = totalIte + iteNum;
    end
    sprintf('Result:\nTotal Iteration Time:%d\nAverage:%f',totalIte,totalIte/testNum)
