uses crt;
var a,b: integer;
 
function NOD (x,y: integer): integer;
begin
while x<>y do
if x>y then x:=x-y else y:=y-x;
NOD:=x;
end;
begin
write('А='); readln(a);
write('B='); readln(b);
writeln ('NOK=',a*b/NOD (a,b));
readln;
end.