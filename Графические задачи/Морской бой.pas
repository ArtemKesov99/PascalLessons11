var n:integer;t:array[1..4] of byte;
s:array[1..100,1..100] of byte;
f:textfile;
procedure Schet(i,j,k:integer);
var z1,z2:byte;
begin if s[i,j]=1 then
begin s[i,j]:=0;
if n>i then z1:=1 else z1:=0;
if n>j then z2:=1 else z2:=0;
case z1*s[i+1,j]*10+z2*s[i,j+1] of
0:inc(t[k]);
1:Schet(i,j+1,k+1);
10:Schet(i+1,j,k+1);
end;
end;
end;
var i,j:integer;
begin
assign(f,'input.txt');
reset(f);
readln(f,n);
for i:=1 to 4 do
t[i]:=0;
for i:=1 to n do
begin for j:=1 to n do
read(f,s[i,j]);
readln(f);
end;
close(f);
for i:=1 to n do
for j:=1 to n do
Schet(i,j,1);
assign(f,'output.txt');
rewrite(f);
for i:=1 to 4 do
write(f,t[i],' ');
close(f);
end.