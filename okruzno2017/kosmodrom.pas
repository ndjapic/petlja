program kosmodrom;
type
 index = word;
 value = cardinal;
var
 n, i, x: index;
 latest, delay, smallest: value;
 t: array [1..200000] of value;

procedure launch(time: value);
begin
 if latest < time then
  latest := time
 else if delay < latest - time then
  delay := latest - time
end;

begin
 readln(n);
 for i := 1 to n do read(t[i]);
 readln();

 smallest := 4294967295;
 for x := 1 to n do begin
  latest := 0; delay := 0;
  for i := x downto 1 do launch(t[i]);
  for i := x+1 to n do launch(t[i]);
  if smallest > delay then smallest := delay
 end;

 writeln(smallest)
end.
