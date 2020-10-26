uses graphABC;
var N, K, H, X1, Y1, X2, Y2, X3, Y3, X4, Y4: integer;
begin
N:=150;
K:=250;
H:=120;
X1:=275;
Y1:=50;
X2:=X1-N;
Y2:=Y1;
X3:=X2-(K-N)div 2;
Y3:=Y1+H;
X4:=X1+(K-N)div 2;
Y4:=Y3;
SetWindowSize(400,250);
Line (X1, Y1, X2, Y2);
Line (X2, Y2, X3, Y3);
Line (X3, Y3, X4, Y4);
Line (X4, Y4, X1, Y1);
Circle(X1,Y1,5)
end.