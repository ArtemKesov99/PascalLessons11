Type
  MN = set of 0..9;
Var
  digit, m, u, h, a : 0..9;
  i, n1, n2 : Integer;
  S1, S2 : MN;
  f : boolean;
Procedure Print(x, y : Integer);
Begin
  write(x);
  write(' + ');
  write(x);
  write(' = ');
  writeln(y);
  writeln;
End;
Begin
  S1 := [ ];
  for m := 1 to 4 do
    begin
      S1 := S1+[m];
      for u := 0 to 9 do
        if Not(u in S1)
          then
            begin
              S1 := S1+[u];
              for h := 0 to 9 do
                if Not (h in S1)
                  then
                    begin
                      S1 := S1+[h];
                        for a := 1 to 9 do
                          if Not (a in S1)
                            then
                              begin
                                S1 := S1+[a];
                                n1 := 1000*m+100*u+10*h+a; {число MUHA}
                                n2 := 2*n1; {число SLON}
                                f := true;  {все цифры в числе SLON - разные}
                                S2 := [ ];
                                for i := 1 to 4 do
                                  begin
                                    digit := n2 mod 10; {выделяем цифру числа SLON}
                                    n2 := n2 div 10;
                                    f := f and not (digit in s2); {цифра повторяется?}
                                    S2 := [digit] + S2;
                                  end;
                                if (S1*S2=[ ]) and f {если все цифры в примере разные}
                                  then
                                    Print (n1, 2 * n1);
                                S1 := S1-[a];
                              end;
                     S1 := S1-[h];
                end;
            S1 := S1-[u];
        end;
      S1 := S1-[m];
    end;
  Readln;
End.