type
Person = class
private 
name: string;
surname: string; 
age: integer;
zvanie:string;
hobyy:string;
procedure SetAge(age: integer);
begin
if age < 0 then
age := 0;
Self.age := age;
end;
public 
procedure setData(name: string; surname: string; age: integer;zvanie:string;hobyy:string);
begin
Self.name := name;
Self.surname := surname;
Self.zvanie:=zvanie;
Self.hobyy:=hobyy;
if age < 0 then
age := 0;
Self.age := age;
end;
procedure getData();
begin
writeln(self.name, ' ', self.surname, '; ', self.age, ' год','; ',self.zvanie,' ; ',self.hobyy);
end;
end;
begin
var c1: Person := new Person;
c1.setData('Кесов ', 'Артем', 21, ' мастер фиде по шахматам','шахматы');
c1.getData();
c1.setData('Студент','РКИУ',3,'программист в компьютерных сетях', 'студент-выпускник');
c1.getData();
c1.setData('Победитель Олимпиад','Региональных мероприятий',0,'проживаю в г.Ростове-на-Дону','на Западном и Северном');
c1.getData();
end.