procedure ShiftRight3(var A,B,C:real);
begin
A:=A+B;
B := A-B;
A:=A-B;
C:=C+A;
A:=C-A;
C:=C-A;
end;
var
A1,B1,C1:real;
A2,B2,C2:real;
begin
write('a1:');
readln(a1);
write('b1:');
readln(b1);
write('c1:');
readln(c1);
ShiftRight3(A1,B1,C1);
writeln(A1,'',B1,'',C1);
write('A2:');
readln(A2);
write('B2:');
readln(B2);
write('C2:');
readln(C2);
ShiftRight3(A2,B2,C2);
writeln(A2,'',B2,'',C2);
end.

  