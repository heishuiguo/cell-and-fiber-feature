clear all;
close all;
clc;

sigma=0.5;
h=floor(2*sigma+1); 
w=h; 
[x y]=meshgrid(-w:w,-h:h);
Ga=0.9213*(-2.254*x+x.^3).*exp(-(x.^2+y.^2)/(2*sigma^2));   %�������׵ķ���ϵ��
Gb=1.843*(-0.7515+x.^2).*y.*exp(-(x.^2+y.^2)/(2*sigma^2));
Gc=0.9780*(-0.7515+y.^2).*x.*exp(-(x.^2+y.^2)/(2*sigma^2));
Gd=0.9780*(-2.254*y+y.^3).*exp(-(x.^2+y.^2)/(2*sigma^2));

img=double(imread('D:\MATLAB CODE\Isolation of D-V oriented fibrous signals\inDir\sh actin-1.png'));
[m n]=size(img);
edge=zeros(m,n);

for i=0:30:360              %һ��ת��30�Ƚ�
    theta=(i/180)*pi;
    Ka=cos(theta)^3;            %�������׵ĽǶ�ϵ��
    Kb=-3*cos(theta)^2*sin(theta);
    Kc=3*cos(theta)*sin(theta)^2;
    Kd=-sin(theta)^3;
    G=Ka*Ga+Kb*Gb+Kc*Gc+Kd*Gd;      %�����ģ��
    
    imgn=imfilter(img,G,'replicate');
    
    figure(1)
    imshow(imgn,[]);
    edge=sqrt(edge.^2+imgn.^2);
end

imshow(edge,[])
% imwrite(edge,'result.tif'); 