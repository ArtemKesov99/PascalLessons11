program pr;
const
Csize = 100;
var
i, n, m, b: integer;
a: array [1..Csize] of integer;
begin
writeln('Введите размер массива');
readln(n);
for i := 1 to n do
begin
a[i] := random(21);
write(a[i]:3);
end;
writeln;
writeln('Введите число М');
readln(m);
writeln('Введите число В');
readln(b);
for i := 1 to n do
if a[i] < m then
begin
a[i] := b;
end;
writeln;
for i := 1 to n do
write(a[i]:3);
end.