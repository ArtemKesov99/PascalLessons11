Program Primer;
USES
CRT;
CONST
kol_strok=5;
kol_stolbcov=4;
VAR
A:array[1..kol_strok,1..kol_stolbcov] of Real;
i,j:integer;
BEGIN
Writeln('Введите элемента матрицы А:');
for i:=1 to kol_strok do
for j:=1 to kol_stolbcov do
Read(A[i,j]);
ClrScr;
Writeln('Матрица А:');
for i:=1 to kol_strok do
begin
for j:=1 to kol_stolbcov do
Write(A[i,j]:4:2,' ');
Writeln;
end;
END.
