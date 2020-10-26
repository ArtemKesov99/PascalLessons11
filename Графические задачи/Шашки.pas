uses crt;
 
 
type
  Matrix = array[1..6, 1..8] of integer;
  arr = array[1..20] of integer;
 
 
 
var
  doska: Matrix;
  dostypxod: arr;
  kr: arr;
  x, j, p, d, kb, kch, kdb, kdch, chx, r: integer;
 
function obnul_Voz_xod(): integer;
var
  s: integer;
begin
  for s := 1 to 20 do
    dostypxod[s] := 0;
  kr[s] := 0;
  
end;
 
function xodhistort(): integer;
begin
 
end;
 
function damka_kreat(): integer;
var
  k, b: integer;
begin
  for k := 1 to 6 do 
  begin
    for b := 1 to 8 do
    begin
      if (k = 1) and ((b = 1) or (b = 3) or (b = 5) or (b = 7)) and (doska[k, b] = 1)
        then doska[k, b] := 3;
      if (k = 6) and ((b = 2) or (b = 4) or (b = 6) or (b = 8)) and (doska[k, b] = 2)
        then doska[k, b] := 4;
    end;
  end;
end;
 
function proverka_xoda_verx_pravo_op(k, b: integer): integer;//только для 1
begin
  if (doska[k, b] = chx) and (k > 1) and (b < 8) and (chx = 1) 
        then
  begin
    if (doska[k - 1, b + 1] = 0)
    then begin
      x := x + 1;
      dostypxod[x] := k * 1000 + b * 100 + (k - 1) * 10 + b + 1;  
    end; 
  end;  
end;
 
function proverka_xoda_verx_levo_op(k, b: integer): integer;//только для 1
begin
  if (doska[k, b] = chx) and (k > 1) and (b > 1) and (chx = 1)
        then
  begin
    if (doska[k - 1, b - 1] = 0)
    then begin
      x := x + 1;
      dostypxod[x] := k * 1000 + b * 100 + (k - 1) * 10 + b - 1;  
    end; 
  end; 
end;
 
function proverka_xoda_vniz_pravo_op(k, b: integer): integer;//только для 2
begin
  if (doska[k, b] = chx) and (k < 6) and (b < 8) and (chx = 2) 
        then
  begin
    if (doska[k + 1, b + 1] = 0)
    then begin
      x := x + 1;
      dostypxod[x] := k * 1000 + b * 100 + (k + 1) * 10 + b + 1;  
    end; 
  end;  
end;
 
function proverka_xoda_vniz_levo_op(k, b: integer): integer;//только для 2
begin
  if (doska[k, b] = chx) and (k < 6) and (b > 1) and (chx = 2)
        then
  begin
    if (doska[k + 1, b - 1] = 0)
    then begin
      x := x + 1;
      dostypxod[x] := k * 1000 + b * 100 + (k + 1) * 10 + b - 1;  
    end; 
  end; 
end;
//проверка хода для дамки
 
 
function proverka_xoda_verx_pravo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k > 1) and (b < 8) and (r = 0)
        then
  begin
    
    if (doska[k - 1, b + 1] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 1) * 10 + b + 1;  
    end;
    
    if (k - 2 > 0) and (b + 2 < 9) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 2) * 10 + b + 2;   
    end;
    
    if (k - 3 > 0) and (b + 3 < 9) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0) and (doska[k - 3, b + 3] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 3) * 10 + b + 3;   
    end;
    
    if (k - 4 > 0) and (b + 4 < 9) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 4) * 10 + b + 4;   
    end;
    
    if (k - 5 > 0) and (b + 5 < 9) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0) and (doska[k - 5, b + 5] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 5) * 10 + b + 5;   
    end;
  end;  
end;
 
function proverka_xoda_verx_levo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k > 1) and (b > 1) and (r = 0)
        then
  begin
    
    if (doska[k - 1, b - 1] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 1) * 10 + b - 1;  
    end;
    
    if (k - 2 > 0) and (b - 2 > 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 2) * 10 + b - 2;   
    end;
    
    if (k - 3 > 0) and (b - 3 > 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0) and (doska[k - 3, b - 3] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 3) * 10 + b - 3;   
    end;
    
    if (k - 4 > 0) and (b - 4 > 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 4) * 10 + b - 4;   
    end;
    
    if (k - 5 > 0) and (b - 5 > 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0) and (doska[k - 5, b - 5] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k - 5) * 10 + b - 5;   
    end;
  end;  
end;
 
function proverka_xoda_vniz_levo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k < 6) and (b > 1) and (r = 0)
        then
  begin
    
    if (doska[k + 1, b - 1] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 1) * 10 + b - 1;  
    end;
    
    if (k + 2 < 7) and (b - 2 > 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 2) * 10 + b - 2;   
    end;
    
    if (k + 3 < 7) and (b - 3 > 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0) and (doska[k + 3, b - 3] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 3) * 10 + b - 3;   
    end;
    
    if (k + 4 < 7) and (b - 4 > 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4;   
    end;
    
    if (k + 5 < 7) and (b - 5 > 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0) and (doska[k + 5, b - 5] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 5) * 10 + b - 5;   
    end;
  end;  
end;
 
function proverka_xoda_vniz_pravo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k < 6) and (b < 8) and (r = 0)
        then
  begin
    
    if (doska[k + 1, b + 1] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 1) * 10 + b + 1;  
    end;
    
    if (k + 2 < 7) and (b + 2 < 9) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 2) * 10 + b + 2;   
    end;
    
    if (k + 3 < 7) and (b + 3 < 9) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0) and (doska[k + 3, b + 3] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 3) * 10 + b + 3;   
    end;
    
    if (k + 4 < 7) and (b + 4 < 9) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0) 
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 4) * 10 + b + 4;   
    end;
    
    if (k + 5 < 7) and (b + 5 < 9) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0) and (doska[k + 5, b + 5] = 0)
    then begin
      x := x + 1;    
      dostypxod[x] := k * 1000 + b * 100 + (k + 5) * 10 + b + 5;   
    end;
  end;  
end;
//проверка хода для дамки конец
 
 
 
 
// Рубка обычными шашками
function proverka_rubki_vniz_pravo_op(k, b: integer): integer;
begin
  if (doska[k, b] = chx) and (k < 5) and (b < 7)
        then
  begin
    if ((doska[k + 1, b + 1] <> chx + 2) and (doska[k + 1, b + 1] <> chx)) and (doska[k + 1, b + 1] <> 0) and (doska[k + 2, b + 2] = 0)  
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;
      kr[r] := (k + 1) * 10 + b + 1;
      dostypxod[r] := k * 1000 + b * 100 + (k + 2) * 10 + b + 2;  
    end;  
  end;
end;
 
 
function proverka_rubki_vniz_levo_op(k, b: integer): integer;
begin
  if (doska[k, b] = chx) and (k < 5) and (b > 2)
        then
  begin
    
    if ((doska[k + 1, b - 1] <> chx + 2) and (doska[k + 1, b - 1] <> chx)) and (doska[k + 1, b - 1] <> 0) and (doska[k + 2, b - 2] = 0)  
    then begin
      
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;
      dostypxod[r] := k * 1000 + b * 100 + (k + 2) * 10 + b - 2; 
      kr[r] := (k + 1) * 10 + b - 1;
    end;  
  end;
end;
 
 
function proverka_rubki_verx_levo_op(k, b: integer): integer;
begin
  if (doska[k, b] = chx) and (k > 2) and (b > 2)
        then
  begin
    if ((doska[k - 1, b - 1] <> chx + 2) and (doska[k - 1, b - 1] <> chx)) and (doska[k - 1, b - 1] <> 0) and (doska[k - 2, b - 2] = 0)  
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;        
      dostypxod[r] := k * 1000 + b * 100 + (k - 2) * 10 + b - 2; 
      kr[r] := (k - 1) * 10 + b - 1;
    end;  
  end;
end;
 
function proverka_rubki_verx_pravo_op(k, b: integer): integer;
begin
  if (doska[k, b] = chx) and (k > 2) and (b < 7)
        then
  begin
    if ((doska[k - 1, b + 1] <> chx + 2) and (doska[k - 1, b + 1] <> chx)) and (doska[k - 1, b + 1] <> 0) and (doska[k - 2, b + 2] = 0)  
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;    
      dostypxod[r] := k * 1000 + b * 100 + (k - 2) * 10 + b + 2;
      kr[r] := (k - 1) * 10 + b + 1;
    end;  
  end;
end;
 
// Рубка обычными шашками конец
 
 
// Рубка дамкой 
function proverka_rubki_vniz_pravo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k < 5) and (b < 7)
        then
  begin
    
    if (((doska[k + 1, b + 1] <> chx + 2) and (doska[k + 1, b + 1] <> chx)) and (doska[k + 1, b + 1] <> chx) and (doska[k + 1, b + 1] <> 0) and (doska[k + 2, b + 2] = 0)) 
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 2) * 10 + b + 2;
      kr[r] := (k + 1) * 10 + b + 1;
      if (k + 3 < 7) and (b + 3 < 9) and (doska[k + 3, b + 3] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 3) * 10 + b + 3; end;
      
      if (k + 4 < 7) and (b + 4 < 9) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b + 4; end;
      
      if (k + 5 < 7) and (b + 5 < 9) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0) and (doska[k + 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b + 5; end;
    end;
    
    if (k + 3 < 7) and (b + 3 < 9) and (((doska[k + 2, b + 2] <> chx + 2) and (doska[k + 2, b + 2] <> chx)) and (doska[k + 2, b + 2] <> 0) and (doska[k + 3, b + 3] = 0) and (doska[k + 1, b + 1] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 3) * 10 + b + 3;  
      kr[r] := (k + 2) * 10 + b + 2;
      if (k + 4 < 7) and (b + 4 < 9) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b + 4; end;
      
      if (k + 5 < 7) and (b + 5 < 9) and (doska[k + 3, b + 3] = 0) and (doska[k + 4, b + 4] = 0) and (doska[k + 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b + 5; end;
    end;
    
    if (k + 4 < 7) and (b + 4 < 9) and (((doska[k + 3, b + 3] <> chx + 2) and (doska[k + 3, b + 3] <> chx)) and (doska[k + 3, b + 3] <> 0) and (doska[k + 4, b + 4] = 0) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b + 4;  
      kr[r] := (k + 3) * 10 + b + 3;
      if (k + 5 < 7) and (b + 5 < 9) and (doska[k + 4, b + 4] = 0) and (doska[k + 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b + 5; end;
    end;
    
    if (k + 5 < 7) and (b + 5 < 9) and (((doska[k + 4, b + 4] <> chx + 2) and (doska[k + 4, b + 4] <> chx)) and (doska[k + 4, b + 4] <> 0) and (doska[k + 5, b + 5] = 0) and (doska[k + 1, b + 1] = 0) and (doska[k + 2, b + 2] = 0) and (doska[k + 3, b + 3] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b + 5;  
      kr[r] := (k + 5) * 10 + b + 5;
    end;
    
    
  end;  
end;
 
 
function proverka_rubki_vniz_levo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k < 5) and (b > 2)
        then
  begin
    
    if (((doska[k + 1, b - 1] <> chx + 2) and (doska[k + 1, b - 1] <> chx)) and (doska[k + 1, b - 1] <> chx) and (doska[k + 1, b - 1] <> 0) and (doska[k + 2, b - 2] = 0)) 
    then begin
      
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 2) * 10 + b - 2;
      kr[r] := (k + 1) * 10 + b - 1;
      if (k + 3 < 7) and (b - 3 > 0) and (doska[k + 3, b - 3] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 3) * 10 + b - 3; end;
      
      if (k + 4 < 7) and (b - 4 > 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4; end; 
      
      if (k + 5 < 7) and (b - 5 > 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0) and (doska[k + 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4; end; 
      
      
    end;
    
    if (k + 3 < 7) and (b - 3 > 0) and (((doska[k + 2, b - 2] <> chx + 2) and (doska[k + 2, b - 2] <> chx)) and (doska[k + 2, b - 2] <> 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 1, b - 1] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 3) * 10 + b - 3; 
      kr[r] := (k + 2) * 10 + b - 2;
      if (k + 4 < 7) and (b - 4 > 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4; end; 
      
      if (k + 5 < 7) and (b - 5 > 0) and (doska[k + 3, b - 3] = 0) and (doska[k + 4, b - 4] = 0) and (doska[k + 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4; end;      
      
      
    end;
    
    if (k + 4 < 7) and (b - 4 > 0) and (((doska[k + 3, b - 3] <> chx + 2) and (doska[k + 3, b - 3] <> chx)) and (doska[k + 3, b - 3] <> 0) and (doska[k + 4, b - 4] = 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 4) * 10 + b - 4;     
      kr[r] := (k + 4) * 10 + b - 4;
      if (k + 5 < 7) and (b - 5 > 0) and (doska[k + 4, b - 4] = 0) and (doska[k + 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b - 5; end;  
    end;
    
    if (k + 5 < 7) and (b - 5 > 0) and (((doska[k + 4, b - 4] <> chx + 2) and (doska[k + 4, b - 4] <> chx)) and (doska[k + 4, b - 4] <> 0) and (doska[k + 5, b - 5] = 0) and (doska[k + 1, b - 1] = 0) and (doska[k + 2, b - 2] = 0) and (doska[k + 3, b - 3] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k + 5) * 10 + b - 5;  
      kr[r] := (k + 4) * 10 + b - 4;
    end;
    
    
  end;  
end;
 
function proverka_rubki_verx_levo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k > 2) and (b > 2)
        then
  begin
    
    if (((doska[k - 1, b - 1] <> chx + 2) and (doska[k - 1, b - 1] <> chx)) and (doska[k - 1, b - 1] <> chx) and (doska[k - 1, b - 1] <> 0) and (doska[k - 2, b - 2] = 0)) 
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;
      
      dostypxod[r] := k * 1000 + b * 100 + (k - 2) * 10 + b - 2; 
      kr[r] := (k - 1) * 10 + b - 1;
      if (k - 3 > 0) and (b - 3 > 0) and (doska[k - 3, b - 3] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 3) * 10 + b - 3; end;
      
      if (k - 4 > 0) and (b - 4 > 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b - 4; end;
      
      if (k - 5 > 0) and (b - 5 > 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0) and (doska[k - 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b - 5; end;
    end;
    
    if (k - 3 > 0) and (b - 3 > 0) and (((doska[k - 2, b - 2] <> chx + 2) and (doska[k - 2, b - 2] <> chx)) and (doska[k - 2, b - 2] <> 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 1, b - 1] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 3) * 10 + b - 3;   
      kr[r] := (k - 2) * 10 + b - 2;
      if (k - 4 > 0) and (b - 4 > 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b - 4; end;
      
      if (k - 5 > 0) and (b - 5 > 0) and (doska[k - 3, b - 3] = 0) and (doska[k - 4, b - 4] = 0) and (doska[k - 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b - 5; end;
      
    end;
    
    
    if (k - 4 > 0) and (b - 4 > 0) and (((doska[k - 3, b - 3] <> chx + 2) and (doska[k - 3, b - 3] <> chx)) and (doska[k - 3, b - 3] <> 0) and (doska[k - 4, b - 4] = 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b - 4;  
      kr[r] := (k - 3) * 10 + b - 3;
      
      if (k - 5 > 0) and (b - 5 > 0) and (doska[k - 4, b - 4] = 0) and (doska[k - 5, b - 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b - 5; end;
      
    end;
    
    if (k - 5 > 0) and (b - 5 > 0) and (((doska[k - 4, b - 4] <> chx + 2) and (doska[k - 4, b - 4] <> chx)) and (doska[k - 4, b - 4] <> 0) and (doska[k - 5, b - 5] = 0) and (doska[k - 1, b - 1] = 0) and (doska[k - 2, b - 2] = 0) and (doska[k - 3, b - 3] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b - 5;  
      kr[r] := (k - 4) * 10 + b - 4;
    end;
    
    
  end;  
end;
 
function proverka_rubki_verx_pravo_d(k, b: integer): integer;
var
  i: integer;
begin
  
  if (doska[k, b] = chx + 2) and (k > 2) and (b < 7)
        then
  begin
    
    if (((doska[k - 1, b + 1] <> chx + 2) and (doska[k - 1, b + 1] <> chx)) and (doska[k - 1, b + 1] <> chx) and (doska[k - 1, b + 1] <> 0) and (doska[k - 2, b + 2] = 0)) 
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 2) * 10 + b + 2;  
      kr[r] := (k - 1) * 10 + b + 1;
      if (k - 3 > 0) and (b + 3 < 9) and (doska[k - 3, b + 3] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 3) * 10 + b + 3; end;
      
      if (k - 4 > 0) and (b + 4 < 9) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b + 4; end;
      
      if (k - 5 > 0) and (b + 5 < 9) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0) and (doska[k - 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b + 5; end;
      
    end;
    
    if (k - 3 > 0) and (b + 3 < 9) and (((doska[k - 2, b + 2] <> chx + 2) and (doska[k - 2, b + 2] <> chx)) and (doska[k - 2, b + 2] <> 0) and (doska[k - 3, b + 3] = 0) and (doska[k - 1, b + 1] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 3) * 10 + b + 3;
      kr[r] := (k - 2) * 10 + b + 2;
      if (k - 4 > 0) and (b + 4 < 9) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b + 4; end;
      
      if (k - 5 > 0) and (b + 5 < 9) and (doska[k - 3, b + 3] = 0) and (doska[k - 4, b + 4] = 0) and (doska[k - 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b + 5; end;
    end;
    
    if (k - 4 > 0) and (b + 4 < 9) and (((doska[k - 3, b + 3] <> chx + 2) and (doska[k - 3, b + 3] <> chx)) and (doska[k - 3, b + 3] <> 0) and (doska[k - 4, b + 4] = 0) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 4) * 10 + b + 4; 
      kr[r] := (k - 3) * 10 + b + 3;
      if (k - 5 > 0) and (b + 5 < 9) and (doska[k - 4, b + 4] = 0) and (doska[k - 5, b + 5] = 0)
      then begin r := r + 1;dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b + 5; end;
    end;
    
    if (k - 5 > 0) and (b + 5 < 9) and (((doska[k - 4, b + 4] <> chx + 2) and (doska[k - 4, b + 4] <> chx)) and (doska[k - 4, b + 4] <> 0) and (doska[k - 5, b + 5] = 0) and (doska[k - 1, b + 1] = 0) and (doska[k - 2, b + 2] = 0) and (doska[k - 3, b + 3] = 0))
    then begin
      if r = 0 
        then  obnul_Voz_xod();       
      r := r + 1;       
      dostypxod[r] := k * 1000 + b * 100 + (k - 5) * 10 + b + 5; 
      kr[r] := (k - 4) * 10 + b + 4;
    end;
    
    
  end;  
end;
// Рубка дамками конец
 
 
 
function vivod() : integer;
var
  k, b: integer;
begin
  clrscr;
  write('  1 2 3 4 5 6 7 8');
  writeln;
  for k := 1 to 6 do 
  begin
    write(k, ' ');
    for b := 1 to 8 do 
    begin
      write(doska[k, b], ' ');
    end;
    writeln;
  end;
end;
 
function proverkadvrubki(k, b: integer): integer;
 
begin
 
  proverka_rubki_vniz_pravo_op(k, b);
  proverka_rubki_vniz_levo_op(k, b);
  proverka_rubki_verx_levo_op(k, b);
  proverka_rubki_verx_pravo_op(k, b);
  proverka_rubki_vniz_pravo_d(k, b);
  proverka_rubki_vniz_levo_d(k, b);
  proverka_rubki_verx_levo_d(k, b);
  proverka_rubki_verx_pravo_d(k, b);      
end;
 
 
function proverkaxoda() : integer;
var
  k, b: integer;
begin
  obnul_Voz_xod();
  r := 0;
  x := 0;
  for k := 1 to 6 do 
  begin
    for b := 1 to 8 do 
    begin
      
      if r = 0 
        then
      begin
        proverka_xoda_verx_pravo_op(k, b);
        proverka_xoda_verx_levo_op(k, b);
        proverka_xoda_vniz_levo_op(k, b);
        proverka_xoda_vniz_pravo_op(k, b);
        proverka_xoda_verx_pravo_d(k, b);
        proverka_xoda_verx_levo_d(k, b);
        proverka_xoda_vniz_levo_d(k, b);
        proverka_xoda_vniz_pravo_d(k, b);
      end;  
      proverka_rubki_vniz_pravo_op(k, b);
      proverka_rubki_vniz_levo_op(k, b);
      proverka_rubki_verx_levo_op(k, b);
      proverka_rubki_verx_pravo_op(k, b);
      proverka_rubki_vniz_pravo_d(k, b);
      proverka_rubki_vniz_levo_d(k, b);
      proverka_rubki_verx_levo_d(k, b);
      proverka_rubki_verx_pravo_d(k, b);
    end;     
  end;
end;
 
function xod() : integer;
begin
  var p, g, l, k, b, y,m,n: integer;
  
  vivod();
  proverkaxoda();
  writeln;
  writeln(dostypxod);
  write('vvedite cordinati');
  readln(g);
  for l := 1 to 20 do
  begin
    
    if g = dostypxod[l]
    then  begin    
      p := doska[g div 1000, (g - (g div 1000) * 1000) div 100];      
      doska[g div 1000, (g - (g div 1000) * 1000) div 100] := 0;
      doska[(g - g div 100 * 100) div 10, g mod 10] := p;
      k := (g - g div 100 * 100) div 10;
      b := g mod 10;
       end;
    p := kr[l];
    if r > 0    
    then
    begin
      damka_kreat();
      doska[p div 10, p mod 10] := 0;
      r := 0;
      proverkadvrubki(k, b);
      
      
      if r > 0
        then xod();
    end;
  end;
  
end;
 
 
begin
  
  chx := 1;
  kb := 8;
  kch := 8;
  for j := 1 to 4 do 
  begin
    doska[1, j * 2 - 1] := 2;
    doska[2, j * 2] := 2;    
    doska[5, j * 2 - 1] := 1;
    doska[6, j * 2] := 1;    
  end;  
 
 
  repeat 
    if chx = 1
      then chx := chx + 1
    else chx := chx - 1;
    vivod();
    xod();
    readln;
    
  until (kb < 1) or (kch < 1);
end.