type
  Complex = record
    Re, Im: real;
  end;
procedure Mult(u,v:Complex;var w:complex);
begin
  w.Re:=u.Re*v.Re-u.Im*v.Im;
  w.Im:=u.Re*v.Im+u.Im*v.Re
end;
 
procedure One(var z:Complex);
begin
  z.Re:=1;
  z.Im:=0;
end;
 
procedure Add(u,v:Complex;var w:complex);
begin
  w.Re:=u.Re+v.Re;
  w.Im:=u.Im+v.Im
end;
 
var
  z,u,w: Complex;
  i:integer;
begin
  writeln('Введите z.Re:');
  readln(z.Re);
  writeln('Введите z.Im:');
  readln(z.Im);
  One(u); //1+0i
  w:=u;
  for i:=1 to 20 do
   begin
    Mult(u,z,u);//умножаем предыдущее на z=z^i
    Add(w,u,w); //прибавляем  это к сумме
   end;
  writeln('Результат:');
  write(w.Re:0:2,' ');
  if w.Im>0 then write('+',w.Im:0:2,'i')
  else write(w.Im,'i');
end.