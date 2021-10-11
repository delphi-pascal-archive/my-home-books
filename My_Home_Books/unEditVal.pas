unit unEditVal;

interface

uses  unSub, unSubTree, unMain, unSubDB,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel, Mask, RzEdit,
  RzCmboBx, RzRadChk;

type
  TfrmEditVal = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btOK: TRzBitBtn;
    btCancel: TRzBitBtn;
    cbFld: TRzComboBox;
    edVal: TRzEdit;
    lbFld: TRzLabel;
    lbVal: TRzLabel;
    lbAvt: TRzLabel;
    lbTit: TRzLabel;
    lbFil: TRzLabel;
    chVal: TRzCheckBox;
    btDel: TRzBitBtn;
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFldClick(Sender: TObject);
    procedure chValClick(Sender: TObject);
    procedure edValChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btOKClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditVal: TfrmEditVal;
  arFldID,arFldTyp:array of integer;
  nTB,n0,idBook,idLib,nSel,nCheck,idFld,idType,idRec:integer;
  sVal:string;
  flChange:boolean;

implementation

{$R *.dfm}

procedure TfrmEditVal.btCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmEditVal.btDelClick(Sender: TObject);
begin
 if(MessageBox(handle,pchar('Удалить значение поля '+QuotedStr(cbFld.Text)+' для файла '
  +QuotedStr(lbFil.Caption)+'?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)
  <>IDYES) then exit;

 UpdDopVal(-n0,idRec,idFld+idType,idBook,idLib,sVal);

 flChange:=false; btOK.Enabled:=false;
end;

procedure TfrmEditVal.btOKClick(Sender: TObject);
var stb:string;
begin
 sVal:=trim(edVal.Text);
 if(sVal='') then begin MessageBox(handle,'Не задано значение','Ошибка',MB_OK+MB_ICONERROR); exit; end;
 case idType of
 100: begin sVal:=booltostr(chVal.Checked); stb:='tbDopB'; end;
 200: try strtofloat(edVal.Text); stb:='tbDopF';
      except MessageBox(handle,'Требуется число','Ошибка',MB_OK+MB_ICONERROR); exit; end;
 300: if(length(sVal)>tbDopS.FieldByName('val').Size) then begin
      MessageBox(handle,pchar('Длина больше '+inttostr(tbDopS.FieldByName('val').Size)),
       'Ошибка',MB_OK+MB_ICONERROR); exit; end else stb:='tbDopS';
 end;

 UpdDopVal(n0,idRec,idFld+idType,idBook,idLib,sVal);

 flChange:=false; btOK.Enabled:=false;
end;

procedure TfrmEditVal.cbFldClick(Sender: TObject);
var sTB:string;
begin
 if(cbFld.ItemIndex<0) then begin
   chVal.Visible:=false;
   edVal.ReadOnly:=true;
   edVal.Text:='';
   exit;
 end;
 idFld:=arFldID[cbFld.ItemIndex];
 idType:=arFldTyp[cbFld.ItemIndex];
 chVal.Visible:=(idType=100); chVal.Checked:=false;
 edVal.ReadOnly:=(idType=100);
 case idType of
 100: sTB:='tbDopB';
 200: sTB:='tbDopF';
 300: sTB:='tbDopS';
 end;
 q0.SQL.Text:='SELECT id,val FROM '+sTB+' WHERE idBook='+inttostr(idBook)
  +' AND idFld='+inttostr(idFld)+' AND idLib='+inttostr(idLib);
 q0.Open;
 if(q0.RecordCount=1) then begin
  idRec:=q0.Fields[0].AsInteger;
  edVal.Text:=q0.Fields[1].AsString;
 end else begin
  idRec:=0;
  edVal.Text:='';
 end;
 if(idType=100) then if (edVal.Text<>'') then chVal.Checked:=strtobool(edVal.Text);
 btDel.Enabled:=(q0.RecordCount>0); btOK.Enabled:=false;
 flChange:=false;
end;

procedure TfrmEditVal.chValClick(Sender: TObject);
begin
 edVal.Text:=booltostr(chVal.Checked,true);
end;

procedure TfrmEditVal.edValChange(Sender: TObject);
begin
 flChange:=true; btOK.Enabled:=true;
end;

procedure TfrmEditVal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if flChange then
  CanClose:=(MessageBox(handle,pchar('Изменения не сохранены. Все равно выйти?'),
   'Подтверждение',MB_YESNOCANCEL+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES);
end;

procedure TfrmEditVal.FormShow(Sender: TObject);
var pan0:TPanel; i,n:integer; 
begin
 GetTreeCellInfo(frmMain.Pages.ActivePageIndex,nTB,n0,idBook,idLib,idFld,nSel,nCheck,sVal);
 case nTB of
  1: pan0:=frmMain.PanelA;
  2: pan0:=frmMain.PanelB;
  3: pan0:=frmMain.PanelS;
  4: pan0:=frmMain.PanelG;
  5: pan0:=frmMain.PanelT
  else begin Close; exit; end;
 end;
 lbAvt.Caption:=(fCtrl(pan0,201) as TLabel).Caption;
 lbTit.Caption:=(fCtrl(pan0,202) as TLabel).Caption;
 lbFil.Caption:=(fCtrl(pan0,205) as TLabel).Caption;
 n:=-1;
 for i := 0 to high(arFldID) do if(arFldID[i]+arFldTyp[i]=idFld) then begin n:=i; break; end;
 cbFld.ItemIndex:=n; cbFldClick(nil);   
end;

end.
