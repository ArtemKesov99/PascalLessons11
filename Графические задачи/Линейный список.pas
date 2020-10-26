program linked_list;
const n = 5;
type pnode = ^node;
node = record                                             { элемент списка }
d : word; 
s : string;
p : pnode;
end;
var beg    : pnode;                                { указатель на начало списка }
i, key : word;
s      : string;
option : word;
const text: array [1 .. n] of string = ('one', 'two', 'three', 'four', 'five');
{ -------------- добавление элемента в конец списка --------------------------- }
procedure add(var beg : pnode; d : word; const s : string);
var p : pnode;                               { указатель на создаваемый элемент }
t : pnode;                                 { указатель для просмотра списка }
begin
new(p);                                                 { создание элемента }
p^.d := d; p^.s := s;                                 { заполнение элемента }
p^.p := nil;
if beg = nil then beg := p                                { список был пуст }
else begin                                                 { список не пуст }
t := beg;
while t^.p <> nil do                        { проход по списку до конца }
t := t^.p;            
t^.p := p;                      { привязка нового элемента к последнему }
end
end;
{ ------------------------- поиск элемента по ключу --------------------------- }
function find(beg : pnode; key : word; var p, pp : pnode) : boolean;
begin
p := beg;
while p <> nil do begin                                                 { 1 }
if p^.d = key then begin                                            { 2 }
find := true; exit end;
pp := p;                                                            { 3 }
p := p^.p;                                                          { 4 }
end;
find := false;
end;
{ -------------------------------- вставка элемента --------------------------- }
procedure insert(beg : pnode; key, d : word; const s : string);
var p    : pnode;                            { указатель на создаваемый элемент }
pkey : pnode;                                { указатель на искомый элемент }
pp   : pnode;                             { указатель на предыдущий элемент }
begin
if not find(beg, key, pkey, pp) then begin
writeln(' вставка не выполнена'); exit; end;
new(p);                                                                 { 1 }
p^.d := d; p^.s := s;                                                   { 2 }
p^.p := pkey^.p;                                                        { 3 }
pkey^.p := p;                                                           { 4 }
end;
{ ------------------------------- удаление элемента --------------------------- }
procedure del(var beg : pnode; key : word);
var p  : pnode;         { указатель на удаляемый элемент }
pp : pnode;         { указатель на предыдущий элемент }
begin
if not find(beg, key, p, pp) then begin 
writeln(' удаление не выполнено'); exit; end; 
if p = beg then beg := beg^.p                   { удаление первого элемента }
else pp^.p := p^.p;
dispose(p);
end;
{ ------------------------------------ вывод списка --------------------------- }
procedure print(beg : pnode);
var p : pnode;                                 { указатель для просмотра списка }
begin
p := beg;
while p <> nil do begin                                    { цикл по списку }
writeln(p^.d:3, p^.s);                                 { вывод элемента }
p := p^.p                        { переход к следующему элементу списка }
end;
end;
{ ------------------------------- главная программа --------------------------- }
begin
for i := 1 to 5 do add(beg, i, text[i]);
while true do begin 
writeln('1 - вставка, 2 - удаление, 3 - вывод, 4 - выход');
readln(option);
case option of
1: begin                                                  { вставка }
writeln('Ключ для вставки?');
readln(key);
writeln('Вставляемый элемент?');
readln(i); readln(s);
insert(beg, key, i, s);
end;
2: begin                                                 { удаление }
writeln('Ключ для удаления?');   
readln(key);
del(beg, key);
end;
3: begin                                                    { вывод }
writeln('Вывод списка:');
print(beg);
end;
4: exit;                                                    { выход }
end;
writeln;
end
end.