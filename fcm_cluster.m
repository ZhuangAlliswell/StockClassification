clc;
clear;
%%
%在加载corrmatrix_2645_100,mat文件之后
length=2645;
N=1:100;
N=N.';
Sequence=1:length;
%峰值
OpenMAX=max(Open);
OpenMAX=OpenMAX.';
CloseMAX=max(Close);
CloseMAX=CloseMAX.';
HighMAX=max(High);
HighMAX=HighMAX.';
LowMAX=max(Low);
LowMAX=LowMAX.';
AmountMAX=max(Amount);
AmountMAX=AmountMAX.';
%%
%谷值
OpenMIN=min(Open);
OpenMIN=OpenMIN.';
CloseMIN=min(Close);
CloseMIN=CloseMIN.';
HighMIN=min(High);
HighMIN=HighMIN.';
LowMIN=min(Low);
LowMIN=LowMIN.';
AmountMIN=min(Amount);
AmountMIN=AmountMIN.';
%%
%峰度
OpenKUR=kurtosis(Open);
OpenKUR=OpenKUR.';
CloseKUR=kurtosis(Close);
CloseKUR=CloseKUR.';
HighKUR=kurtosis(High);
HighKUR=HighKUR.';
LowKUR=kurtosis(Low);
LowKUR=LowKUR.';
AmountKUR=kurtosis(Amount);
AmountKUR=AmountKUR.';
%%
%偏度
OpenSKE=skewness(Open);
OpenSKE=OpenSKE.';
CloseSKE=skewness(Close);
CloseSKE=CloseSKE.';
HighSKE=skewness(High);
HighSKE=HighSKE.';
LowSKE=skewness(Low);
LowSKE=LowSKE.';
AmountSKE=skewness(Amount);
AmountSKE=AmountSKE.';
%%
%趋势
for i=1:length
    [fitresult1, gof1] = ODpoly(N, Open(:,i));
    OpenTrend(i)=fitresult1.p1;
    [fitresult1, gof1] = ODpoly(N, Close(:,i));
    CloseTrend(i)=fitresult1.p1;
    [fitresult1, gof1] = ODpoly(N, High(:,i));
    HighTrend(i)=fitresult1.p1;
    [fitresult1, gof1] = ODpoly(N, Low(:,i));
    LowTrend(i)=fitresult1.p1;
        [fitresult1, gof1] = ODpoly(N, Amount(:,i));
    AmountTrend(i)=fitresult1.p1;
    i
end

OpenTrend=OpenTrend.';
CloseTrend=CloseTrend.';
HighTrend=HighTrend.';
LowTrend=LowTrend.';
AmountTrend=AmountTrend.';
%%
%分形维数
cellmax=128;
for i=1:length
   OpenFD(i)=FractalDim(Open(:,i),cellmax) ;
   CloseFD(i)=FractalDim(Close(:,i),cellmax)  ;
   HighFD(i)=FractalDim(High(:,i),cellmax) ;  
   LowFD(i)=FractalDim(Low(:,i),cellmax) ;   
   AmountFD(i)=FractalDim(Amount(:,i),cellmax)  ;
   i
end
OpenFD=OpenFD.';
CloseFD=CloseFD.';
HighFD=HighFD.';
LowFD=LowFD.';
AmountFD=AmountFD.';
%%
%%按每一维归一化

%峰值归一化

OpenMAX1=mapminmax(OpenMAX.',0,1);

CloseMAX1=mapminmax(CloseMAX.',0,1);

HighMAX1=mapminmax(HighMAX.',0,1);

LowMAX1=mapminmax(LowMAX.',0,1);

AmountMAX1=mapminmax(AmountMAX.',0,1);

MAX1M=[OpenMAX1.' CloseMAX1.' HighMAX1.' LowMAX1.' AmountMAX1.'];
%%
%谷值归一化

OpenMIN1=mapminmax(OpenMIN.',0,1);

CloseMIN1=mapminmax(CloseMIN.',0,1);

HighMIN1=mapminmax(HighMIN.',0,1);

LowMIN1=mapminmax(LowMIN.',0,1);

AmountMIN1=mapminmax(AmountMIN.',0,1);

MIN1M=[OpenMIN1.' CloseMIN1.' HighMIN1.' LowMIN1.' AmountMIN1.'];
%%
%峰度归一化

OpenKUR1=mapminmax(OpenKUR.',0,1);

CloseKUR1=mapminmax(CloseMIN.',0,1);

HighKUR1=mapminmax(HighKUR.',0,1);

LowKUR1=mapminmax(LowKUR.',0,1);

AmountKUR1=mapminmax(AmountKUR.',0,1);

KUR1M=[OpenKUR1.' CloseKUR1.' HighKUR1.' LowKUR1.' AmountKUR1.'];
%%
%偏度归一化

OpenSKE1=mapminmax(OpenSKE.',0,1);

CloseSKE1=mapminmax(CloseSKE.',0,1);

HighSKE1=mapminmax(HighSKE.',0,1);

LowSKE1=mapminmax(LowSKE.',0,1);

AmountSKE1=mapminmax(AmountSKE.',0,1);

SKE1M=[OpenSKE1.' CloseSKE1.' HighSKE1.' LowSKE1.' AmountSKE1.'];
%%
%趋势归一化

OpenTrend1=mapminmax(OpenTrend.',0,1);

CloseTrend1=mapminmax(CloseTrend.',0,1);

HighTrend1=mapminmax(HighTrend.',0,1);

LowTrend1=mapminmax(LowTrend.',0,1);

AmountTrend1=mapminmax(AmountTrend.',0,1);

Trend1M=[OpenTrend1.' CloseTrend1.' HighTrend1.' LowTrend1.' AmountTrend1.'];
%%
%分形维数归一化

OpenFD1=mapminmax(OpenFD.',0,1);

CloseFD1=mapminmax(CloseFD.',0,1);

HighFD1=mapminmax(HighFD.',0,1);

LowFD1=mapminmax(LowFD.',0,1);

AmountFD1=mapminmax(AmountFD.',0,1);

FD1M=[OpenFD1.' CloseFD1.' HighFD1.' LowFD1.' AmountFD1.'];
%%
FiveM=[MAX1M MIN1M KUR1M SKE1M Trend1M FD1M];

%%

% [CENTER1, U1, OBJ_FCN1] = fcm(FiveM, 1);
% [CENTER2 ,U2, OBJ_FCN2] = fcm(FiveM, 3);
% [CENTER3 ,U3, OBJ_FCN3] = fcm(FiveM, 3);
% [CENTER4 ,U4, OBJ_FCN4] = fcm(FiveM, 4);
% [CENTER5 ,U5, OBJ_FCN5] = fcm(FiveM, 5);
% [CENTER6 ,U6, OBJ_FCN6] = fcm(FiveM, 6);
% [CENTER7 ,U7, OBJ_FCN7] = fcm(FiveM, 7);
%[CENTER8,U8, OBJ_FCN8] = fcm(FiveM, 8);

[coeff,score,latent,tsquared,explained]= pca(FiveM);
% FiveMCPA=score(:,1:3);
%%
% %plot3(FiveMCPA(:,1),FiveMCPA(:,2),FiveMCPA(:,3),'o');
 
%%
FiveMCPA=score(:,1:2);
plot(FiveMCPA(:,1),FiveMCPA(:,2),'o');
hold on;
%%
[CENTER2 ,U2, OBJ_FCN2] = fcm(FiveMCPA, 9);
maxU = max(U2);
index1 = find(U2(1,:) == maxU);
index2 = find(U2(2,:) == maxU);
index3 = find(U2(3,:) == maxU);
index4 = find(U2(4,:) == maxU);
index5 = find(U2(5,:) == maxU);
index6 = find(U2(6,:) == maxU);
index7 = find(U2(7,:) == maxU);
index8 = find(U2(8,:) == maxU);
index9 = find(U2(9,:) == maxU);
line(FiveMCPA(index1,1),FiveMCPA(index1,2),'marker','*','color','g');
line(FiveMCPA(index2,1),FiveMCPA(index2,2),'marker','*','color','r');
line(FiveMCPA(index3,1),FiveMCPA(index3,2),'marker','*','color','k');
line(FiveMCPA(index4,1),FiveMCPA(index4,2),'marker','*','color','m');
line(FiveMCPA(index5,1),FiveMCPA(index5,2),'marker','*','color','b');
line(FiveMCPA(index6,1),FiveMCPA(index6,2),'marker','*','color',[0.5,0.7,0.3]);
line(FiveMCPA(index7,1),FiveMCPA(index7,2),'marker','*','color',[0.3,0.2,0.2]);
line(FiveMCPA(index8,1),FiveMCPA(index8,2),'marker','*','color',[0.8,0.2,0.2]);
line(FiveMCPA(index9,1),FiveMCPA(index8,2),'marker','*','color',[0.8,1,0.4]);
% plot(CENTER2(1,1),CENTER2(1,2),'*','color','k');
hold off
%%

