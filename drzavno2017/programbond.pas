program programbond;
var
 n, i, k, poeni, r1: longint;
 x: array [1..2000000] of integer;
 bond, sifr: record
  f: array [1..6] of longint;
  cf: array [0..6] of longint
 end;

begin
 readln(n);
 for i := 1 to 2*n do read(x[i]);
 readln();
 r1 := 0;
 for i := 1 to 6 do begin
  bond.f[i] := 0; sifr.f[i] := 0
 end;
 for k := 1 to n do begin

  inc(bond.f[x[k]]);
  inc(sifr.f[x[2*k]]);
  inc(sifr.f[x[2*k-1]]);
  dec(sifr.f[x[k]]);
  bond.cf[0] := 0;
  sifr.cf[0] := 0;
  for i := 1 to 6 do begin
   bond.cf[i] := bond.cf[i-1] + bond.f[i];
   sifr.cf[i] := sifr.cf[i-1] + sifr.f[i]
  end;

  poeni := 0;
  i := 0;
  while i < 6 do begin
   inc(i);
   if sifr.cf[i] > bond.cf[i] then begin
    poeni := poeni - bond.cf[i];
    while bond.cf[i+1] < sifr.cf[i] do inc(i);
    poeni := poeni + sifr.cf[i]
   end
  end;

  if r1 < poeni then r1 := poeni
 end;
 writeln(r1)
end.
