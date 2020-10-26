uses GraphAbc, Events;
const
MaxLength = 14 * 14;
a = 30;
AppleA = 10;
WindowSize = a * 14;
var
Life, LockKey: boolean;
Direction: 1..4; {Направление кусочка змейки 1 - лево, 2 - право, 3 - верх, 4 - низ}
CordBlock: array [1..MaxLength + 1, 1..2] of integer;
Amount: 1..MaxLength;// Размер змейки
AppleCord: array [1..2] of integer;// Кординаты яблока
//Рисует квадрат с центром (x, y) и стороной а
procedure Sqare(x, y, a: integer);
begin
Rectangle(x - (a div 2), y + (a div 2), x + (a div 2), y - (a div 2));
end;
//Рисует красный квадрат с центром (x, y) и стороной а
procedure RedSqare(x, y, a: integer);
begin
setbrushcolor(clRed);
FillRectangle(x - (a div 2), y + (a div 2), x + (a div 2), y - (a div 2));
setbrushcolor(clWhite);
end;
//Рисует белый квадрат с центром (x, y) и стороной а
procedure FillSqare(x, y, a: integer);
begin
FillRectangle(x - (a div 2), y + (a div 2), x + (a div 2), y - (a div 2));
end;
// Нажатие кнопки
procedure KeyDown(key: integer);
begin
if (not LockKey) then
case Direction of
1: 
case key of
38: Direction := 3;
40: Direction := 4;
end;
2: 
case key of
38: Direction := 3;
40: Direction := 4;
end;
3: 
case key of
37: Direction := 1;
39: Direction := 2;
end;
4: 
case key of
37: Direction := 1;
39: Direction := 2;
end;
end;
LockKey := true;
end;
//Дает кроординаты яблоку
procedure Apple;
label start;
var
i: integer;
begin
start:
AppleCord[1] := Random(2, (WindowSize div a) - 1) * a;
AppleCord[2] := Random(2, (WindowSize div a) - 1) * a;
for i := 1 to Amount do
if (AppleCord[1] = CordBlock[i, 1]) and (AppleCord[2] = CordBlock[i, 2]) then
goto start;
end;
//Здесь задаются все начальные значения
procedure StartValue;
var
i: integer;
begin
SetWindowSize(WindowSize + 50, WindowSize);
Amount := 3;
Life := true;
Direction := 1;
for i := 1 to Amount do
begin
CordBlock[i, 1] := (i * a) + 210;
CordBlock[i, 2] := (WindowSize div a) * (a div 2);
end;
Apple;
end;
//Подсчёт координат
procedure Count;
var
i: byte;
C1, C2: array [1..2] of integer;
begin
//Проверка на врезание в самого себя
for i := 2 to Amount do
if (CordBlock[1, 1] = CordBlock[i, 1]) and (CordBlock[1, 2] = CordBlock[i, 2]) then
Life := false;
C1[1] := CordBlock[1, 1];
C1[2] := CordBlock[1, 2];
case Direction of {Смещение головы змейки}
1: {лево}CordBlock[1, 1] -= a;
2: {право}CordBlock[1, 1] += a;
3: {верх}CordBlock[1, 2] -= a;
4: {низ}CordBlock[1, 2] += a; 
end;
//Проверка на сьедание яблока
if (CordBlock[1, 1] = AppleCord[1]) and (CordBlock[1, 2] = AppleCord[2]) then
begin
Apple;
if (Amount < MaxLength) then
Amount += 1;
end;
//Проверка на выход за границы поля
if (CordBlock[1, 1] > WindowSize) then
CordBlock[1, 1] := 0;
if (CordBlock[1, 1] < 0) then
CordBlock[1, 1] := WindowSize;
if (CordBlock[1, 2] > WindowSize) then
CordBlock[1, 2] := 0;
if (CordBlock[1, 2] < 0) then
CordBlock[1, 2] := WindowSize;  
//Смещение остальных частей змейки..
for i := 2 to Amount + 1 do
begin
C2[1] := CordBlock[i, 1];
C2[2] := CordBlock[i, 2];
CordBlock[i, 1] := C1[1];
CordBlock[i, 2] := C1[2];
C1[1] := C2[1];
C1[2] := C2[2];
end;
end;
//Рисовка окна
procedure DrawWindow;
var
i: byte;
begin
Line(WindowSize, 0, WindowSize, WindowSize);
TextOut(WindowSize + 10, 10, Amount);
//Очищение хвоста и головы
FillSqare(CordBlock[Amount + 1, 1], CordBlock[Amount + 1, 2], a);
FillSqare(CordBlock[2, 1], CordBlock[2, 2], a);
//Рисовка головы и части перед ней
Sqare(CordBlock[1, 1], CordBlock[1, 2], a);
Sqare(CordBlock[2, 1], CordBlock[2, 2], a);
//Рисовка глаз
case Direction of
1:
begin
Sqare(CordBlock[1, 1] - (a div 4), CordBlock[1, 2] + (a div 4), a div 3);
Sqare(CordBlock[1, 1] - (a div 4), CordBlock[1, 2] - (a div 4), a div 3);
end;
2:
begin
Sqare(CordBlock[1, 1] + (a div 4), CordBlock[1, 2] + (a div 4), a div 3);
Sqare(CordBlock[1, 1] + (a div 4), CordBlock[1, 2] - (a div 4), a div 3);
end;
3:
begin
Sqare(CordBlock[1, 1] - (a div 4), CordBlock[1, 2] - (a div 4), a div 3);
Sqare(CordBlock[1, 1] + (a div 4), CordBlock[1, 2] - (a div 4), a div 3);
end;
4:
begin
Sqare(CordBlock[1, 1] + (a div 4), CordBlock[1, 2] + (a div 4), a div 3);
Sqare(CordBlock[1, 1] - (a div 4), CordBlock[1, 2] + (a div 4), a div 3);
end;
end;
//Рисовка еды для змейки
RedSqare(AppleCord[1], AppleCord[2], AppleA);
end;
begin
StartValue;
OnKeyDown := KeyDown;
while Life do
begin
DrawWindow;
sleep(105);
Count;
LockKey := False;
end;
end.