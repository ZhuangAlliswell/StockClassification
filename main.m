%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file=dir('H:\patrecognition\stock\*.txt'); %获取当前目录下的.txt文件名
% textnum=length(file);
% f=fullfile('H:','patrecognition','fulldata_2886.mat'); %获取上述文件对应的路径
% Info=importdata(f); %使用importdata来处理含标题的文本
%     for k=1:textnum
%     [M,N]=size(Info{k}.data);
%     Sequence=1:M;Sequence=Sequence.';
%     Open=Info{k}.data(:,2);
%     High=Info{k}.data(:,3);
%     Low=Info{k}.data(:,4);
%     Close=Info{k}.data(:,5);
%     Amount=Info{k}.data(:,6);
%     Volume=Info{k}.data(:,7);
%     
% %数据预处理 preprocessing
% Vibra=High - Low;
% for i=1:M-1
%     Vibra(i)=Vibra(i+1)/Close(i);
% end
% Vibra(M)=[]; %删除最后一行，降一维，获得振幅
% SequVib=1:M-1;SequVib=SequVib.';

%拟合求解系数
% [fitresult1, gof1]=createFit( Sequence,Open);
% % [fitresult2, gof2]=createFit( Sequence,Close);
% % [fitresult3, gof3]=createFit( SequVib,Vibra);
% %开盘系数
% Open_a1(k)=fitresult1.a1;
% Open_b1(k)=fitresult1.b1;
% Open_c1(k)=fitresult1.c1;
%     Open_a2(k)=fitresult1.a2;
%     Open_b2(k)=fitresult1.b2;
%     Open_c2(k)=fitresult1.c2;
% Open_a3(k)=fitresult1.a3;
% Open_b3(k)=fitresult1.b3;
% Open_c3(k)=fitresult1.c3;
%     Open_a4(k)=fitresult1.a4;
%     Open_b4(k)=fitresult1.b4;
%     Open_c4(k)=fitresult1.c4;
% Open_a5(k)=fitresult1.a5;
% Open_b5(k)=fitresult1.b5;
% Open_c5(k)=fitresult1.c5;
%     Open_a6(k)=fitresult1.a6;
%     Open_b6(k)=fitresult1.b6;
%     Open_c6(k)=fitresult1.c6;
% %收盘系数
% Close_a1(k)=fitresult2.a1;
% Close_b1(k)=fitresult2.b1;
% Close_c1(k)=fitresult2.c1;
%     Close_a2(k)=fitresult2.a2;
%     Close_b2(k)=fitresult2.b2;
%     Close_c2(k)=fitresult2.c2;
% Close_a3(k)=fitresult2.a3;
% Close_b3(k)=fitresult2.b3;
% Close_c3(k)=fitresult2.c3;
%     Close_a4(k)=fitresult2.a4;
%     Close_b4(k)=fitresult2.b4;
%     Close_c4(k)=fitresult2.c4;
% Close_a5(k)=fitresult2.a5;
% Close_b5(k)=fitresult2.b5;
% Close_c5(k)=fitresult2.c5;
%     Close_a6(k)=fitresult2.a6;
%     Close_b6(k)=fitresult2.b6;
%     Close_c6(k)=fitresult2.c6;
% %振荡系数
% Vib_a1(k)=fitresult3.a1;
% Vib_b1(k)=fitresult3.b1;
% Vib_c1(k)=fitresult3.c1;
%     Vib_a2(k)=fitresult3.a2;
%     Vib_b2(k)=fitresult3.b2;
%     Vib_c2(k)=fitresult3.c2;
% Vib_a3(k)=fitresult3.a3;
% Vib_b3(k)=fitresult3.b3;
% Vib_c3(k)=fitresult3.c3;
%     Vib_a4(k)=fitresult3.a4;
%     Vib_b4(k)=fitresult3.b4;
%     Vib_c4(k)=fitresult3.c4;
% Vib_a5(k)=fitresult3.a5;
% Vib_b5(k)=fitresult3.b5;
% Vib_c5(k)=fitresult3.c5;
%     Vib_a6(k)=fitresult3.a6;
%     Vib_b6(k)=fitresult3.b6;
%     Vib_c6(k)=fitresult3.c6;
%取平均
%     k
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%
% MM=[Open_a1;Open_b1;Open_c1;Open_a2;Open_b2;Open_c2;Open_a3;Open_b3;Open_c3;Open_a4...
% ;Open_b4;Open_c4;Open_a5;Open_b5;Open_c5;Open_a6;Open_b6;Open_c6];
% MM=MM.';
% [Idx,C,sumD,D]=kmeans(MM,3,'dist','sqEuclidean','rep',4);
% %%



% %用cell结构把当前文档中的.txt文件数据全部读取出来
% clc;clear;
% file=dir('H:\patrecognition\stock\*.txt'); %获取当前目录下的.txt文件名
% textnum=length(file);
% Fulldata={};T={};
% for j=1:textnum
%     f=fullfile('H:','patrecognition\stock',file(j).name);
%     Fulldata=[Fulldata;importdata(f)];
%     j    
% end
% 
% for i=1:textnum
%     T{i}=Fulldata{i}.data(1:100,:);
%     i
% end

%% 三阶高斯拟合
Info=T; M=100;
textnum=2645;
for k=1:textnum
  
    Sequence=1:M;Sequence=Sequence.';
    Open=Info{1,k}(:,2);
    High=Info{1,k}(:,3);
    Low=Info{1,k}(:,4);
    Close=Info{1,k}(:,5);
    Amount=Info{1,k}(:,6);
    Volume=Info{1,k}(:,7);
    
% %数据预处理 preprocessing
    Vibra=High - Low;
        for i=1:M-1
            Vibra(i)=Vibra(i+1)/Close(i);
        end
Vibra(M)=[]; %删除最后一行，降一维，获得振幅
SequVib=1:M-1;SequVib=SequVib.';

% 拟合求解系数
[fitresult1, gof1]=Gauss3( Sequence,Open);
[fitresult2, gof2]=Gauss3( Sequence,Close);
[fitresult3, gof3]=Gauss3( SequVib,Vibra);
[fitresult4, gof4]=Gauss3( Sequence,Amount);
%开盘系数
Open_a1(k)=fitresult1.a1;
Open_b1(k)=fitresult1.b1;
Open_c1(k)=fitresult1.c1;
    Open_a2(k)=fitresult1.a2;
    Open_b2(k)=fitresult1.b2;
    Open_c2(k)=fitresult1.c2;
Open_a3(k)=fitresult1.a3;
Open_b3(k)=fitresult1.b3;
Open_c3(k)=fitresult1.c3;
%  
% %收盘系数
Close_a1(k)=fitresult2.a1;
Close_b1(k)=fitresult2.b1;
Close_c1(k)=fitresult2.c1;
    Close_a2(k)=fitresult2.a2;
    Close_b2(k)=fitresult2.b2;
    Close_c2(k)=fitresult2.c2;
Close_a3(k)=fitresult2.a3;
Close_b3(k)=fitresult2.b3;
Close_c3(k)=fitresult2.c3;
%   
% %振荡系数
Vib_a1(k)=fitresult3.a1;
Vib_b1(k)=fitresult3.b1;
Vib_c1(k)=fitresult3.c1;
    Vib_a2(k)=fitresult3.a2;
    Vib_b2(k)=fitresult3.b2;
    Vib_c2(k)=fitresult3.c2;
Vib_a3(k)=fitresult3.a3;
Vib_b3(k)=fitresult3.b3;
Vib_c3(k)=fitresult3.c3;

%成交量
Amount_a1(k)=fitresult4.a1;
Amount_b1(k)=fitresult4.b1;
Amount_c1(k)=fitresult4.c1;
    Amount_a2(k)=fitresult4.a2;
    Amount_b2(k)=fitresult4.b2;
    Amount_c2(k)=fitresult4.c2;
Amount_a3(k)=fitresult4.a3;
Amount_b3(k)=fitresult4.b3;
Amount_c3(k)=fitresult4.c3;

 
% 取平均
    k
end
    
%%
%kmeans分类
OpenM=[Open_a1;Open_a2;Open_a3;Open_b1;Open_b2;Open_b3;Open_c1;Open_c2;Open_c3];
OpenM=OpenM.';
OpenMarctan=atan(OpenM);
[Idx,C,sumD,D]=kmeans(OpenMarctan,3,'dist','sqEuclidean','rep',4);

CloseM=[Close_a1;Close_a2;Close_a3;Close_b1;Close_b2;Close_b3;Close_c1;Close_c2;Close_c3];
CloseM=CloseM.';
CloseMarctan=atan(CloseM);
[Idx,C,sumD,D]=kmeans(CloseMarctan,1,'dist','sqEuclidean','rep',6);

AmountM=[Amount_a1;Amount_a2;Amount_a3;Amount_b1;Amount_b2;Amount_b3;Amount_c1;Amount_c2;Amount_c3];
AmountM=AmountM.';
AmountMactan=atan(AmountM);
[Idx,C,sumD,D]=kmeans(AmountMactan,1,'dist','sqEuclidean','rep',6);

VibM=[Vib_a1;Vib_a2;Vib_a3;Vib_b1;Vib_b2;Vib_b3;Vib_c1;Vib_c2;Vib_c3];
VibM=VibM.';
VibMactan=atan(VibM);
[Idx,C,sumD,D]=kmeans(VibMactan,1,'dist','sqEuclidean','rep',6);
FourM=[OpenM CloseM VibM AmountM];%36维特征向量
FourMarctan=atan(FourM);
[Idx,C,sumD,D]=kmeans(FourMarctan,2,'dist','sqEuclidean','rep',6);
[coeff,score,latent,tsquared,explained]= pca(FourMarctan);%主成分分析















