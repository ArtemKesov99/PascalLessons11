var m,p:set of byte;
i,min:byte;
begin
m:=[2..255];
p:=[];
repeat
min:=255;
for i:=2 to 255 do
if (i in m)and(i<min)then min:=i;
for i:=2 to 255 do
if (i in m)and(i mod min=0) then m:=m-[i];
p:=p+[min];
until m=[];
writeln('Простые числа от 2 до 255');
for i:=2 to 255 do
if i in p then write(i:4);
end.