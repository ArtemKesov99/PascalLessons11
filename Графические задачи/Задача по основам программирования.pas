var
a:integer;
p,d:real;
t:real;
begin
writeln('введите цену,количество товара,скидку');
read(a,p,d);
t:=(a*p)-(a*p/100*d);
writeln('T=',T);
end.
