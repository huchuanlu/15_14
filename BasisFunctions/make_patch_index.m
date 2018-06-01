function [patchIndex] = make_patch_index(patchIndexMatrix, indexRange)
%% function [patchIndex] = make_patch_index(patchIndexMatrix)
%%      功能： 
%%              计算分块index
%%      输入： 
%%              patchIndexMatrix：   分块index矩阵，矩阵格式 imSize(1)*imSize(2)大小
%%              indexRange:          index的范围,[1:patchNum(1)*patchNum(2)]
%%      输出：
%%              patchIndex： Cell格式
%% Dong Wang@2011-10-31

patchIndex = cell(1,length(indexRange));
patchIndexVector = patchIndexMatrix(:);

for num = 1:length(indexRange)
    index = find(patchIndexVector==indexRange(num));
    patchIndex{num} = index;
end
