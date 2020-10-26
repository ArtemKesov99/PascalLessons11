type
mas=array [1..5] of real;
var
P,C:mas;
T:real;
i,k,s:integer;
procedure ZAMENA(P:mas;var k:integer);
var
i:integer;
begin
k:=0;
for i:=1 to 5 do
begin
if P[i]<T then
begin
P[i]:=0;
k:=k+1;
end;
end;
end;
procedure VVOD(var P:mas);
var
i:integer;
begin
for i:=1 to 5 do readln(P[i]);
end;
procedure VIVOD(P:mas);
var
i:integer;
begin
for i:=1 to 5 do write(P[i]:6:2);
writeln;
end;
begin
writeln('Введите величину T');
readln(T);
writeln('Введите элементы массива Р');
VVOD(P);
writeln('Введите элементы массива С');
VVOD(C);
writeln('Массив Р');
VIVOD(P);
writeln('Массив С');
VIVOD(C);
ZAMENA(P,k);
ZAMENA(C,s);
writeln('Измененный массив Р');
VIVOD(P);
writeln('Измененный массив С');
VIVOD(C);
writeln('Количество замен в массиве Р = ', k);
writeln('Количество замен в массиве С = ', s);
if k>s then
writeln('В массиве Р больше замен')
else
writeln('В массиве С больше замен');
end.