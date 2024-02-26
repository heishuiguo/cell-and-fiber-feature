clear
MASKFolder=fullfile('D:\MATLAB code\Polarity\mask');
dirOutput=dir(fullfile(MASKFolder,'*.tif'));
fileNames={dirOutput.name}';
num = length(fileNames);
for i = 1:num
	mask_name = fullfile(MASKFolder,fileNames(i));
	mask = (imread(mask_name{1}));
    mask =im2bw(mask);
    
    polarity = regionprops(mask,'Orientation');
    Pol = polarity.Orientation;
    Polar = abs(Pol/90);%Ð£Õý
    if (Polar>1)
        Polar = 1-(Polar-1)
    end
P (i,:) = Polar;
end
% P = mean(P)


