var
i,eb,ek:integer;
ar:array[1234..6543] of boolean;
procedure ask(n:integer;var i,j:integer);
var
a,e:integer;
s,s1:string;
begin
ar[n]:=true;
writeln('Мое число:',n);
repeat
write('Сколько быков и коров?');
readln(i,j);
until (i+j>=0) and (i+j<5);
if i=4 then begin writeln('Я угадал');halt;end;
if i+j=4 then begin
s:=inttostr(n);
for a:=1111 to 4444 do
if inttostr(a).ToCharArray.where((c:char)->c in ['1'..'4']).Distinct.Count=4 
then begin
s1:=s[a div 1000]+s[a mod 1000 div 100]+s[a mod 1000 mod 100 div 10]+s[a mod 10];
e:=strtoint(s1);
if (e<>n) and (not ar[e]) then ask(e,i,j);
end;
end;
end;  
begin
writeln('Загадайте четырехзначное число с не повторяющимися цифрами от 1 до 6');
for i:=1234 to 6543 do 
if inttostr(i).ToCharArray.where((c:char)->c in ['1'..'6']).Distinct.Count=4 
then ask(i,eb,ek);
end.