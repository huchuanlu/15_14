function main_AR32x32_lbp_Coding

% % %(0)
% % load('./Data/AR_32x32/AR_dataset_unoccluded_32_32.mat');
% % dataV = dataMatrix;
% % dataNum = size(dataMatrix,2);
% % dataMatrix = [];
% % for num = 1:dataNum
% %     dataM = double(reshape(dataV(:,num), [32 32]));
% %     [V] = LBP_Coding(dataM,0);
% %     dataMatrix = [dataMatrix, V];
% % end 
% % save('./MAP/AR_32x32/AR_dataset_unoccluded_32_32_LBPCoding.mat',...
% %      'dataMatrix', 'sampleLabels');
% % 
% % %(1)
% % load('./Data/AR_32x32/AR_dataset_sunglass_32_32.mat');
% % dataV = sunglass_dataMatrix;
% % dataNum = size(sunglass_dataMatrix,2);
% % sunglass_dataMatrix = [];
% % for num = 1:dataNum
% %     dataM = double(reshape(dataV(:,num), [32 32]));
% %     [V] = LBP_Coding(dataM,0);
% %     sunglass_dataMatrix = [sunglass_dataMatrix, V];
% % end 
% % save('./MAP/AR_32x32/AR_dataset_sunglass_32_32_LBPCoding.mat',...
% %      'sunglass_dataMatrix', 'sunglass_sampleLabels');
% %  
% % %(2)
% % load('./Data/AR_32x32/AR_dataset_scarf_32_32.mat');
% % dataV = scarf_dataMatrix;
% % dataNum = size(scarf_dataMatrix,2);
% % scarf_dataMatrix = [];
% % for num = 1:dataNum
% %     dataM = double(reshape(dataV(:,num), [32 32]));
% %     [V] = LBP_Coding(dataM,0);
% %     scarf_dataMatrix = [scarf_dataMatrix, V];
% % end 
% % save('./MAP/AR_32x32/AR_dataset_scarf_32_32_LBPCoding.mat',...
% %      'scarf_dataMatrix', 'scarf_sampleLabels');
 
% % %(3)
% % load('./Data/AR_32x32/AR_dataset_unoccluded_train_32_32.mat');
% % dataV = Tr_dataMatrix;
% % dataNum = size(Tr_dataMatrix,2);
% % Tr_dataMatrix = [];
% % for num = 1:dataNum
% %     dataM = double(reshape(dataV(:,num), [32 32]));
% %     [V] = LBP_Coding(dataM,0);
% %     Tr_dataMatrix = [Tr_dataMatrix, V];
% % end 
% % save('./MAP/AR_32x32/AR_dataset_unoccluded_train_32_32_LBPCoding.mat',...
% %      'Tr_dataMatrix', 'Tr_sampleLabels');
% %  
% % %(4)
% % load('./Data/AR_32x32/AR_dataset_unoccluded_test_32_32.mat');
% % dataV = Tt_dataMatrix;
% % dataNum = size(Tt_dataMatrix,2);
% % Tt_dataMatrix = [];
% % for num = 1:dataNum
% %     dataM = double(reshape(dataV(:,num), [32 32]));
% %     [V] = LBP_Coding(dataM,0);
% %     Tt_dataMatrix = [Tt_dataMatrix, V];
% % end 
% % save('./MAP/AR_32x32/AR_dataset_unoccluded_test_32_32_LBPCoding.mat',...
% %      'Tt_dataMatrix', 'Tt_sampleLabels');