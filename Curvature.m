X = xlsread('data.xlsx','sheet2')
Y = xlsread('data.xlsx','sheet1')
In = xlsread('data.xlsx','sheet3')
A = zeros(150,150);
B = zeros(150,150);
Inmax = max(In(:,1));
Inmin = abs(min(In(:,1)));
for i = 1:4736 % ������� number
    Xi = X(i,2);
    Yi = Y(i,2);
    Xii=round(Xi);
    Yii=round(Yi);
    Ini = In(i,1);
    if (Ini<0) 
        Ini = abs(Ini);
        % B(Xii,Yii) = Ini/Inmin; % ������ negative curvature
       B(Xii,Yii) = Ini./2.0; % ������ negative curvature
    else
    
    Ini = In(i,2);
    % A (Xii,Yii)= Ini/Inmax; % ������ positive curvature
    A (Xii,Yii)= Ini./2.4; % ������ positive curvature
    end
end
Gau = fspecial('gaussian',[3,3],1);
out1= imfilter(A,Gau,'conv','replicate');
out2= imfilter(B,Gau,'conv','replicate');
imshow(out1);
imshow(out2);
imwrite(out1, 'out1.tif'); % ������ positive curvature
imwrite(out2, 'out2.tif'); % ������ negative curvature
