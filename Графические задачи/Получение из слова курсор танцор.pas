uses crt;
var s:string;
BEGIN
s:= 'курсор';
Delete(s,1,4);
Insert('танц',s,1);
writeln(s);
END.