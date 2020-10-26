var
a,b,c:integer;
begin
a:=random(15);
writeln('a=',a);
b:=random(15);
writeln('b=',b);
if b>a then writeln('a-наибольшее:',a);
if b<a  then writeln('b-наименьшее:',b);
c:=a+b;
writeln(c);
end.
