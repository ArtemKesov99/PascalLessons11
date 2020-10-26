var
a, b: longint;
n, m: byte;
begin
readln(a);
readln(n);
b := 0;
while a > 0 do begin
m := a mod 10;
if m <> n then
b := b * 10 + m;
a := a div 10;
end;
while b > 0 do begin
a := a * 10 + b mod 10;
b := b div 10;
end;
writeln(a);
end.