function [patchIndexMatrix, indexRange] = make_patch_index_matrix(imSize, patchNum)
%% function [patchIndexMatrix, indexRange] = make_patch_index_matrix((imSize, patchNum)
%%      功能: 计算分块index矩阵
%%      输入:  
%%            imSize   = [imSize(1)   imSize(2)]    图像大小
%%            patchNum = [patchNum(1) patchNum(2)]  分块大小
%%      输出：
%%            patchIndexMatrix：   分块index矩阵，矩阵格式 imSize(1)*imSize(2)大小
%%            indexRange:          index的范围,[1:patchNum(1)*patchNum(2)]
%%  Dong Wang@2011-10-31

%%确定分块大小  
interval = [ floor(imSize(1)/patchNum(1)),...
             floor(imSize(2)/patchNum(2)) ];      
         
%%关键点计算：行方向patchNum(1)+1个关键点，列方向patchNum(2)+1个关键点
%%行方向
rPosition = zeros(1,patchNum(1)+1);  
rPosition(1) = 1; 
rPosition(patchNum(1)+1) = imSize(1); 
for num = 2:patchNum(1)
    rPosition(num) = rPosition(1) + (num-1)*interval(1);
end
%%列方向
cPosition = zeros(1,patchNum(2)+1);
cPosition(1) = 1; 
cPosition(patchNum(2)+1) = imSize(2); 
for num = 2:patchNum(2)
    cPosition(num) = cPosition(1) + (num-1)*interval(2);
end
   
patchIndexMatrix = zeros(imSize(1), imSize(2));
for ii = 1:patchNum(1)
    for jj = 1:patchNum(2)
        %(1)
        rMin = rPosition(ii);
        if  ii == patchNum(1)
            rMax = rPosition(ii+1);
        else
            rMax = rPosition(ii+1) - 1;
        end
        %(2)
        cMin = cPosition(jj);
        if  jj == patchNum(2)
            cMax = cPosition(jj+1);
        else
            cMax = cPosition(jj+1) - 1;
        end
        %(3)
        patchIndexMatrix(rMin:rMax, cMin:cMax) = (ii-1)*patchNum(2) + jj;
    end
end
indexRange = unique(patchIndexMatrix);

%%用于测试函数的代码段，结果显示分块的图像块
% patchIndexMatrixTemp = patchIndexMatrix./max(max(patchIndexMatrix));
% figure(1),imagesc(patchIndexMatrixTemp);
 