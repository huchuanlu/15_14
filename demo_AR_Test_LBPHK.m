clear all;
clc;
%%Load Data:
load('./ARDatabase/AR_dataset_unoccluded_32_32_LBPCoding.mat');           %%AR Unoccluded
load('./ARDatabase/AR_dataset_scarf_32_32_LBPCoding.mat');                %%AR Scarf
load('./ARDatabase/AR_dataset_sunglass_32_32_LBPCoding.mat');             %%AR Sunglass
addpath(genpath('./BasisFunctions/'));
%
%%(0)Parameter Setting:
flag      = 1;
lambda    = 0.005;
patchNum  = [ 1 1 ];    %%merely choose [1 1]
options.flag       = flag;
options.lambda     = lambda;
options.KernelType = 'Hamming';
options.algorithm  = 'r_residuals';
imSize   = [32 32];
[patchIndexMatrix, indexRange] = make_patch_index_matrix(imSize, patchNum);
[patchIndex] = make_patch_index(patchIndexMatrix, indexRange);
options.patchIndex = patchIndex;
trainNum  = [2, 4, 6, 8, 10, 12];
labelPath = '.\ARDatabase\';
%
%%(1)Unoccluded:
recRate = zeros(1, length(trainNum));
for num = 1:length(trainNum)
    load([labelPath num2str(trainNum(num)) 'Train.mat']);
    trainData  = double(dataMatrix(:, trainIdx));
    testData   = double(dataMatrix(:, testIdx));
    trainLabel = sampleLabels(:, trainIdx);
    testLabel  = sampleLabels(:, testIdx);
    recRate(num) = CR_RLS_Kernel_PatchVoting(trainData, testData,...
                                             trainLabel, testLabel, options);
end
recRate
%%(2)Sunglass:
recRate = zeros(1, length(trainNum));
for num = 1:length(trainNum)
    load([labelPath num2str(trainNum(num)) 'Train.mat']);
    trainData  = double(dataMatrix(:, trainIdx));
    testData   = double(sunglass_dataMatrix);
    trainLabel = sampleLabels(:, trainIdx);
    testLabel  = sunglass_sampleLabels;
    recRate(num) = CR_RLS_Kernel_PatchVoting(trainData, testData,...
                                             trainLabel, testLabel, options);
end
recRate
%%(3)Scarf:
recRate = zeros(1, length(trainNum));
for num = 1:length(trainNum)
    load([labelPath num2str(trainNum(num)) 'Train.mat']);
    trainData  = double(dataMatrix(:, trainIdx));
    testData   = double(scarf_dataMatrix);
    trainLabel = sampleLabels(:, trainIdx);
    testLabel  = scarf_sampleLabels;
    recRate(num) = CR_RLS_Kernel_PatchVoting(trainData, testData,...
                                             trainLabel, testLabel, options);
end
recRate