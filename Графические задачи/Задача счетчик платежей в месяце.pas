var
month:integer;
plates:integer;
begin
write('month:');
readln(month);
case month of
1..8 :plates:=1000;
9..16:plates:=2000;
17..24:plates:=3000;
25..31:plates:=4000;
end;
if(month=1) then  writeln('1000');
for month:=1 to 31 do
writeln(1000);
writeln(plates);
end.