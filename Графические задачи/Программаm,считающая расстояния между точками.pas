const n=2;
type
Tpoint=record
x,y:real;
end;
var
point:array[1..n] of Tpoint;
i:integer;
distance:real;
begin
for i:=1 to n do
point[i].x:=random(2);
writeln(point[i].x);
point[i].y:=random(2);
writeln(point[i].y);
distance:=sqrt(point[i].x-point[i].y);
writeln(distance);
end.
