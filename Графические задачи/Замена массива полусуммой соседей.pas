const n = 8;
var a: array[1..n] of real;
i: integer;
t, ti: real;
begin
randomize;
for i := 1 to n do
repeat
a[i] := -99 + random(199);
until ((i > 1) and (i < n)) or (a[i] > 0);
writeln('Исходный массив:');
for i := 1 to n do write(a[i]:6:1);
writeln;
t := a[1];
for i := 2 to n - 1 do
begin
ti := a[i];
if a[i] < 0 then a[i] := (t + a[i + 1]) / 2;
t := ti
end;
writeln('Результат:');
for i := 1 to n do write(a[i]:6:1);
end.