Type
  Letters = set of 'A'..'я';
Var
  Glasn, Sogl : Letters;
  Text : String;
  i, G, S : byte;
Begin
  Glasn := ['A', 'а', 'Е', 'е', 'И', 'и', 'О', 'о', 'У', 'у', 'ы','Э', 'э', 'Ю', 'ю', 'Я', 'я', 'Ё', 'ё'];
  Sogl := ['Б'..'Д', 'б'..'д', 'Ж', 'ж', 'З', 'з', 'К'..'Н', 'к'..'н', 'П'..'Т', 'п'..'т', 'Ф'..'Щ', 'ф'..'щ', 'ь', 'ъ'];
  Write('Введите предложение ');
  Readln(Text);
  G := 0;
  S := 0;
  For i := 1 to Length(Text) do
    Begin
      If Text[i] in Glasn
        Then
          G := G+1;
      If Text[i] in Sogl
        Then
          S := S+1;
    End;
  Write('В предложении " ', Text, ' " ', G, ' гласных и ', S, ' согласных букв');
End.