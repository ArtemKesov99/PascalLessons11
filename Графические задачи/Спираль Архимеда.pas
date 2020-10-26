uses graphABC;
procedure arh(x0,y0,a,m,n:integer);
var f,r,x,y:real;
begin
f:=0;
while f<=m*pi do
begin
r:=a*f;
x:=r*cos(f);
y:=r*sin(f);
if f=0 then moveto(x0+round(x),y0-round(y))
else lineto(x0+round(x),y0-round(y));
f:=f+0.01;
end;
line(x0-round(r),y0,x0+round(r),y0);
line(x0,y0-round(r),x0,y0+round(r));
textout(x0-50,y0-round(r)-20,'a='+inttostr(a)+' m='+inttostr(m));
end;
var a,n,m:integer;
begin
arh(100,100,4,1,1);
arh(400,100,6,4,1);
arh(100,300,2,10,1);
arh(400,300,3,12,1);
end.