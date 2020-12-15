
{$i deltics.inc}

  unit Test.TypedExchanges;


interface

  uses
    Deltics.Smoketest;


  type
    TTypedExchangeTests = class(TTest)
    private
      procedure TestExchangeBytesWithData(a, b: Byte);
      procedure TestExchangeWordsWithData(a, b: Word);
      procedure TestExchangeLongWordsWithData(a, b: LongWord);
      procedure TestExchangeShortIntsWithData(a, b: ShortInt);
      procedure TestExchangeSmallIntsWithData(a, b: SmallInt);
      procedure TestExchangeIntegersWithData(a, b: Integer);
      procedure TestExchangeInt64sWithData(a, b: Int64);
      procedure TestExchangeDatetimesWithData(a, b: TDatetime);
      procedure TestExchangeStringsWithData(a, b: String);
      procedure TestExchangeWideStringsWithData(a, b: WideString);
    {$ifdef UNICODE}
      procedure TestExchangeAnsiStringsWithData(a, b: AnsiString);
    {$endif}

    published
      procedure ExchangeBytesCorrectlyExchangesValues;
      procedure ExchangeWordsCorrectlyExchangesValues;
      procedure ExchangeLongWordsCorrectlyExchangesValues;
      procedure ExchangeShortIntsCorrectlyExchangesValues;
      procedure ExchangeSmallIntsCorrectlyExchangesValues;
      procedure ExchangeIntegersCorrectlyExchangesValues;
      procedure ExchangeInt64sCorrectlyExchangesValues;
      procedure ExchangeDatetimesCorrectlyExchangesValues;
      procedure ExchangeStringsCorrectlyExchangesValues;
      procedure ExchangeWideStringsCorrectlyExchangesValues;
    {$ifdef UNICODE}
      procedure ExchangeAnsiStringsCorrectlyExchangesValues;
    {$endif}
    end;



implementation

  uses
    Math,
    SysUtils,
    Deltics.Exchange;



  procedure TTypedExchangeTests.TestExchangeBytesWithData(a, b: Byte);
  var
    oa, ob: Byte;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeWordsWithData(a, b: Word);
  var
    oa, ob: Word;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeLongWordsWithData(a, b: LongWord);
  var
    oa, ob: LongWord;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeShortIntsWithData(a, b: ShortInt);
  var
    oa, ob: ShortInt;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeSmallIntsWithData(a, b: SmallInt);
  var
    oa, ob: SmallInt;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeIntegersWithData(a, b: Integer);
  var
    oa, ob: Integer;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeInt64sWithData(a, b: Int64);
  var
    oa, ob: Int64;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeDatetimesWithData(a, b: TDatetime);
  var
    oa, ob: TDatetime;
  begin
    oa := a;
    ob := b;

{$ifdef EnhancedOverloads}
    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
{$else}
    ExchangeDatetime(a, b);

    Test('a').AssertDatetime(a).Equals(ob);
    Test('b').AssertDatetime(b).Equals(oa);
{$endif}
  end;


  procedure TTypedExchangeTests.TestExchangeStringsWithData(a, b: String);
  var
    oa, ob: String;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


  procedure TTypedExchangeTests.TestExchangeWideStringsWithData(a, b: WideString);
  var
    oa, ob: WideString;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;


{$ifdef UNICODE}
  procedure TTypedExchangeTests.TestExchangeAnsiStringsWithData(a, b: AnsiString);
  var
    oa, ob: AnsiString;
  begin
    oa := a;
    ob := b;

    Exchange(a, b);

    Test('a').Assert(a).Equals(ob);
    Test('b').Assert(b).Equals(oa);
  end;
{$endif}


{ TTypedExchangeTests }

  procedure TTypedExchangeTests.ExchangeBytesCorrectlyExchangesValues;
  const
    Max = High(Byte);
  begin
    TestExchangeBytesWithData(       0,  Max);
    TestExchangeBytesWithData( Max - 1,  Max);
    TestExchangeBytesWithData(     Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeWordsCorrectlyExchangesValues;
  const
    Max = High(Word);
  begin
    TestExchangeWordsWithData(       0,  Max);
    TestExchangeWordsWithData( Max - 1,  Max);
    TestExchangeWordsWithData(     Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeLongWordsCorrectlyExchangesValues;
  const
    Max = High(LongWord);
  begin
    TestExchangeLongWordsWithData(       0,  Max);
    TestExchangeLongWordsWithData( Max - 1,  Max);
    TestExchangeLongWordsWithData(     Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeShortIntsCorrectlyExchangesValues;
  const
    Max = High(ShortInt);
  begin
    TestExchangeShortIntsWithData(       0,  Max);
    TestExchangeShortIntsWithData( Max - 1,  Max);
    TestExchangeShortIntsWithData(-Max + 1, -Max);
    TestExchangeShortIntsWithData(    -Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeSmallIntsCorrectlyExchangesValues;
  const
    Max = High(SmallInt);
  begin
    TestExchangeSmallIntsWithData(       0,  Max);
    TestExchangeSmallIntsWithData( Max - 1,  Max);
    TestExchangeSmallIntsWithData(-Max + 1, -Max);
    TestExchangeSmallIntsWithData(    -Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeIntegersCorrectlyExchangesValues;
  begin
    TestExchangeIntegersWithData(          0,  MaxInt);
    TestExchangeIntegersWithData( MaxInt - 1,  MaxInt);
    TestExchangeIntegersWithData(-MaxInt + 1, -MaxInt);
    TestExchangeIntegersWithData(    -MaxInt,  MaxInt);
  end;


  procedure TTypedExchangeTests.ExchangeInt64sCorrectlyExchangesValues;
  const
    Max = High(Int64);
  begin
    TestExchangeInt64sWithData(       0,  Max);
    TestExchangeInt64sWithData( Max - 1,  Max);
    TestExchangeInt64sWithData(-Max + 1, -Max);
    TestExchangeInt64sWithData(    -Max,  Max);
  end;


  procedure TTypedExchangeTests.ExchangeDatetimesCorrectlyExchangesValues;
  begin
    TestExchangeDatetimesWithData(       0,  Now);
    TestExchangeDatetimesWithData( Now - 1,  Now);
    TestExchangeDatetimesWithData(-Now + 1, -Now);
    TestExchangeDatetimesWithData(    -Now,  Now);
  end;


  procedure TTypedExchangeTests.ExchangeStringsCorrectlyExchangesValues;
  begin
    TestExchangeStringsWithData(   '', 'foo');
    TestExchangeStringsWithData('foo', '');
    TestExchangeStringsWithData('foo', 'bar');
  end;


  procedure TTypedExchangeTests.ExchangeWideStringsCorrectlyExchangesValues;
  begin
    TestExchangeWideStringsWithData(   '', 'foo');
    TestExchangeWideStringsWithData('foo', '');
    TestExchangeWideStringsWithData('foo', 'bar');
  end;


{$ifdef UNICODE}
  procedure TTypedExchangeTests.ExchangeAnsiStringsCorrectlyExchangesValues;
  begin
    TestExchangeAnsiStringsWithData(   '', 'foo');
    TestExchangeAnsiStringsWithData('foo', '');
    TestExchangeAnsiStringsWithData('foo', 'bar');
  end;
{$endif}


end.
