%ֱ��ͼ���⻯����
imgDataPath = 'C:\Users\kiking\Desktop\357\';
imgDataDir  = dir(imgDataPath);             % ���������ļ�
for i = 1:length(imgDataDir)
    if(isequal(imgDataDir(i).name,'.')||... % ȥ��ϵͳ�Դ����������ļ���
       isequal(imgDataDir(i).name,'..')||...
       ~imgDataDir(i).isdir)                % ȥ�������в����ļ��е�
           continue;
    end
    imgDir = dir([imgDataPath imgDataDir(i).name '\*.jpg']); 
    for j =1:length(imgDir)                 % ��������ͼƬ
        img = imread([imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
        %imgeq = histeq(img);
        imgdouble = double(img);
        [m n]=size(imgdouble);

        Fe=1;   %���Ʋ���
        Fd=128;

       xmax=max(max(imgdouble));
       u=(1+(xmax-imgdouble)/Fd).^(-Fe);     %�ռ���任��ģ����

       %Ҳ���Զ�ε��� 
       for ii=1:m                       %ģ������ǿ����
          for jj=1:n
             if u(ii,jj)<0.5
               u(ii,jj)=2*u(ii,jj)^2; 
             else
              u(ii,jj)=1-2*(1-u(ii,jj))^2;
             end
          end
       end

       imgmohu = xmax-Fd.*(u.^(-1/Fe)-1);    %ģ����任�ؿռ���
       imwrite(uint8(imgmohu),[imgDataPath imgDataDir(i).name '\' imgDir(j).name]);
    end
end
