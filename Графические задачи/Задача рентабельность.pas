var
a,b:integer;
r:real;
begin
write('a:=');
readln(a);
write('b:=');
readln(b);
r:=a/b;
writeln(r);
if r<>0 then writeln('показатель оптимален:');
end.