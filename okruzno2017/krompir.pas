program krompir;
var
 n,a,b,k: Int64;
 m,i,x,y: Longint;
 xfree, yfree: array [1..1000000] of boolean;
begin
 readln(n, m);
 for i := 1 to n do begin
  xfree[i] := true;
  yfree[i] := true
 end;
 a := n; b := n;
 for i := 1 to m do begin
  readln(x, y);
  if xfree[x] then begin
   xfree[x] := false;
   a := a - 1
  end;
  if yfree[y] then begin
   yfree[y] := false;
   b := b - 1
  end;
 end;
 k := n * n - a * b;
(* k := (n-a) * (n-b) + (n-a) * b + a * (n-b); *)
 writeln(k)
end.
