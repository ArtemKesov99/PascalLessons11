uses graphABC;
var c,r:integer;
begin
setwindowsize(500,500);
centerwindow;
c:=250;
r:=50;
lockdrawing;
repeat
clearwindow;
r:=r+5;
setbrushcolor(clRed);
circle(c,c,r);
sleep(50);
redraw;
until r>c;
end.