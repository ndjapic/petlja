program mingo;
var
 n, ni, k, ki, m, broj, q, qi: integer;
 listici: array [1..10000] of record
  jeBiran: array [1..500] of boolean;
  dobitni: boolean;
 end;
 dobitnih: array [1..20000, 1..8] of integer;

begin
 readln(n, k, m);
 for ni := 1 to n do begin
  for broj := 1 to m do listici[ni].jeBiran[broj] := false;
  for ki := 1 to k do begin
   read(broj);
   listici[ni].jeBiran[broj] := true
  end;
  readln()
 end;
 readln(q);
 for qi := 1 to q do begin
  for ni := 1 to n do listici[ni].dobitni := true;
  for ki := 1 to k do begin
   read(broj);
   dobitnih[qi, ki] := 0;
   for ni := 1 to n do
    if listici[ni].dobitni then begin
     if listici[ni].jeBiran[broj] then inc(dobitnih[qi, ki])
     else listici[ni].dobitni := false
    end
  end;
  readln()
 end;
 for qi := 1 to q do begin
  for ki := 1 to k do write(dobitnih[qi, ki], ' ');
  writeln()
 end
end.
