type student=class
public
name:string;
age:integer;
group:string;
protected
surname:string[20];
private
constructor create(n:string;a:integer);
begin
name:=n;
age:=a;
end;
end;
var p:student;
begin
p:=new student;
readln(p.name);
p := new student;
readln(p.age);
end.