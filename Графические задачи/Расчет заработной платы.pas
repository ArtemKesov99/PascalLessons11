const
Rate=40; Bonus=300; TaxRate=0.186;
var
s, h, i: Integer;
begin
Write('Ежедневная почасовая отработка за 5 дней: ');
for i:=1 to 5 do begin
Read(h); s:=s+Rate*h+Bonus*Ord(h>8);
end; ReadLn;
WriteLn('Начислено: $',s,' Налог: $',s*TaxRate:0:2,' К выдаче: $',s*(1-TaxRate):0:2);
end.