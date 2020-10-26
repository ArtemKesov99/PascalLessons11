var
a:array[1..10] of integer;
N,i:integer;
begin
writeln('N:');
readln(N);
i:=0;
while(i<=N) do
begin
i:=i+2;
end;
writeln(i,':',a[i]);
end.