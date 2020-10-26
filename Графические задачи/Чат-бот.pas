Program chat;
uses crt;
var s:string;
i:integer;
begin
clrscr;
for i:=1 to 10 do
begin
readln(s);
if s='привет' then
writeln('привет');
if s='как тебя зовут' then
writeln('Егор');
if s='Пока' then
writeln('Пока');
end;
end.