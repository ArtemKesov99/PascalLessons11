const n=4;
var a:array [1..n] of integer;
Var i,p:integer;
Begin 
P:=1;
For i:=1 to n do Readln(a[i]);
For i:=1 to n do 
If (i mod 2 = 0) and (a[i] mod 2 <>0) then p:=p*a[i];
Writeln (p);
End.