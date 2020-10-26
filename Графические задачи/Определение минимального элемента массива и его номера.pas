const N=10;
var A,B:array [1..N] of real;
i,imax:integer;
begin
randomize;
writeln('Массив А');
for i:=1 to N do
begin
A[i]:=-5+random*10;
write(A[i]:7:2);
end;
writeln;
writeln('Массив В');
for i:=1 to n do
begin
B[i]:=sqrt(exp(A[i]))-sqr(A[i]);
write(B[i]:7:2);
end;
writeln;
imax:=1;
for i:=2 to N do
if B[i]>B[imax] then
imax:=i;
writeln('Max elem= ',B[imax]:0:2,' его номер=',imax);
readln;
end.