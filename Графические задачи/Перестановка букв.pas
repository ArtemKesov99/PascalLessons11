uses crt;
var s:string;
BEGIN
s:= 'клоун';
s:=Copy(s,4,1)+s;
Delete(s,5,1);
writeln(s);
s:= Copy(s,2,1)+s;
Delete(s,3,1);
writeln(s);
Insert(Copy(s,2,1),s,4);
Delete(s,2,1);
Insert(Copy(s,4,1),s,2);
Delete(s,5,1);
write(s);
END.