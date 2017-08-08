program kladionica;
const
 BIGPRIME = 1000000007;
var
 n, m, i, j, k, deg, c: integer;
 kvota: int64;
 ukupno: longint;
 esp: array [1..100, 0..100] of longint;
 a: array [0..100, 0..10000] of longint;

begin
 readln(n, m);
 for i := 1 to n do begin
  esp[i, 0] := 1;
  for j := 1 to m do begin
   read(kvota);
   esp[i, j] := 0;
   for k := j downto 1 do
    esp[i, k] := (esp[i, k] + kvota * esp[i, k-1]) mod BIGPRIME
  end;
  readln()
 end;
 kvota := 1;
 a[0, 0] := 1;
 for i := 1 to n do begin
  for deg := i to i * m do a[i, deg] := 0;
  for j := 1 to m do begin
   read(c);
   if c = 1 then
    for deg := i - 1 to (i - 1) * m do
     a[i, deg + j] := (a[i, deg + j]
      + kvota * esp[i, j] * a[i - 1, deg]) mod BIGPRIME
  end;
  readln()
 end;
 ukupno := 0;
 for deg := 1 to n - 1 do read(kvota);
 for deg := n to n * m do begin
  read(kvota);
  ukupno := (ukupno + a[n, deg] * kvota) mod BIGPRIME;
 end;
 readln();
 writeln(ukupno)
end.
