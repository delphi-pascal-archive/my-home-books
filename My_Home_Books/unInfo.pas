unit unInfo;

interface

uses unSub, unSubDB,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzSplit, RzLabel, ExtCtrls, RzEdit, StdCtrls, RzCommon,
  Grids, RzGrids, Mask, RzButton, ExtDlgs;

type
  TfrmInfo = class(TForm)
    PanelA: TPanel;
    PanelRightA: TRzSizePanel;
    Image4: TImage;
    RzSizePanel15: TRzSizePanel;
    RzMemo4: TRzMemo;
    PanelBookA: TRzPanel;
    lbTitle: TRzLabel;
    lbAvt: TRzLabel;
    RzLabel54: TRzLabel;
    RzLabel55: TRzLabel;
    pnFile: TRzPanel;
    RzLabel76: TRzLabel;
    RzLabel77: TRzLabel;
    RzLabel78: TRzLabel;
    lbFile: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzLabel80: TRzLabel;
    RzLabel81: TRzLabel;
    RzLabel82: TRzLabel;
    RzLabel90: TRzLabel;
    RzLabel88: TRzLabel;
    RzLabel83: TRzLabel;
    RzLabel84: TRzLabel;
    RzLabel85: TRzLabel;
    RzLabel87: TRzLabel;
    RzLabel89: TRzLabel;
    RzLabel91: TRzLabel;
    RzLabel86: TRzLabel;
    pnDop: TRzPanel;
    pnFb2: TRzPanel;
    pnSize: TRzSizePanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    pnBookFile: TPanel;
    lb1: TRzLabel;
    lb2: TRzLabel;
    RzLabel3: TRzLabel;
    lb4: TRzLabel;
    RzLabel5: TRzLabel;
    lb5: TRzLabel;
    RzLabel7: TRzLabel;
    lb3: TRzLabel;
    RzLabel4: TRzLabel;
    lb6: TRzLabel;
    lbT2: TRzLabel;
    lbDop: TRzLabel;
    lbT1: TRzLabel;
    sgDop: TRzStringGrid;
    RzLabel8: TRzLabel;
    lb0: TRzLabel;
    pnBottom: TRzPanel;
    btSaveInfo: TRzBitBtn;
    btSavePic: TRzBitBtn;
    btExit: TRzBitBtn;
    SavePicDial: TSavePictureDialog;
    SaveDial: TSaveDialog;
  procedure BookShowI(idB,idF,idL:integer);
    procedure FormCreate(Sender: TObject);
    procedure sgDopSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDopResize(Sender: TObject);
    procedure pnSizeResize(Sender: TObject);
    procedure sgDopDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure btSaveInfoClick(Sender: TObject);
  private
    { Private declarations }
    pnFileH0,pnSizeH0:integer;
  public
    { Public declarations }
  end;


var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

procedure TfrmInfo.BookShowI(idB,idF,idL:integer);
var sidB,sidL:string; n:integer;
begin
 lb0.Caption:=arLib[idL].Name;
 q1[idL].SQL.Text:='SELECT sizef,nextf,dat FROM tbFile WHERE id='+inttostr(idF);
 q1[idL].Open;
 lb1.Caption:=inttostr(q1[idL].Fields[0].AsInteger);
 lb2.Caption:=DateToStr(q1[idL].Fields[2].AsDateTime);
 if(q1[idL].Fields[1].AsInteger=1) then begin
  pnBookFile.Visible:=true;
  pnFile.Height:=pnFileH0;
 end else begin
  pnBookFile.Visible:=false;
  pnFile.Height:=pnFileH0-pnBookFile.Height;
 end;
 q1[idL].SQL.Text:='SELECT sizef,dat,arhfile,datarh,nextf FROM tbBook WHERE id='+inttostr(idB);
 q1[idL].Open;
 lb3.Caption:=DateToStr(q1[idL].Fields[1].AsDateTime);
 lb4.Caption:=q1[idL].Fields[2].AsString;
 lb5.Caption:=inttostr(q1[idL].Fields[0].AsInteger);
 lb6.Caption:=DateToStr(q1[idL].Fields[3].AsDateTime);
 pnFb2.Visible:=(q1[idL].Fields[4].AsInteger=2);

 sidB:=inttostr(idB); sidL:=inttostr(arLib[idL].ID);
 q0.SQL.Text:='SELECT tbDop.name, CAST(tbDopB.val AS String), tbDop.Typ FROM tbDopB INNER JOIN tbDop '
  +'ON tbDopB.idFld=tbDop.id WHERE tbDopB.idBook='+sidB+' AND tbDopB.idLib='+sidL
  +' UNION SELECT tbDop.name, tbDopF.val, tbDop.Typ FROM tbDopF INNER JOIN tbDop '
  +'ON tbDopF.idFld=tbDop.id WHERE tbDopF.idBook='+sidB+' AND tbDopF.idLib='+sidL
  +' UNION SELECT tbDop.name, tbDopS.val, tbDop.Typ FROM tbDopS INNER JOIN tbDop '
  +'ON tbDopS.idFld=tbDop.id WHERE tbDopS.idBook='+sidB+' AND tbDopS.idLib='+sidL
  +' ORDER BY name';
 q0.Open; q0.First; n:=1;
 sgDop.RowCount:=q0.RecordCount+1;
 if(q0.RecordCount>0) then pnSize.Height:=pnSizeH0
 else pnSize.Height:=0;
 while not q0.Eof do begin
  sgDop.Cells[0,n]:=q0.Fields[0].AsString+':';
  sgDop.Cells[1,n]:=q0.Fields[1].AsString;
  q0.Next; inc(n);
 end;
 btSavePic.Enabled:=(image4.Picture.Height>0);
end;

procedure SaveTxt();
const st=chr(9);
var sfile:string; i:integer; ls:TStringList;
begin
 with frmInfo.SaveDial do begin
  Title:='Сохранить информацию';
  if(frmInfo.lb4.Caption<>'') then FileName:=ChangeFileExt(frmInfo.lb4.Caption,'.txt')
  else FileName:=ChangeFileExt(frmInfo.lbFile.Caption,'.txt');
  Filter:='Текстовые файлы (*.txt)|*.txt|Все файлы (*.*)|*.*';
  InitialDir:=AppPath;
  if not Execute then exit;
  sfile:=FileName;
 end;

 ls:=TStringList.Create; ls.Clear;
 with frmInfo do begin
  ls.Add('Название:'+st+lbTitle.Caption);
  ls.Add('Автор:'+st+lbAvt.Caption);
  ls.Add('');
  ls.Add(lbT1.Caption);
  ls.Add('');
  for i:=206 to 211 do
   ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
  i:=203;
  ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
  ls.Add('');
  if(pnSize.Height>0) then begin
   ls.Add(lbDop.Caption);
   ls.Add('');
   for i:=1 to sgDop.RowCount-1 do
    ls.Add(sgDop.Cells[0,i]+st+sgDop.Cells[1,i]);
   ls.Add('');
  end;
  ls.Add(lbT2.Caption);
  ls.Add('');
  i:=500;
  ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
  i:=204;
  ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
  i:=205;
  ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
  for i:=501 to 506 do
   ls.Add((fCtrl(PanelA,1000+i) as TLabel).Caption+st+(fCtrl(PanelA,i) as TLabel).Caption);
   ls.Add('');
 end;
 ls.SaveToFile(sfile);
 ls.Free;
end;

procedure SavePic();
var styp:string;
begin
 styp:=LowerCase(frmInfo.Image4.Picture.Graphic.GetNamePath);
 if(Pos('jpeg',styp)>0) then styp:='.jpg'
 else if(Pos('png',styp)>0) then styp:='.png' else styp:='';
 with frmInfo.SavePicDial do begin
  Title:='Сохранить картинку';
  if(frmInfo.lb4.Caption<>'') then FileName:=ChangeFileExt(frmInfo.lb4.Caption,styp)
  else FileName:=ChangeFileExt(frmInfo.lbFile.Caption,styp);
  if(styp='') then styp:='.*';
  Filter:='Картинки (*'+styp+')|*'+styp;
  InitialDir:=AppPath;
  if not Execute then exit;
  frmInfo.Image4.Picture.SaveToFile(FileName);
 end;
end;

procedure TfrmInfo.FormCreate(Sender: TObject);
begin
 pnFileH0:=pnFile.Height;
 pnSizeH0:=pnSize.Height;
 RzPanel1.BorderOuter:=fsNone;
 RzPanel2.BorderOuter:=fsNone;
 pnBookFile.BevelOuter:=bvNone;
 with sgDop do begin
  BorderStyle:=bsNone;
  RowHeights[0]:=-1;
  ColCount:=2;
  ColWidths[0]:=150;
 end;

end;

procedure TfrmInfo.pnSizeResize(Sender: TObject);
begin
 if(pnSize.Height>0) then pnSizeH0:=pnSize.Height;
end;

procedure TfrmInfo.btSaveInfoClick(Sender: TObject);
begin
 case (Sender as TComponent).Tag of
  1: SaveTxt;
  2: SavePic;
  3: Close;
 end;
end;

procedure TfrmInfo.sgDopDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if(ACol=0) then exit;
 with (Sender as TStringGrid) do begin
  Canvas.Font.Assign(fntBookA);
  Canvas.fillRect(Rect);
  Canvas.TextOut(Rect.Left,Rect.Top,Cells[ACol,ARow]);
 end;
end;

procedure TfrmInfo.sgDopResize(Sender: TObject);
begin
 with sgDop do ColWidths[1]:=ClientWidth-ColWidths[0]-3*GridLineWidth;
end;

procedure TfrmInfo.sgDopSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 CanSelect:=false;
end;

end.
