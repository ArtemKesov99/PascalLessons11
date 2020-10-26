uses GraphABC;
const
  N = 2;
  Z = '0';
  K = 'X';
  Size = 200;
  Border = 1;
  Sx = 1200;
  Sy = 70;

var
  Matrix: array [0..N, 0..N] of char;
  Player1: boolean;

procedure Draw();
  procedure DrawZ(i, j: integer);
  begin
    SetPenColor(clCyan);
    SetPenWidth(4);
    var size2 := Size div 2;
    DrawCircle((i + 1) * Size - size2, (j + 1) * Size - size2, Round(size2 * 0.7));
  end;
  
  procedure DrawK(i, j: integer);
    procedure RLine(x, y, x1, y1: real):=Line(Round(x), Round(y), Round(x1), Round(y1));

  begin
    SetPenColor(clPink);
    SetPenWidth(4);
    var size2 := Size div 2 * 0.3;
    var cx1 := i * Size + size2;
    var cy1 := j * Size + size2;
    var cx2 := (i + 1) * Size - size2;
    var cy2 := (j + 1) * Size - size2;
    RLine(cx1, cy1, cx2, cy2);
    RLine(cx1, cy2, cx2, cy1);
  end;

  begin
    ClearWindow(clBlack);
    if Player1 then SetWindowCaption('Ходит первый игрок') else SetWindowCaption('Ходит второй игрок');
    for var i := 0 to N do
      for var j := 0 to N do
      begin
        SetPenColor(clLightBlue);
        SetPenWidth(1);
        DrawRectangle(i * Size + Border, j * Size + Border, (i + 1) * Size - Border, (j + 1) * Size - Border);
        if Matrix[i, j] = Z then DrawZ(i, j)
        else if Matrix[i, j] = K then DrawK(i, j);
      end;
    Redraw();
  end;

function Won(c: char): boolean;
var
  count: byte;
begin
  Result := false;
  for var i := 0 to N do
  begin
    count := 0;
    for var j := 0 to N do
      if Matrix[i, j] = c then Inc(count);
    if count = 3 then Result := true;
  end;
  
  if not Result then
  begin
    for var i := 0 to N do
    begin
      count := 0;
      for var j := 0 to N do
        if Matrix[j, i] = c then Inc(count);
      if count = 3 then Result := true;
    end;
    
    if not Result then
    begin
      count := 0;
      for var i := 0 to N do
        if Matrix[i, i] = c then Inc(count);
      if count = 3 then Result := true;
      
      if not Result then
      begin
        count := 0;
        for var i := 0 to N do
          if Matrix[N - i, i] = c then Inc(count);
        if count = 3 then Result := true;
      end;
    end;
  end;
end;

function IsFull(): boolean;
begin
  Result := true;
  for var i := 0 to N do
    for var j := 0 to N do
      if (Matrix[i, j] <> Z) and (Matrix[i, j] <> K) then
      begin
        Result := false;
        break;
      end;
end;

procedure MouseDown(x, y, mb: integer);
  procedure ShowWinner(s: string; c: Color);
  begin
    SetWindowCaption('Результат игры');
    Sleep(2000);
    SetWindowSize(Sx, Sy);
    CenterWindow();
    ClearWindow(clBlack);
    
    SetFontSize(16);
    SetFontStyle(fsBold);
    SetFontColor(c);
    DrawTextCentered(0, 0, Sx, Sy, s);
    
    Redraw();
    Sleep(2000);
    Halt();
  end;

begin
  var i := x div Size;
  var j := y div Size;
  if (Matrix[i, j] <> Z) and (Matrix[i, j] <> K) then
  begin
    if Player1 then Matrix[i, j] := Z else Matrix[i, j] := K;
    Draw();
    
    var winnerExists := Won(Z) or Won(K);
    if winnerExists then
      if Player1 then ShowWinner('Игрок первый победил!', clLightBlue) else ShowWinner('Игрок второй победил!', clLightBlue);
    
    if IsFull() and not winnerExists then ShowWinner('Ничья!', clOrange);
    
    Player1 := not Player1;
  end;
end;

begin
  var Size2 := Size * 3;
  SetWindowIsFixedSize(true);
  SetWindowSize(Size2, Size2);
  CenterWindow();
  LockDrawing();
  
  Player1 := true;
  Draw();
  
  OnMouseDown := MouseDown;
end.