program stack;
const n = 5;
type pnode = ^node;
node = record                                { элемент стека }
d : word;
s : string;
p : pnode;
end;
var  top : pnode;                    { указатель на вершину стека }
i   : word;
 s   : string;
const text : array [1 .. n] of string = ('one', 'two', 'three', 'four', 'five');
{ ------------------------------ занесение в стек --------------------------- }
function push(top : pnode; d : word; const s : string) : pnode;
var p : pnode;
begin
new(p);
p^.d := d; p^.s := s;  p^.p := top;
push := p;
end;
{ ------------------------------ выборка из стека --------------------------- }
function pop(top : pnode; var d : word; var s : string) : pnode;
var p : pnode;
begin
d := top^.d; s := top^.s;
pop := top^.p;
dispose(top);
end;
{ ------------------------------- главная программа ----------------------------- }
begin
top := nil;
for i := 1 to n do top := push(top, i, text[i]);        { занесение в стек: }
while top <> nil do begin                               { выборка из стека: }
top := pop(top, i, s);     writeln(i:2, s);
end;
end.