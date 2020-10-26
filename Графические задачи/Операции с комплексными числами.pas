type
Complex=record
Re,Im:real;
end;
var
z,u,V:complex;
procedure Mult(u,V:Complex;var w:complex);
begin
w.Re:=u.Re*V.Re-u.Im*V.Im;
w.Im:=u.Re*V.Im+u.Im*V.Re;
end;
procedure One(var z:Complex);
begin
z.Re:=1;
z.Im:=0;
end;
procedure Add(u,V:complex;var w:complex);
begin
w.Re:=u.Re+V.Re;
w.Im:=u.Im+V.im;
end;
begin
writeln('Введите z.Re:');
readln(z.Re);
writeln('Введите z.Im:');
readln(z.Im);
One(u);
Add(u,z,u);
writeln('Результат:');
writeln(u);
end.