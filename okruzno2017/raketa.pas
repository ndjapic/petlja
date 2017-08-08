program raketa;
var
 a,b: longint;
begin
 read(a);
 readln(b); a := a-b;
 read(b); a := a-b;
 readln(b); a := a+b;
 if a < 0 then a := -a;
 a := (a div 2) + (a mod 2);
 writeln(a)
end.
