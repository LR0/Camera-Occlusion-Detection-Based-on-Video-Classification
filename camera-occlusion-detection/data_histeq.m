%ֱ��ͼ���⻯����
imgDataPath = 'a\';
imgDataDir  = dir(imgDataPath);             % ���������ļ�
for i = 1:length(imgDataDir)
    if(isequal(imgDataDir(i).name,'.')||... % ȥ��ϵͳ�Դ����������ļ���
       isequal(imgDataDir(i).name,'..')||...
       ~imgDataDir(i).isdir)                % ȥ�������в����ļ��е�
           continue;
    end
    imgDir = dir([imgDataPath imgDataDir(i).name '\*.jpg']); 
    for j =1:length(imgDir)                 % ��������ͼƬ
        img = imread([imgDataPath imgDataDir(i).name '\' imgDir(j).name]);%gpuArray
        imgeq = histeq(img);
        imwrite(imgeq,[imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
    end
end