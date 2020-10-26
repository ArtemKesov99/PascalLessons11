var
 a, b, c: byte;
 pa, pb, pc: byte;
 qty, sum: byte;
begin
qty := 30;
sum := 100;
pa := 10;
pb := 5;
    pc := 2;
    for a:=0 to (sum div pa) do
        for b:=0 to (sum div pb) do
            for c:=0 to (sum div pc) do
                if (pa*a + pb*b + pc*c = sum) and
                    (a + b + c = qty) then
                        writeln (a:3,b:3,c:3);
end.