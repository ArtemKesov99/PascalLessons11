var
	a, b: integer;
begin
	write('A: '); readln(a);
	write('B: '); readln(b);
	if a < b then
		for a := a to b do 
			writeln (a * a * a);
readln;
end.