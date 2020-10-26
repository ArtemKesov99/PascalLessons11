uses system;
var
  D: DateTime;

begin
  writeln( 'tekushee vremya: ', DateTime.Now.Hour,':', DateTime.Now.Minute,':', DateTime.Now.Second,'.', DateTime.Now.Millisecond );

  writeln( 'tekushaya data: ', DateTime.Now.Date );

  D := DateTime.Parse( '02.10.2001' );
  writeln( 'Дата из строки: ', D.Date );  
end.