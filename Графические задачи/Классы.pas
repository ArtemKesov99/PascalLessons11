type 
  Person = class
  private
    name: string;
    age: integer;
  public
    constructor (n: string; a: integer);
    begin
      name := n; age := a;
    end;
    function ToString: string; override;
    begin
      Result := Format('Имя: {0}   Возраст: {1}',name,age);
    end;
    
  end;
 
var p: Person;
 
begin
  p := new Person('Иванов',20); // Новый синтаксис вызова конструктора (рекомендуется)
  writeln(p);
end.