program baza;
var
 n, m, k, x, y: int64;

function f(): int64;
begin
 x := k - y;
 f := x * (2*n-x) + (n-x) * y
end;

begin
 readln(n, m);
 k := 1; y := 0;
 while (f() <> m) and (y < k) and (k <= n) do
  if f() < m then inc(k) else
  if f() > m then inc(y);
 if (y < k) and (k <= n) then begin
  writeln(k);
  y := 0;
  while y < x do begin inc(y); writeln(y, ' ', y) end;
  while y < k do begin inc(y); writeln(x, ' ', y) end
 end else writeln(-1)
end.
