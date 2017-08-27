(* Nedovrseno *)
program karte;
var
 n, i, j, k: integer;
 a: array [0..30000] of longint;
 zadeljenje, deljivi: record
  ind: array [1..30000] of integer;
  len: longint
 end;
 prosti: record
  ind, brojac, manje, vece: array [1..30000] of integer;
  len: longint
 end;
 uzprosti: array [1..30000, 1..30000] of boolean;
 deljivi: array [1..30000] of boolean;
 parova, jedinica, delilac, kvadrat: longint;

begin

 readln(n);
 zadeljenje.len := 0;
 parova := n * (n-1) div 2;
 jedinica := 0;
 for i := 1 to n do begin
  readln(a[i]);
  for j := 1 to i - 1 do uzprosti[j, i] := true;
  if a[i] > 1 then begin
   inc(zadeljenje.len);
   zadeljenje.ind[zadeljenje.len] := i
  end
 end;

 delilac := 2;
 prosti.len := 0;
 a[0] := 0; (* Zbog slucaja praznog binarnog stabla. *)
 prosti.ind[1] := 0;
 prosti.manje[1] := 0;
 prosti.vece[1] := 0;
 (* Ovde je problem off by one nedovoljno dobro resen. *)
 (* prosti.ind[1] je dummy element koji je manji od svih. *)
 (* Drugacije resenje bi bilo da se gubi vreme na stalnu proveru da li je prosti.len=0. *)

 while zadeljenje.len > 0 do begin
  j := 0;
  deljivi.len := 0;
  kvadrat := delilac * delilac;
  for i := 1 to zadeljenje.len do
   if a[zadeljenje.ind[i]] < kvadrat then begin
    (* Ovde bi dosla provera da li je prosti.len=0 da nije napravljen dummy element. *)
    (* To bi oduzelo mnogo vremena. *)
    k := 1;
    while a[zadeljenje.ind[i]] <> a[prosti.ind[k]] do
     if a[zadeljenje.ind[i]] < a[prosti.ind[k]] then
      if prosti.manje[k] = 0 then begin
       inc(prosti.len);
       prosti.manje[k] := prosti.len;
       k := prosti.manje[k];
       prosti.ind[k] := zadeljenje.ind[i];
       prosti.brojac[k] := 0;
       prosti.manje[k] := 0;
       prosti.vece[k] := 0
      end else
       k := prosti.manje[k]
     else
      if prosti.vece[k] = 0 then begin
       inc(prosti.len);
       prosti.vece[k] := prosti.len;
       k := prosti.vece[k];
       prosti.ind[k] := zadeljenje.ind[i];
       prosti.brojac[k] := 0;
       prosti.manje[k] := 0;
       prosti.vece[k] := 0
      end else
       k := prosti.vece[k];
    inc(prosti.brojac[k]);
    (* Daleko efikasnije je da se najveci prosti delioci brojeva unetih u program, *)
    (* koji se dobijaju u nizu a[prosti.ind[i]], *)
    (* sortiraju posebno za svaki delilac, nego ovako zajedno za sve delioce. *)
    (* Ovakvo sortiranje ne doprinosi efikasnosti skoro ni malo. *)
   end else begin
    inc(j);
    zadeljenje.ind[j] := zadeljenje.ind[i];
    if a[zadeljenje.ind[i]] mod delilac = 0 then begin
     repeat
      a[zadeljenje.ind[i]] := a[zadeljenje.ind[i]] div delilac
     until a[zadeljenje.ind[i]] mod delilac > 0;
     for k := 1 to deljivi.len do
      if uzprosti[deljivi.ind[k], zadeljenje.ind[i]] then begin
       uzprosti[deljivi.ind[k], zadeljenje.ind[i]] := false;
       dec(parova)
      end;
     inc(deljivi.len);
     deljivi.niz[deljivi.len] := zadeljenje.ind[i]
    end
   end;
  zadeljenje.len := j;
  inc(delilac)
 end;

 writeln(parova)

end.
