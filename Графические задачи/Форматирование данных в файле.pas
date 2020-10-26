uses Crt;
function EditString(s:string;l,x,y:integer):string;  //редактирование строки c координатами начала x,y
var
i:integer;
key:char;
t:string;
begin
while length(s)<l do s:=s+' ';
t:=s;
ShowCursor;
i:=1;
repeat
GotoXY(x,y);write('['+s+']');  
gotoxy(x+i,y);
key:=ReadKey;
case key of
#0:begin
key:=ReadKey;
case ord(key) of
46:begin delete(s,i,1);s:=s+#32;end;
37:if i>1 then i:=i-1;
39:i:=i+1;
end;
end;  
#13,#9:begin Result:=s;break;end;
#27:begin Result:=t;break;end;
#8:if i>1 then begin i:=i-1;delete(s,i,1);s:=s+#32;end;
else begin delete(s,length(s),1);insert(key,s,i);i:=i+1;end;
end;
if i>Length(s) then i:=length(s)
until (key=#13) or (key=#27);
end;  
function Menu(title,bottom:string;a:array of string;var Position:integer;var Sy:integer):integer; //Текстовое меню (заголовок, низ, массив пунктов меню, положение начальное, положение конечное)возвращает код клавиши
var
i,j,k,l,y,m:integer;
key:char;
procedure InitMenu(Title,Bottom:string);
begin
SetWindowSize(80,26);
if Position>length(a)-1 then Position:=length(a)-1;
HideCursor;
j:=Position;
textbackground(Black);TextColor(LightGreen);clrscr;
writeln(title);
TextColor(Cyan);
y:=WhereY;
for i:integer:=1 to WindowWidth-1 do begin gotoxy(i,y);write('-');gotoxy(i,WindowHeight-2);write('-');end;
y:=y+1;
gotoxy(1,WindowHeight-1);
for i:integer:=1 to length(Bottom) do begin
case Bottom[i] of
'A'..'Z','a'..'z','0'..'9':TextColor(LightRed);
 '-':TextColor(Cyan);
';',':':TextColor(Yellow)
else TextColor(LightGray);
end;  
write(Bottom[i]);
end;  
end;
begin
InitMenu(title,bottom);
repeat
k:=Position-19;l:=Position;m:=0;
if k<0 then begin l:=l+19-Position;k:=0;end;
for i:=k to l do
if (i>=0) and (i<Length(a)) then begin
textbackground(Black);textcolor(LightGray);
if i=Position then begin textbackground(LightGray);textcolor(Black);Sy:=y+m;end;
gotoxy(1,y+m);        m:=m+1;
writeln(a[i]);
end;  
key:=ReadKey;
if key=#0 then begin key:=ReadKey;
case ord(key) of
40:if Position<Length(a)-1 then Position:=Position+1;
38:if Position>0 then Position:=Position-1;
45,46,112..123:break;
//else begin gotoxy(10,10);write(ord(key));end;
end;
end;  
until (key=#13) or (key=#27);
if key=#27 then Position:=j;
TextBackground(Black);
TextColor(LightGray);
ShowCursor;
Result:=ord(key);
end;
procedure FillChar(var s:string;c:char;Count:integer);
begin
s:='';
for i:integer:=1 to Count do s:=s+c;
end;
var
FBuffer,FName:string;
FStrings:array of string;
Position:integer:=0;
Sy:integer:=0;
begin
clrscr;
FillChar(FBuffer,' ',76);
var menuitems:array of string:=('Создание/редактирование файла','Выбор уникальных слов из файла','Сортировка слов из файла по частоте');
repeat
case Menu('Выберите действие','Enter - выбор; Esc - выход из программы',menuitems,Position,Sy) of
27:halt;
13:case Position of
0:begin
clrscr;
var FPosition:integer:=0;
Fname:=ReadlnString('Введите имя файла:');
if FileExists(FName) then FStrings:=System.IO.File.ReadAllLines(FName,Encoding.GetEncoding(1251)) else begin SetLength(FStrings,1);FillChar(FStrings[0],' ',76);end;
repeat 
case Menu ('Файл:'+FName,'F2 - Сохранить; Enter - редактировать; F3 - вставить пустую;'+newline+' {F5 - копировать; F6 - вставить} F8 - удалить; Esc - Выход',FStrings,Fposition,Sy) of
27:begin FillChar(FBuffer,' ',76);break;end;
13:FStrings[FPosition]:=EditString(FStrings[FPosition],76,1,Sy);
113:System.IO.File.WriteAllLines(FName,FStrings,Encoding.GetEncoding(1251));
114:begin
SetLength(FStrings,length(FStrings)+1);
for i:integer:=length(FStrings)-1 downto FPosition+1 do FStrings[i]:=FStrings[i-1];
FillChar(FStrings[FPosition],' ',76);
end;
116:FBuffer:=FStrings[FPosition];
117:begin
SetLength(FStrings,length(FStrings)+1);
for i:integer:=length(FStrings)-1 downto FPosition+1 do FStrings[i]:=FStrings[i-1];
FStrings[FPosition]:=FBuffer;
end;
119:if Length(FStrings)=1 then FillChar(FStrings[0],' ',76) else begin
for i:integer:=FPosition to length(FStrings)-2 do FStrings[i]:=FStrings[i+1];                        
SetLength(FStrings,Length(FStrings)-1);
end;    
end;      
until false;          
end;
1:begin 
clrscr;
var FPosition:integer:=0;
Fname:=ReadlnString('Введите имя файла:');
if FileExists(FName) then begin
FStrings:=System.IO.File.ReadAllText(FName,Encoding.GetEncoding(1251)).ToLower.ToWords.Distinct().ToArray(); 
//                 Writeln(FStrings);readln;
repeat
until Menu('Уникальные слова:','Esc - выход',FStrings,FPosition,Sy)=27;
end  
else begin writeln('Файл не найден!');readln;break;end;
end;
2:begin 
clrscr;
var FPosition:integer:=0;
Fname:=ReadlnString('Введите имя файла:');
if FileExists(FName) then begin
var s:string:=System.IO.File.ReadAllText(FName,Encoding.GetEncoding(1251));
var t:=s.ToWords.groupby(st->st.ToLower()).OrderBy(q->q.count);//Спасибо volvo
SetLength(FStrings,0);
foreach var x in t do begin
SetLength(FStrings,length(FStrings)+1);
FStrings[FStrings.Length-1]:=format('{0,-60}:{1,18}',x.key,x.count);
end;  
repeat
case Menu('Уникальные слова:'+newline+format('{0,-60}:{1,18}','СЛОВО','ЧАСТОТА'),'Esc - выход; F2 - сохранить результат в файл',FStrings,FPosition,Sy) of
27:break;
113:begin
clrscr;
System.IO.File.WriteAllLines(ReadlnString('Введите имя файла:'),FStrings,Encoding.GetEncoding(1251));
writeln('Сохранено!');
repeat until KeyPressed;
end;
end;
until false;
end  
else begin writeln('Файл не найден!');readln;break;end;
end;
end;  
end;  
until false;
end.