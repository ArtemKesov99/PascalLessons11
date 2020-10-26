const m = 10;
var a: array[1..m] of real;
t: real;
i, j: integer;
begin
randomize;
writeln('Вектор:');
for i := 1 to m do
begin
a[i] := 198 * random - 99;
write(a[i]:7:2)
end;
writeln;
writeln('Элементы вектора, большие 0, умножены на 10:');
for i := 1 to m do
begin
if a[i] > 0 then a[i] := a[i] * 10;
write(a[i]:7:2)
end;
writeln;
for i := 1 to m - 1 do
for j := i + 1 to m do
if a[i] > a[j]
then begin
t := a[i];
a[i] := a[j];
a[j] := t
end;
writeln('Вектор, отсортированный по неубыванию:');
for i := 1 to m do write(a[i]:7:2);
end.