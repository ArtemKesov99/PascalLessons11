uses CRT,GraphABC;
var
ax,ay,vx,vy,bx,by: integer;
A: array [1..80,1..24] of char;
procedure CleanA;
var i,j: integer;
begin
for j := 1 to 24 do
for i := 1 to 80 do
A[i,j] := ' '
end;
procedure Horiz(x,y,L: integer);
var i: integer;
begin
for i := x to x+L-1 do
A[i,y] := '+'
end;
procedure Vert(x,y,L: integer);
var j: integer;
begin
for j := y to y+L-1 do
A[x,j] := '+'
end;
procedure MinimalFill;
begin
CleanA;
Horiz(1,1,80);
Horiz(1,24,80);
Vert(1,2,22);
Vert(80,2,22);
end;
procedure Fill;
begin
Horiz(49,9,31);
Horiz(49,14,31);
end;
procedure DrawScreen;
var i,j: integer;
begin
MinimalFill;
Fill;
ClrScr;
for j := 1 to 24 do
for i := 1 to 80 do
write(A[i,j])
end;
function Stuck: boolean;
begin
if (A[ax+1,ay]<>' ') or (A[ax,ay+1]<>' ') or (A[ax+1,ay+1]<>' ') or (A[ax-1,ay]<>' ') or (A[ax,ay-1]<>' ') or (A[ax-1,ay-1]<>' ')
then Stuck:= True
else Stuck:= False
end;
procedure Stop;
begin
if A[ax+vx,ay]<>' ' then vx := 0;
if A[ax,ay+vy]<>' ' then vy := 0;
if (A[ax+vx,ay]=' ') and (A[ax,ay+vy]=' ') and (A[ax+vx,ay+vy]<>' ') then
begin
vx := 0;
vy := 0;
end;
end;
procedure Show;
begin
GotoXY(ax,ay);
write('B');
end;
procedure Hide;
begin
GotoXY(bx,by);
write(' ');
end;
procedure SetCoords (x,y: integer);
begin
ax := x;
ay := y
end;
procedure SetVeloc (vx0,vy0: integer);
begin
vx := vx0;
vy := vy0
end;
procedure MoveTo (x,y: integer);
begin
hide;
SetCoords(x,y);
show;
end;
procedure MoveOn (dx,dy: integer);
begin
bx:=ax;
by:=ay;
MoveTo(ax+dx,ay+dy);
end;
BEGIN
SetWindowCaption('Game');
clrscr;
HideCursor;
DrawScreen;
TextColor(Yellow);
Setcoords(70,13);
Show;
repeat
begin
Setveloc(0,0);
case ReadKey of
{ëåâàÿ} #77: vx:=-1;
{ïðàâàÿ} #75: vx:=1;
{âåðõíÿÿ} #72: vy:=-1;
{íèæíÿÿ} #80: vy:=1;
end;
end;
if Stuck then Stop;
moveon(vx,vy);
until False;
END.