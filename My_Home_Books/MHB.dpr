program MHB;

uses
  Forms,
  unMain in 'unMain.pas' {frmMain},
  unSubDB in 'unSubDB.pas',
  unSub in 'unSub.pas',
  unSubTree in 'unSubTree.pas',
  unLibNew in 'unLibNew.pas' {frmLibNew},
  ALCPUID in 'ALCPUID.pas',
  ALFcnString in 'ALFcnString.pas',
  pngimage in 'pngimage.pas',
  unSets in 'unSets.pas' {frmSets},
  unEditVal in 'unEditVal.pas' {frmEditVal},
  unInfo in 'unInfo.pas' {frmInfo},
  unSplash in 'unSplash.pas' {frmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  frmSplash := TfrmSplash.Create(Application);
  try
    frmSplash.Show;
    frmSplash.Update;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLibNew, frmLibNew);
  Application.CreateForm(TfrmSets, frmSets);
  Application.CreateForm(TfrmEditVal, frmEditVal);
  Application.CreateForm(TfrmInfo, frmInfo);
  PrepStart;

  frmSplash.Hide;
  finally
    frmSplash.Free;  
  end;

  Application.Run;
end.
