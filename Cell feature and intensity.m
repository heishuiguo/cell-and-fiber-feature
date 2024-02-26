clear
MASKFolder=fullfile('D:\MATLAB code\密度\mask');
dirOutput=dir(fullfile(MASKFolder,'*.tif'));
fileNames={dirOutput.name}';
ImageFolder=fullfile('D:\MATLAB code\密度\Image');
dirOutput1=dir(fullfile(ImageFolder,'*.tif'));
fileNames1={dirOutput1.name}';
num = length(fileNames);


for i = 1:num
	mask_name = fullfile(MASKFolder,fileNames(i));
	mask = (imread(mask_name{1}));
    image_name = fullfile(ImageFolder,fileNames1(i));
	image = (imread(image_name{1}));
Lifact = im2double(imread(image_name{1}));    
mask = imread(mask_name{1});  % 二值细胞区域图像
% mask = rgb2gray(mask);
mask =im2bw(mask);
area = sum(mask(:)==1);

Total = mask.* Lifact;

Int = sum(Total(:))./area;
Tot = Int.*area;
N (i,:) = Int;
T (i,:) = Tot;
end

N
T