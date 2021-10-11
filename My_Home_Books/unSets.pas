unit unSets;

interface

uses unSub, unMain, unSubDB, unSubTree, unEditVal, DB, ABSMain,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, RzTabs, ExtCtrls, RzPanel, Grids, RzGrids,
  RzButton, StdCtrls, RzCmboBx, Mask, RzEdit, RzLabel, RzRadChk, ExtDlgs,
  RzBtnEdt, RzShellDialogs, ImgList, RzSpnEdt, RzCommon, RzSelDir, RzSplit,
  VirtualTrees, ToolWin, RzListVw, RzRadGrp;

type
  TfrmSets = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    Pages: TRzPageControl;
    TabDirs: TRzTabSheet;
    TabVid: TRzTabSheet;
    tvPages: TRzTreeView;
    TabFlds: TRzTabSheet;
    TabCols: TRzTabSheet;
    sgFldsC: TRzStringGrid;
    RzLabel1: TRzLabel;
    RzGroupBox1: TRzGroupBox;
    edNewFldName: TRzEdit;
    RzLabel2: TRzLabel;
    lbNewFldType: TRzLabel;
    cbNewFldType: TRzComboBox;
    btFldAdd: TRzBitBtn;
    btDel: TRzBitBtn;
    RzLabel4: TRzLabel;
    cbImgTrue: TRzImageComboBox;
    gbTrue: TRzGroupBox;
    rbTxtTrue: TRzRadioButton;
    rbImgTrue: TRzRadioButton;
    edTrue: TRzEdit;
    gbFalse: TRzGroupBox;
    rbTxtFalse: TRzRadioButton;
    rbImgFalse: TRzRadioButton;
    cbImgFalse: TRzImageComboBox;
    edFalse: TRzEdit;
    rbFldNew: TRzRadioButton;
    rbFldOld: TRzRadioButton;
    RzPanel4: TRzPanel;
    cbImgBool: TRzImageComboBox;
    RzLabel3: TRzLabel;
    btImgBoolAdd: TRzButton;
    btImgBoolDel: TRzButton;
    OpenDialImg: TOpenPictureDialog;
    sgColsAll: TStringGrid;
    PagesCols: TRzPageControl;
    TabA: TRzTabSheet;
    TabB: TRzTabSheet;
    TabS: TRzTabSheet;
    TabG: TRzTabSheet;
    TabT: TRzTabSheet;
    RzLabel5: TRzLabel;
    sgCA: TStringGrid;
    sgCB: TStringGrid;
    sgCS: TStringGrid;
    sgCG: TStringGrid;
    RzPanel5: TRzPanel;
    btL: TRzBitBtn;
    btR: TRzBitBtn;
    btU: TRzBitBtn;
    btD: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    edDir1: TRzButtonEdit;
    chDir1: TRzCheckBox;
    btOK: TRzBitBtn;
    btCancel: TRzBitBtn;
    sgCT: TStringGrid;
    TabFils: TRzTabSheet;
    TabOther: TRzTabSheet;
    chBoolDbl: TRzCheckBox;
    RzGroupBox4: TRzGroupBox;
    rbCopyNFld1: TRzRadioButton;
    rbCopyNFld2: TRzRadioButton;
    RzLabel6: TRzLabel;
    edCopyNFld: TRzSpinEdit;
    RzGroupBox5: TRzGroupBox;
    edDir2: TRzButtonEdit;
    chDir2: TRzCheckBox;
    chDir2Unzip: TRzCheckBox;
    DirDial: TRzSelDirDialog;
    RzPanel6: TRzPanel;
    FontDial: TFontDialog;
    ColorDial: TColorDialog;
    pnLeft: TRzPanel;
    lbLeftT: TLabel;
    pnLeftTv: TRzPanel;
    lbLeftTv: TLabel;
    pnLeftTvH: TRzPanel;
    lbLeftTvH: TLabel;
    PanelReSize: TRzSizePanel;
    PanelA: TPanel;
    pnRight: TRzSizePanel;
    RzSizePanel15: TRzSizePanel;
    pnRightB: TRzPanel;
    lbRightB1: TRzLabel;
    lbRightB2: TRzLabel;
    pnBook: TRzPanel;
    pnBookT: TRzPanel;
    lbBookT: TRzLabel;
    pnBookB: TRzPanel;
    lbBookN: TRzLabel;
    lbBookA: TRzLabel;
    lbBookG1: TRzLabel;
    lbBookG2: TRzLabel;
    pnBookTv: TRzPanel;
    lbBookTv: TLabel;
    pnBookTvH: TRzPanel;
    lbBookTvH: TLabel;
    pnRightM: TRzPanel;
    lbRightM: TLabel;
    pnMain: TRzPanel;
    lbMain: TRzLabel;
    RzPanel7: TRzPanel;
    RusBar: TToolBar;
    btAZR: TToolButton;
    EngBar: TToolBar;
    btAZE: TToolButton;
    RzGroupBox6: TRzGroupBox;
    chShowTools: TRzCheckBox;
    chShowEng: TRzCheckBox;
    chShowRus: TRzCheckBox;
    RzGroupBox7: TRzGroupBox;
    RzButton1: TRzButton;
    lbSkin: TRzLabel;
    RzButton2: TRzButton;
    OpenDial: TRzOpenDialog;
    SaveDial: TRzSaveDialog;
    RzGroupBox8: TRzGroupBox;
    lvReaders: TRzListView;
    btnDeleteExt: TRzBitBtn;
    btnAddExt: TRzBitBtn;
    rbExtNew: TRzRadioButton;
    rbExtOld: TRzRadioButton;
    RzLabel7: TRzLabel;
    edExt1: TRzEdit;
    edExt2: TRzButtonEdit;
    RzLabel8: TRzLabel;
    chCbLib: TRzCheckBox;
    chTabsTab: TRzCheckBox;
    chTabsBt: TRzCheckBox;
    rgTabsBt: TRzRadioGroup;
    edMaxBooks: TRzSpinEdit;
    RzLabel9: TRzLabel;
    chShowRight: TRzCheckBox;
  procedure LoadSets();
    procedure tvPagesChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure btFldAddClick(Sender: TObject);
    procedure cbNewFldTypeChange(Sender: TObject);
    procedure sgFldsCDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure rbFldNewClick(Sender: TObject);
    procedure sgFldsCSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btImgBoolAddClick(Sender: TObject);
    procedure btLClick(Sender: TObject);
    procedure edDir1ButtonClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure chBoolDblClick(Sender: TObject);
    procedure edDir1Change(Sender: TObject);
    procedure pnLeftTvClick(Sender: TObject);
    procedure lbLeftTvClick(Sender: TObject);
    procedure RusBarClick(Sender: TObject);
    procedure btAZRClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure lvReadersClick(Sender: TObject);
    procedure btnAddExtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure LoadSkin(nfl:integer);

const ftype:array[1..3] of string=('Логический','Числовой','Текстовый');
 stab1=';';
 iSetsPageA=0;
 iSetsPageB=3;
 iSetsPageS=1;
 iSetsPageG=2;
 iSetsPageT=4;

var
  frmSets: TfrmSets;
    flTabFlds,flTabDirs,flTabVid,flTabCols,flTabFils,flTabOther:boolean;
    SkinFileDum:string='';

implementation

{$R *.dfm}

uses unInfo;

procedure LoadFlds();
var i,j,n:integer; ls:TStringList; sg0:TStringGrid;
begin
 ls:=TStringList.Create;
 for i:=1 to high(ColsMainName) do
  ls.Add(stab1+ColsMainName[i]+stab1+inttostr(i));
 tbDop.Filtered:=false;
 tbDop.Open; tbDop.First; i:=1;
 frmSets.sgFldsC.RowCount:=tbDop.RecordCount+1;
 while not tbDop.Eof do begin
  ls.Add(stab1+tbDop.Fields[1].asString+stab1+inttostr(tbDop.Fields[0].asInteger+tbDop.Fields[2].asInteger));
  with frmSets.sgFldsC do begin
   Cells[0,i]:=inttostr(i);
   Cells[1,i]:=tbDop.Fields[1].Value;
   Cells[2,i]:=ftype[(tbDop.Fields[2].AsInteger div 100)];
   Cells[5,i]:=tbDop.Fields[0].AsString;
   Cells[6,i]:=tbDop.Fields[3].AsString;
   Cells[7,i]:=tbDop.Fields[4].AsString;
   Cells[8,i]:=tbDop.Fields[2].AsString;
   tbDop.Next; inc(i);
  end;
 end;
 ls.CaseSensitive:=false; ls.Sort;
 with frmSets.sgColsAll do begin
  RowCount:=ls.Count;
  for i:=0 to ls.Count-1 do begin
   Rows[i].Clear; Rows[i].Delimiter:=stab1;  Rows[i].QuoteChar:=stab1;
   Rows[i].DelimitedText:=ls.Strings[i];
  end;
  frmMain.cbFldsT.Clear;
  for i:=0 to RowCount-1 do frmMain.cbFldsT.AddItemValue(Cells[0,i],Cells[1,i]);
  if(frmMain.cbFldsT.Items.Count>0) then frmMain.cbFldsT.ItemIndex:=0;
 end;
 ls.Free;
 frmSets.sgFldsC.Refresh;
 for n:=1 to nTabs do begin
  case n of
   1: sg0:=frmSets.sgCA;
   2: sg0:=frmSets.sgCB;
   3: sg0:=frmSets.sgCS;
   4: sg0:=frmSets.sgCG;
   5: sg0:=frmSets.sgCT
   else exit;
  end;
  with sg0 do begin
   RowCount:=1; Rows[1].Clear; RowCount:=nnColsB[n];
   for i:=0 to RowCount-1 do Rows[i].DelimitedText:=stab1;
  end;
 end;
 with frmSets.sgColsAll do for j:=0 to RowCount-1 do begin
  n:=strtoint(Cells[1,j]);
  for i:=1 to nnColsB[1] do if(n=nColsB[1,i]) then frmSets.sgCA.Rows[i-1]:=Rows[j];
  for i:=1 to nnColsB[2] do if(n=nColsB[2,i]) then frmSets.sgCB.Rows[i-1]:=Rows[j];
  for i:=1 to nnColsB[3] do if(n=nColsB[3,i]) then frmSets.sgCS.Rows[i-1]:=Rows[j];
  for i:=1 to nnColsB[4] do if(n=nColsB[4,i]) then frmSets.sgCG.Rows[i-1]:=Rows[j];
  for i:=1 to nnColsB[5] do if(n=nColsB[5,i]) then frmSets.sgCT.Rows[i-1]:=Rows[j];
 end;
 with frmEditVal do begin
  cbFld.Clear;
  with q0 do begin
   SQL.Text:='SELECT id,name,typ FROM tbDop ORDER BY name';
   Open; Filtered:=false; First; i:=0;
   SetLength(arFldID,RecordCount); SetLength(arFldTyp,RecordCount);
   while not eof do begin
    cbFld.Add(Fields[1].asString);
    arFldID[i]:=Fields[0].AsInteger;
    arFldTyp[i]:=Fields[2].AsInteger;
    Next; inc(i);
   end;
  end;
 end;
end;

procedure LoadImgBool2Combos();
var i:integer;
begin
 with frmSets.cbImgTrue do begin
  Clear; Images:=frmMain.ilBool;
  for i:=0 to frmMain.ilBool.Count-1 do AddItem('',i,0);
  ItemIndex:=0;
 end;
 with frmSets.cbImgFalse do begin
  Clear; Images:=frmMain.ilBool;
  for i:=0 to frmMain.ilBool.Count-1 do AddItem('',i,0);
  ItemIndex:=0;
 end;
 with frmSets.cbImgBool do begin
  Clear; Images:=frmMain.ilBool;
  for i:=0 to frmMain.ilBool.Count-1 do AddItem('',i,0);
  ItemIndex:=0;
 end;
end;

procedure OldFld(nRow:integer);
var n:integer;
begin
 with frmSets do begin
  if rbFldNew.Checked then begin
   edNewFldName.Text:=''; edTrue.Text:=''; edFalse.Text:='';
   cbNewFldType.Enabled:=true; lbNewFldType.Enabled:=true;
  end else with sgFldsC do begin
   edNewFldName.Text:=Cells[1,nRow];
   cbNewFldType.ItemIndex:=(strtoint(Cells[8,nRow]) div 100)-1;
   cbNewFldTypeChange(nil);
   try n:=strtoint(Cells[6,nRow]); except n:=-1; end;
   if(n<0) then begin
    edTrue.Text:=Cells[6,nRow]; rbTxtTrue.Checked:=true;
   end else begin
    edTrue.Text:=''; rbImgTrue.Checked:=true; cbImgTrue.ItemIndex:=n;
   end;
   try n:=strtoint(Cells[7,nRow]); except n:=-1; end;
   if(n<0) then begin
    edFalse.Text:=Cells[7,nRow]; rbTxtFalse.Checked:=true;
   end else begin
    edFalse.Text:=''; rbImgFalse.Checked:=true; cbImgFalse.ItemIndex:=n;
   end;
   cbNewFldType.Enabled:=false; lbNewFldType.Enabled:=false;
  end;
 end;
end;

procedure LoadSkin(nfl:integer);
var i:integer;
begin
if(nfl=0) then begin
 fntMain.Assign(frmMain.Font);
 fntRus.Assign(frmMain.RusBar.Font);
 fntEng.Assign(frmMain.EngBar.Font);
 fntLeftT.Assign(frmMain.PanelAvt.Font);
 fntLeftTvH.Assign(frmMain.tvAvt.Header.Font);
 fntLeftTv.Assign(frmMain.tvAvt.Font);
 fntBookT.Assign((fCtrl(frmMain.PanelA,101) as TRzLabel).Font);
 fntBookTvH.Assign(frmMain.tvBooksA.Header.Font);
 fntBookTv.Assign(frmMain.tvBooksA.Font);
 fntBookN.Assign((fCtrl(frmMain.PanelA,201) as TRzLabel).Font);
 fntBookA.Assign((fCtrl(frmMain.PanelA,202) as TRzLabel).Font);
 fntBookG1.Assign(frmMain.PanelBookA.Font);
 fntBookG2.Assign((fCtrl(frmMain.PanelA,203) as TRzLabel).Font);
 fntRightM.Assign((fCtrl(frmMain.PanelA,302) as TRzMemo).Font);
 fntRightB1.Assign(frmMain.PanelRightA.Font);
 fntRightB2.Assign((fCtrl(frmMain.PanelA,206) as TRzLabel).Font);
 clMain:=frmMain.Color;
 clRus:=frmMain.RusBar.GradientEndColor;
 clEng:=frmMain.EngBar.GradientEndColor;
 clLeft:=frmMain.PanelAvt.Color;
 clLeftTv:=frmMain.tvAvt.Color;
 clBook:=frmMain.PanelBookA.Color;
 clBookTv:=frmMain.tvBooksA.Color;
 clRight:=frmMain.PanelRightA.Color;
 clRightM:=(fCtrl(frmMain.PanelA,302) as TRzMemo).Color;
end;
if(nfl=1) then begin
 clMain:=frmSets.pnMain.Color;
 clRus:=frmSets.RusBar.GradientEndColor;
 clEng:=frmSets.EngBar.GradientEndColor;
 clLeft:=frmSets.pnLeft.Color;
 clLeftTv:=frmSets.pnLeftTv.Color;
 clBook:=frmSets.pnBook.Color;
 clBookTv:=frmSets.pnBookTv.Color;
 clRight:=frmSets.pnRight.Color;
 clRightM:=frmSets.pnRightM.Color;
 fntMain.Assign(frmSets.lbMain.Font);
 fntRus.Assign(frmSets.RusBar.Font);
 fntEng.Assign(frmSets.EngBar.Font);
 fntLeftT.Assign(frmSets.lbLeftT.Font);
 fntBookG1.Assign(frmSets.lbBookG1.Font);
 fntLeftTvH.Assign(frmSets.lbLeftTvH.Font);
 fntLeftTv.Assign(frmSets.lbLeftTv.Font);
 fntBookTvH.Assign(frmSets.lbBookTvH.Font);
 fntBookTv.Assign(frmSets.lbBookTv.Font);
 fntRightB1.Assign(frmSets.lbRightB1.Font);
 fntBookT.Assign(frmSets.lbBookT.Font);
 fntBookN.Assign(frmSets.lbBookN.Font);
 fntBookA.Assign(frmSets.lbBookA.Font);
 fntBookG2.Assign(frmSets.lbBookG2.Font);
 fntRightB2.Assign(frmSets.lbRightB2.Font);
 fntRightM.Assign(frmSets.lbRightM.Font);
end;
if(nfl=2) then begin
 if(SkinFileDum='') then frmSets.lbSkin.Caption:=SkinFile else frmSets.lbSkin.Caption:=SkinFileDum;
 frmSets.pnMain.Color:=clMain;
 frmSets.RusBar.GradientEndColor:=clRus;
 frmSets.EngBar.GradientEndColor:=clEng;
 frmSets.pnLeft.Color:=clLeft;
 frmSets.pnLeftTv.Color:=clLeftTv;
 frmSets.pnBook.Color:=clBook;
 frmSets.pnBookTv.Color:=clBookTv;
 frmSets.pnRight.Color:=clRight;
 frmSets.pnRightM.Color:=clRightM;

 frmSets.lbMain.Font.Assign(fntMain);
 frmSets.RusBar.Font.Assign(fntRus);
 frmSets.EngBar.Font.Assign(fntEng);
 frmSets.lbLeftT.Font.Assign(fntLeftT);
 frmSets.lbLeftTvH.Font.Assign(fntLeftTvH);
 frmSets.lbLeftTv.Font.Assign(fntLeftTv);
 frmSets.lbBookT.Font.Assign(fntBookT);
 frmSets.lbBookTvH.Font.Assign(fntBookTvH);
 frmSets.lbBookTv.Font.Assign(fntBookTv);
 frmSets.lbBookN.Font.Assign(fntBookN);
 frmSets.lbBookA.Font.Assign(fntBookA);
 frmSets.lbBookG1.Font.Assign(fntBookG1);
 frmSets.lbBookG2.Font.Assign(fntBookG2);
 frmSets.lbRightM.Font.Assign(fntRightM);
 frmSets.lbRightB1.Font.Assign(fntRightB1);
 frmSets.lbRightB2.Font.Assign(fntRightB2);
end;
if(nfl=3) then begin
 frmMain.Font.Assign(frmSets.lbMain.Font);
 frmMain.Pages.TextColors.Selected:=frmSets.lbMain.Font.Color;
 frmMain.Pages.TextColors.UnSelected:=frmSets.lbMain.Font.Color;
 frmMain.PanelAvt.Color:=frmSets.pnLeft.Color;
 frmMain.PanelBookA.Color:=frmSets.pnBook.Color;
 frmMain.tvBooksA.Color:=frmSets.pnBookTv.Color;
 frmMain.PanelRightA.Color:=frmSets.pnRight.Color;
 frmMain.tvAvt.Color:=frmSets.pnLeftTv.Color;
 frmMain.MainBar.Font.Assign(frmSets.lbMain.Font);
 frmMain.RusBar.Font.Assign(frmSets.RusBar.Font);
 frmMain.EngBar.Font.Assign(frmSets.EngBar.Font);
 frmMain.PanelAvt.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.PanelBookA.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.tvAvt.Header.Font.Assign(frmSets.lbLeftTvH.Font);
 frmMain.tvAvt.Font.Assign(frmSets.lbLeftTv.Font);
 frmMain.tvBooksA.Header.Font.Assign(frmSets.lbBookTvH.Font);
 frmMain.tvBooksA.Font.Assign(frmSets.lbBookTv.Font);
 frmMain.PanelRightA.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmMain.PanelA,101) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelA,102) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelA,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 (fCtrl(frmMain.PanelA,202) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmMain.PanelA,203) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelA,204) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelA,205) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelA,206) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,207) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,208) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,209) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,210) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,211) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelA,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmMain.PanelA,302) as TRzMemo).Color:=frmSets.pnRightM.Color;

 frmMain.Color:=frmSets.pnMain.Color;
 frmMain.Pages.TabColors.Shadow:=frmSets.pnMain.Color;
 frmMain.MainBar.GradientEndColor:=frmSets.pnMain.Color;
 frmMain.RusBar.GradientEndColor:=frmSets.RusBar.GradientEndColor;
 frmMain.EngBar.GradientEndColor:=frmSets.EngBar.GradientEndColor;
 frmMain.PanelBook.Color:=frmSets.pnLeft.Color;
 frmMain.PanelBook.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.PanelBookB.Color:=frmSets.pnBook.Color;
 frmMain.PanelBookB.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.tvBook.Header.Font.Assign(frmSets.lbLeftTvH.Font);
 frmMain.tvBook.Font.Assign(frmSets.lbLeftTv.Font);
 frmMain.tvBook.Color:=frmSets.pnLeftTv.Color;
 frmMain.tvBooksB.Header.Font.Assign(frmSets.lbBookTvH.Font);
 frmMain.tvBooksB.Font.Assign(frmSets.lbBookTv.Font);
 frmMain.tvBooksB.Color:=frmSets.pnBookTv.Color;
 frmMain.PanelRightB.Color:=frmSets.pnRight.Color;
 frmMain.PanelRightB.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmMain.PanelB,101) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelB,102) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelB,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 (fCtrl(frmMain.PanelB,202) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmMain.PanelB,203) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelB,204) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelB,205) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelB,206) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,207) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,208) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,209) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,210) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,211) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelB,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmMain.PanelB,302) as TRzMemo).Color:=frmSets.pnRightM.Color;

 frmMain.PanelSer.Color:=frmSets.pnLeft.Color;
 frmMain.PanelSer.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.PanelBookS.Color:=frmSets.pnBook.Color;
 frmMain.PanelBookS.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.tvSer.Header.Font.Assign(frmSets.lbLeftTvH.Font);
 frmMain.tvSer.Font.Assign(frmSets.lbLeftTv.Font);
 frmMain.tvSer.Color:=frmSets.pnLeftTv.Color;
 frmMain.tvBooksS.Header.Font.Assign(frmSets.lbBookTvH.Font);
 frmMain.tvBooksS.Font.Assign(frmSets.lbBookTv.Font);
 frmMain.tvBooksS.Color:=frmSets.pnBookTv.Color;
 frmMain.PanelRightS.Color:=frmSets.pnRight.Color;
 frmMain.PanelRightS.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmMain.PanelS,101) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelS,102) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelS,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 (fCtrl(frmMain.PanelS,202) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmMain.PanelS,203) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelS,204) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelS,205) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelS,206) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,207) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,208) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,209) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,210) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,211) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelS,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmMain.PanelS,302) as TRzMemo).Color:=frmSets.pnRightM.Color;

 frmMain.PanelGen.Color:=frmSets.pnLeft.Color;
 frmMain.PanelGen.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.PanelBookG.Color:=frmSets.pnBook.Color;
 frmMain.PanelBookG.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.tvGen.Header.Font.Assign(frmSets.lbLeftTvH.Font);
 frmMain.tvGen.Font.Assign(frmSets.lbLeftTv.Font);
 frmMain.tvGen.Color:=frmSets.pnLeftTv.Color;
 frmMain.tvBooksG.Header.Font.Assign(frmSets.lbBookTvH.Font);
 frmMain.tvBooksG.Font.Assign(frmSets.lbBookTv.Font);
 frmMain.tvBooksG.Color:=frmSets.pnBookTv.Color;
 frmMain.PanelRightG.Color:=frmSets.pnRight.Color;
 frmMain.PanelRightG.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmMain.PanelG,101) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelG,102) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelG,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 (fCtrl(frmMain.PanelG,202) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmMain.PanelG,203) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelG,204) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelG,205) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelG,206) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,207) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,208) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,209) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,210) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,211) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelG,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmMain.PanelG,302) as TRzMemo).Color:=frmSets.pnRightM.Color;

 frmMain.PanelTot.Color:=frmSets.pnLeft.Color;
 frmMain.PanelTot.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.PanelBookT.Color:=frmSets.pnBook.Color;
 frmMain.PanelBookT.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.tvBooksT.Header.Font.Assign(frmSets.lbBookTvH.Font);
 frmMain.tvBooksT.Font.Assign(frmSets.lbBookTv.Font);
 frmMain.tvBooksT.Color:=frmSets.pnBookTv.Color;
 frmMain.PanelRightT.Color:=frmSets.pnRight.Color;
 frmMain.PanelRightT.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmMain.PanelT,101) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelT,102) as TRzLabel).Font.Assign(frmSets.lbBookT.Font);
 (fCtrl(frmMain.PanelT,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 (fCtrl(frmMain.PanelT,202) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmMain.PanelT,203) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelT,204) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelT,205) as TRzLabel).Font.Assign(frmSets.lbBookG2.Font);
 (fCtrl(frmMain.PanelT,206) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,207) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,208) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,209) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,210) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,211) as TRzLabel).Font.Assign(frmSets.lbRightB2.Font);
 (fCtrl(frmMain.PanelT,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmMain.PanelT,302) as TRzMemo).Color:=frmSets.pnRightM.Color;

 frmMain.PanelLib.Color:=frmSets.pnLeft.Color;
 frmMain.PanelLib.Font.Assign(frmSets.lbLeftT.Font);
 frmMain.tvLib.Header.Font.Assign(frmSets.lbLeftTvH.Font);
 frmMain.tvLib.Font.Assign(frmSets.lbLeftTv.Font);
 frmMain.tvLib.Color:=frmSets.pnLeftTv.Color;
 frmMain.PanelLib1.Color:=frmSets.pnBook.Color;
 frmMain.PanelLib1.Font.Assign(frmSets.lbBookG1.Font);
 frmMain.sgLib.Font.Assign(frmSets.lbBookT.Font);

 frmInfo.Color:=frmSets.pnMain.Color;
 frmInfo.PanelA.Color:=frmSets.pnMain.Color;
 frmInfo.Font.Assign(frmSets.lbMain.Font);
 frmInfo.PanelBookA.Color:=frmSets.pnBook.Color;
 frmInfo.PanelRightA.Color:=frmSets.pnRight.Color;
 frmInfo.PanelBookA.Font.Assign(frmSets.lbBookG1.Font);
 frmInfo.PanelRightA.Font.Assign(frmSets.lbRightB1.Font);
 (fCtrl(frmInfo.PanelA,302) as TRzMemo).Font.Assign(frmSets.lbRightM.Font);
 (fCtrl(frmInfo.PanelA,302) as TRzMemo).Color:=frmSets.pnRightM.Color;
 for i:=201 to 211 do
  (fCtrl(frmInfo.PanelA,i) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);
 (fCtrl(frmInfo.PanelA,201) as TRzLabel).Font.Assign(frmSets.lbBookN.Font);
 for i:=500 to 505 do
  (fCtrl(frmInfo.PanelA,i) as TRzLabel).Font.Assign(frmSets.lbBookA.Font);

end;
end;

function SaveFlds():String;
label lb1;
var i,j,j1,nres,ntype,ID,id100,k:integer; ls:TStringList; sErr:string;
begin
  sErr:='';
  db0.StartTransaction;
  with frmSets.sgFldsC do begin
   nres:=0; id100:=-1;
   ls:=TStringList.Create;
   ls.Delimiter:=';'; ls.DelimitedText:=Cells[5,0];
   for i:=1 to ls.Count-1 do begin
    try
     tbDop.Close; tbDop.ReadOnly:=false; tbDop.Open; tbDop.Filtered:=false;
     ID:=strtoint(ls.Strings[i]);
     tbDop.Filter:='id='+inttostr(ID); tbDop.Filtered:=true;
     ntype:=tbDop.Fields[2].AsInteger;
     id100:=ID+ntype;
     case ntype of
     100: q0.SQL.Text:='DELETE FROM tbDopB WHERE idFld='+inttostr(ID);
     200: q0.SQL.Text:='DELETE FROM tbDopF WHERE idFld='+inttostr(ID);
     300: q0.SQL.Text:='DELETE FROM tbDopS WHERE idFld='+inttostr(ID);
     end;
     q0.ExecSQL;
     tbDop.Delete; tbDop.Close; tbDop.ReadOnly:=true;
     nres:=1;
    except nres:=-1; sErr:='удалить поле'; break; end;
    for j1:=1 to nTabs do begin
     k:=0;
     for j:=1 to nnColsB[j1]-1 do begin
      if(nColsB[j1,j]=id100) then inc(k);
      nColsB[j1,j]:=nColsB[j1,j+k];
     end;
     nnColsB[j1]:=nnColsB[j1]-k;
    end;
   end;
   ls.Free;
   if(nres<0) then goto lb1;
   for i:=1 to RowCount-1 do begin
    if(Cells[5,i]='') then begin
     try
      tbDop.Close; tbDop.ReadOnly:=false; tbDop.Open;
      tbDop.AppendRecord([nil,Cells[1,i],strtoint(Cells[8,i]),Cells[6,i],Cells[7,i]]);
      tbDop.Close; tbDop.ReadOnly:=true;
      nres:=1;
     except nres:=-1; sErr:='добавить поле '+Cells[1,i]; break; end;
    end;
    try ID:=strtoint(Cells[5,i]); except ID:=0; end;
    if(ID<0) then begin
     try
      ID:=-ID;
      q0.SQL.Text:='UPDATE tbDop SET name='+QuotedStr(Cells[1,i])+', vTrue='
       +QuotedStr(Cells[6,i])+', vFalse='+QuotedStr(Cells[7,i])+' WHERE id='+inttostr(ID);
      q0.ExecSQL;
      nres:=q0.RowsAffected;
     except nres:=-1; sErr:='изменить поле '+Cells[1,i]; break; end;
    end;
   end;
   if(nres<0) then goto lb1;
  end;
  db0.Commit(false);

lb1:
 if (nres<0) then db0.Rollback;
 result:=sErr;
end;

function SaveCols(): string;
var j,n:integer; sg0:TStringGrid;
begin
 result:='сохранить колонки';
 for n:=1 to nTabs do begin
  case n of
   1: sg0:=frmSets.sgCA;
   2: sg0:=frmSets.sgCB;
   3: sg0:=frmSets.sgCS;
   4: sg0:=frmSets.sgCG;
   5: sg0:=frmSets.sgCT
   else exit;
  end;
  nnColsB[n]:=sg0.RowCount;
  for j:=1 to nnColsB[n] do nColsB[n,j]:=strtoint(sg0.Cells[1,j-1]);
 end;
 result:='';
end;

procedure LoadOther();
begin
 with frmSets do begin
  edDir1.Text:=Dir1; chDir1.Checked:=flDir1Ask;
  edDir2.Text:=Dir2; chDir2.Checked:=flDir2Ask; chDir2Unzip.Checked:=flDir2Unzip;
  chShowRight.Checked:=flShowRight;
  chShowTools.Checked:=flShowTools;
  chShowRus.Checked:=flShowRus;
  chShowEng.Checked:=flShowEng;
  chBoolDbl.Checked:=flBoolDblClick;
  chCbLib.Checked:=flShowCbLib;
  chTabsTab.Checked:=flShowTabsTab;
  chTabsBt.Checked:=flShowTabsBt;
  if flShowTabsBtShort then rgTabsBt.ItemIndex:=0 else rgTabsBt.ItemIndex:=1;
  if(nflCopyNFld<0) then rbCopyNFld1.Checked:=true
  else begin rbCopyNFld2.Checked:=true; edCopyNFld.Value:=nflCopyNFld; end;
  edMaxBooks.Value:=nMaxBooks;
 end;
end;

function SaveOther(): String;
begin
 result:=' сохранить разное';
 with frmSets do begin
  Dir1:=edDir1.Text; flDir1Ask:=chDir1.Checked;
  Dir2:=edDir2.Text; flDir2Ask:=chDir2.Checked; flDir2Unzip:=chDir2Unzip.Checked;
  flShowRight:=chShowRight.Checked;
  flShowTools:=chShowTools.Checked;
  flShowRus:=chShowRus.Checked;
  flShowEng:=chShowEng.Checked;
  flBoolDblClick:=chBoolDbl.Checked;
  flShowCbLib:=chCbLib.Checked;
  flShowTabsTab:=chTabsTab.Checked;
  flShowTabsBt:=chTabsBt.Checked;
  flShowTabsBtShort:=(rgTabsBt.ItemIndex=0);
  if(rbCopyNFld1.Checked) then nflCopyNFld:=-1
  else nflCopyNFld:=round(edCopyNFld.Value);
  nMaxBooks:=round(edMaxBooks.Value);
 end;
 result:='';
 LoadState(1);
end;

function SaveFils(): String;
var ls:TStringList; i,id:integer;
begin
 result:=' сохранить типы файлов';
 id:=0;
 with frmSets.lvReaders do begin
  for i:=0 to Items.Count-1 do
   if(Items[i].SubItems[1]='') then begin
    tbExt.Open;
    tbExt.AppendRecord([nil,Items[i].Caption,Items[i].SubItems[0]]);
   end else begin
    try id:=strtoint(Items[i].SubItems[1]); except id:=0; end;
    if(id>=0) then continue else id:=-id;
    tbExt.Close;
    q0.SQL.Text:='UPDATE tbExt SET name='+QuotedStr(Items[i].Caption)
     +', reader='+QuotedStr(Items[i].SubItems[0])+' WHERE id='+inttostr(id);
    q0.ExecSQL;
    if(q0.RowsAffected<>1) then exit;
   end;
   ls:=TStringList.Create;
   ExtractStrings([';'],[],pchar(Column[2].Caption),ls);
   for i:=1 to ls.Count-1 do begin
    try id:=strtoint(ls.Strings[i]); except continue; end;
    tbExt.Close;
    q0.SQL.Text:='DELETE FROM tbExt WHERE id='+inttostr(abs(id));
    q0.ExecSQL;
    if(q0.RowsAffected<>1) then exit;
   end;
   ls.Free;
 end;
 result:='';
end;

function SaveSets(flSave:boolean): Boolean;
label lb1;
var sErr:string;
begin
 result:=false; sErr:='';
 if flSave then begin
  if flTabFlds then sErr:=SaveFlds;
  if(sErr<>'') then goto lb1;
  if flTabCols then sErr:=SaveCols;
  if(sErr<>'') then goto lb1;
  if flTabOther then sErr:=SaveOther;
  if(sErr<>'') then goto lb1;
  if flTabFils then sErr:=SaveFils;
  if(sErr<>'') then goto lb1;
  if flTabVid then begin
   LoadSkin(1);
   LoadSkin(3);
   if(SkinFileDum<>'') then begin SkinFile:=SkinFileDum; SkinFileDum:=''; end;
  end;
 end;

lb1:
 if flTabFlds or flTabCols then with frmMain do begin
  LoadFlds;
  BoolVals;
  BookClear(PanelA,0);
  BookClear(PanelB,0);
  BookClear(PanelS,0);
  BookClear(PanelG,0);
  BookClear(PanelT,0);
  PrepTreeHeader(tvBooksA);
  PrepTreeHeader(tvBooksB);
  PrepTreeHeader(tvBooksS);
  PrepTreeHeader(tvBooksG);
  PrepTreeHeader(tvBooksT);
  if Assigned(tvAvt.FocusedNode) then tvAvtChange(tvAvt,tvAvt.FocusedNode);
  if Assigned(tvSer.FocusedNode) then tvAvtChange(tvSer,tvSer.FocusedNode);
  if Assigned(tvGen.FocusedNode) then tvAvtChange(tvGen,tvGen.FocusedNode);
  if Assigned(tvBook.FocusedNode) then tvAvtChange(tvBook,tvBook.FocusedNode);
 end;
 if flTabOther then LoadOther;
 if flTabFils then ReadDBMain(2);
 if flTabVid then begin
  LoadSkin(0);
  SkinFileDum:='';
  LoadSkin(2);
 end;

 if(sErr<>'') then MessageBox(frmSets.handle,pchar('Не получилось '+sErr),'Ошибка',MB_OK+MB_ICONERROR)
 else begin
  result:=true;
 end;
end;

procedure TfrmSets.LoadSets();
begin
 LoadFlds;
 LoadOther;
 flTabFlds:=false; flTabCols:=false; flTabDirs:=false; flTabVid:=false;
 flTabOther:=false; flTabFils:=false;
 btOK.Enabled:=false;
end;

procedure TfrmSets.lvReadersClick(Sender: TObject);
begin
 if rbExtOld.Checked then rbFldNewClick(rbExtOld);
end;

procedure TfrmSets.btAZRClick(Sender: TObject);
begin
 with FontDial do begin
  if((Sender as TComponent).Tag=1) then begin
   Font.Name:=RusBar.Font.Name;
   Font.CharSet:=RusBar.Font.Charset;
   Font.Color:=RusBar.Font.Color;
   Font.Height:=RusBar.Font.Height;
   Font.Size:=RusBar.Font.Size;
   Font.Style:=RusBar.Font.Style;
   if not Execute then exit;
   RusBar.Font.Assign(Font);
  end else begin
   Font.Name:=EngBar.Font.Name;
   Font.CharSet:=EngBar.Font.Charset;
   Font.Color:=EngBar.Font.Color;
   Font.Height:=EngBar.Font.Height;
   Font.Size:=EngBar.Font.Size;
   Font.Style:=EngBar.Font.Style;
   if not Execute then exit;
   EngBar.Font.Assign(Font);
  end;
 end;
 flTabVid:=true; btOK.Enabled:=true;
end;

procedure TfrmSets.btFldAddClick(Sender: TObject);
var sName,sTrue,sFalse:string; n,i,j,nType:integer; flTrue,flFalse:boolean;
begin
 if((Sender as TComponent).Tag=2) then begin
  if(MessageBox(handle,pchar('Действительно удалить поле '+QuotedStr(sgFldsC.Cells[1,sgFldsC.Row])+'? '
   +'Данные пропадут окончательно и бесповоротно!'),'Предупреждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)<>IDYES) then exit;
  with sgFldsC do begin
   if(Cells[5,Row]<>'') then Cells[5,0]:=Cells[5,0]+';'+Cells[5,Row];
   for i:=Row+1 to RowCount-1 do for j:=1 to ColCount-1 do Cells[j,i-1]:=Cells[j,i];
   RowCount:=RowCount-1;
  end;
  flTabFlds:=true; btOK.Enabled:=true;
  exit;
 end;
 sName:=StringReplace(trim(edNewFldName.Text),';',',',[rfReplaceAll]);
 if(sName='') then begin MessageBox(handle,pchar('Нет названия поля'),'Ошибка',MB_OK+MB_ICONERROR); exit; end;
 if(length(sName)>tbDop.Fields[1].Size) then begin
  MessageBox(handle,pchar('Длина названия > '+inttostr(tbDop.Fields[1].Size)),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if(cbNewFldType.ItemIndex=0) then begin
  if rbTxtTrue.Checked then sTrue:=trim(edTrue.Text)
  else begin
   n:=-1; for i:=0 to high(idImgBool) do
    if(idImgBool[i]=cbImgTrue.ItemIndex) then begin n:=i; break; end;
   if(n>-1) then sTrue:=inttostr(n) else sTrue:='да';
  end;
  if rbTxtFalse.Checked then sFalse:=trim(edFalse.Text)
  else begin
   n:=-1; for i:=0 to high(idImgBool) do
    if(idImgBool[i]=cbImgFalse.ItemIndex) then begin n:=i; break; end;
   if(n>-1) then sFalse:=inttostr(n) else sFalse:='да';
  end;
  if(length(sTrue)>tbDop.Fields[3].Size) then begin
    MessageBox(handle,pchar('Текст для обозначения ''true'' > '+inttostr(tbDop.Fields[3].Size)
     +' знаков'),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if(length(sFalse)>tbDop.Fields[4].Size) then begin
    MessageBox(handle,pchar('Текст для обозначения ''false'' > '+inttostr(tbDop.Fields[4].Size)
     +' знаков'),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if(sTrue='') and (sFalse='') then begin
    MessageBox(handle,pchar('Нет обозначения'),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
 end;
 if not rbTxtTrue.Checked then flTrue:=false
 else begin flTrue:=true; try strtoint(sTrue); except flTrue:=false; end; end;
 if not rbTxtFalse.Checked then flFalse:=false
 else begin flFalse:=true; try strtoint(sFalse); except flFalse:=false; end; end;
 if flTrue or flFalse then begin
  MessageBox(handle,pchar('Текстовое обозначение не может быть числом'),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 nType:=(cbNewFldType.ItemIndex+1)*100;
 if rbFldNew.Checked then begin
  if(MessageBox(handle,pchar('Добавить в БД поле '''+sName+''' ('+cbNewFldType.Text+')?'),'Подтверждение',
   MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON2)<>IDYES) then exit;
  with sgFldsC do begin
   n:=RowCount; RowCount:=RowCount+1;
   Cells[0,n]:=inttostr(n);
   Cells[1,n]:=sName;
   Cells[2,n]:=ftype[nType div 100];
   Cells[5,n]:='';
   Cells[6,n]:=sTrue;
   Cells[7,n]:=sFalse;
   Cells[8,n]:=inttostr(nType);
  end;
 end else begin
  if(MessageBox(handle,pchar('Изменить поле '''+sgFldsC.Cells[1,sgFldsC.Row]+'''?'),'Подтверждение',
   MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON2)<>IDYES) then exit;
  with sgFldsC do begin
   n:=Row;
   Cells[1,n]:=sName;
   Cells[6,n]:=sTrue;
   Cells[7,n]:=sFalse;
   if(Cells[5,n]<>'') then Cells[5,n]:=inttostr(-strtoint(Cells[5,n]));
  end;
 end;
 flTabFlds:=true; btOK.Enabled:=true;
end;

procedure TfrmSets.btImgBoolAddClick(Sender: TObject);
var tmp:TBitmap; nh,nw,i,n:integer;
begin
 if((Sender as TComponent).Tag=1) then begin
  with OpenDialImg do begin
   Title:='Значок из файла (bmp 16x16)';
   Filter:='Картинки 16x16 (*.bmp)|*.bmp';
InitialDir:=AppPath;
   if not Execute then exit;
    tmp:=TBitmap.Create; tmp.LoadFromFile(FileName);
    nw:=tmp.Width; nh:=tmp.Height;
    tmp.Free;
    if(nw<>16) or (nh<>16) then begin
      MessageBox(handle,pchar('Картинка должна быть 16x16'),'Ошибка',MB_OK+MB_ICONERROR); exit;
    end;
   tbImgBool.AppendRecord([nil,tmp.Width,'bmp']);
   tbImgBool.Edit;
   (tbImgBool.FieldByName('Img') as TBlobField).LoadFromFile(FileName);
   tbImgBool.Post;
  end;
 end else begin
  n:=-1;
  for i:=0 to high(idImgBool) do
   if(idImgBool[i]=cbImgBool.ItemIndex) then begin n:=i; break; end;
  q0.SQL.Text:='DELETE FROM tbImgBool WHERE id='+inttostr(n);
  q0.ExecSQL; n:=q0.RowsAffected;
  if(n<1) then MessageBox(handle,pchar('Не получилось...'),'Ошибка',MB_OK+MB_ICONERROR)
  else begin
   q0.SQL.Text:='UPDATE tbDop SET vTrue=''да'' WHERE vTrue='+inttostr(n); q0.ExecSQL;
   q0.SQL.Text:='UPDATE tbDop SET vFalse=''нет'' WHERE vTrue='+inttostr(n); q0.ExecSQL;
  end;
 end;
 LoadImgBool;
 LoadImgBool2Combos;
end;

procedure TfrmSets.btOKClick(Sender: TObject);
begin
 if((Sender as TComponent).Tag=1) then begin
  if flTabDirs or flTabVid or flTabFlds or flTabCols or flTabOther or flTabFils then
   case MessageBox(handle,pchar('Сохранить изменения?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON2) of
    IDCANCEL: exit;
    IDYES: if not SaveSets(true) then exit;
    IDNO:  exit;
   end;
 end else begin
  if flTabDirs or flTabVid or flTabFlds or flTabCols or flTabOther or flTabFils then
   case MessageBox(handle,pchar('Изменения не сохранены. Все равно выйти?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2) of
    IDCANCEL: exit;
    IDNO:  exit;
   end;
  SaveSets(false);
  Close;
 end;
 btOK.Enabled:=false;
 flTabFlds:=false; flTabCols:=false; flTabDirs:=false; flTabVid:=false;
 flTabOther:=false; flTabFils:=false;
end;

procedure TfrmSets.cbNewFldTypeChange(Sender: TObject);
begin
 gbTrue.Enabled:=(cbNewFldType.ItemIndex<1);
 gbFalse.Enabled:=gbTrue.Enabled;
end;

procedure TfrmSets.chBoolDblClick(Sender: TObject);
begin
 flTabOther:=true; btOK.Enabled:=true;
 edCopyNFld.Enabled:=rbCopyNFld2.Checked;
 rgTabsBt.Enabled:=chTabsBt.Checked;
end;

procedure TfrmSets.FormCreate(Sender: TObject);
var i:integer;
begin
 LoadImgBool2Combos;
 with frmSets.sgFldsC do begin
  ColCount:=10;  ColWidths[0]:=20;
  Cells[1,0]:='Название'; ColWidths[1]:=180;
  Cells[2,0]:='Тип'; ColWidths[2]:=70;
  Cells[3,0]:='true'; ColWidths[3]:=50;
  Cells[4,0]:='false'; ColWidths[4]:=50;
  Cells[5,0]:='ID';
  Cells[6,0]:='true';
  Cells[7,0]:='false';
  Cells[8,0]:='type';
  Cells[9,0]:='';
  ColWidths[5]:=-1; ColWidths[6]:=-1; ColWidths[7]:=-1; ColWidths[8]:=-1; ColWidths[9]:=-1;
 end;
 with frmSets.sgColsAll do begin
  ColCount:=2;  ColWidths[0]:=190;
  ColWidths[1]:=-1;
 end;
 with sgCA do begin ColCount:=sgColsAll.ColCount; for i:=0 to ColCount-1 do ColWidths[i]:=sgColsAll.ColWidths[i]; end;
 with sgCB do begin ColCount:=sgColsAll.ColCount; for i:=0 to ColCount-1 do ColWidths[i]:=sgColsAll.ColWidths[i]; end;
 with sgCS do begin ColCount:=sgColsAll.ColCount; for i:=0 to ColCount-1 do ColWidths[i]:=sgColsAll.ColWidths[i]; end;
 with sgCG do begin ColCount:=sgColsAll.ColCount; for i:=0 to ColCount-1 do ColWidths[i]:=sgColsAll.ColWidths[i]; end;
 with sgCT do begin ColCount:=sgColsAll.ColCount; for i:=0 to ColCount-1 do ColWidths[i]:=sgColsAll.ColWidths[i]; end;
 for i:=0 to Pages.PageCount-1 do Pages.Pages[i].TabVisible:=false;
 flTabDirs:=false; flTabVid:=false; flTabFlds:=false; flTabCols:=false;
 flTabOther:=false; flTabFils:=false;
 btOK.Enabled:=false;
end;

procedure TfrmSets.lbLeftTvClick(Sender: TObject);
begin
 with FontDial do begin
  Font.Name:=(Sender as TLabel).Font.Name;
  Font.CharSet:=(Sender as TLabel).Font.Charset;
  Font.Color:=(Sender as TLabel).Font.Color;
  Font.Height:=(Sender as TLabel).Font.Height;
  Font.Size:=(Sender as TLabel).Font.Size;
  Font.Style:=(Sender as TLabel).Font.Style;
  if not Execute then exit;
  (Sender as TLabel).Font.Assign(Font);
 end;
 flTabVid:=true; btOK.Enabled:=true;
end;

procedure TfrmSets.rbFldNewClick(Sender: TObject);
begin
 if((Sender as TComponent).Tag=0) then begin OldFld(sgFldsC.Row); exit; end;
 if rbExtNew.Checked then begin edExt1.Text:=''; edExt2.Text:=''; end
 else begin
  if(lvReaders.ItemIndex<0) then exit;
   edExt1.Text:=lvReaders.Items[lvReaders.ItemIndex].Caption;
   edExt2.Text:=lvReaders.Items[lvReaders.ItemIndex].SubItems[0];
 end;
end;

procedure TfrmSets.RusBarClick(Sender: TObject);
begin
 with ColorDial do begin
  Color:=(Sender as TToolBar).GradientEndColor;
  if not Execute then exit;
  (Sender as TToolBar).GradientEndColor:=Color;
 end;
 flTabVid:=true; btOK.Enabled:=true;
end;

procedure TfrmSets.RzButton1Click(Sender: TObject);
begin
 if((Sender as TComponent).Tag=1) then with OpenDial do begin
  Title:='Загрузить шкурку';
  Filter:='Файлы ini (*.ini)|*.ini'; FilterIndex:=1;
  FileName:=SkinFile;
  if not Execute then exit;
  if not InitSkin(true,FileName) then LoadSkin(1)
  else begin
   SkinFileDum:=FileName;
   LoadSkin(2);
   flTabVid:=true; btOK.Enabled:=true;
  end;
 end else with SaveDial do begin
  Title:='Сохранить шкурку';
  Filter:='Файлы ini (*.ini)|*.ini'; FilterIndex:=1;
  FileName:=SkinFile;
  if not Execute then exit;
  LoadSkin(1);
  InitSkin(false,FileName);
  lbSkin.Caption:=FileName;
  LoadSkin(0);
  SkinFileDum:=FileName;
 end;
end;

procedure TfrmSets.pnLeftTvClick(Sender: TObject);
begin
 with ColorDial do begin
  if(Sender is TRzPanel) then Color:=(Sender as TRzPanel).Color
  else Color:=(Sender as TRzSizePanel).Color;
  if not Execute then exit;
  if((Sender as TComponent).Tag=0) then begin
   if(Sender is TRzPanel) then (Sender as TRzPanel).Color:=Color
   else (Sender as TRzSizePanel).Color:=Color;
  end else begin
   if((Sender as TRzPanel).Parent is TRzPanel) then ((Sender as TRzPanel).Parent as TRzPanel).Color:=Color
   else (Sender as TRzSizePanel).Color:=Color;
  end;
 end;
 flTabVid:=true; btOK.Enabled:=true;
end;

procedure TfrmSets.btLClick(Sender: TObject);
var i,j,n:integer; sg0:TStringGrid; s:string;
begin
 case PagesCols.ActivePageIndex of
 iSetsPageA: sg0:=sgCA;
 iSetsPageS: sg0:=sgCS;
 iSetsPageG: sg0:=sgCG;
 iSetsPageB: sg0:=sgCB;
 iSetsPageT: sg0:=sgCT
 else exit;
 end;
 flTabCols:=true; btOK.Enabled:=true;
 with sg0 do
 case (Sender as TComponent).Tag of
 1: begin
   s:=sgColsAll.Cells[1,sgColsAll.Row]; n:=-1;
   for i:=0 to RowCount-1 do if(Cells[1,i]=s) then begin n:=Row; break; end;
   if(n>-1) then
    if(MessageBox(handle,pchar('Такое уже есть. Все равно добавить?'),
     'Подтверждение',MB_YESNOCANCEL+MB_ICONWARNING+MB_DEFBUTTON2)<>IDYES) then exit;
   RowCount:=RowCount+1;
   for i:=RowCount-2 downto Row do for j:=0 to ColCount-1 do Cells[j,i+1]:=Cells[j,i];
   for j:=0 to ColCount-1 do Cells[j,Row]:=sgColsAll.Cells[j,sgColsAll.Row];
    end;
 2: begin
   if(RowCount=1) then exit;
   for i:=Row+1 to RowCount-1 do for j:=0 to ColCount-1 do Cells[j,i-1]:=Cells[j,i];
   RowCount:=RowCount-1;
    end;
 3: begin
   if(Row=0) then exit;
   for j:=0 to ColCount-1 do begin s:=Cells[j,Row]; Cells[j,Row]:=Cells[j,Row-1]; Cells[j,Row-1]:=s; end;
   Row:=Row-1;
    end;
 4: begin
   if(Row=RowCount-1) then exit;
   for j:=0 to ColCount-1 do begin s:=Cells[j,Row+1]; Cells[j,Row+1]:=Cells[j,Row]; Cells[j,Row]:=s; end;
   Row:=Row+1;
    end;
 end;
end;

procedure TfrmSets.btnAddExtClick(Sender: TObject);
var item0:TListItem; id:integer;
begin
 if((Sender as TComponent).Tag=1) then begin
  if(trim(edExt1.Text)='') then begin
    MessageBox(handle,'Нет типа файла','Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if(trim(edExt2.Text)='') then begin
    MessageBox(handle,'Нет программы','Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  with lvReaders do
   if rbExtNew.Checked then begin
    Item0 := Items.Add;
    Item0.Caption :=edExt1.Text;
    Item0.SubItems.Add(edExt2.Text);
    Item0.SubItems.Add('');
   end else begin
    if(ItemIndex<0) then begin
     MessageBox(handle,'Не выбрано, что менять','Ошибка',MB_OK+MB_ICONERROR); exit;
    end;
    Items[ItemIndex].Caption:=edExt1.Text;
    Items[ItemIndex].SubItems[0]:=edExt2.Text;
    try Items[ItemIndex].SubItems[1]:=inttostr(-strtoint(Items[ItemIndex].SubItems[1]));
    except Items[ItemIndex].SubItems[1]:=''; end;
   end;
 end else begin
  try id:=strtoint(lvReaders.Items[lvReaders.ItemIndex].SubItems[1]); except id:=0; end;
  if(id<>0) then lvReaders.Columns[2].Caption:=lvReaders.Columns[2].Caption+';'+inttostr(id);
  lvReaders.Items[lvReaders.ItemIndex].Delete;
  edExt1.Text:=''; edExt2.Text:=''; rbExtNew.Checked:=true;
 end;
end;

procedure TfrmSets.edDir1ButtonClick(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
   1: begin
     DirDial.Caption:='Папка устройства';
     DirDial.Directory:=Dir1;
     if not DirDial.Execute then exit;
     edDir1.Text:=DirDial.Directory;
    end;
   2: begin
     DirDial.Caption:='Папка ''Для чтения''';
     DirDial.Directory:=Dir2;
     if not DirDial.Execute then exit;
     edDir2.Text:=DirDial.Directory;
    end;
   3: begin
     OpenDial.Title:='Программа для '+edExt1.Text;
     OpenDial.FileName:=edExt2.Text;
     if not OpenDial.Execute then exit;
     edExt2.Text:=OpenDial.FileName;
    end;
  end;
end;

procedure TfrmSets.edDir1Change(Sender: TObject);
begin
 if((Sender as TComponent).Tag=3) then flTabFils:=true else flTabOther:=true;
 btOK.Enabled:=true;
end;

procedure TfrmSets.sgFldsCDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var tmp:TBitmap; n:integer;
begin
 if (gdFixed in State) or ((ACol<>3) and (ACol<>4)) then exit;
 with (Sender as TStringGrid) do begin
  Canvas.fillRect(Rect);
  try n:=strtoint(Cells[ACol+3,ARow]); except n:=-1; end;
  if(n<0) then Canvas.TextOut(Rect.Left,Rect.Top,Cells[ACol+3,ARow])
  else begin
   tmp:=TBitmap.Create;
   if(high(idImgBool)>=n) then frmMain.ilBool.GetBitmap(idImgBool[n],tmp);
   Canvas.Draw(Rect.Left, Rect.Top, tmp);
   tmp.Free;
  end;
 end;
end;

procedure TfrmSets.sgFldsCSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 if rbFldOld.Checked then OldFld(ARow);
end;

procedure TfrmSets.tvPagesChange(Sender: TObject; Node: TTreeNode);
begin
 if(tvPages.Selected.Index>=0) then
  Pages.ActivePageIndex:=tvPages.Selected.Index;
end;

end.
