var
  cs1,cs2,res,change:integer;
  TD:string;
{функция перевода Dec числа в любую сс}
function FromDec(n,r:longint):string;
var
  s:String;
const
  digit:string[16]='0123456789ABCDEF';
begin
  s:='';
  repeat
    s:=digit[(n mod r)+1]+s;
    n:=n div r;
  until n=0;
    FromDec:=s;
end;
{фунция перевода любой сс в Dec}
function ToDec(n:string;r:longint):longint;
var
  m,i:longint;
const
  digit:string[16]='0123456789ABCDEF';
begin
  m:=0;
  while n[1]='0' do
    delete(n,1,1);
  for i:=1 to length(n) do
    m:=m*r+pos(n[i],digit)-1;
  ToDec:=m;
end;
{осоновная программы}
begin
  writeln('Введите из какой CC:');
  repeat
    readln(cs1);
  until
    (cs1>=2) and (cs1<=36);
  writeln('Введите число в соответствии с CC:');
  readln(TD);
  writeln('Введите в какую CC:');
  repeat
    readln(cs2);
  until
    (cs2>=2) and (cs2<=36);
  writeln('Перевод из ',cs1,' CC --> ',cs2,' CC:');
  writeln(FromDec(ToDec(TD,cs1),cs2));
end.