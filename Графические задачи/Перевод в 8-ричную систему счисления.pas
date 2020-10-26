var
n:integer;
k:integer;
begin
n:=100 div 8;
writeln(n);
n:=12 div 8;
writeln(n);
n:=1 div 8;
writeln(n);
                                 01B   ->0F  01B0F ->100 8
k:=12 mod 8*(100-8*12);
writeln(k);
k:=16 mod 8;
writeln(k);
end.
