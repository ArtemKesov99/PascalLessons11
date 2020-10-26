var
    a,b: integer;
 
begin
    randomize;
    a := random(100);
 
    while a <> b do begin
        write('Введи число: ');
        readln(b);
        if b > a then
            writeln('Много')
        else
            if b < a then
                writeln('Мало')
            else
                writeln('Угадал');
    end;
 
readln
end.