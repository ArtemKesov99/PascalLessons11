var
a:integer;
n:integer;
b:real;
m:integer;
count:integer;
r:integer;
begin
write('введите  номер платежа');
readln(n);
b:=0;
case n of
1,2:a:=1000;3,4:a:=2000;
end;
if n=1 then a:=1000
else if n=2 then a:=2000;
writeln(a);
write('введите банковскую ставку');
readln(n);
case m of
6,5:b:=8.5;
end;
writeln(b);
if n=1 then writeln ('ваш платеж cоставляет:',2000);
 if n=2 then writeln ('ваш платеж составляет:',1000);
 case r of
 1,2:writeln('99 счет:');
 3,4:writeln('43 счет:');
 end;
 if (r=1) or (r=2) then writeln('счет:count:',99)
  else if(r=3) or (r=4) then count:=43;
 writeln('count:',99);
 writeln('count:',43);
end.