var x, xn: real;
begin
x := 1;
repeat
xn := x;
x := xn - (0.1 * sin(x) + x * x - 1) / (0.1 * cos(x) + 2 * x)
until abs(x - xn) < 1e-4;
write('x = ', x:0:4);
readln
end.