Program stack;
Uses crt;
Const max = 4;
Type
    TS = Record
    Stacks : Array[1..max] Of Integer;
    top : Integer;
  End;
Var
  tumpukan : TS;
  i : Integer;
Function iniStack(Var stack : TS) : Boolean;
Begin
  stack.top := 0;
  iniStack := True;
End;
Function push(Var stack : TS; data : Integer) : Boolean;
Begin
  If high(stack.stacks) = stack.top Then
    Begin
      Writeln('                       Tumpukkan Sudah Penuh');
      push := False;
      Exit;
    End
  Else
    Begin
      Inc(stack.top);
      stack.stacks[stack.top] := data;
      push := True;
    End;
  For i:= 1 To max Do
    Begin
      Write('                          Indeks Data Ke-',i,' : ',stack.stacks[i]);
      Writeln;
    End;
End;
Function pop(Var stack : TS) : Integer;
Begin
  If stack.top = 0 Then
    Begin
      Writeln('                    =>Tumpukkan Kosong!!!');
    End
  Else
    Begin
      pop := stack.stacks[stack.top];
      stack.stacks[stack.top] := 0;     {data yg di pop menjadi 0}
      Dec(stack.top);
    End;
  For i:= 1 To max Do
    Begin
      Write('                          Indeks Data Ke-',i,' : ',stack.stacks[i]);
      Writeln;
    End;
End;
Label 10,20,30;
Var
  tanya : Char;
  jawab : Byte;
	data : integer;
Begin
  Clrscr;
  Writeln('                  ======================================');
  Writeln('                  ||           PROGRAM STACK          ||');
  Writeln('                  ||      ALFA SEAN (20101106067)     ||');
  iniStack(tumpukan);
  10:
      Repeat
        Writeln('                  ======================================');
        Writeln('                    1. Masukkan Data Ke dalam Tumpukkan ');
        Writeln('                    2. Keluarkan Data Dari Tumpukkan ');
        Writeln('                    3. Keluar ');
        Writeln('                  ======================================');
        Write('                    => Masukkan Pilihan Anda  : ');
        Readln(jawab);
        Case jawab Of
          1 :
              Begin
                Write('                       Masukkan Datanya       : ');
                Readln(data);
                Writeln('                  ======================================');
                push(tumpukan,data);
              End;
          2 :
              Begin
                Writeln('                  ======================================');
                pop(tumpukan);
              End;
          3 :
              20:
                  Begin
                    Write ('                       Apakah Anda Yakin Ingin Keluar? (y/n) : ');
                    Readln(tanya);
                    If (tanya = 'y') Or (tanya = 'Y') Then
                      Begin
                        Goto 30;
                      End
                    Else If (tanya = 'n') Or (tanya = 'N') Then
                           Begin
                             Goto 10;
                           End
                    Else
                      Begin
                        Writeln ('                    => Inputan Salah! ');
                        Goto 20;
                      End;
                  End;
          Else
            Writeln('                       Inputan Salah!');
        End;
        Readln;
      Until jawab = 3;
  30:
End.