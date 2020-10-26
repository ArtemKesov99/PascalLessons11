program massiv4;
var 
a : array[1..10] of integer;
i,j,n : integer;
begin
n :=10;
randomize;
for i:=1 to n do
a[i] := random(5,100);
write('Массив начальный: ');
for i:=1 to n do
write(a[i]:4);
writeln;
for i:=n downto 1 do
if (a[i] mod 2 = 0) then
begin
for j:=i to n-1 do
a[j]:=a[j+1];
n:=n-1;
end;
write('Массив конечный:  ');
for i:=1 to n do
write(a[i]:4);
writeln; 
end.