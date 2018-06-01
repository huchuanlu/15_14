function [V] = LBP_Coding(X,T)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DIP LAB%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% P=8 , R=1;
%%%X : image_block;
%%%V : labelled_image,  可以用来统计纹理标号的分布;
%%%I : uniform_lbp,     实际的纹理编码;
%%%T : 阈值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

uniform_labels = [0 ...
        128 64 32 16 8 4 2 1 ...
        192 96 48 24 12 6 3 129 ...
        224 112 56 28 14 7 131 193 ...
        240 120 60 30 15 135 195 225 ...
        248 124 62 31 143 199 227 241 ...
        252 126 63 159 207 231 243 249 ...
        254 127 191 223 239 247 251 253 ...
        255];

D = size(X);
sy = D(1);
sx = D(2);

Xi = zeros(sy+2,sx+2);
Xi(2:sy+1,2:sx+1) = X;  %%"加边"

Xi1 = zeros(sy+2,sx+2);  Xi2 = zeros(sy+2,sx+2);  Xi3 = zeros(sy+2,sx+2);  Xi4= zeros(sy+2,sx+2);
Xi5 = zeros(sy+2,sx+2);  Xi6 = zeros(sy+2,sx+2);  Xi7 = zeros(sy+2,sx+2);  Xi8 = zeros(sy+2,sx+2);

Xi1(3:sy+2,3:sx+2) = X;                 %%Right and Down 
Xi2(3:sy+2,2:sx+1) = X;                 %%Down
Xi3(3:sy+2,1:sx)   = X;                 %%Left and Down
Xi4(2:sy+1,1:sx)   = X;                 %%Left
Xi5(1:sy,1:sx)     = X;                 %%Left and Up
Xi6(1:sy,2:sx+1)   = X;                 %%Up
Xi7(1:sy,3:sx+2)   = X;                 %%Right and Up
Xi8(2:sy+1,3:sx+2) = X;                 %%Right

Xi1 = (Xi1-Xi>=T);  Xi1 = Xi1(2:sy+1,2:sx+1);
Xi2 = (Xi2-Xi>=T);  Xi2 = Xi2(2:sy+1,2:sx+1);
Xi3 = (Xi3-Xi>=T);  Xi3 = Xi3(2:sy+1,2:sx+1);
Xi4 = (Xi4-Xi>=T);  Xi4 = Xi4(2:sy+1,2:sx+1);
Xi5 = (Xi5-Xi>=T);  Xi5 = Xi5(2:sy+1,2:sx+1);
Xi6 = (Xi6-Xi>=T);  Xi6 = Xi6(2:sy+1,2:sx+1);
Xi7 = (Xi7-Xi>=T);  Xi7 = Xi7(2:sy+1,2:sx+1);
Xi8 = (Xi8-Xi>=T);  Xi8 = Xi8(2:sy+1,2:sx+1);

V = [ Xi1(:); Xi2(:); Xi3(:); Xi4(:); Xi5(:); Xi6(:); Xi7(:); Xi8(:) ];