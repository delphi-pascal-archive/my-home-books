unit unMain;

interface

uses unSub, unSubDB, unSubTree, ZipForge, ALfcnString,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ABSMain, DB, RzPanel, ExtCtrls, RzSplit, RzTabs,
  VirtualTrees, Mask, RzEdit, RzButton, RzLabel, RzStatus, Menus, Grids, RzGrids,
  RzCmboBx, RzRadChk, DBGrids, RzDBGrid, RzRadGrp, RzShellDialogs, ImgList,
  Buttons, RzSpnEdt, ActnList, ComCtrls, ToolWin, RzCommon, RzSelDir;

type
  TfrmMain = class(TForm)
    Pages: TRzPageControl;
    TabAvt: TRzTabSheet;
    TabSer: TRzTabSheet;
    TabGen: TRzTabSheet;
    TabLibs: TRzTabSheet;
    TabBook: TRzTabSheet;
    TabTot: TRzTabSheet;
    TabSheet8: TRzTabSheet;
    Button1: TButton;
    me1: TMemo;
    PanelAvt: TRzSizePanel;
    RzPanel16: TRzPanel;
    Label19: TLabel;
    tbClearEdAuthor: TRzToolButton;
    edLocateA: TRzEdit;
    tvAvt: TVirtualStringTree;
    PanelSer: TRzSizePanel;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    RzToolButton1: TRzToolButton;
    edLocateS: TRzEdit;
    tvSer: TVirtualStringTree;
    PanelGen: TRzSizePanel;
    RzPanel2: TRzPanel;
    tvGen: TVirtualStringTree;
    PanelA: TPanel;
    PanelRightA: TRzSizePanel;
    MMenu1: TMainMenu;
    miLib: TMenuItem;
    miLibNew: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    Stat0: TRzStatusPane;
    Stat1: TRzStatusPane;
    StatProgress: TRzProgressStatus;
    PanelLib1: TRzPanel;
    PanelLib: TRzSizePanel;
    tvLib: TVirtualStringTree;
    sgLib: TRzStringGrid;
    PanelBook: TRzSizePanel;
    RzPanel7: TRzPanel;
    Label4: TLabel;
    RzToolButton4: TRzToolButton;
    edLocateB: TRzEdit;
    tvBook: TVirtualStringTree;
    SaveDial: TRzSaveDialog;
    rbGen1: TRzRadioButton;
    rbGen2: TRzRadioButton;
    PanelBookA: TRzPanel;
    RzPanel30: TRzPanel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzPanel31: TRzPanel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel54: TRzLabel;
    RzLabel55: TRzLabel;
    RzPanel32: TRzPanel;
    RzLabel76: TRzLabel;
    RzLabel77: TRzLabel;
    RzLabel78: TRzLabel;
    RzLabel79: TRzLabel;
    tvBooksA: TVirtualStringTree;
    RzSizePanel15: TRzSizePanel;
    RzPanel33: TRzPanel;
    RzLabel80: TRzLabel;
    RzLabel81: TRzLabel;
    RzLabel82: TRzLabel;
    RzLabel83: TRzLabel;
    RzLabel84: TRzLabel;
    RzLabel85: TRzLabel;
    RzLabel86: TRzLabel;
    RzLabel87: TRzLabel;
    RzLabel88: TRzLabel;
    RzLabel89: TRzLabel;
    RzLabel90: TRzLabel;
    RzLabel91: TRzLabel;
    RzMemo4: TRzMemo;
    Image4: TImage;
    miLibDel: TMenuItem;
    mi0N1: TMenuItem;
    mi0N2: TMenuItem;
    miExit: TMenuItem;
    miLibChoise: TMenuItem;
    miLibAll: TMenuItem;
    miSets: TMenuItem;
    ilBool: TImageList;
    miTools: TMenuItem;
    miToolsGen: TMenuItem;
    OpenDial: TRzOpenDialog;
    ImgList0: TImageList;
    PanelTot: TRzSizePanel;
    pmBook: TPopupMenu;
    pmBookRead: TMenuItem;
    pmBook2Dir1: TMenuItem;
    pmBook2Dir2: TMenuItem;
    pmB1: TMenuItem;
    pmBookInfo: TMenuItem;
    pmB2: TMenuItem;
    pmBookSel: TMenuItem;
    pmBookUnsel: TMenuItem;
    pmB3: TMenuItem;
    pmBookCopy: TMenuItem;
    pmB5: TMenuItem;
    miBook: TMenuItem;
    miBookDir1: TMenuItem;
    miBookDir2: TMenuItem;
    miBook1: TMenuItem;
    miBookInfo: TMenuItem;
    miBook2: TMenuItem;
    miBookSel: TMenuItem;
    miBookUnsel: TMenuItem;
    miBookRead: TMenuItem;
    cbFldsT: TRzComboBox;
    cbTotVal: TRzComboBox;
    edTotVal: TRzEdit;
    btTotS: TRzRapidFireButton;
    btTotF: TRzRapidFireButton;
    btTotD: TRzRapidFireButton;
    btTotB: TRzRapidFireButton;
    btTotO1: TRzRapidFireButton;
    btTotO2: TRzRapidFireButton;
    btTotO4: TRzRapidFireButton;
    btTotO3: TRzRapidFireButton;
    btTotO6: TRzRapidFireButton;
    btTotO5: TRzRapidFireButton;
    btFind: TRzBitBtn;
    pmBookEdit: TMenuItem;
    MainBar: TToolBar;
    btRead: TToolButton;
    EngBar: TToolBar;
    btStarE: TToolButton;
    btStar1E: TToolButton;
    btAZE: TToolButton;
    RusBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    btAZR: TToolButton;
    btDir: TToolButton;
    ToolButton6: TToolButton;
    btRu: TToolButton;
    tbEn: TToolButton;
    btCbLibSeparator: TToolButton;
    btSel: TToolButton;
    ToolButton4: TToolButton;
    btUnSel: TToolButton;
    btSets: TToolButton;
    pmBookSelPic: TMenuItem;
    miiBookSelPic: TMenuItem;
    ToolButton3: TToolButton;
    cbLib: TRzComboBox;
    rbTot: TRzRadioGroup;
    miLibUpd: TMenuItem;
    PanelG: TPanel;
    PanelRightG: TRzSizePanel;
    Image2: TImage;
    RzSizePanel2: TRzSizePanel;
    RzPanel12: TRzPanel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzMemo2: TRzMemo;
    PanelBookG: TRzPanel;
    RzPanel14: TRzPanel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzPanel15: TRzPanel;
    RzLabel41: TRzLabel;
    RzLabel42: TRzLabel;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzPanel17: TRzPanel;
    RzLabel45: TRzLabel;
    RzLabel46: TRzLabel;
    RzLabel47: TRzLabel;
    RzLabel48: TRzLabel;
    tvBooksG: TVirtualStringTree;
    PanelB: TPanel;
    PanelRightB: TRzSizePanel;
    Image3: TImage;
    RzSizePanel4: TRzSizePanel;
    RzPanel18: TRzPanel;
    RzLabel49: TRzLabel;
    RzLabel50: TRzLabel;
    RzLabel51: TRzLabel;
    RzLabel52: TRzLabel;
    RzLabel53: TRzLabel;
    RzLabel56: TRzLabel;
    RzLabel57: TRzLabel;
    RzLabel58: TRzLabel;
    RzLabel59: TRzLabel;
    RzLabel60: TRzLabel;
    RzLabel61: TRzLabel;
    RzLabel62: TRzLabel;
    RzMemo3: TRzMemo;
    PanelBookB: TRzPanel;
    RzPanel20: TRzPanel;
    RzLabel63: TRzLabel;
    RzLabel64: TRzLabel;
    RzPanel21: TRzPanel;
    RzLabel65: TRzLabel;
    RzLabel66: TRzLabel;
    RzLabel67: TRzLabel;
    RzLabel68: TRzLabel;
    RzPanel22: TRzPanel;
    RzLabel69: TRzLabel;
    RzLabel70: TRzLabel;
    RzLabel71: TRzLabel;
    RzLabel72: TRzLabel;
    tvBooksB: TVirtualStringTree;
    PanelT: TPanel;
    PanelRightT: TRzSizePanel;
    Image5: TImage;
    RzSizePanel6: TRzSizePanel;
    RzPanel23: TRzPanel;
    RzLabel73: TRzLabel;
    RzLabel74: TRzLabel;
    RzLabel75: TRzLabel;
    RzLabel92: TRzLabel;
    RzLabel93: TRzLabel;
    RzLabel94: TRzLabel;
    RzLabel95: TRzLabel;
    RzLabel96: TRzLabel;
    RzLabel97: TRzLabel;
    RzLabel98: TRzLabel;
    RzLabel99: TRzLabel;
    RzLabel100: TRzLabel;
    RzMemo5: TRzMemo;
    PanelBookT: TRzPanel;
    RzPanel25: TRzPanel;
    RzLabel101: TRzLabel;
    RzLabel102: TRzLabel;
    RzPanel26: TRzPanel;
    RzLabel103: TRzLabel;
    RzLabel104: TRzLabel;
    RzLabel105: TRzLabel;
    RzLabel106: TRzLabel;
    RzPanel27: TRzPanel;
    RzLabel107: TRzLabel;
    RzLabel108: TRzLabel;
    RzLabel109: TRzLabel;
    RzLabel110: TRzLabel;
    tvBooksT: TVirtualStringTree;
    PanelS: TPanel;
    PanelRightS: TRzSizePanel;
    Image1: TImage;
    RzSizePanel9: TRzSizePanel;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzMemo1: TRzMemo;
    PanelBookS: TRzPanel;
    RzPanel9: TRzPanel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzPanel10: TRzPanel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzPanel11: TRzPanel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    tvBooksS: TVirtualStringTree;
    miToolsExportLeft: TMenuItem;
    ToolButton5: TToolButton;
    RzPanel6: TRzPanel;
    Label3: TLabel;
    RzToolButton3: TRzToolButton;
    RzEdit3: TRzEdit;
    DirDial: TRzSelDirDialog;
    btTabA: TToolButton;
    btTabS: TToolButton;
    btTabG: TToolButton;
    btTabB: TToolButton;
    btTabT: TToolButton;
    btTabL: TToolButton;
    miToolsExportBooks: TMenuItem;
    miTools1: TMenuItem;
    Label5: TLabel;
    mnAbout: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvAvtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure tvAvtCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure tvAvtHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvAvtChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure miLibNewClick(Sender: TObject);
    procedure sgLibSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure rbGen1Click(Sender: TObject);
    procedure tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure tvBooksACompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure tvBooksAHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvBooksAChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure cbLibChange(Sender: TObject);
    procedure miLibAllClick(Sender: TObject);
    procedure edLocateAChange(Sender: TObject);
    procedure miSetsClick(Sender: TObject);
    procedure tvBooksAInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure miExitClick(Sender: TObject);
    procedure miLibDelClick(Sender: TObject);
    procedure tvBooksAGetImageIndexEx(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer;
      var ImageList: TCustomImageList);
    procedure miToolsGenClick(Sender: TObject);
    procedure pmBookPopup(Sender: TObject);
    procedure ActEditFldValExecute(Sender: TObject);
    procedure tvBooksADblClick(Sender: TObject);
    procedure ActCopyNFldExecute(Sender: TObject);
    procedure btStarRClick(Sender: TObject);
    procedure PagesChange(Sender: TObject);
    procedure btRuClick(Sender: TObject);
    procedure miBookSelClick(Sender: TObject);
    procedure cbFldsTClick(Sender: TObject);
    procedure rbTotClick(Sender: TObject);
    procedure btFindClick(Sender: TObject);
    procedure btTotSClick(Sender: TObject);
    procedure miBookInfoClick(Sender: TObject);
    procedure miBookDir1Click(Sender: TObject);
    procedure btTabAClick(Sender: TObject);
    procedure miToolsExportBooksClick(Sender: TObject);
    procedure miLibAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure mnAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses unLibNew, unSets, unEditVal, unInfo;

{$R *.dfm}

procedure TfrmMain.btFindClick(Sender: TObject);
begin
 TotalFind;
end;

procedure TfrmMain.cbFldsTClick(Sender: TObject);
begin
 PrepTotFld((Sender as TRzComboBox).ItemIndex);
end;

procedure TfrmMain.cbLibChange(Sender: TObject);
begin
 miLibChoise.Items[cbLib.ItemIndex].Click;
end;

procedure TfrmMain.ActCopyNFldExecute(Sender: TObject);
begin
 CopyNFld;
end;

procedure TfrmMain.ActEditFldValExecute(Sender: TObject);
begin
 frmEditVal.ShowModal;
end;

procedure TfrmMain.edLocateAChange(Sender: TObject);
var s,s1:string; ntag,i:integer;
begin
 s:=trim((Sender as TRzEdit).Text);
 if(s='') then exit;
 ntag:=(Sender as TComponent).Tag;
 s[1]:=AnsiUpperCase(s)[1];
 if(s=sFiltrs[ntag]) then exit;
 with (Sender as TRzEdit) do begin Text:=s; SelStart:=length(s); end;

 if(sFiltrs[nTag]='') or (s[1]<>sFiltrs[nTag][1]) or (s=btAZR.Caption) or (s=btAZE.Caption) then begin
  sFiltrs[nTag]:=s;
  btStarRClick(nil);
  FillLeftTrees(nTag,s[1]);
 end;
 if(length(s)=1) then begin sFiltrs[nTag]:=s; exit; end;

 sFiltrs[nTag]:=s;
 s:=AnsiUpperCase(s);
 for i:=length(s) downto 2 do begin
  s1:=copy(s,1,i);
  case nTag of
   1: if GetNodeBySubStr(tvAvt,AnsiUpperCase(s1),true)<>nil then break;
   2: if GetNodeBySubStr(tvBook,AnsiUpperCase(s1),true)<>nil then break;
   3: if GetNodeBySubStr(tvSer,AnsiUpperCase(s1),true)<>nil then break;
  end;
 end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
const
  E : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  R : string = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЭЮЯ';
var i:integer; B: TToolButton;
begin
 Caption:=AppTit;
 Application.Title:=AppTit;
 miLibAll.Caption:=wAll;
 with sgLib do begin
   ColCount:=2; RowCount:=10;
   RowHeights[0]:=-1;
   ColWidths[0]:=160; ColWidths[1]:=1500;
   Cells[0,1]:='Название:';
   Cells[0,2]:='Папка:';
   Cells[0,3]:='Книги:';
   Cells[0,4]:='Авторы:';
   Cells[0,5]:='Файлы:';
   Cells[0,6]:='Серии:';
   Cells[0,7]:='Жанры:';
   Cells[0,8]:='Размер (полный):';
   Cells[0,9]:='Размер (на диске):';
   for i := 0 to high(arExt) do Cells[0,10+i]:=arExt[i].Name;
 end;
 for i:=1 to length(R) do begin
    B := TToolButton.Create(RusBar);
    B.Caption := R[i];
    B.Left := 100 + i * 27;
    B.Width := 25;
    B.Height := 25;
    B.Style := tbsTextButton;
    B.OnClick := btStarRClick;
    RusBar.InsertControl(B);
 end;
 for i:=1 to length(E) do begin
    B := TToolButton.Create(EngBar);
    B.Caption := E[i];
    B.Left := 100 + i * 27;
    B.Width := 25;
    B.Height := 25;
    B.Style := tbsTextButton;
    B.OnClick := btStarRClick;
    EngBar.InsertControl(B);
 end;
 with edTotVal do begin
   Left:=cbTotVal.Left;
   Top:=cbTotVal.Top;
   Width:=cbTotVal.Width;
   Height:=cbTotVal.Height;
 end;
 btTabA.Tag:=iPageA;
 btTabS.Tag:=iPageS;
 btTabG.Tag:=iPageG;
 btTabB.Tag:=iPageB;
 btTabT.Tag:=iPageT;
 btTabL.Tag:=iPageL;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
 PrepExit;
end;

procedure TfrmMain.miBookDir1Click(Sender: TObject);
begin
 BooksCopyTo((Sender as TComponent).Tag);
end;

procedure TfrmMain.miBookInfoClick(Sender: TObject);
var nd:PNodeDataB; idB,idF,idL:integer; tv0:TVirtualStringTree;
begin
 case Pages.ActivePageIndex of
  iPageA: tv0 := tvBooksA;
  iPageS: tv0 := tvBooksS;
  iPageG: tv0 := tvBooksG;
  iPageB: tv0 := tvBooksB;
  iPageT: tv0 := tvBooksT
  else exit;
 end;
 if(tv0.RootNodeCount<1) then begin MessageBox(handle,'Не выбрана книга','Ошибка',MB_OK+MB_ICONERROR); exit; end;
 nd := tv0.GetNodeData(tv0.FocusedNode);
 if not Assigned(nd) then begin MessageBox(handle,'Не выбрана книга','Ошибка',MB_OK+MB_ICONERROR); exit; end;
 idB:=nd^.idBook;
 idF:=nd^.idFil;
 idL:=nd^.idLib;
 case (Sender as TComponent).Tag of
  1: BookCopyTo(0,idB,idF,idL,'');
  2: begin
    BookClear(frmInfo.PanelA,3);
    BookShow(0, idB,idF,idL);
    frmInfo.BookShowI(idB,idF,idL);
    frmInfo.ShowModal;
  end;
 end;
end;

procedure TfrmMain.miBookSelClick(Sender: TObject);
begin
 SelAllBooks(((Sender as TComponent).Tag<>3),((Sender as TComponent).Tag=2));
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMain.miLibAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
var rct:TRect; 
begin
  MMenu1.OwnerDraw:=True;
  with ACanvas do begin
   FillRect(ARect);
  if(odSelected in State) or (odFocused in State) or (odHotLight in State) then begin
   Brush.Color:=clGradientActiveCaption;
   Pen.Style:=psClear;
  end else begin
   Brush.Color:=clMain;
   Pen.Style:=psClear;
  end;
   Font.Assign(fntMain);
   Rectangle(ARect);

   if((Sender as TMenuItem).Parent.MenuIndex<0)
    and (copy((Sender as TMenuItem).Name,1,2)<>'pm') then rct.Left:=ARect.Left
   else rct.Left:=ARect.Left+ImgList0.Width;
   rct.Top:=ARect.Top; rct.Right:=ARect.Right; rct.Bottom:=ARect.Bottom;
   if(odChecked in State) then begin
    ImgList0.Draw(ACanvas,ARect.Left,ARect.Top,0);
   end else begin
   if((Sender as TMenuItem).ImageIndex>-1) then
    ImgList0.Draw(ACanvas,ARect.Left,ARect.Top,(Sender as TMenuItem).ImageIndex);
   end;
 if((Sender as TMenuItem).Caption='_') then begin
   TextOut(ARect.Left,ARect.Top-3,'____________________________________________________');
 end else
   DrawText(handle,pchar(' '+(Sender as TMenuItem).Caption),
    length((Sender as TMenuItem).Caption)+1,rct,
    DT_LEFT+DT_SINGLELINE+DT_VCENTER+DT_NOCLIP);
  end;
end;

procedure TfrmMain.miLibAllClick(Sender: TObject);
var i:integer; s:string;
begin
 if(nnDB<1) then exit;
 for i:=0 to miLibChoise.Count-1 do miLibChoise.Items[i].Checked:=false;
 nDB1:=(Sender as TComponent).Tag;
 cbLib.ItemIndex:=nDB1;
 (Sender as TMenuItem).Checked:=true;
 if(nDB1=0) then begin nDB1:=0; nDB2:=nnDB-1; end else begin nDB1:=nDB1-1; nDB2:=nDB1; end;
 for i:=1 to 3 do
  if(sFiltrs[i]='*') or (sFiltrs[i]='А-Я') or (sFiltrs[i]='A-Z') then sFiltrs[i]:='А';
 with edLocateA do begin Text:=''; s:=sFiltrs[1]; sFiltrs[1]:=''; Text:=s; end;
 with edLocateB do begin Text:=''; s:=sFiltrs[2]; sFiltrs[2]:=''; Text:=s; end;
 with edLocateS do begin Text:=''; s:=sFiltrs[3]; sFiltrs[3]:=''; Text:=s; end;
 if rbGen1.Checked then i:=1 else if rbGen2.Checked then i:=2 else i:=0;
 if(sFiltrs[4]='*') then rbGen1.Checked:=true else rbGen2.Checked:=true;
 if((rbGen1.Checked) and (i=1)) or ((rbGen2.Checked) and (i=2)) then rbGen1Click(nil);
 tvBooksT.Clear;
 Stat1.Caption:='Коллекция: '+(Sender as TMenuItem).Caption;
end;

procedure TfrmMain.miLibDelClick(Sender: TObject);
begin
 DeleteLib;
end;

procedure TfrmMain.miLibNewClick(Sender: TObject);
begin
 with frmLibNew do begin
  if((Sender as TComponent).Tag=1) then Tag:=-1 else Tag:=nDB1;
  PanelStat.Visible:=false;
  meCur.Clear; meErr.Clear;
  ShowModal;
 end;
end;

procedure TfrmMain.miSetsClick(Sender: TObject);
begin
 frmSets.ShowModal;
end;

procedure TfrmMain.miToolsExportBooksClick(Sender: TObject);
var tv0:TVirtualStringTree; s:string; fl:boolean;
begin
 if((Sender as TComponent).Tag=1) then begin
  fl:=false;
  case Pages.ActivePageIndex of
   iPageA: begin tv0:=tvAvt; s:='авторов'; end;
   iPageS: begin tv0:=tvSer; s:='серий'; end;
   iPageB: begin tv0:=tvBook; s:='книг'; end
   else exit;
  end;
 end else begin
  fl:=true;
  case Pages.ActivePageIndex of
   iPageA: begin tv0:=tvBooksA; s:='книг автора '+(fctrl(PanelA,101) as TLabel).Caption; end;
   iPageS: begin tv0:=tvBooksS; s:='книг серии '+(fctrl(PanelS,101) as TLabel).Caption; end;
   iPageG: begin tv0:=tvBooksG; s:='книг жанра '+(fctrl(PanelG,101) as TLabel).Caption; end;
   iPageB: begin tv0:=tvBooksB; s:='книг '+(fctrl(PanelB,101) as TLabel).Caption; end;
   iPageT: begin tv0:=tvBooksT; s:='книг '+(fctrl(PanelT,101) as TLabel).Caption; end;
   else exit;
  end;
 end;
 SaveTree2File(tv0,s,fl);
end;

procedure TfrmMain.miToolsGenClick(Sender: TObject);
begin
 with OpenDial do begin
  Title:='Открыть файл со списком жанров';
  InitialDir:=AppPath;
  FileName:=FileGenres;
  Options:=Options-[osoFileMustExist];
  if not Execute then exit;
  MessageBox(handle,pchar('Найдено жанров: '+inttostr(GenresFile2BD(FileName,true))),
   'Информация',MB_OK+MB_ICONINFORMATION);
 end;
end;

procedure TfrmMain.mnAboutClick(Sender: TObject);
begin
 showmessage('shashka333@list.ru');
end;

procedure TfrmMain.PagesChange(Sender: TObject);
var s:string; i:integer;
begin
 s:='';
 case Pages.ActivePageIndex of
 iPageA: begin
          if(sFiltrs[1]<>'') then s:=AnsiUpperCase(sFiltrs[1])[1];
          miToolsExportLeft.Enabled:=true; miToolsExportBooks.Enabled:=true;
         end;
 iPageS: begin
          if(sFiltrs[3]<>'') then s:=AnsiUpperCase(sFiltrs[3])[1];
          miToolsExportLeft.Enabled:=true; miToolsExportBooks.Enabled:=true;
         end;
 iPageB: begin
          if(sFiltrs[2]<>'') then s:=AnsiUpperCase(sFiltrs[2])[1];
          miToolsExportLeft.Enabled:=true; miToolsExportBooks.Enabled:=true;
         end;
 iPageL: begin miToolsExportLeft.Enabled:=false; miToolsExportBooks.Enabled:=false; end;
 else begin miToolsExportLeft.Enabled:=false; miToolsExportBooks.Enabled:=true; end;
 end;
 with RusBar do for i:=0 to ButtonCount-1 do Buttons[i].Down:=(Buttons[i].Caption=s);
 with EngBar do for i:=0 to ButtonCount-1 do Buttons[i].Down:=(Buttons[i].Caption=s);
end;

procedure TfrmMain.pmBookPopup(Sender: TObject);
var nTB,n0,idBook,idLib,nSel,nCheck,nFld:integer; s:string; fl:boolean;
begin
 fl:=GetTreeCellInfo(Pages.ActivePageIndex,nTB,n0,idBook,idLib,nFld,nSel,nCheck,s);
 pmBookEdit.Enabled:=(nFld>100) and (nSel=1);
 pmBookCopy.Enabled:=((nFld>0) and ((nFld<100) or (nFld>200))) and (nSel=1) and (s<>'');
 pmBookRead.Enabled:=(nSel=1);
 pmBookInfo.Enabled:=(nSel=1);
 pmBook2Dir1.Enabled:=(nSel>0) or (nCheck>0);
 pmBook2Dir2.Enabled:=pmBook2Dir1.Enabled;
 pmBookSel.Enabled:=fl;
 pmBookSelPic.Enabled:=(nSel>0);
 pmBookUnsel.Enabled:=(nCheck>0);
end;

procedure TfrmMain.rbGen1Click(Sender: TObject);
var n1,n2:integer;
begin
 n1:=0; n2:=100;
 if rbGen1.Checked then sFiltrs[4]:='*' else sFiltrs[4]:='0';
 FillTreeGen(rbGen1.Checked,n1,n2);
 if(nFocusL[4]>0) then GetNodeByNG(tvGen.RootNode,nFocusL[4],true);
 frmMain.StatProgress.Percent:=0;
end;

procedure TfrmMain.rbTotClick(Sender: TObject);
begin
 edTotVal.Visible:=(rbTot.ItemIndex=1); cbTotVal.Visible:=not edTotVal.Visible;
 if cbTotVal.Visible and (cbTotVal.Items.Count=0) then GetTotFldVals(rbTot.ItemIndex);
end;

procedure TfrmMain.sgLibSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 CanSelect:=false;
end;

procedure TfrmMain.btRuClick(Sender: TObject);
begin
 case (Sender as TComponent).Tag of
  4: RusBar.Visible:=not RusBar.Visible;
  5: EngBar.Visible:=not EngBar.Visible;
 end;
end;

procedure TfrmMain.btStarRClick(Sender: TObject);
var i:integer; s:string; ed0:TRzEdit;
begin
 case Pages.ActivePageIndex of
  iPageA: ed0:=edLocateA;
  iPageS: ed0:=edLocateS;
  iPageB: ed0:=edLocateB
  else exit;
 end;
 with RusBar do for i:=0 to ButtonCount-1 do Buttons[i].Down:=false;
 with EngBar do for i:=0 to ButtonCount-1 do Buttons[i].Down:=false;
 if(Sender=nil) then begin
  if(ed0.Text=btAZR.Caption) or (ed0.Text=btAZE.Caption) then s:=ed0.Text
  else begin
   if(length(ed0.Text)<>1) then exit;
   s:=AnsiUpperCase(ed0.Text)[1];
  end;
  with RusBar do for i:=0 to ButtonCount-1 do
   if(Buttons[i].Caption=s) then begin Buttons[i].Down:=true; break; end;
  with EngBar do for i:=0 to ButtonCount-1 do
   if(Buttons[i].Caption=s) then begin Buttons[i].Down:=true; break; end;
 end else begin
  (Sender as TToolButton).Down:=true;
  ed0.Text:=(Sender as TToolButton).Caption;
 end;
end;

procedure TfrmMain.btTabAClick(Sender: TObject);
begin
 Pages.ActivePageIndex:=(Sender as TComponent).Tag;
end;

procedure TfrmMain.btTotSClick(Sender: TObject);
begin
 btTotO5.Enabled:=btTotS.Down;
 btTotO3.Enabled:=not btTotB.Down;
 btTotO4.Enabled:=not btTotB.Down;
 if not btTotO3.Enabled and btTotO3.Down then btTotO1.Down:=true;
 if not btTotO4.Enabled and btTotO4.Down then btTotO1.Down:=true;
 if not btTotO5.Enabled and btTotO5.Down then btTotO1.Down:=true;
 edTotVal.Enabled:=not btTotO6.Down;
 cbTotVal.Enabled:=edTotVal.Enabled;
end;

procedure TfrmMain.tvAvtChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  nd: PNodeDataL;
  sID,sDB,sFld:string;
begin
  (fCtrl(PanelA,101) as TLabel).Caption:='...';
  (fCtrl(PanelA,102) as TLabel).Caption:='(0)';
  case Sender.Tag of
  0: sgLib.Cols[1].Clear;
  1: begin BookClear(PanelA,0); tvBooksA.Clear; end;
  2: begin BookClear(PanelB,0); tvBooksB.Clear; end;
  3: begin BookClear(PanelS,0); tvBooksS.Clear; end;
  4: begin BookClear(PanelG,0); tvBooksG.Clear; end;
  5: begin BookClear(PanelT,0); tvBooksT.Clear; end;
  end;
 Sender.Refresh;
 nd := Sender.GetNodeData(Node);
 if not Assigned(nd) then Exit;
 sDB := nd^.sDB;
 sID := nd^.sID;
 if(Sender.Tag<>0) then begin sFld:=TabsField[Sender.Tag]; nFocusL[Sender.Tag]:=nd^.n; end;
 if(sDB<>'') and (sID<>'') then begin
  screen.Cursor:=crHourGlass;
  Enabled:=false;
  case Sender.Tag of
  0: GetLibStatictic(sDB);
  1: begin
    (fCtrl(PanelA,101) as TLabel).Caption:=nd.Text;
    (fCtrl(PanelA,102) as TLabel).Caption:='('+FillTreeBooks(sID,sDB,sFld,tvBooksA)+')';
   end;
  2: begin
    (fCtrl(PanelB,101) as TLabel).Caption:=nd.Text;
    (fCtrl(PanelB,102) as TLabel).Caption:='('+FillTreeBooks(sID,sDB,sFld,tvBooksB)+')';
   end;
  3: begin
    (fCtrl(PanelS,101) as TLabel).Caption:=nd.Text;
    (fCtrl(PanelS,102) as TLabel).Caption:='('+FillTreeBooks(sID,sDB,sFld,tvBooksS)+')';
   end;
  4: begin
    (fCtrl(PanelG,101) as TLabel).Caption:=nd.Text;
    (fCtrl(PanelG,102) as TLabel).Caption:='('+FillTreeBooks(sID,sDB,sFld,tvBooksG)+')';
   end;
  end;
 end;
  Enabled:=true;
  frmMain.StatProgress.Percent:=0;
  screen.Cursor:=crDefault;
end;

procedure TfrmMain.tvAvtCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
begin
 with TVirtualStringTree(Sender) do
  Result := AnsiCompareText(Text[Node1, Column], Text[Node2, Column]);
end;

procedure TfrmMain.tvAvtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var ndata:PNodeDataL;
begin
  ndata := Sender.GetNodeData(Node);
  CellText:=ndata.Text;
end;

procedure TfrmMain.tvAvtHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then begin
  with Sender do begin
   SortColumn := Column;
   if SortDirection = sdAscending then SortDirection := sdDescending
   else SortDirection := sdAscending;
   Treeview.SortTree(SortColumn, SortDirection, False);
   nDirSortL[Sender.Columns[0].Tag]:=SortDirection;
  end;
 end;
end;

procedure TfrmMain.tvBooksAChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var nd:PNodeDataB; idB,idF,idL:integer;
begin
 Sender.Refresh;
  nd := Sender.GetNodeData(Node);
  if not Assigned(nd) then Exit;
 idB:=nd^.idBook;
 idF:=nd^.idFil;
 idL:=nd^.idLib;
 nFocusB[Sender.Tag]:=nd^.n;
 case Sender.Tag of
  1: BookClear(PanelA,1);
  2: BookClear(PanelB,1);
  3: BookClear(PanelS,1);
  4: BookClear(PanelG,1);
  5: BookClear(PanelT,1);
 end;
  BookShow(Sender.Tag, idB,idF,idL);
end;

procedure TfrmMain.tvBooksACompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var nd1,nd2:PNodeDataB;
begin
 with TVirtualStringTree(Sender) do begin
  if((Header.Columns.Items[Column].Tag div 100)<>1) then begin
   Result := AnsiCompareText(Text[Node1, Column], Text[Node2, Column]);
  end else begin
   nd1:=GetNodeData(Node1);
   nd2:=GetNodeData(Node2);
   Result := AnsiCompareText(nd1.flds[Column], nd2.flds[Column]);
  end;
 end;
end;

procedure TfrmMain.tvBooksADblClick(Sender: TObject);
var n0,idFld0,idBook0,idLib0:integer; tv0:TVirtualStringTree;
    nd:PNodeDataB; sVal:string;
begin
 if not flBoolDblClick then exit;
 tv0:=(Sender as TVirtualStringTree);
 with tv0 do begin
   if not Assigned(HotNode) then exit;
   idFld0:=Header.Columns.Items[FocusedColumn].Tag;
   if(idFld0<100) or (idFld0>=200) then exit;
   nd:=GetNodeData(HotNode);
   n0:=nd.n;
   idBook0:=nd.idBook;
   idLib0:=arLib[nd.idLib].ID;
 end;
 UpdDopVal(n0,0,idFld0,idBook0,idLib0,sVal);
end;

procedure TfrmMain.tvBooksAGetImageIndexEx(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer;
  var ImageList: TCustomImageList);
var n:integer; Node1: PNodeDataB;
begin
 n:=nColsB[Sender.Tag,Column];
 if((n div 100)<>1) then exit;
 Node1 := Sender.GetNodeData(Node);
 if not Assigned(Node1) then exit;
 try
  n:=strtoint(Node1.flds[Column]);
  if(high(idImgBool)>=n) then ImageIndex:=idImgBool[n];
 except exit; end;
end;

procedure TfrmMain.tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var ndata:PNodeDataB;
begin
 ndata := Sender.GetNodeData(Node);
 if((nColsB[Sender.Tag,Column] div 100)<>1) then CellText:=ndata.flds[Column]
 else begin
  CellText:='';
  try strtoint(ndata.flds[Column]); except CellText:=ndata.flds[Column]; end; 
 end;
end;

procedure TfrmMain.tvBooksAHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then begin
  with Sender do begin
   SortColumn := Column;
   if SortDirection = sdAscending then SortDirection := sdDescending
   else SortDirection := sdAscending;
   Treeview.SortTree(SortColumn, SortDirection, False);
   nSortColB[Sender.Treeview.Tag]:=Column;
   nSortDirB[Sender.Treeview.Tag]:=SortDirection;
  end; 
 end;
end;

procedure TfrmMain.tvBooksAInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
  Sender.CheckState[Node] := csUncheckedNormal;
end;

end.
