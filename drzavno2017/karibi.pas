program karibi;
var
 n, m, a, b, i, j, k, l, d: integer;
 mbzpm, bzpmt, bpm, x, y: longint;
 z: array [1..2000, 1..2000] of record
  ch: char;
  ah, av, bh, bv: longint
 end;
 ah, av, bh, bv: record
  i, j, d: array[1..2000000] of integer;
  len: longint
 end;

(* funkcija broj parking mesta *)
function fbpm(d: integer): integer;
begin
 if d < b then fbpm := 0
 else fbpm := d - b + 1
end;

(* funkcija broj zauzetih parking mesta *)
function fbzpm(d, r, a: integer): integer;
var t: integer;
begin
 t := d - b + 1;
 dec(t, fbpm(r));
 dec(t, fbpm(d - r - a));
 fbzpm := t
end;

(* bzmp = broj zauzetih parking mesta *)
procedure uporedi(bzpm: longint);
begin
 if mbzpm < bzpm then mbzpm := bzpm;
end;

begin
 readln(n, m, a, b);
 for i := 1 to n do begin
  for j := 1 to m do
   read(z[i, j].ch);
  readln()
 end;

 ah.len := 0;
 bh.len := 0;
 for i := 1 to n do begin
  k := 1;
  while k <= m do begin
   while (k <= m) and (z[i, k].ch = '1') do inc(k);
   if k <= m then begin
    j := k;
    while (k <= m) and (z[i, k].ch = '0') do inc(k);
    d := k - j;
    if a <= d then begin
     inc(ah.len);
     ah.i[ah.len] := i;
     ah.j[ah.len] := j;
     ah.d[ah.len] := d;
     for l := j to k-1 do z[i, l].ah := ah.len
    end else
     for l := j to k-1 do z[i, l].ah := 0;
    if b <= d then begin
     inc(bh.len);
     bh.i[bh.len] := i;
     bh.j[bh.len] := j;
     bh.d[bh.len] := d;
     for l := j to k-1 do z[i, l].bh := bh.len
    end else
     for l := j to k-1 do z[i, l].bh := 0
   end
  end
 end;

 av.len := 0;
 bv.len := 0;
 for j := 1 to m do begin
  k := 1;
  while k <= n do begin
   while (k <= n) and (z[k, j].ch = '1') do inc(k);
   if k <= n then begin
    i := k;
    while (k <= n) and (z[k, j].ch = '0') do inc(k);
    d := k - i;
    if a <= d then begin
     inc(av.len);
     av.i[av.len] := i;
     av.j[av.len] := j;
     av.d[av.len] := d;
     for l := i to k-1 do z[l, j].av := av.len
    end else
     for l := i to k-1 do z[l, j].av := 0;
    if b <= d then begin
     inc(bv.len);
     bv.i[bv.len] := i;
     bv.j[bv.len] := j;
     bv.d[bv.len] := d;
     for l := i to k-1 do z[l, j].bv := bv.len
    end else
     for l := i to k-1 do z[l, j].bv := 0
   end
  end
 end;

 mbzpm := 0; (* max bzpm *)

 bzpmt := 0; (* bzmp transverzalno *)
 for x := 1 to ah.len do begin
  i := ah.i[x];
  for j := ah.j[x] to ah.j[x] + a - 1 do begin
   y := z[i, j].bv;
   if y > 0 then
    inc(bzpmt, fbzpm(bv.d[y], i - bv.i[y], 1));
  end;
  uporedi(bzpmt + fbzpm(ah.d[x], 0, a));
  for j := ah.j[x] to ah.j[x] + ah.d[x] - a - 1 do begin
   y := z[i, j].bv;
   if y > 0 then
    dec(bzpmt, fbzpm(bv.d[y], i - bv.i[y], 1));
   y := z[i, j + a].bv;
   if y > 0 then
    inc(bzpmt, fbzpm(bv.d[y], i - bv.i[y], 1));
   uporedi(bzpmt + fbzpm(ah.d[x], j - ah.j[x] + 1, a));
  end;
 end;

 bzpmt := 0; (* bzmp transverzalno *)
 for y := 1 to av.len do begin
  j := av.j[y];
  for i := av.i[y] to av.i[y] + a - 1 do begin
   x := z[i, j].bh;
   if x > 0 then
    inc(bzpmt, fbzpm(bh.d[x], j - bh.j[x], 1));
  end;
  uporedi(bzpmt + fbzpm(av.d[y], 0, a));
  for i := av.i[y] to av.i[y] + av.d[y] - a - 1 do begin
   x := z[i, j].bh;
   if x > 0 then
    dec(bzpmt, fbzpm(bh.d[x], j - bh.j[x], 1));
   x := z[i + a, j].bh;
   if x > 0 then
    inc(bzpmt, fbzpm(bh.d[x], j - bh.j[x], 1));
   uporedi(bzpmt + fbzpm(av.d[y], i - av.i[y] + 1, a));
  end;
 end;

 bpm := 0;
 for x := 1 to bh.len do inc(bpm, fbpm(bh.d[x]));
 for y := 1 to bv.len do inc(bpm, fbpm(bv.d[y]));

 writeln(bpm - mbzpm)
end.
