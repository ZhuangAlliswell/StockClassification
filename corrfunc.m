%%计算相关系数
Open=[];High=[];Low=[];Close=[];Amount=[];Volume=[];

for i=1:2645
    Open=[Open T{1,i}(:,2)];
 end
 OpenRe=corr(Open);
 
 for i=1:2645
    High=[High T{1,i}(:,3)];
 end
 HighRe=corr(High);
 
  for i=1:2645
    Low=[Low T{1,i}(:,4)];
 end
 LowRe=corr(Low);
 
 for i=1:2645
    Close=[Close T{1,i}(:,5)];
 end
 CloseRe=corr(Close);
 
  for i=1:2645
    Amount=[Amount T{1,i}(:,6)];
 end
 AmountRe=corr(Amount);
 
   for i=1:2645
    Volume=[Volume T{1,i}(:,7)];
 end
 VolumeRe=corr(Volume);




