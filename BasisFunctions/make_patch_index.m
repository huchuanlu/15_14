function [patchIndex] = make_patch_index(patchIndexMatrix, indexRange)
%% function [patchIndex] = make_patch_index(patchIndexMatrix)
%%      ���ܣ� 
%%              ����ֿ�index
%%      ���룺 
%%              patchIndexMatrix��   �ֿ�index���󣬾����ʽ imSize(1)*imSize(2)��С
%%              indexRange:          index�ķ�Χ,[1:patchNum(1)*patchNum(2)]
%%      �����
%%              patchIndex�� Cell��ʽ
%% Dong Wang@2011-10-31

patchIndex = cell(1,length(indexRange));
patchIndexVector = patchIndexMatrix(:);

for num = 1:length(indexRange)
    index = find(patchIndexVector==indexRange(num));
    patchIndex{num} = index;
end
