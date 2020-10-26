
uses GraphABC,Events,Utils;
var pr,px,py,kx,ky,ku,pc: integer;
procedure KeyDown(Key: integer);
begin
case Key of
VK_Up: if pr>10 then pr:=pr-10;
VK_Down: if pr<490 then pr:=pr+10;
end;
end;
 
procedure Pm;
begin
if px<10 then kx:=kx*(-1);
if (py<10) or (py>490) then ky:=ky*(-1);
if px>590 then
if (py>pr-20) and (py<pr+20) then kx:=kx*(-1) else
begin
showmessage('Вы упустили мячик!');
inc(ku);
px:=15;
py:=250;
end;
px:=px+kx;
py:=py+ky;
end;
begin
lockdrawing;
setwindowsize(600,500);
kx:=1; ky:=1; px:=15; py:=250; pr:=250;
repeat
clearwindow;
setbrushcolor(clgreen);
rectangle(5,5,595,495);
Pm;
setbrushcolor(clwhite);
circle(px,py,10);
OnKeyDown:=KeyDown;
pc:=py;
setbrushcolor(clblack);
rectangle(592,pr-20,597,pr+20);
rectangle(3,pc-20,8,pc+20);
sleep(5);
redraw;
until ku=5;
end.