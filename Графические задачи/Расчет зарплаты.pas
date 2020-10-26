function countZarplata(n,k:integer):integer;
begin
countZarplata:=n*k;
end;
var i,k,n:integer;
begin
write('k=');
readln(k);
write('n=');
readln(n);
for i:=1 to n do
begin
k:=k mod 50000;
end;
if(k<>0) and (k=i) then begin
n:=k;
end;
writeln(countZarplata(n,k));
writeln(k*n);
end.