%ֱ��ͼ���⻯����
imgDataPath = 'C:\Users\kiking\Desktop\train_1\';
imgDataDir  = dir(imgDataPath);             % ���������ļ�
for i = 1:length(imgDataDir)
    if(isequal(imgDataDir(i).name,'.')||... % ȥ��ϵͳ�Դ����������ļ���
       isequal(imgDataDir(i).name,'..')||...
       ~imgDataDir(i).isdir)                % ȥ�������в����ļ��е�
           continue;
    end
    imgDir = dir([imgDataPath imgDataDir(i).name '\*.jpg']); 
    for j =1:length(imgDir)                 % ��������ͼƬ
        %img = imread([imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        %imgeq = histeq(img);
        %imwrite(imgeq,[imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        %[X, MAP] = imread([imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        %RGB = ind2rgb(X,MAP);
        RGB = imread([imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        LAB = rgb2lab(RGB);
        L = LAB(:,:,1)/100;
        L = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.005);
        LAB(:,:,1) = L*100;
        J = lab2rgb(LAB);
        imwrite(J,[imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        %figure
        %imshowpair(RGB,J,'montage')
        %title('Original (left) and Contrast Enhanced (right) Image')
    end
end