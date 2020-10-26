var
    n: longint;
    max: byte;
begin
    readln(n);
    if n < 0 then n := abs(n);
    max := 0;
    if n > 0 then 
        while n > 0 do begin
            if n mod 10 > max then
                max := n mod 10;
            n := n div 10;
        end;
    writeln(max);
end.