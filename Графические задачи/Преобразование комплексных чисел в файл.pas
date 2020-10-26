uses crt;
type kompl=record
nm:integer;
re,im:real;
end;
procedure Vyvod(z:kompl);{процедура вывода чисел в заданном виде}
var s,s1:string;
begin
str(z.nm,s);
s:=s+' ';
str(z.re:0:1,s1);
s:=s+s1;
str(z.im:0:1,s1);
if z.im<0 then s:=s+s1+'i'
else s:=s+'+'+s1+'i';
writeln(s);
end;
var f:file of kompl;
z:kompl;
n,i,j,k:integer;
begin
clrscr;
assign(f,'complex');
rewrite(f);
writeln('Сколько чисел записать в файл n=');
readln(n);
for i:=1 to n do
begin
writeln('Число ',i);
with z do
begin
write('Действительная часть=');
readln(z.re);
write('Мнимая часть=');
readln(z.im);
z.nm:=i;{номера даем по порядку, хотя это и не обязательно}
write(f,z);
end;
end;
clrscr;
writeln('Содержание исходного файла:');
reset(f);
while not eof(f) do
begin
read(f,z);
Vyvod(z);
end;
writeln('Сколько чисел добавить n=');
readln(n);
k:=filesize(f);{уже есть столько}
for i:=1 to n do
begin
writeln('Число ',i);
with z do
begin
write('Действительная часть=');
readln(z.re);
write('Мнимая часть=');
readln(z.im);
z.nm:=k+i;
seek(f,filesize(f)); {дописываем в конец}
write(f,z);
end;
end;
clrscr;
seek(f,0);{возвращаемся в начало}
writeln('Содержание файла после добавления:');
while not eof(f) do
begin
read(f,z);
Vyvod(z);
end;
seek(f,0);{опять в начало, будем удалять}
i:=0;
k:=0;{количество удалений}
while i<filesize(f)-2-k do{пока не останется одно проверенное значение}
begin
seek(f,i);
read(f,z);
if z.nm mod 2=0 then{если номер четный}
begin
k:=k+1;{считаем}
for j:=i to filesize(f)-2 do{сдвигаем все что ниже на 1 вверх}
begin
seek(f,j+1);
read(f,z);
seek(f,j);
write(f,z);
end;
end
else i:=i+1; {иначе дальше}
end;
seek(f,filesize(f)-1-k);{проверим последнее не проверенное}
read(f,z);
if z.nm mod 2=0 then k:=k+1;{если четный, добавим}
seek(f,filesize(f)-k);{отступаем на количество четных от конца}
truncate(f);{и обрезаем файл}
seek(f,0);
writeln('Содержание файла после удаления четных номеров:');
while not eof(f) do
begin
read(f,z);
Vyvod(z);
end;
close(f);
readln
end.