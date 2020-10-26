uses graphABC;
var  x,y,r,h:integer;
begin
setwindowsize(500,500);
centerwindow;
x:=250;
y:=375;
line(x,y,x-100,y-200);
line(x,y,x+100,y-200);
ellipse(x-100,y-230,x+100,y-170);
setbrushcolor(clBlue);
ellipse(x-58,y-135,x+58,y-95);
floodfill(x,y-10,clBlue);
end.