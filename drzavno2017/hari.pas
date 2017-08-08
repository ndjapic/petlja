program hari;
var
 n, k, x, y, d, q: longint;
 age, first, freq, next,
 less, great: array [1..200000] of longint;
 comb: longint;

procedure testdivisor(dq: longint);
var p: boolean;
begin
 p := true;
 x := 1;
 while (x <= n) and p do begin
  y := x + dq;
  p := (y <= next[x]);
  x := y
 end;
 if p then inc(comb)
end;

begin
 readln(n, k);
 for x := 1 to n do begin
  read(age[x]);
  freq[x] := 0;
  less[x] := 0;
  great[x] := 0;
 end;
 for x := 1 to n do begin
  y := 1;
  while age[x] <> age[y] do
   if age[x] < age[y] then
    if less[y] = 0 then less[y] := x
    else y := less[y]
   else
    if great[y] = 0 then great[y] := x
    else y := great[y];
  first[x] := y
 end;
 readln();
 y := 1;
 for x := 1 to n do begin
  while (y <= n) and (freq[first[y]] <= k) do begin
   freq[first[y]] := freq[first[y]] + 1;
   inc(y)
  end;
  next[x] := y;
  freq[first[x]] := freq[first[x]] - 1
 end;
 comb := 0;
 d := 1;
 q := n;
 while d < q do begin
  if n mod d = 0 then begin
   testdivisor(d);
   testdivisor(q)
  end;
  inc(d);
  q := n div d
 end;
 if d * d = n then testdivisor(d);
 writeln(comb)
end.
