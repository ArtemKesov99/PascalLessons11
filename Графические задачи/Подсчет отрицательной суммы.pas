const
N = 4;
M = 3;
var
ar: Array[1..N, 1..M] Of Real;
i: 1..N;
j: 1..M;
count: 0..N*M;
sum: Real;
begin
Randomize;
WriteLn('M:');
sum := 0;
count := 0;
for i := 1 to N do
begin
for j := 1 to M do
begin
ar[i, j] := Random*198 - 99;
Write(ar[i, j]:7:2);
if (ar[i, j] < 0)
then
Inc(count)
else
sum := sum + ar[i, j];
end;
WriteLn;
end;
WriteLn('Количество отрицательных: ', count);
WriteLn('Сумма положительных: ', sum:0:2);
end.