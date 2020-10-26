uses crt;
type complex=record
re,im:real;
end;
function Modul(f:complex):real;
begin
Modul:=sqrt(sqr(f.re)+sqr(f.im));
end;
var a:complex;
begin
clrscr;
writeln('Введите действительную и мнимую части a:');
readln(a.re,a.im);
writeln('Modul A=',Modul(a):0:6);
end.