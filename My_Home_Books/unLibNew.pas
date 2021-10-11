unit unLibNew;

interface

uses unSub, unSubDB, ALfcnString, DB, ABSMain, unMain, unSets,   DateUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzCommon, RzSelDir, RzButton, StdCtrls, Mask,
  RzEdit, RzStatus, RzLabel, RzRadChk, ZipForge, RzShellDialogs, StrUtils,
  RzRadGrp, RzBtnEdt, RzPopups, ComCtrls, RzDTP, RzLstBox, RzChkLst, RzListVw;

type
  TfrmLibNew = class(TForm)
    RzPanel1: TRzPanel;
    DirDialog: TRzSelDirDialog;
    gbExt: TRzGroupBox;
    btDo: TRzButton;
    PanelStat: TRzPanel;
    lbTime: TRzLabel;
    lbState: TRzLabel;
    SaveDial: TRzSaveDialog;
    RzStatusBar1: TRzStatusBar;
    Stat0: TRzStatusPane;
    Stat1: TRzStatusPane;
    StatProgress: TRzProgressStatus;
    RzPanel2: TRzPanel;
    btExit: TRzButton;
    PanelLog: TRzPanel;
    RzLabel5: TRzLabel;
    meCur: TRzMemo;
    lbLog: TRzLabel;
    meErr: TRzMemo;
    btSaveLog: TRzButton;
    OpenDial: TRzOpenDialog;
    PanelStat1: TPanel;
    RzLabel4: TRzLabel;
    RzLabel3: TRzLabel;
    lbtotal: TRzLabel;
    lbtreat: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    lbOK: TRzLabel;
    lberr: TRzLabel;
    PanelStat2: TPanel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    lbB: TRzLabel;
    lbA: TRzLabel;
    Labeln: TRzLabel;
    LabelN1: TRzLabel;
    lbS: TRzLabel;
    lbG: TRzLabel;
    LabelN3: TRzLabel;
    lbF: TRzLabel;
    lbTim1: TRzLabel;
    PanelNew: TRzPanel;
    Label2: TLabel;
    edLibName: TRzEdit;
    rgSour: TRzRadioGroup;
    PanelSrcDir: TRzPanel;
    lbSourPath: TLabel;
    lbLibPathFile: TLabel;
    rgDBPath: TRzRadioGroup;
    edLibPathFile: TRzButtonEdit;
    edSourPath: TRzButtonEdit;
    PanelUpd: TRzPanel;
    PanelUpd2: TRzPanel;
    Label3: TLabel;
    edSourPathNew: TRzButtonEdit;
    rgOper: TRzRadioGroup;
    Label1: TLabel;
    rgSourNew: TRzRadioGroup;
    Label4: TLabel;
    edLibNameNew: TRzEdit;
    PanelUpd1: TRzPanel;
    Label5: TLabel;
    edSourPathUpd: TRzButtonEdit;
    PanelUpd0: TRzPanel;
    RzLabel9: TRzLabel;
    dp1: TRzDateTimePicker;
    rbUpd01: TRzRadioButton;
    rbUpd02: TRzRadioButton;
    chReplace: TRzCheckBox;
    chDel: TRzCheckBox;
    RzPanel3: TRzPanel;
    rbUpd03: TRzRadioButton;
    RzRadioButton1: TRzRadioButton;
    rgShablon: TRzRadioGroup;
    edShablonFrom: TRzEdit;
    RzGroupBox1: TRzGroupBox;
    edShablonTo: TRzEdit;
    lvExt: TRzListView;
    btAddExt: TButton;
    edExt: TEdit;
    edShablon: TEdit;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    lbShablons: TRzLabel;
    procedure btPathClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btDoClick(Sender: TObject);
    procedure btSaveLogClick(Sender: TObject);
    procedure rgSourClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgOperClick(Sender: TObject);
    procedure rgShablonClick(Sender: TObject);
    procedure btAddExtClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const tErr:array[-1..3] of string=('unzip','double','file access',
 'encoding&description','not attributes');

var
  frmLibNew: TfrmLibNew;
   flStop:boolean;
   ntotal,nerr,ntreat,nOK:integer;
   tim0,t00:double;
   zip0:TZipForge;
   fs0:TMemoryStream;
   arMask,arCsvFlds:array of integer;
   LibIDN,LibN:integer;
   sLibNameN,sLibPathN,sLibPathFileN,sLibPathUpd:string;
   naAvt,naSer,naGen,maAvt,maSer,maGen:integer;
   aAvt,aSer,aGen,aAvt1,aAvt2,aAvt3:array of string;
   lsAvt1,lsAvt2,lsAvt3,lsTit,lsSer,lsSerN,lsGen,lsFil:TStringList;
   file0,arhfile:string;
   nExtf,nExtz,idBookNew:integer;
   sizef,sizez:int64;
   datAdd,DatFile,DatArh,DatUpd:TDate;
   arSh0,arSh1,arSh2:TarSh;
   ariSh0,ariSh1,ariSh2:TariSh;
   ar4Sh:Tar4Sh;
   flUpd0,flUpd1,flUpd2,flOnlyLog,flReplace,flDel,flShablonFb2:boolean;

implementation

{$R *.dfm}

procedure LibProps();
var sName,sPathLib,sPathFile:string;
begin
 sName:=trim(frmLibNew.edLibNameNew.Text);
 if(sName='') then begin
   MessageBox(0,'Нет названия коллекции','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 sPathLib:=trim(frmLibNew.edSourPathNew.Text);
 if not DirectoryExists(sPathLib) then begin
   MessageBox(0,'Путь к коллекции не найден','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 q0.SQL.Text:='SELECT id FROM tbLib WHERE LOWER(name)='+QuotedStr(AnsiLowerCase(sName));
 q0.Open;
 if(q0.RecordCount>0) and (q0.Fields[0].AsInteger<>LibIDN) then begin
   MessageBox(0,'Такое название уже есть','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if(MessageBox(0,'Программа не перемещает никакие файлы, только меняет записи в БД. '
  +'Продолжать?','Внимание!',MB_YESNO+MB_ICONEXCLAMATION)<>IDYES) then exit;
 sPathFile:=sName+'.'+FileDBExt;
 if(frmLibNew.rgSourNew.ItemIndex=0) then sPathFile:=AppPath+sPathFile
 else sPathFile:=sPathLib+sPathFile;
 q0.SQL.Text:='UPDATE tbLib SET name='+QuotedStr(sName)+', PathFile='
  +QuotedStr(sPathFile)+', PathLib='+QuotedStr(sPathLib)+' WHERE id='+inttostr(LibIDN);
 tbLib.Close;
 q0.ExecSQL;
 if(q0.RowsAffected=1) then MessageBox(0,'Теперь надо перезагрузить программу','OK',MB_OK)
 else MessageBox(0,'Не получилось...','Ошибка',MB_OK);
end;

function PrepArMask(): Boolean;
var n,i,id:integer; sh0:string;
begin
 result:=false;
 n:=0;
 with frmLibNew.lvExt do begin
  for i:=0 to Items.Count-1 do if Items[i].Checked then inc(n);
  if(n<1) then begin
   MessageBox(frmLibNew.handle,pchar('Не выбраны типы файлов'),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if(n>2) then begin
   sh0:=trim(frmLibNew.edShablon.Text);
   if(sh0='') then begin
    MessageBox(frmLibNew.handle,pchar('Нет шаблона для не-fb2-файлов'),'Ошибка',MB_OK+MB_ICONERROR); exit;
   end;
   if(length(sh0)>0) then if(sh0[1]='\') then sh0[1]:=' ';
   sh0:=LowerCase(trim(sh0));
   if(sh0='') then begin
    MessageBox(0,'Нет шаблона','Ошибка',MB_OK+MB_ICONERROR); exit;
   end;
   if(Pos('\',sh0)>0) then begin
    MessageBox(0,'В шаблоне не должно быть ''\''','Ошибка',MB_OK+MB_ICONERROR); exit;
   end;
   if not GetShablon(sh0,arSh0,ariSh0) then begin
    MessageBox(0,'Ошибка в исходном шаблоне','Ошибка',MB_OK+MB_ICONERROR); exit;
   end;
  end;

  SetLength(arMask,n);
  for i:=0 to Items.Count-1 do
   if Items[i].Checked and (Items[i].SubItems.Strings[0]='') then begin 
    id:=ValGetI1('',tbExt,q0,true,[nil,Items[i].Caption]);
    if(id<1) then begin
     MessageBox(frmLibNew.handle,pchar('Не добавляется '+Items[i].Caption),
      'Ошибка',MB_OK+MB_ICONERROR); exit;
    end;
    Items[i].SubItems.Strings[0]:=inttostr(id);
   end;
  n:=0;
  for i:=0 to Items.Count-1 do if Items[i].Checked then begin
   arMask[n]:=strtoint(Items[i].SubItems.Strings[0]); inc(n);
  end;
  SetLength(arMask,n);
 end;
 result:=true;
end;

function PrepShablons(): Boolean;
var sh1,sh2:string;
begin
 result:=false;
 sh1:=trim(frmLibNew.edShablonTo.Text);
 if(length(sh1)>0) then if(sh1[1]='\') then sh1[1]:=' ';
 sh1:=LowerCase(trim(sh1));
 if(sh1='') then begin
   MessageBox(0,'Нет нового шаблона','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if not flShablonFb2 then begin
  sh2:=trim(frmLibNew.edShablonFrom.Text);
  if(Pos('\',sh2)>0) then begin
    MessageBox(0,'В исходном шаблоне не должно быть ''\''','Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if(sh2='') then begin
    MessageBox(0,'Нет исходного шаблона','Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
 end;

 if not GetShablon(sh1,arSh1,ariSh1) then begin
   MessageBox(0,'Ошибка в шаблоне файла','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if not flShablonFb2 then
  if not GetShablon(sh2,arSh2,ariSh2) then begin
    MessageBox(0,'Ошибка в исходном шаблоне','Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
 result:=true;
end;

procedure AddIndex2Tab(tb0:TABSTable;nTB:integer);
var Log:string; i:integer;
begin
  with tb0 do begin
    Close;
     with RestructureIndexDefs do
      for i:=0 to DefTabsNum[nTB,1]-1 do Add(DefINam[nTB,i],DefIFld[nTB,i],DefITyp[nTB,i]);
     if not (RestructureTable(Log)) then
       frmLibNew.meErr.Lines.Add(tb0.Name+' restructure errors: '+Log);
  end;
end;

function AddNewDB(sName,sLibPath,sFilPath:string):boolean;
var i:integer;
begin
 result:=false;
 for i:=0 to nnDB-1 do if(sName=arLib[i].Name) then begin
   MessageBox(frmLibNew.handle,pchar('Коллекция с таким именем уже есть'),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 tbLib.AppendRecord([nil,sName,sFilPath,sLibPath]);
 LibIDN:=GetNewID(tbLib,q0); LibN:=nnDB;

 SetLength(arLib,nnDB+1);
 arLib[nnDB].ID:=LibIDN;
 arLib[nnDB].Name:=sName;
 arLib[nnDB].PathFile:=sFilPath;
 arLib[nnDB].PathLib:=sLibPath;
 nnDB:=nnDB+1;

 SetLength(db1,nnDB);
 SetLength(q1,nnDB);
 SetLength(tbLinks,nnDB);
 SetLength(tbFile,nnDB);
 SetLength(tbBook,nnDB);
 SetLength(tbAvt,nnDB);
 SetLength(tbSer,nnDB);
 SetLength(tbGen,nnDB);
 PrepDB(LibN);
 result:=true;
end;

procedure Tmp2BD(tb0,tbD:TABSTable;sTab,sF,sI:string;np:integer);
var i,j,n:integer; ar0:array of integer;
begin
 tb0.Close;
frmLibNew.StatProgress.Percent:=3;
 q1[LibN].SQL.Text:='SELECT DISTINCT '+sF+' INTO tb'+sTab+' FROM MEMORY tb'+sTab+'D1 ORDER BY name';
 q1[LibN].Open;
frmLibNew.StatProgress.Percent:=5;
 qD.SQL.Text:='select count(id),name from tb'+sTab+'D1 group by name order by name';
 qD.Open; qD.First; n:=qD.RecordCount;
 frmLibNew.StatProgress.Percent:=8;
 SetLength(ar0,n+1);
 for i:=1 to n do begin
  ar0[i]:=qD.Fields[0].Value; qD.Next;
 end;
 qD.SQL.Text:='select id,name from tb'+sTab+'D1 group by name,id order by name';
 qD.Open; qD.First; i:=0;
 frmLibNew.StatProgress.Percent:=10;
 np:=(n div 90)+1;
 while not qD.Eof do begin
  for j:=1 to ar0[i+1] do begin
   if(j=1) then inc(i);
   q1[LibN].SQL.Text:='UPDATE tbLinks SET id'+sTab+'=-'+inttostr(i)
    +' WHERE id'+sTab+'='+qD.Fields[0].AsString;
   q1[LibN].ExecSQL;
   qD.Next;
  end;
  if((i mod np)=0) then with frmLibNew do begin
   StatProgress.Percent:=StatProgress.Percent+1;
   lbTime.Caption:=TimeToStr(now-tim0); Refresh;
  end;
 end;
 q1[LibN].SQL.Text:='UPDATE tbLinks SET id'+sTab+'=-id'+sTab;
 q1[LibN].ExecSQL;
end;

procedure tbD2tbD1(nfl:integer);
begin
 if(nfl=0) then begin
  tbLinksD.Close; tbBookD.Close; tbFileD.Close;
  tbLinksD1.Close; tbBookD1.Close; tbFileD1.Close;
  qD.SQL.Text:='INSERT INTO MEMORY tbLinksD1 (SELECT * FROM MEMORY tbLinksD)'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbLinksD'; qD.ExecSQL;
  qD.SQL.Text:='INSERT INTO MEMORY tbBookD1 (SELECT * FROM MEMORY tbBookD)'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbBookD'; qD.ExecSQL;
  qD.SQL.Text:='INSERT INTO MEMORY tbFileD1 (SELECT * FROM MEMORY tbFileD)'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbFileD'; qD.ExecSQL;
  tbLinksD.Open; tbBookD.Open; tbFileD.Open;
 end else begin
  tbLinks[LibN].Close; tbBook[LibN].Close; tbFile[LibN].Close;
  tbLinksD1.Close; tbBookD1.Close; tbFileD1.Close;
  q1[LibN].SQL.Text:='INSERT INTO tbLinks (SELECT * FROM MEMORY tbLinksD1)'; q1[LibN].ExecSQL;
  q1[LibN].SQL.Text:='INSERT INTO tbBook (SELECT * FROM MEMORY tbBookD1)'; q1[LibN].ExecSQL;
  q1[LibN].SQL.Text:='INSERT INTO tbFile (SELECT * FROM MEMORY tbFileD1)'; q1[LibN].ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbLinksD1'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbBookD1'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbFileD1'; qD.ExecSQL;
  tbLinksD.Close; tbBookD.Close; tbFileD.Close;
  qD.SQL.Text:='DELETE FROM MEMORY tbLinksD'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbBookD'; qD.ExecSQL;
  qD.SQL.Text:='DELETE FROM MEMORY tbFileD'; qD.ExecSQL;
 end;
end;

function Add2New(var idFil:integer): boolean;
var h1:THandle; sbuf,sFiltr,s1,s2,s3,s4:string;
 n1,n2,n3,n4,i,j,kGen,kAvt,kTit,kSer,ner,nn:integer;
 nGen,nAvt,nTit,nSer:array[1..50] of integer;
 sSerN:array[1..50] of string;
 bufsize,bufsize0:dword;
 encode1,author1,title1,seria1,genre1,id1:string;
begin
 result:=false;
  kAvt:=1; nAvt[1]:=0;
 for i := 1 to lsAvt1.Count  do begin
  s4:=trim(lsAvt1.Strings[i-1]+' '+lsAvt2.Strings[i-1]+' '+lsAvt3.Strings[i-1]);
  nn:=-1;
  for j:=1 to naAvt do if(s4=aAvt[j]) then begin nn:=j; break; end;
  if(nn>0) then nAvt[i]:=nn
  else begin
   inc(naAvt);
   if(naAvt>=maAvt) then begin
    maAvt:=maAvt+1000;
    SetLength(aAvt,maAvt+1); SetLength(aAvt1,maAvt+1); SetLength(aAvt2,maAvt+1); SetLength(aAvt3,maAvt+1);
   end;
   aAvt[naAvt]:=s4; aAvt1[naAvt]:=lsAvt1.Strings[i-1];
   aAvt2[naAvt]:=lsAvt2.Strings[i-1]; aAvt3[naAvt]:=lsAvt3.Strings[i-1];
   nAvt[i]:=naAvt; kAvt:=i;
  end;
 end;
 kGen:=1; nGen[1]:=0;
 for i := 1 to lsGen.Count do begin
  nn:=-1;
  for j:=1 to naGen do if(lsGen.Strings[i-1]=aGen[j]) then begin nn:=j; break; end;
  if(nn>0) then nGen[i]:=nn
  else begin
   inc(naGen);
   if(naGen>=maGen) then begin maGen:=maGen+1000; SetLength(aGen,maGen+1); end;
   aGen[naGen]:=lsGen.Strings[i-1]; nGen[i]:=naGen; kGen:=i;
  end;
 end;
 kSer:=1; nSer[1]:=0; sSerN[1]:='';
 for i := 1 to lsSer.Count do begin
  nn:=-1;
  for j:=1 to naSer do if(lsSer.Strings[i-1]=aSer[j]) then begin nn:=j; break; end;
  if(nn>0) then nSer[i]:=nn
  else begin
   inc(naSer);
   if(naSer>=maSer) then begin maSer:=maSer+1000; SetLength(aSer,maSer+1); end;
   aSer[naSer]:=lsSer.Strings[i-1]; nSer[i]:=naSer; kSer:=i;
  end;
  sSerN[i]:=lsSerN.Strings[i-1];
 end;
 kTit:=1; nTit[1]:=0;
 for i := 1 to lsTit.Count do begin
  nTit[i]:=ValGetI1('',tbBookD,qD,true,[nil,lsTit.Strings[i-1],datAdd,arhfile,
   ord(ALUpperCase(lsTit.Strings[i-1][1])[1]),sizef,nExtf,DatArh]); kTit:=i;
  idBookNew:=nTit[i];
 end;

 if(idFil<1) then begin
  idFil:=ValGetI1('',tbFileD,qD,true,[nil,ALStringReplace(file0,sLibPathN,'',[rfIgnoreCase]),
   sizez,nExtz,DatFile]);
  if(idFil<1) then exit;
 end;
  ner:=1;
 for n1:=1 to kTit do for n2:=1 to kAvt do for n4:=1 to kSer do for n3:=1 to kGen do begin
  i:=ValGetI1('',tbLinksD,qD,true,[nil,nTit[n1],nAvt[n2],idFil,nSer[n4],
   nGen[n3],sSerN[n4]]);
  if(i=0) then exit;
 end;
 result:=true;
 if((nok mod 100)=0) then tbD2tbD1(0);
end;

function Add2Old(var idFil:integer): boolean;
var file0dum,s4,sFiltr,file0dumFull:string;
 n1,n2,n3,n4,i,j,kGen,kAvt,kTit,kSer,ner,nn,idFilDum:integer;
 nGen,nAvt,nTit,nSer,nLinks:array[0..50] of integer;
 sSerN:array[0..50] of string;
 fl:boolean;
begin
 result:=true;
 idFilDum:=idFil;
 s4:='';
 if not flUpd1 then file0dum:=ALStringReplace(file0,sLibPathN,'',[rfIgnoreCase])
 else begin
  if flShablonFb2 then begin
   for i:=0 to high(ar4Sh) do ar4Sh[i]:='';
   if(lsAvt1.Count>0) then ar4Sh[1]:=lsAvt1.Strings[0];
   if(lsAvt2.Count>0) then ar4Sh[2]:=lsAvt2.Strings[0];
   if(lsAvt3.Count>0) then ar4Sh[3]:=lsAvt3.Strings[0];
   if(lsTit.Count>0) then ar4Sh[4]:=lsTit.Strings[0];
   if(lsSer.Count>0) then ar4Sh[5]:=lsSer.Strings[0];
   if(lsSerN.Count>0) then ar4Sh[6]:=lsSerN.Strings[0];
   if(ar4Sh[1]<>'') then ar4Sh[0]:=AnsiUpperCase(ar4Sh[1][1])[1];
  end else begin
   GetFromShablon(ExtractFileName(file0),arSh2,ariSh2,ar4Sh);
  end;
  file0dum:=GetByShablon(arSh1,ariSh1,ar4Sh);
  if flShablonFb2 then file0dum:=file0dum+ExtractFileExt(file0);
  file0dumFull:=sLibPathN+file0dum;
  if FileExists(file0dumFull) then begin
   s4:='double ';
   if not flReplace then begin
    frmLibNew.meErr.Lines.Add('double '+file0dumFull); exit;
   end;
  end else begin
   s4:=ExtractFilePath(file0dumFull);
   if not DirectoryExists(s4) then begin
     if not ForceDirectories(s4) then begin
      frmLibNew.meErr.Lines.Add('error create dir '+s4); exit;
     end;
   end;
   s4:='new '; 
  end;
 end;

 if flOnlyLog then begin
  idFil:=ValGetI1('name='+QuotedStr(file0dum),tbFile[LibN],q1[LibN],false,[]);
  frmLibNew.meErr.Lines.Add(s4+file0dum);
  exit;
 end;
 if flUpd1 then begin
  if not CopyFile(pchar(file0),pchar(file0dumFull),false) then begin
s4:=errmsg('');
   frmLibNew.meErr.Lines.Add('error copy '+file0+' to '+file0dumFull+' '+s4);
   result:=false; exit;
  end;
  if flDel then
    if not DeleteFile(file0) then begin
s4:=errmsg('');
     frmLibNew.meErr.Lines.Add('error del '+file0+' '+s4);
    end;
 end;
 idFil:=ValGetI1('name='+QuotedStr(file0dum),tbFile[LibN],q1[LibN],true,[nil,file0dum,sizez,nExtz,DatFile]);
 frmLibNew.meErr.Lines.Add(s4+file0dum);

 result:=false;

  for i := 0 to lsAvt1.Count-1  do begin
  s4:=trim(lsAvt1.Strings[i]+' '+lsAvt2.Strings[i]+' '+lsAvt3.Strings[i]);
  sFiltr:=tbAvt[LibN].Fields[1].FieldName+'='+QuotedStr(s4);
  nAvt[i]:=ValGetI1(sFiltr,tbAvt[LibN],q1[LibN],true,[nil,s4,lsAvt1.Strings[i],
   lsAvt2.Strings[i],lsAvt3.Strings[i],ord(ALUpperCase(lsAvt1.Strings[i][1])[1])]);
 end;
 for i := 0 to lsGen.Count-1 do begin
  sFiltr:=tbGen[LibN].Fields[1].FieldName+'='+QuotedStr(lsGen.Strings[i]);
  nGen[i]:=ValGetI1(sFiltr,tbGen[LibN],q1[LibN],true,[nil,lsGen.Strings[i]]);
 end;
 for i := 0 to lsSer.Count-1 do begin
  sFiltr:=tbSer[LibN].Fields[1].FieldName+'='+QuotedStr(lsSer.Strings[i]);
  nSer[i]:=ValGetI1(sFiltr,tbSer[LibN],q1[LibN],true,[nil,lsSer.Strings[i],
   ord(ALUpperCase(lsSer.Strings[i][1])[1])]);
  sSerN[i]:=lsSerN.Strings[i];
 end;

 if(idFilDum<1) then begin
  q1[LibN].SQL.Text:='DELETE FROM tbBook WHERE id IN (SELECT idBook FROM tbLinks '
   +'WHERE idFile='+inttostr(idFil)+')';
  q1[LibN].ExecSQL;
  q1[LibN].SQL.Text:='DELETE FROM tbLinks WHERE idFile='+inttostr(idFil);
  q1[LibN].ExecSQL;
 end;

 for i := 0 to lsTit.Count-1 do begin
  nTit[i]:=ValGetI1('',tbBook[LibN],q1[LibN],true,[nil,lsTit.Strings[i],datAdd,arhfile,
   ord(ALUpperCase(lsTit.Strings[i][1])[1]),sizef,nExtf,DatArh]);
 end;
 for n1:=0 to lsTit.Count-1 do for n2:=0 to lsAvt1.Count-1 do
  for n4:=0 to lsSer.Count-1 do for n3:=0 to lsGen.Count-1 do begin
  i:=ValGetI1('',tbLinks[LibN],q1[LibN],true,[nil,nTit[n1],nAvt[n2],idFil,nSer[n4],
   nGen[n3],sSerN[n4]]);
  if(i=0) then exit;
 end;
 result:=true;
end;

function fb2Pars2BD(ftmp:string;out nresult:integer):boolean;
const
 tag001='encoding='; tag002='?';
 tag01='<title-info>'; tag02='</title-info>';
 tagG1='<genre>'; tagG2='</genre>';
 tagB1='<book-title>'; tagB2='</book-title>';
var h1:THandle; sbuf,s1,s2,s3:string;
 n1,i:integer;
 bufsize,bufsize0:dword;
 flUtf,flA,flB,flS,flG:boolean;
begin
 nresult:=1; result:=false;
 h1 := CreateFile(pChar(ftmp), GENERIC_READ, FILE_SHARE_READ,
  nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
 if (h1 = INVALID_HANDLE_VALUE) then begin Exit; end;
 BufSize0:=65536;
 BufSize:=BufSize0*sizeof(char);
 SetLength(sbuf, BufSize0);
 ReadFile(h1,sbuf[1],bufsize,bufsize,nil);
 CloseHandle(h1);
 nresult:=2;
 flUtf:=GetUtf(sbuf);

 n1:=1;
 sbuf:=TagValGetS1(sbuf,tag01,tag02,n1);
 if(sbuf='') then exit;

 lsAvt1.Clear; lsAvt2.Clear; lsAvt3.Clear; lsTit.Clear; lsSer.Clear;
 lsSerN.Clear; lsGen.Clear; lsFil.Clear;
 flA:=false; flB:=false; flS:=false; flG:=false;

 n1:=1;
 for i := 1 to 50 do begin
  TagValGetS3(sbuf,'<author>','</author>',n1,s1,s2,s3);
  if(s1='') then begin if(i=1) then s1:=wnone else break; end else flA:=true;
  if flUtf then begin
   s1:=Utf8ToAnsi(s1);
   s2:=Utf8ToAnsi(s2);
   s3:=Utf8ToAnsi(s3);
  end;
  lsAvt1.Add(s1); lsAvt2.Add(s2); lsAvt3.Add(s3);
 end;
 n1:=1;
 for i := 1 to 50 do begin
  s1:=TagValGetS1(sbuf,tagG1,tagG2,n1);
  if(s1='') then begin if(i=1) then s1:=wnone else break; end else flG:=true;
  lsGen.Add(s1);
 end;
 n1:=1;
 for i := 1 to 50 do begin
  TagValGetS2(sbuf,n1,s1,s2);
  if(s1='') then begin if(i=1) then s1:=wnone else break; end else flS:=true;
  if flUtf then s1:=Utf8ToAnsi(s1);
  lsSer.Add(s1); lsSerN.Add(s2);
 end;
 n1:=1;
 for i := 1 to 50 do begin
  s1:=TagValGetS1(sbuf,tagB1,tagB2,n1);
  if(s1='') then begin if(i=1) then s1:=wnone else break; end else flB:=true;
  if flUtf then s1:=Utf8ToAnsi(s1);
  lsTit.Add(s1);
 end;

 result:=flA or flB or flG or flS;
 if not result then nresult:=3;
end;

function AnyPars2BD(ftmp:string;out nresult:integer):boolean;
var s1:string;
 i:integer;
 fl:boolean;
begin
 nresult:=1;

 lsAvt1.Clear; lsAvt2.Clear; lsAvt3.Clear; lsTit.Clear; lsSer.Clear;
 lsSerN.Clear; lsGen.Clear; lsFil.Clear;

  for i:=0 to high(ar4Sh) do ar4Sh[i]:='';
  s1:=ALStringReplace(ExtractFileName(ftmp),ExtractFileExt(ftmp),'',[]);
  GetFromShablon(s1,arSh0,ariSh0,ar4Sh);
  s1:=''; for i:=0 to high(ar4Sh) do s1:=s1+ar4Sh[i];
  fl:=(trim(s1)<>'');
  if not fl then ar4Sh[4]:=ExtractFileName(ftmp);
  if(trim(ar4Sh[1])='') then ar4Sh[1]:=wNone;
  if(trim(ar4Sh[4])='') then ar4Sh[4]:=wNone;
  if(trim(ar4Sh[5])='') then ar4Sh[5]:=wNone;

  lsAvt1.Add(ar4Sh[1]);
  lsAvt2.Add(ar4Sh[2]);
  lsAvt3.Add(ar4Sh[3]);
  lsTit.Add(ar4Sh[4]);
  lsSer.Add(ar4Sh[5]);
  lsSerN.Add(ar4Sh[6]);
  lsGen.Add(wNone);

 result:=true;
 if not fl then nresult:=3;
end;

procedure ScanDir1(Path:string;ScanSub:boolean);
label lbContinue;
var
SearchRec:TSearchrec;
a,i,i1,j,j1,j2,nExt0,nExt1,nresult,idFil,idFilDum:integer;
Path0,sExt1,file0dum:string;
ArchiveItem:TZFArchiveItem;
fl:boolean;
begin
Application.ProcessMessages; if flStop=true then exit;
with frmLibNew do begin
 Path0:=ExcludeTrailingPathDelimiter(Path);
 if ScanSub then begin
  FindFirst(path+'\*.*',faDirectory,SearchRec);
  FindNext(SearchRec);
  a:=FindNext(SearchRec);
  while a=0 do begin
   if (SearchRec.Attr and faDirectory)>0 then begin
    frmLibNew.meCur.Lines.Add(Path0+'\'+SearchRec.Name);
    ScanDir1(Path+'\'+SearchRec.Name,ScanSub);
   end;
   a:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
 end;

 Path0:=ALStringReplace(Path0,'\\','\',[rfReplaceAll]);
 for i:=0 to high(arMask) do begin
  a:=FindFirst(Path+'\*.'+arExt[arMask[i]].Name,faAnyFile,SearchRec);
  while a=0 do begin
    Application.ProcessMessages; if flStop then break;
  nExt0:=arExt[arMask[i]].ID;
   DatFile:=FileDateToDateTime(SearchRec.Time);
   if flUpd0 then if DatFile<=DatUpd then goto lbContinue;
   inc(ntotal);
   file0:=Path0+'\'+SearchRec.Name;
   case nExt0-1 of
   0: begin
    try
     with zip0 do begin
      FileName := file0;
      BaseDir := AppPath;
      OpenArchive; idFil:=0;
      for i1:=0 to high(arMask) do begin
       if (FindFirst('*.'+arExt[arMask[i1]].Name,ArchiveItem,faAnyFile)) then
       repeat
        fs0.Clear;
        ExtractToStream(ArchiveItem.FileName,fs0);
        fs0.SaveToFile(TmpFile);
        sExt1:=ALLowerCase(copy(ExtractFileExt(ArchiveItem.FileName),2,20));
        j1:=-1; for j2:=0 to high(arExt) do if(sExt1=arExt[j2].Name) then begin j1:=j2; break; end;
        nExt1:=j1;
        for j := 0 to j1 do if(arExt[j].Name=sExt1) then begin nExt1:=arExt[j].ID; break; end;
        inc(nTreat);
        arhfile:=ArchiveItem.FileName;
        DatArh:=FileDateToDateTime(ArchiveItem.LastModFileDate shl 16 + ArchiveItem.LastModFileTime);
        nExtf:=nExt1;
        nExtz:=nExt0;
        sizef:=ArchiveItem.UncompressedSize;
        sizez:=SearchRec.Size;
        file0dum:=TmpFile;
    if(nExt1=2) then fl:=fb2Pars2BD(TmpFile,nresult)
    else fl:=AnyPars2BD(arhfile,nresult);
        if flUpd0 or flUpd1 then begin
         if fl then fl:=Add2Old(idFil);
        end else begin
         if fl then fl:=Add2New(idFil);
        end;
        if fl then inc(nOK)
        else begin
         inc(nerr);
         frmLibNew.meErr.Lines.Add(tErr[nresult]+stab+file0+'\'+ArchiveItem.FileName);
        end;
       until (not FindNext(ArchiveItem));
      end;
      if(idFil=0) then begin
         inc(nerr);
         frmLibNew.meErr.Lines.Add('empty arhiv'+stab+file0);
      end;
      CloseArchive;
     end;
    except
     inc(nerr);
     frmLibNew.meErr.Lines.Add(tErr[-1]+stab+file0);
    end;
   end;
   else begin
    inc(nTreat); idFil:=0;
        arhfile:='';
        nExtf:=nExt0;
        nExtz:=nExt0;
        sizef:=SearchRec.Size;
        sizez:=SearchRec.Size;
    if(nExt0=2) then fl:=fb2Pars2BD(file0,nresult)
    else fl:=AnyPars2BD(file0,nresult);
        if flUpd0 or flUpd1 then begin
         if fl then fl:=Add2Old(idFil);
        end else begin
         if fl then fl:=Add2New(idFil);
        end;
    if fl then inc(nOK)
    else begin
     inc(nerr);
     frmLibNew.meErr.Lines.Add(tErr[nresult]+stab+file0);
    end;
   end;
   end;
   lbtotal.Caption:=inttostr(ntotal);
   lbtreat.Caption:=inttostr(ntreat);
   lbok.Caption:=inttostr(nok);
   lberr.Caption:=inttostr(nerr);
   lbTime.Caption:=TimeToStr(now-tim0);
lbTim1.Caption:=inttostr(ntotal div (SecondsBetween(tim0,now)+1));
   if((ntotal mod 10)=0) then frmLibNew.Refresh;
lbContinue:
   a:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
 end;
end;
end;

procedure ScanCsvFile(sFile:string);
var ls,ls1:TStringList; i,j,ncMax,k,k1:integer;
 fl,flA,flB,flS,flG,flSn,flF:boolean; s,file0dum:string;
 SearchRec:TSearchrec;
 ArchiveItem:TZFArchiveItem;
begin
 ncMax:=high(arCsvFlds);
 ls:=TStringList.Create; ls1:=TStringList.Create;
 ls.LoadFromFile(sFile);

 ntotal:=ls.Count-1;
 for i:=1 to ls.Count-1 do begin
  ls1.Clear;
  ExtractStrings([chr(9)],[],pchar(ls.Strings[i]),ls1);
  if(ls1.Count<ncMax+1) then for j:=ls1.Count to ncMax do ls1.Add('');
  lsAvt1.Clear; lsAvt2.Clear; lsAvt3.Clear; lsTit.Clear; lsSer.Clear;
  lsSerN.Clear; lsGen.Clear; lsFil.Clear;
  flA:=false; flB:=false; flS:=false; flG:=false; flF:=false; flSn:=false;
  arhfile:=''; datAdd:=now; datFile:=0; datArh:=0; sizef:=0; sizez:=0; nextf:=0; nextz:=0;
  for j:=0 to ncMax do begin
   s:=trim(ls1.Strings[j]);
   case arCsvFlds[j] of
    1: begin if(s='') then s:=wnone else flA:=true; lsAvt1.Add(s); lsAvt2.Add(''); lsAvt3.Add(''); end;
    2: begin if(s='') then s:=wnone else flB:=true; lsTit.Add(s); end;
    3: begin if(s='') then s:=wnone else flS:=true; lsSer.Add(s); end;
    4: begin if(s<>'') then flSn:=true; lsSerN.Add(s); end;
    5: begin if(s='') then s:=wnone else flG:=true; lsGen.Add(s); end;
    6: try datAdd:=strtodate(s); except datAdd:=0; end;
    7: try sizef:=strtoint(s); except sizef:=0; end;
    8: begin
        nextf:=0;
        if(s<>'') then for k:=0 to high(arExt) do
         if(s=arExt[k].Name) then begin nextf:=arExt[k].ID; break; end;
       end;
    9: try datFile:=strtodate(s); except datFile:=0; end;
   10: begin
        nextz:=0;
        if(s<>'') then for k:=0 to high(arExt) do
         if(s=arExt[k].Name) then begin nextz:=arExt[k].ID; break; end;
       end;
   11: try sizez:=strtoint(s); except sizez:=0; end;
   12: begin if(s<>'') then flF:=true; file0:=s; end;
   end;
  end;
  if not flA then begin lsAvt1.Add(wnone); lsAvt2.Add(''); lsAvt3.Add(''); end;
  if not flS then lsSer.Add(wnone);
  if not flSn then lsSerN.Add('');
  if not flG then lsGen.Add(wnone);
  if not flF then begin
   frmLibNew.meErr.Lines.Add('not filename'+stab+ls.Strings[i]); inc(nerr); continue;
  end;

  if(nextz=0) then begin
    s:=trim(StringReplace(ExtractFileExt(file0),'.','',[]));
    if(s<>'') then for k:=0 to high(arExt) do
     if(s=arExt[k].Name) then begin nextz:=arExt[k].ID; break; end;
  end;
  if(nextz>1) then begin
   if(nextf=0) then nextf:=nextz;
   if(sizef=0) and (sizez>0) then sizef:=sizez;
   if(sizez=0) and (sizef>0) then sizez:=sizef;
   if(datFile=0) and (datArh>0) then datFile:=datArh;
   if(datArh=0) and (datFile>0) then datArh:=datFile;
  end;

  file0dum:=sLibPathN+file0;
  if not FileExists(file0dum) then begin
   frmLibNew.meErr.Lines.Add('file not found'+stab+ls.Strings[i]); inc(nerr);
  end else begin
   if(sizez=0) or (datFile=0) then begin
    FindFirst(file0dum,faAnyFile,SearchRec);
    sizez:=SearchRec.Size;
    DatFile:=FileDateToDateTime(SearchRec.Time);
    FindClose(SearchRec);
   end;
   if(nextz>1) then begin
    arhfile:=ExtractFileName(file0);
    if(sizef=0) then sizef:=sizez;
    if(datArh=0) then datArh:=datFile;
   end else begin
    try
     with zip0 do begin
      FileName := file0dum;
      BaseDir := AppPath;
      OpenArchive;
      FindFirst('*.*',ArchiveItem,faAnyFile);
      arhfile:=ArchiveItem.FileName;
      if(nextf=0) then begin
       s:=trim(StringReplace(ExtractFileExt(arhfile),'.','',[]));
       if(s<>'') then for k:=0 to high(arExt) do
       if(s=arExt[k].Name) then begin nextf:=arExt[k].ID; break; end;
      end;
      DatArh:=FileDateToDateTime(ArchiveItem.LastModFileDate shl 16 + ArchiveItem.LastModFileTime);
      sizef:=ArchiveItem.UncompressedSize;
      CloseArchive;
     end;
    except
     frmLibNew.meErr.Lines.Add('unzip'+stab+ls.Strings[i]); inc(nerr); continue;
    end;
   end;
  end;

  fl:=flA or flB or flG or flS;
  s:='';
  if fl then begin
   k1:=0;
   fl:=Add2New(k1);
   if not fl then s:='error add';
  end else s:='no attrs';
  if fl then begin
   for j:=0 to ncMax do begin
    s:=trim(ls1.Strings[j]);
    if(s<>'') then
     case (arCsvFlds[j] div 100) of
      1: tbDopB.AppendRecord([nil,(arCsvFlds[j] mod 100),idBookNew,LibIDN,s]);
      2: tbDopF.AppendRecord([nil,(arCsvFlds[j] mod 100),idBookNew,LibIDN,s]);
      3: tbDopS.AppendRecord([nil,(arCsvFlds[j] mod 100),idBookNew,LibIDN,s]);
     end;
   end;
   inc(nok);
  end else begin frmLibNew.meErr.Lines.Add(s+stab+ls.Strings[i]); inc(nerr); end;
  inc(ntreat);

  with frmLibNew do begin
   lbtotal.Caption:=inttostr(ntotal);
   lbtreat.Caption:=inttostr(ntreat);
   lbok.Caption:=inttostr(nok);
   lberr.Caption:=inttostr(nerr);
   lbTime.Caption:=TimeToStr(now-tim0);
lbTim1.Caption:=inttostr(ntreat div (SecondsBetween(tim0,now)+1));
   if((ntreat mod 10)=0) then Refresh;
  end;
 end;

 ls.Free; ls1.Free;
end;

function PrepFlds(): Boolean;
var sFile,s:string; f1:Textfile; ls:TStringList; i,j,n:integer; flB:boolean;
begin
 result:=false;
 sFile:=trim(frmLibNew.edLibPathFile.Text);
 if not FileExists(sFile) then begin
  MessageBox(frmLibNew.handle,pchar('Не найден файл описаний '+sFile),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 AssignFile(f1,sFile); Reset(f1);
 Readln(f1,s);
 CloseFile(f1);
 ls:=TStringList.Create;
 ExtractStrings([chr(9)],[],pchar(s),ls);
 SetLength(arCsvFlds,ls.Count);
 s:=''; flB:=false;
 for i:=0 to ls.Count-1 do begin
  n:=-1;
  with frmSets.sgColsAll do for j:=0 to RowCount-1 do
   if(Cells[0,j]=ls.Strings[i]) then
    begin try n:=strtoint(Cells[1,j]); except n:=-1; end; break; end;
   if(n<1) then s:=s+QuotedStr(ls.Strings[i])+' '
   else begin arCsvFlds[i]:=n; if(n=2) then flB:=true; end;
 end;
 ls.Free;
 if(s<>'') then begin
  MessageBox(frmLibNew.handle,pchar('Поля не найдены в БД: '+s),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if not flB then begin
  MessageBox(frmLibNew.handle,pchar('Название должно присутствовать'),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 result:=true;
end;

function AddDBDir(flDir:boolean): Boolean;
var i,np:integer;
begin
 frmLibNew.StatProgress.ShowPercent:=false;
 result:=false;
 if flDir then if not PrepArMask then exit;
 if not flDir then if not PrepFlds then exit;

 if(frmLibNew.rgDBPath.ItemIndex=0) then sLibPathFileN:=AppPath+sLibNameN+'.'+FileDBExt
 else sLibPathFileN:=sLibPathN+sLibNameN+'.'+FileDBExt;
 if FileExists(sLibPathFileN) then begin
  if(MessageBox(frmLibNew.handle,pchar('Файл '+sLibPathFileN+' уже существует. Уничтожить?'),
   'Предупреждение',MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON2)<>IDYES) then exit;
  if not DeleteFile(sLibPathFileN) then begin
    MessageBox(frmLibNew.handle,pchar('Не могу уничтожить файл '+sLibPathFileN),
     'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
 end;

 if not AddNewDB(sLibNameN,sLibPathN,sLibPathFileN) then exit;

 PrepDB(-1);

 frmLibNew.meCur.Clear; frmLibNew.meErr.Clear;

 tim0:=now; ntotal:=0; ntreat:=0; nerr:=0; nok:=0;
 datAdd:=now;
 frmLibNew.lbState.Caption:='Импорт файлов...';
 frmLibNew.lbtotal.Caption:=inttostr(ntotal);
 frmLibNew.lbtreat.Caption:=inttostr(ntreat);
 frmLibNew.lbok.Caption:=inttostr(nok);
 frmLibNew.lberr.Caption:=inttostr(nerr);
 frmLibNew.lbTime.Caption:=TimeToStr(now-tim0);
 frmLibNew.PanelStat1.Visible:=true;
 screen.Cursor:=crHourGlass;
 frmLibNew.Repaint;
 frmLibNew.Enabled:=false;
 Zip0 := TZipForge.Create(nil);
 FS0 := TMemoryStream.Create;

 naAvt:=0; maAvt:=1001; SetLength(aAvt,maAvt+1); SetLength(aAvt1,maAvt+1); SetLength(aAvt2,maAvt+1); SetLength(aAvt3,maAvt+1);
 naSer:=0; maSer:=1001; SetLength(aSer,maSer+1);
 naGen:=0; maGen:=1001; SetLength(aGen,maGen+1);
 lsAvt1:=TStringList.Create;
 lsAvt2:=TStringList.Create;
 lsAvt3:=TStringList.Create;
 lsTit:=TStringList.Create;
 lsSer:=TStringList.Create;
 lsSerN:=TStringList.Create;
 lsGen:=TStringList.Create;
 lsFil:=TStringList.Create;

 db1[LibN].StartTransaction;
 if flDir then ScanDir1(sLibPathN,true)
 else ScanCsvFile(trim(frmLibNew.edLibPathFile.Text));
 db1[LibN].Commit(false);

 lsAvt1.Free;
 lsAvt2.Free;
 lsAvt3.Free;
 lsTit.Free;
 lsSer.Free;
 lsSerN.Free;
 lsGen.Free;
 lsFil.Free;

 frmLibNew.StatProgress.ShowPercent:=true;
frmLibNew.lbState.Caption:='Обработка...'; frmLibNew.Refresh;
 tbD2tbD1(0);
 db1[LibN].StartTransaction;
 tbD2tbD1(1);
 db1[LibN].Commit(false);

 tbAvt[LibN].Close;  q1[LibN].SQL.Clear;
frmLibNew.lbState.Caption:='Обработка авторов...'; frmLibNew.Refresh;
 if(naAvt>0) then begin
  for i:=1 to naAvt do q1[LibN].SQL.Text:=q1[LibN].SQL.Text+
  'INSERT INTO tbAvt (id,name,name1,name2,name3,L) VALUES ('
   +inttostr(i)+', '+QuotedStr(aAvt[i])+', '+QuotedStr(aAvt1[i])+', '+QuotedStr(aAvt2[i])
   +', '+QuotedStr(aAvt3[i])+', '+inttostr(ord(ALUpperCase(aAvt[i][1])[1]))+');';
  db1[LibN].StartTransaction;
  q1[LibN].ExecSQL;
  db1[LibN].Commit(false);
 end;
 tbSer[LibN].Close;  q1[LibN].SQL.Clear;
frmLibNew.lbState.Caption:='Обработка серий...'; frmLibNew.Refresh;
 if(naSer>0) then begin
  for i:=1 to naSer do q1[LibN].SQL.Text:=q1[LibN].SQL.Text+
  'INSERT INTO tbSer (id,name,L) VALUES ('
   +inttostr(i)+', '+QuotedStr(aSer[i])+', '+inttostr(ord(ALUpperCase(aSer[i][1])[1]))+');';
  db1[LibN].StartTransaction;
  q1[LibN].ExecSQL;
  db1[LibN].Commit(false);
 end;
 tbGen[LibN].Close;  q1[LibN].SQL.Clear;
frmLibNew.lbState.Caption:='Обработка жанров...'; frmLibNew.Refresh;
 if(naGen>0) then begin
  for i:=1 to naGen do q1[LibN].SQL.Text:=q1[LibN].SQL.Text+
  'INSERT INTO tbGen (id,name,idList) VALUES ('
   +inttostr(i)+', '+QuotedStr(aGen[i])+',0);';
  db1[LibN].StartTransaction;
  q1[LibN].ExecSQL;
  db1[LibN].Commit(false);
 end;

 with frmLibNew do begin
  StatProgress.Percent:=0;

  np:=10;
lbState.Caption:='Индексирование связей...';
  AddIndex2Tab(tbLinks[LibN],1);
  StatProgress.Percent:=StatProgress.Percent+np;
lbState.Caption:='Индексирование файлов...';
  AddIndex2Tab(tbFile[LibN],2);
  StatProgress.Percent:=StatProgress.Percent+np;
lbState.Caption:='Индексирование книг...';
  AddIndex2Tab(tbBook[LibN],3);
  StatProgress.Percent:=StatProgress.Percent+np;
lbState.Caption:='Индексирование авторов...';
  AddIndex2Tab(tbAvt[LibN],4);
  StatProgress.Percent:=StatProgress.Percent+np;
lbState.Caption:='Индексирование серий...';
  AddIndex2Tab(tbSer[LibN],5);
  StatProgress.Percent:=StatProgress.Percent+np;
lbState.Caption:='Индексирование жанров...';
  AddIndex2Tab(tbGen[LibN],6);
  StatProgress.Percent:=StatProgress.Percent+np;

  lbState.Caption:='Еще чуть-чуть...';
  Repaint;
 end;
 GenresUpdInDB(LibN);

 fs0.Free;
 Zip0.Free;
 with tbLinksD do begin Close; DeleteTable; Free; end;
 with tbLinksD1 do begin Close; DeleteTable; Free; end;
 with tbBookD do begin Close; DeleteTable; Free; end;
 with tbFileD do begin Close; DeleteTable; Free; end;
 with tbBookD1 do begin Close; DeleteTable; Free; end;
 with tbFileD1 do begin Close; DeleteTable; Free; end;
 qD.Close; qD.Free;

 result:=true;
end;

function AddDBFil(): Boolean;
var i,j,np,n:integer; s:string;
begin
 result:=false;
 with frmLibNew do begin
  sLibPathFileN:=trim(edLibPathFile.Text);
  if not FileExists(sLibPathFileN) then begin
   MessageBox(handle,pchar('Файл БД не найден'),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
  if not AddNewDB(sLibNameN,sLibPathN,sLibPathFileN) then exit;
  lbA.Caption:=''; lbB.Caption:=''; lbS.Caption:=''; lbG.Caption:=''; lbF.Caption:='';
  PanelStat2.Visible:=true;
  screen.Cursor:=crHourGlass;
  Repaint;
  Enabled:=false;
  StatProgress.Percent:=5;

  StatProgress.Percent:=10;
 end;
 np:=10; n:=nnDB-1;
  for i:=1 to 6 do begin
   s:='SELECT '+DefFNam[i,0];
   for j:=1 to DefTabsNum[i,0]-1 do begin
    s:=s+', '+DefFNam[i,j];
   end;
   q1[n].SQL.Text:=s+' FROM '+DefTabsNam[i];
   try q1[n].Open;
   except
    tbLib.Filtered:=false; tbLib.Last; tbLib.Delete;  ReadDBMain(1);
    MessageBox(frmLibNew.handle,pchar('Формат БД отличается от требуемого. Коллекция не добавлена.'),
     'Ошибка',MB_OK+MB_ICONERROR); exit;
   end;
   with frmLibNew do begin
    case i of
    2: lbF.Caption:=inttostr(q1[n].RecordCount);
    3: lbB.Caption:=inttostr(q1[n].RecordCount);
    4: lbA.Caption:=inttostr(q1[n].RecordCount);
    5: lbS.Caption:=inttostr(q1[n].RecordCount);
    6: lbG.Caption:=inttostr(q1[n].RecordCount);
    end;
    StatProgress.Percent:=StatProgress.Percent+np;
   end;
  end;

 result:=true;
end;

procedure DoNew();
var fl:boolean;
begin
with frmLibNew do begin
 flUpd0:=false; flUpd1:=false; flUpd2:=false; flOnlyLog:=false; 
 LibIDN:=-1;
 lbLog.Caption:='Ошибки в файлах';
 sLibNameN:=trim(edLibName.Text);
 sLibPathN:=ExcludeTrailingPathDelimiter(trim(edSourPath.Text))+'\';
 if (sLibNameN)='' then begin
  MessageBox(handle,pchar('Нет названия коллекции'),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if not DirectoryExists(sLibPathN) then begin
  MessageBox(handle,pchar('Путь к библиотеке не найден'),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;

 PanelStat.Visible:=true;
 PanelStat1.Visible:=false;
 PanelStat2.Visible:=false;
 lbState.Caption:=''; lbTime.Caption:=''; lbTim1.Caption:='';

 flStop:=false;
 StatProgress.ShowPercent:=true;

 case rgSour.ItemIndex of
  0: fl:=AddDBDir(true);
  1: fl:=AddDBFil;
  2: fl:=AddDBDir(false);
 end;

 if not fl then lbState.Caption:='Увы...'
 else begin
  PrepLibList;
  with tbLinks[LibN] do begin Open; Refresh; end;
  with tbAvt[LibN] do begin Open; Refresh; end;
  with tbBook[LibN] do begin Open; Refresh; end;
  with tbSer[LibN] do begin Open; Refresh; end;
  with tbGen[LibN] do begin Open; Refresh; end;
  with tbFile[LibN] do begin Open; Refresh; end;
  lbState.Caption:='Готово!';
 end;

 StatProgress.ShowPercent:=false;

 Enabled:=true;
 StatProgress.Percent:=0;
 lbTime.Caption:=TimeToStr(now-tim0);
 screen.Cursor:=crDefault;
end;
end;

procedure DoUpd();
begin
 with frmLibNew do begin
  LibN:=frmLibNew.Tag;
  LibIDN:=arLib[LibN].ID;
 sLibNameN:=arLib[LibN].Name;
 sLibPathN:=arLib[LibN].PathLib;
  flUpd0:=(rgOper.ItemIndex=0);
  flUpd1:=(rgOper.ItemIndex=1);
  flUpd2:=(rgOper.ItemIndex=2);
  case rgOper.ItemIndex of
   0: begin
    DatUpd:=dp1.Date;
    flOnlyLog:=rbUpd02.Checked;
    if(MessageBox(handle,pchar('Обновить коллекцию '+sLibNameN+' после '+DateToStr(DatUpd)),
     'Подтверждение',MB_YESNOCANCEL+MB_ICONQUESTION)<>IDYES) then exit;
   end;
   1: begin
    sLibPathUpd:=trim(edSourPathUpd.Text);
    if not DirectoryExists(sLibPathUpd) then begin
      MessageBox(handle,pchar('Путь к обновлению не найден'),'Ошибка',MB_OK+MB_ICONERROR); exit;
    end;
    flShablonFb2:=(rgShablon.ItemIndex=0);
    if not PrepShablons then exit;

    if(MessageBox(handle,pchar('Обновить коллекцию '+sLibNameN+' из '+sLibPathUpd),
     'Подтверждение',MB_YESNOCANCEL+MB_ICONQUESTION)<>IDYES) then exit;
    flOnlyLog:=rbUpd03.Checked;
    flReplace:=chReplace.Checked;
    flDel:=chDel.Checked;
   end;
   2: begin
    LibProps; exit;
   end;
  end;
  lbLog.Caption:='Лог';
 StatProgress.ShowPercent:=false;
 if not PrepArMask then exit;

 PanelStat.Visible:=true;
 PanelStat1.Visible:=false;
 PanelStat2.Visible:=false;
 lbState.Caption:=''; lbTime.Caption:=''; lbTim1.Caption:='';

 flStop:=false;
 StatProgress.ShowPercent:=true;

 frmLibNew.meCur.Clear; frmLibNew.meErr.Clear;

 tim0:=now; ntotal:=0; ntreat:=0; nerr:=0; nok:=0;
 datAdd:=now;
 frmLibNew.lbState.Caption:='Обновление...';
 frmLibNew.lbtotal.Caption:=inttostr(ntotal);
 frmLibNew.lbtreat.Caption:=inttostr(ntreat);
 frmLibNew.lbok.Caption:=inttostr(nok);
 frmLibNew.lberr.Caption:=inttostr(nerr);
 frmLibNew.lbTime.Caption:=TimeToStr(now-tim0);
 frmLibNew.PanelStat1.Visible:=true;
 screen.Cursor:=crHourGlass;
 frmLibNew.Repaint;
 frmLibNew.Enabled:=false;
 Zip0 := TZipForge.Create(nil);
 FS0 := TMemoryStream.Create;

 lsAvt1:=TStringList.Create;
 lsAvt2:=TStringList.Create;
 lsAvt3:=TStringList.Create;
 lsTit:=TStringList.Create;
 lsSer:=TStringList.Create;
 lsSerN:=TStringList.Create;
 lsGen:=TStringList.Create;
 lsFil:=TStringList.Create;

 if flUpd0 then ScanDir1(sLibPathN,true);
 if flUpd1 then ScanDir1(sLibPathUpd,true);

 lsAvt1.Free;
 lsAvt2.Free;
 lsAvt3.Free;
 lsTit.Free;
 lsSer.Free;
 lsSerN.Free;
 lsGen.Free;
 lsFil.Free;

  lbState.Caption:='Готово!';

 StatProgress.ShowPercent:=false;

 Enabled:=true;
 StatProgress.Percent:=0;
 lbTime.Caption:=TimeToStr(now-tim0);
 screen.Cursor:=crDefault;
end;
end;

procedure TfrmLibNew.rgOperClick(Sender: TObject);
begin
 PanelUpd0.Visible:=(rgOper.ItemIndex=0);
 PanelUpd1.Visible:=(rgOper.ItemIndex=1);
 PanelUpd2.Visible:=(rgOper.ItemIndex=2);
 gbExt.Enabled:=(rgOper.ItemIndex<>2);
end;

procedure TfrmLibNew.rgShablonClick(Sender: TObject);
begin
 edShablonFrom.Enabled:=rgShablon.ItemIndex=1;
end;

procedure TfrmLibNew.rgSourClick(Sender: TObject);
begin
 case rgSour.ItemIndex of
  0: begin
    lbLibPathFile.Visible:=false;
    edLibPathFile.Visible:=false;
    rgDBPath.Visible:=true;
    gbExt.Enabled:=true;
    PanelLog.Enabled:=true;
   end;
  1: begin
    lbLibPathFile.Visible:=true;
    lbLibPathFile.Caption:='Файл БД';
    edLibPathFile.Visible:=true;
    rgDBPath.Visible:=false;
    gbExt.Enabled:=false;
    PanelLog.Enabled:=false;
   end;
  2: begin
    lbLibPathFile.Visible:=true;
    lbLibPathFile.Caption:='Файл описаний';
    edLibPathFile.Visible:=true;
    rgDBPath.Visible:=true;
    gbExt.Enabled:=false;
    PanelLog.Enabled:=true;
   end;
 end;
end;

procedure TfrmLibNew.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=btDO.Enabled;
end;

procedure TfrmLibNew.FormCreate(Sender: TObject);
var i:integer; s:string;
begin
 PanelNew.BorderOuter:=fsNone; PanelNew.Align:=alTop;
 PanelUpd.BorderOuter:=fsNone; PanelUpd.Align:=alTop;
 PanelUpd0.Left:=PanelUpd1.Left; PanelUpd0.Top:=PanelUpd1.Top;
 PanelUpd0.Width:=PanelUpd1.Width; PanelUpd0.Height:=PanelUpd1.Height;
 PanelUpd2.Left:=PanelUpd1.Left; PanelUpd2.Top:=PanelUpd1.Top;
 PanelUpd2.Width:=PanelUpd1.Width; PanelUpd2.Height:=PanelUpd1.Height;
 PanelLog.BorderOuter:=fsNone;
 RzPanel3.BorderOuter:=fsNone;
 PanelStat1.BevelOuter:=bvNone;
 PanelStat2.BevelOuter:=bvNone;
 PanelStat2.Left:=PanelStat1.Left;
 PanelStat2.Top:=PanelStat1.Top;

 s:=''; for i:=0 to high(Shab0) do s:=s+'%'+Shab0[i]+' ';
 lbShablons.Caption:=s;

edLibName.Text:='Lib1';
edSourPath.Text:='';
edLibPathFile.Text:='';
edShablon.Text:='%f - %t';
end;

procedure TfrmLibNew.FormShow(Sender: TObject);
begin
 if(frmLibNew.Tag<0) then begin
   PanelNew.Visible:=true; PanelUpd.Visible:=false;
   Caption:='Новая коллекция';
 end else begin
   PanelNew.Visible:=false; PanelUpd.Visible:=true;
   Caption:='Обновление коллекции '+arLib[frmLibNew.Tag].Name;
   edLibNameNew.Text:=arLib[frmLibNew.Tag].Name;
   edSourPathNew.Text:=arLib[frmLibNew.Tag].PathLib;
   if(arLib[frmLibNew.Tag].PathLib=ExtractFilePath(arLib[frmLibNew.Tag].PathFile)) then
    rgSourNew.ItemIndex:=1 else rgSourNew.ItemIndex:=0;
 end;
end;

procedure TfrmLibNew.btPathClick(Sender: TObject);
begin
 case (Sender as TComponent).Tag of
 1: begin
  DirDialog.Directory:=AppPath;
  if DirDialog.Execute then edSourPath.Text:=DirDialog.Directory;
 end;
 2: with OpenDial do begin
     if(rgSour.ItemIndex=2) then begin
   Title:='Файл описаний';
   Filter:='Текстовые файлы (*.txt)|*.txt|Файлы csv (*.csv)|*.csv|Все файлы (*.*)|*.*';
     end else begin
   Title:='Файл базы данных';
   if(FileDBExt='abs') then Filter:=''
   else Filter:='Файлы коллекций (*.'+FileDBExt+')|*.'+FileDBExt+'|';
   Filter:=Filter+'Файлы БД (*.abs)|*.abs|Все файлы (*.*)|*.*';
     end;
   FilterIndex:=1;
   InitialDir:=AppPath;
   if not Execute then exit;
   edLibPathFile.Text:=FileName;
 end;
 3: begin
  DirDialog.Directory:=AppPath;
  if DirDialog.Execute then edSourPathUpd.Text:=DirDialog.Directory;
 end;
 4: begin
  DirDialog.Directory:=AppPath;
  if DirDialog.Execute then edSourPathNew.Text:=DirDialog.Directory;
 end;
 end;
end;

procedure TfrmLibNew.btSaveLogClick(Sender: TObject);
begin
 with SaveDial do begin
   Title:='Сохранить лог в файл';
   Filter:='Текстовые файлы (*.txt)|*.txt|Все файлы|*.*';
   FilterIndex:=1;
   InitialDir:=AppPath;
   if not Execute then exit;
   meErr.Lines.SaveToFile(FileName);
 end;
end;

procedure TfrmLibNew.btAddExtClick(Sender: TObject);
var item0: TListItem; s:string; i,n:integer;
begin
 s:=AnsiLowerCase(trim(StringReplace(edExt.Text,'.','',[rfReplaceAll])));
 if(s='') then begin
  MessageBox(handle,'Введите расширение','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 n:=-1;
 for i:=0 to lvExt.Items.Count-1 do
  if(lvExt.Items[i].Caption=s) then begin n:=i; break; end;
 if(n>-1) then begin
  MessageBox(handle,'Такое уже есть','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 with lvExt do begin
   Item0 := Items.Add;
   Item0.Caption := s;
   Item0.SubItems.Add('');
 end;
end;

procedure TfrmLibNew.btDoClick(Sender: TObject);
begin
 if(PanelUpd.Visible) and (rgOper.ItemIndex<0) then begin
   MessageBox(handle,'Делать-то что?','Ошибка',MB_OK); exit;
 end;
 btDo.Enabled:=false;
 if(frmLibNew.Tag<0) then DoNew
 else DoUpd;
 btDo.Enabled:=true;
end;

procedure TfrmLibNew.btExitClick(Sender: TObject);
begin
 Close;
end;

end.
