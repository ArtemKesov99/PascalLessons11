type
date_valid = record
day: 1..31;
month: 1..11;
year: integer;
valid: boolean;
end ;
const
z: array [0..12] of string =
( 'Козерог','Водолей', 'Рыба', 'Овен', 'Телец', 'Близнецы',
'Рак', 'Лев', 'Дева', 'Весы', 'Скорпион', 'Стрелец', 'Козерог');
d: array [1..12] of byte = (19, 18, 20, 19, 20, 21, 22, 22, 22, 22, 22, 21);
var
str: string;
parse: date_valid;
function valid_date(dat: string): date_valid;
var
arr: array[0..2] of string;
date: array[0..2] of integer;
p, i: byte;
err: integer;
R: date_valid;
begin
R.valid := false;
valid_date := R;
if length(dat) <> 10 then exit()
else begin
i := 0;
dat := dat + '.';
repeat
p := pos('.', dat);
if p > 0 then begin
arr[i] := copy(dat, 1, p - 1);
if (length(arr[i]) < 2) OR (length(arr[i]) > 4) then exit();
dat := copy(dat, p + 1, length(dat) - p);
i := i + 1;
if i > 3 then exit();
end;
until p = 0;
if i < 2 then exit();
for i := 0 to 2 do
begin
val(arr[i], date[i], err);
if err <> 0 then exit();
end;
case date[1] of 
1, 3, 5, 7, 8, 10, 12: if date[0] > 31 then exit();
2: if (date[0] > 29) OR ((date[0] = 29) AND (date[2] mod 4 > 0)) then exit();
4, 6, 9, 11: if date[0] > 30 then exit();
else exit() ;
//31 28 31 30 31 30 31 31 30 31 30 31
end;
end;
R.day := date[0];
R.month := date[1];
R.year := date[2];
R.valid := true;
valid_date := R;
end;
begin
repeat
write('Введите дату рождения в формате дд.мм.гггг: '); 
readln(str);
parse := valid_date(str);
until parse.valid;
if parse.day <= d[parse.month] then writeln(z[parse.month - 1])
else writeln(z[parse.month]);
If z[parse.month]='Козерог' then writeln('Период: 22.12-19.01',#10#13,'Правящая планета: Сатурн.',#10#13,
'Счастливое число: 3,5,7,8,14.',#10#13,'Символ козел: лестница, башенные часы.',
#10#13,'Цвета: черный, темно-коричневый, пепельно-серый, синий и бледно-желтый, все темн-ые тона.',
#10#13,'Камни: бирюза, ляпис-лазурь, оникс, лунный камень, хрусталь, гранат, лазурит.',
#10#13,'Металл: свинец.',#10#13,'Цветы: белая гвоздика, мак.',#10#13,'Талисман: черный кот, чертик.',
#10#13,'Счастливые дни: вторник, суббота.',#10#13,'Неудачные дни: понедельник, четверг.',#10#13,'Страны: Индия, Македония, Бирма, Мексика, страны Прибалтики.');

If z[parse.month]='Стрелец' then writeln('Период: 23.11-21.12',#10#13,'Правящая планета: Юпитер.',#10#13,'Счастливое число: 3,4,9.',#10#13,
'Символ: кентавр-стрелок, звезды, жезлы.',#10#13,'Цвета: синий, голубой, фиолетовый и багровый.',#10#13,
'Камни: аметист, сапфир, изумруд, агат, карбункул, бирюза, хризолит, топаз.',#10#13,'Металл: цинк, жесть.',#10#13,'Цветы: гвоздика, нарцисс, василек.',
#10#13,'Талисман: саламандра, подкова.',#10#13,'Счастливый день: четверг.',#10#13,'Неудачный день: среда.',#10#13,
'Страны: Португалия, Венгрия, Испания, страны Латинской Америки (кроме Мексики и Бразилии), арабские страны.');
readln;
end.