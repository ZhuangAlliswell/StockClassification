%计算时间序列分形维数。
function D=FractalDim(y,cellmax)
if cellmax<length(y)
    error('cellmax must be larger than input signal!') 
end
L=length(y);
y_min=min(y);
y_min=min(y);
y_shift=y-y_min;
x_ord=[0:L-1]./(L-1);
xx_ord=[0:cellmax]./(cellmax);
y_interp=interp1(x_ord,y_shift,xx_ord);
ys_max=max(y_interp);
factory=cellmax/ys_max;
yy=abs(y_interp*factory);
t=log2(cellmax)+1;
for e=1:t 
    Ne=0;
    cellsize=2^(e-1);
    NumSeg(e)=cellmax/cellsize;
       for j=1:NumSeg(e)
           begin=cellsize*(j-1)+1;
           tail=cellsize*j+1;
           seg=[begin:tail];
           yy_max=max(yy(seg));
           yy_min=min(yy(seg));
           up=ceil(yy_max/cellsize);
           down=floor(yy_min/cellsize);
           Ns=up-down;
           Ne=Ne+Ns;
       end
       N(e)=Ne;
end

r=-diff(log2(N));
id=find(r<=2&r>=1);
Ne=N(id);
e=NumSeg(id);
P=polyfit(log2(e),log2(Ne),1);
D=P(1);
           