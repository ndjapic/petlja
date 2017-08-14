program karte;
var
 n, i, j, k: integer;
 a: array [1..30000] of longint;
 b: array [1..100] of longint;
 c: longint;

begin
 readln(n);
 c := 0;
 for i := 1 to n do begin
  readln(a[i]);
  for j := 1 to i - 1 do begin
   b[1] := a[i];
   b[2] := a[j];
   k := 2;
   repeat
    inc(k);
    b[k] := b[k-2] mod b[k-1]
   until b[k] = 0;
   if b[k-1] = 1 then inc(c)
  end
 end;
 writeln(c)
end.
