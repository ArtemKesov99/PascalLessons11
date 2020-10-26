procedure CountSum(a,b:integer;var sum:integer);
begin
sum:=0;
sum:=a+b;
end;
var
sum,a,b:integer;
begin
write('a:');
readln(a);
write('b:');
readln(b);
CountSum(sum,a,b);
writeln(a+b);
end.