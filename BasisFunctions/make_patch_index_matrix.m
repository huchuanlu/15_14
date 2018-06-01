function [patchIndexMatrix, indexRange] = make_patch_index_matrix(imSize, patchNum)
%% function [patchIndexMatrix, indexRange] = make_patch_index_matrix((imSize, patchNum)
%%      ����: ����ֿ�index����
%%      ����:  
%%            imSize   = [imSize(1)   imSize(2)]    ͼ���С
%%            patchNum = [patchNum(1) patchNum(2)]  �ֿ��С
%%      �����
%%            patchIndexMatrix��   �ֿ�index���󣬾����ʽ imSize(1)*imSize(2)��С
%%            indexRange:          index�ķ�Χ,[1:patchNum(1)*patchNum(2)]
%%  Dong Wang@2011-10-31

%%ȷ���ֿ��С  
interval = [ floor(imSize(1)/patchNum(1)),...
             floor(imSize(2)/patchNum(2)) ];      
         
%%�ؼ�����㣺�з���patchNum(1)+1���ؼ��㣬�з���patchNum(2)+1���ؼ���
%%�з���
rPosition = zeros(1,patchNum(1)+1);  
rPosition(1) = 1; 
rPosition(patchNum(1)+1) = imSize(1); 
for num = 2:patchNum(1)
    rPosition(num) = rPosition(1) + (num-1)*interval(1);
end
%%�з���
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

%%���ڲ��Ժ����Ĵ���Σ������ʾ�ֿ��ͼ���
% patchIndexMatrixTemp = patchIndexMatrix./max(max(patchIndexMatrix));
% figure(1),imagesc(patchIndexMatrixTemp);
 