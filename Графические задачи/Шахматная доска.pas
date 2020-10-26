uses GraphWPF;
const 
  n = 8;
  sz = 50;
type 
  ChessBoard = class
  private
    a: array [,] of boolean := new boolean[n,n];
    procedure setCell(x,y: integer; value: boolean);
    begin
      if value then
        Brush.Color := Colors.White
      else Brush.Color := Colors.Gray;
      FillRectangle((x-1)*sz+1,(y-1)*sz+1,sz,sz);
      a[x-1,y-1] := value;
    end;
    function getCell(x,y: integer) := a[x-1,y-1];
  public
    property Cells[x,y: integer]: boolean read getCell write setCell; default;
end;

var c: ChessBoard := new ChessBoard;

begin
  for var x:=1 to n do
  for var y:=1 to n do
    c[x,y] := Odd(x+y); 
end.
