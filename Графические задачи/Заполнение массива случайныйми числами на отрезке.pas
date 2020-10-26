program pr;
const
Csize = 100;
var
b, i, n: integer;
a:array[1..Csize] of integer;
begin
writeln('Введите размер массива');
readln(n);
writeln('Введите В');
readln(b);
for i := 1 to n do
begin
a[i] := random(b + 1);
write(a[i]:3);
end;
end.