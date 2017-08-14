program prorok;
var
 n, i, k, j: longint;
 q, manje, vece, prvi: array [1..100000] of longint;
 a: array [1..100000] of char;

begin
 readln(n);
 for i := 1 to n do begin
  read(q[i]);
  read(a[i]);
  read(a[i]);
  readln();
  manje[i] := 0;
  vece[i] := 0;
  j := 1;
  while q[i] <> q[j] do
   if q[i] < q[j] then
    if manje[j] = 0 then manje[j] := i
    else j := manje[j]
   else
    if vece[j] = 0 then vece[j] := i
    else j := vece[j];
  prvi[i] := j;
 end;

 k := 2;
 i := 1;
 while (i <= n) and (k <= n) do begin
  i := 1;
  while
   (i <= n) and
   (((i mod k = 0) = (prvi[i] mod k = 0)) =
   (a[i] = a[prvi[i]]))
  do inc(i);
  inc(k);
 end;
 if i > n then dec(k) else k := -1;
 writeln(k)
end.
