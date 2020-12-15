
{$i deltics.exchange.inc}

  unit Deltics.Exchange;


interface


  procedure Exchange(var A, B: Byte); overload;             {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: Word); overload;             {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: LongWord); overload;         {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: ShortInt); overload;         {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: SmallInt); overload;         {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: Integer); overload;          {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: Int64); overload;            {$ifdef InlineMethods} inline; {$endif}
{$ifdef EnhancedOverloads}
  procedure Exchange(var A, B: TDateTime); overload;        {$ifdef InlineMethods} inline; {$endif}
{$else}
  procedure ExchangeDatetime(var A, B: TDateTime); overload;  {$ifdef InlineMethods} inline; {$endif}
{$endif}
  procedure Exchange(var A, B: String); overload;           {$ifdef InlineMethods} inline; {$endif}
  procedure Exchange(var A, B: WideString); overload;       {$ifdef InlineMethods} inline; {$endif}
{$ifdef UNICODE}
  procedure Exchange(var A, B: AnsiString); overload;       {$ifdef InlineMethods} inline; {$endif}
{$endif}

  procedure Exchange(var A, B; aSize: LongWord); overload;


implementation


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: Byte);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: Word);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: LongWord);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: ShortInt);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: SmallInt);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: Integer);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: Int64);
  begin
    A := A + B;
    B := A - B;
    A := A - B;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
{$ifdef EnhancedOverloads}
  procedure Exchange(var A, B: TDateTime);
{$else}
  procedure ExchangeDatetime(var A, B: TDateTime);
{$endif}
  var
    T: TDatetime;
  begin
    T := A;
    A := B;
    B := T;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: String);
  var
    T: String;
  begin
    T := A;
    A := B;
    B := T;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: WideString);
  var
    T: WideString;
  begin
    T := A;
    A := B;
    B := T;
  end;


{$ifdef UNICODE}

  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B: AnsiString);
  var
    T: AnsiString;
  begin
    T := A;
    A := B;
    B := T;
  end;

{$endif}



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Exchange(var A, B; aSize: LongWord);
  var
    a8: Byte absolute A;
    b8: Byte absolute B;
    a16: Word absolute A;
    b16: Word absolute B;
    a32: LongWord absolute A;
    b32: LongWord absolute B;
    a64: Int64 absolute A;
    b64: Int64 absolute B;
    aE: Extended absolute A;
    bE: Extended absolute B;
    i8: Byte;
    i16: Word;
    i32: LongWord;
    i64: Int64;
  {$ifNdef WIN64}
    iE: Extended;
  {$endif}
    ap8: PByte;
    bp8: PByte;
  begin
    case aSize of
      sizeof(Byte)      : begin
                            i8 := a8;
                            a8 := b8;
                            b8 := i8;
                          end;

      sizeof(Word)      : begin
                            i16 := a16;
                            a16 := b16;
                            b16 := i16;
                          end;

      sizeof(LongWord)  : begin
                            i32 := a32;
                            a32 := b32;
                            b32 := i32;
                          end;

      sizeof(Int64)     : begin
                            i64 := a64;
                            a64 := b64;
                            b64 := i64;
                          end;

    {$ifNdef WIN64} // Extended is an alias for "Double" on Win64 and thus 8-bytes, not 10 as on Win32
      sizeof(Extended)  : begin
                            iE := aE;
                            aE := bE;
                            bE := iE;
                          end;
    {$endif}
    else
      ap8 := PByte(@A);
      bp8 := PByte(@B);
      i32 := aSize;
      while (i32 > 0) do
      begin
        i8   := ap8^;
        ap8^ := bp8^;
        bp8^ := i8;
        Inc(ap8);
        Inc(bp8);
        Dec(i32);
      end;
    end;
  end;






end.
