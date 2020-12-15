
program test;

{$apptype console}

{$i deltics.inc}

uses
  Deltics.Smoketest,
  Deltics.Exchange in '..\src\Deltics.Exchange.pas',
  Test.TypedExchanges in 'Test.TypedExchanges.pas';

begin
  TestRun.Test(TTypedExchangeTests);
end.
