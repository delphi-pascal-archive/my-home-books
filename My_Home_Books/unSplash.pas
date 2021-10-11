unit unSplash;

interface

uses unSub,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel;

type
  TfrmSplash = class(TForm)
    lbTit: TRzLabel;
    RzLabel2: TRzLabel;
    lbState: TRzLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
 lbTit.Caption:=AppTit;
 lbState.Caption:='Загрузка...';
end;

end.
