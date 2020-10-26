type
complex=record
re,im:real;
end;
function modul(z:complex):real;
begin
modul := sqrt(sqr(z.re)+sqr(z.im));
end;
function argument(z:complex):real;
begin
if(z.re=0) and (z.im=0) then
argument := 0
else if(z.re=0) and (z.im<0) then
argument := 3*pi/2
else if(z.re=0) and (z.im>0) then
argument := pi/2
else if (z.re>0) then
argument := arctan(z.im/z.re)+pi
else if (z.re>0) and (z.im<0) then
argument:=arctan(z.im/z.re)+2*pi;
end;
procedure vyvod(z:complex);
begin
writeln(z.re:0:2);
if z.im>0 then
writeln('+',z.im:0:2,'i')
else writeln(z.im:0:2,'i');
end;
var f:file of complex;
z,zmnm,zmna,zmx,zmxa:complex;
mnm,mna,mxm,mxa:real;
n,i:integer;
begin
assign(f,fname);
rewrite(f);
writeln('Сколько чисел записать в файл n=');
readln(n);
for i:=1 to n do
begin
writeln('Введите действительную часть re=');
 readln(z.re);
  write('Введите мнимую часть im=');
  readln(z.im);
  write(f,z);
 end;
clrscr;
reset(f);
writeln('Содержание файла:');
read(f,z);
vyvod(z);
mnm:=modul(z);
mna:=argument(z);
mxm:=modul(z);
mxa:=argument(z);
zmnm:=z;
zmna:=z;
zmxm:=z;
zmxa:=z;
while not eof(f) do
 begin
  read(f,z);
  vyvod(z);
  if modul(z)<mnm then
   begin
    mnm:=modul(z);
    zmnm:=z;
   end;
  if argument(z)<mna then
   begin
    mna:=argument(z);
    zmna:=z;
   end;
  if modul(z)>mxm then
   begin
    mxm:=modul(z);
    zmxm:=z;
   end;
  if argument(z)>mxa then
   begin
    mxa:=argument(z);
    zmxa:=z;
   end;
 end;
close(f);
write('Число с минимальным модулем=');
vyvod(zmnm);
write('Число с минимальным аргументом=');
vyvod(zmna);
write('Число с максимальным модулем=');
vyvod(zmxm);
write('Число с максимальным аргументом=');
vyvod(zmxa);
readln
end.