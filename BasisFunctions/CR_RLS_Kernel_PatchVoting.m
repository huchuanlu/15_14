function [ recRate minIdx score coeff  ]... 
         = CR_RLS_Kernel_PatchVoting(trainData, testData, trainLabel, testLabel, options)

if  ~isfield(options, 'lambda'),
    options.lambda = 0.001;             
end

if  ~isfield(options, 'KernelType'),
    options.KernelType = 'Linear';     
end

if  ~isfield(options, 'algorithm')
    options.algorithm = 'residuals';  
end

if  ~isfield(options, 'flag')
    options.flag = 0;
end

lambda = options.lambda;               
trainNum = size(trainData, 2);         
testNum  = size(testData, 2);            
labelSet = unique(trainLabel);            
labelNum = length(labelSet);               
score    = zeros(labelNum, testNum);       
%
trainK   = zeros(size(trainData,2), size(trainData,2));          
testK    = zeros(size(trainData,2), size(testData,2));
patchNum = size(options.patchIndex,1)*size(options.patchIndex,2);
minIndexSet = [];
for pp = 1:patchNum 
    switch lower(options.KernelType)
        case {lower('Hamming')}     
            trainK     = constructKernel(trainData',trainData',options);
            testK      = constructKernel(trainData',testData',options);         
        otherwise  %%Gaussian&&Linear
            trainDataT = trainData(options.patchIndex{pp},:);
            testDataT  = testData(options.patchIndex{pp},:);
            trainDataT = trainDataT./(repmat(sqrt(sum(trainDataT.^2)), size(trainDataT,1), 1)+eps);
            testDataT  = testDataT./(repmat(sqrt(sum(testDataT.^2)), size(testDataT,1), 1)+eps);
            trainK     = constructKernel(trainDataT',trainDataT',options);
            testK      = constructKernel(trainDataT',testDataT',options);   
    end
    %coefficents
    if  options.flag == 0
        lambda = lambda/700;
        coeff = inv(trainK+lambda*trace(trainK)*eye(trainNum))*testK;
    else
        coeff = inv(trainK+lambda*eye(trainNum))*testK; 
    end
    
    %∑÷¿‡£∫
    for num = 1:labelNum
        [value index]  = find(trainLabel==labelSet(num));
        for ii = 1:testNum
            %(1)Residuals:
            if  strcmp(options.algorithm, 'residuals')
                score(num,ii) = (1+coeff(index,ii)'*trainK(index,index)*coeff(index,ii)...
                                -2*testK(index,ii)'*coeff(index,ii));
            end
            %(2)R_residuals:
            if  strcmp(options.algorithm, 'r_residuals')
                score(num,ii) = (1+coeff(index,ii)'*trainK(index,index)*coeff(index,ii)...
                                -2*testK(index,ii)'*coeff(index,ii))./sum(coeff(index,ii).^2); 
            end
        end
    end
    [value minIdx] = min(score);
    minIndexSet = [minIndexSet; minIdx];
end

minIdx = [];
for num = 1:size(minIndexSet,2)
    minIdx = [ minIdx, max_voting(minIndexSet(:,num)) ];
end

recRate = sum(minIdx==testLabel)/testNum;