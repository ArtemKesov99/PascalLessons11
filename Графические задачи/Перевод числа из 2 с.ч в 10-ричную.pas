program algoritm;
uses crt;
label 1,2;
var s,sbox,dvaPs:string;
m:array [1..99] of integer;
i,step,des,dva,n,ost,l,delo,v,rand,box,dvaP,desP:integer;
begin
{Выбор направления обучения}
writeln('Выберите направление обучения:');
writeln('1. Перевод из десятичной системы счисления в двоичную');
writeln('2. Перевод из двоичной системы счисления в десятичную');
read(v);
if v=1 then //если выбран 1, то
begin
writeln('--------------------');
randomize;
des:=random(6)+2;//задаём "сложность", число цифр в десятичном числе
for i:=1 to des do
begin
rand:=random(10)+1;//выбираем рандомное число
s:=s+IntToStr(rand);
end;
l:=length(s);
{Отрубаем нолики из начала}
for i:=1 to l do
if s[1]='0' then
begin
Delete(s,1,1);
l:=l-1;
end
else
break;
{/Отрубили нолики}
des:=StrToInt(s);
des:=3831;//тест
writeln('Десятичное число:',des);
n:=0;
i:=0;
repeat
inc(n);
inc(i);
ost:=des mod 2;
des:=des div 2;
m[i]:=ost;
until des=0;
for i:=n downto 1 do
begin
box:=m[i];
sbox:=sbox+IntToStr(box);//записываем двоичное число в строку
end;
l:=length(sbox);
{Отрубаем нолики из начала}
for i:=1 to l do
if sbox[1]='0' then
begin
Delete(sbox,1,1);
l:=l-1;
end
else
break;
{/Отрубили нолики}
1:write('Переведите его в двоичную систему счисления:');
read(dvaPs);
if dvaPs=sbox then
writeln('Правильно!')
else
begin
writeln('Не правильно, попробуйте еще');
goto 1;
end;
end
else
if v=2 then //если выбран 2, то
begin
writeln('--------------------');
randomize;
dva:=random(9)+3;//задаём "сложность", число цифр в двоичном числе
for i:=1 to dva do
begin
rand:=random(2);//случайный 0 или 1
s:=s+IntToStr(rand);
end;
l:=length(s);//длина строки
{Отрубаем нолики из начала}
for i:=1 to l do
if s[1]='0' then
begin
Delete(s,1,1);
l:=l-1;
end
else
break;
{/Отрубили нолики из начала}
Writeln('Двоичное число:',s);
for i:=1 to l do //для каждого символа делаем
begin
dva:=StrToInt(s[i]);//записываем текущую цифру
step:=l-i;//степень
if dva>0 then //для 1 делаем
begin
for n:=1 to step do
dva:=dva*2; //1*2^step
delo:=delo+dva;//складываем
end;
end;
2: Write('Переведите его в десятичную систему счисления:');
read(desP);
if desP=delo then
writeln('Правильно!')
else
begin
writeln('Не правильно, попробуйте еще');
goto 2;
end;
end
else
writeln('Некоректный выбор');
end.