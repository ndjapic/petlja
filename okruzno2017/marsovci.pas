program marsovci;
var
 hi, lo, x, y: longint;
 n, x0, area: int64;
 h: array [1..100000] of longint;
begin
 readln(n);
 read(h[1]); hi := h[1]; lo := h[1];
 for x := 2 to n do begin
  read(h[x]);
  if h[x] < lo then lo := h[x] else
  if h[x] > hi then hi := h[x]
 end;
 readln();

 area := 0; x := 0; x0 := 0;
 for y := 1 to n do
  if (h[y] = hi) or (h[y] = lo) then begin
   if (x > 0) and (h[x] <> h[y]) then begin
    area := area + (x-x0) * (n+1-y);
    x0 := x
   end;
   x := y;
  end;

 writeln(area)
end.
