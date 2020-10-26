var i,n:integer;
min_razmer_oplati_truda:integer;
begin
writeln('min_razmer_oplati_truda:');
for i:=1 to n do
if(n=11250) then writeln(i=n);
writeln('min_razmer_oplati_truda=');
writeln(11250);
case n of
1..12:min_razmer_oplati_truda:=11250;
end;
while(min_razmer_oplati_truda=11250) do
break;
if(n=1) and (n=2) and (n=3) then writeln(n);
writeln('1 месяц');
n:=1;
writeln('2 месяц');
n:=2;
writeln('3 месяц');
n:=3;
end.