var
    i,j,k,sum, N,S: word;
 
begin
    write('Предел для перебираемых чисел: ');
    readln(N);
    write('Искомая сумма: ');
    readln(S);
    for i:=1 to N do 
        for j:=1 to N do
            for k:=1 to N do begin
                sum := i + j + k;
                if sum = S then
                    writeln(i,' ',j,' ',k);
            end;
end.