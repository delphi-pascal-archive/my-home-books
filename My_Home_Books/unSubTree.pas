unit unSubTree;

interface

uses DB, ABSMain, ZipForge, Clipbrd,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, StrUtils, Menus, ExtCtrls;

const
 nColsDopMax=50;
 nColsMain=12;
 nColsMax=nColsMain+nColsDopMax;
 LRecMax=255;

type
  PNodeDataL = ^TNodeDataL;
  TNodeDataL = record
    n,nParent: Integer;
    sDB,sID,Text,name: String;
  end;
  PNodeDataB = ^TNodeDataB;
  TNodeDataB = record
    idBook,idFil,idLib, n,nParent: Integer;
    Checked: Boolean;
    Text: String[255];
    flds:array[0..nColsMax] of string[LRecMax];
  end;


  procedure FillLeftTrees(nfl:integer;sFltr:char);
  procedure FillTreeLeft1(tv0:TVirtualStringTree;nLib:integer;sFiltr1:integer;var n1,n2:integer);
  function GetNodeByText(tv0:TVirtualStringTree;s0:string): PVirtualNode;
  function GetNodeByNL(tv0:TVirtualStringTree;n0:integer;flGoTo:boolean): PVirtualNode;
  function GetNodeByNB(tv0:TVirtualStringTree;n0,idB,idF,idL:integer;flGoTo:boolean): PVirtualNode;
  function GetNodeBySubStr(tv0:TVirtualStringTree;SubS:string;flGoTo:boolean): PVirtualNode;
  function GetNodeByNG(ANode:PVirtualNode;n0:integer;flGoTo:boolean): PVirtualNode;
  procedure FillTreeGen(flAll:boolean;var n1,n2:integer);
  procedure PrepTreeHeader(tv0:TVirtualStringTree);
  function FillTreeBooks(sID,sDB,sFld:string;tv0:TVirtualStringTree):string;
  procedure BookClear(p0:TPanel;nfl:integer);
  procedure BookShow(ntv,idBook,idFil,idLib:integer);
  function GetTreeCellInfo(PageIndex:integer;out nTB,n0,idBook,idLib,idFld,
   nSel,nCheck:integer;out sText:string): Boolean;
  procedure UpdTreeBook(tv0:TVirtualStringTree;n0,idFld0:integer;sVal:string);
  procedure CopyNFld();
  procedure PutStringIntoClipBoard(const Str: WideString);
  procedure SelAllBooks(flSel,flPic:boolean);
  procedure BooksCopyTo(nfl:integer);
  function BookCopyTo(nfl,idBook,idFil,idLib:integer;Dir0:string): Boolean;
  procedure SaveTree2File(tv0:TVirtualStringTree;stit:string;flBooks:boolean);

const
 nTabs=5;
 ColsMainName:array[0..nColsMain] of string[15]=('Выбор','Автор','Название','Серия',
  '№','Жанр','Добавлено','Размер','Формат','Дата файла','Формат файла','Размер файла','Файл');
 ColsMainSize:array[0..nColsMain] of integer=(55,150,250,150,40,150,90,60,50,90,50,60,100);
 TabsField:array[1..nTabs] of string[10]=('idAvt','idBook','idSer','idGen',''); 
 
var
 nnColsB:array[1..nTabs] of integer;
 nColsB:array[1..nTabs,0..nColsMax] of integer;
 nSortColB:array[1..nTabs] of integer;
 nSortDirB,nDirSortL:array[1..nTabs] of TSortDirection;
 ColsBName:array[1..nTabs,0..nColsDopMax] of string;
 ColsBSize:array[1..nTabs,0..nColsDopMax] of integer;
   arID,arN,arN0:array of array of integer;
   arABSGF:array of array of array of string;
   arSerN:array of string;

implementation

uses unMain, unSub, unSubDB, unInfo;

procedure FillLeftTrees(nfl:integer;sFltr:char);
var n1,n2,n,nLib,nFltr:integer;
begin
 screen.Cursor:=crHourGlass;
 n2:=0; if(nfl=0) then n:=4 else n:=1;
 n:=100 div (n*(nDB2-nDB1+1));
 with frmMain do begin
  StatProgress.ShowPercent:=true;
  if(nfl=0) or (nfl=1) then begin
   tvAvt.Clear; tvBooksA.Clear;
   if(sFiltrs[1]='*') then nFltr:=0 else if(sFiltrs[1]='#') then nFltr:=-1
   else if(sFiltrs[1]=frmMain.btAZR.Caption) then nFltr:=-2
   else if(sFiltrs[1]=frmMain.btAZE.Caption) then nFltr:=-3
   else nFltr:=ord(sFiltrs[1][1]);
   for nLib:=nDB1 to nDB2 do begin
    n1:=n2; n2:=n1+n;
    FillTreeLeft1(tvAvt,nLib,nFltr,n1,n2);
    tvAvt.Header.Columns[0].Text:='ФИО авторов ('+inttostr(tvAvt.RootNodeCount)+')';
   end;
  end;
  if(nfl=0) or (nfl=2) then begin
   tvBook.Clear; tvBooksB.Clear;
   if(sFiltrs[2]='*') then nFltr:=0 else if(sFiltrs[2]='#') then nFltr:=-1
   else if(sFiltrs[2]=frmMain.btAZR.Caption) then nFltr:=-2
   else if(sFiltrs[2]=frmMain.btAZE.Caption) then nFltr:=-3
   else nFltr:=ord(sFiltrs[2][1]);
   for nLib:=nDB1 to nDB2 do begin
    n1:=n2; n2:=n1+n;
    FillTreeLeft1(tvBook,nLib,nFltr,n1,n2);
    tvBook.Header.Columns[0].Text:='Названия книг ('+inttostr(tvBook.RootNodeCount)+')';
   end;
  end;
  if(nfl=0) or (nfl=3) then begin
   tvSer.Clear; tvBooksS.Clear;
   if(sFiltrs[3]='*') then nFltr:=0 else if(sFiltrs[3]='#') then nFltr:=-1
   else if(sFiltrs[3]=frmMain.btAZR.Caption) then nFltr:=-2
   else if(sFiltrs[3]=frmMain.btAZE.Caption) then nFltr:=-3
   else nFltr:=ord(sFiltrs[3][1]);
   for nLib:=nDB1 to nDB2 do begin
    n1:=n2; n2:=n1+n;
    FillTreeLeft1(tvSer,nLib,nFltr,n1,n2);
    tvSer.Header.Columns[0].Text:='Названия серий ('+inttostr(tvSer.RootNodeCount)+')';
   end;
  end;
  if(nfl=0) or (nfl=4) then begin
   tvBooksG.Clear;
   n1:=n2; n2:=n1+n;
   FillTreeGen(frmMain.rbGen1.Checked,n1,n2);
  end;
  StatProgress.Percent:=0;
  StatProgress.ShowPercent:=false;
 end;
 screen.Cursor:=crDefault;
end;

procedure FillTreeLeft1(tv0:TVirtualStringTree;nLib:integer;sFiltr1:integer;var n1,n2:integer);
const sTbl:array[0..5] of string=('','Avt','Book','Ser','Gen','');
var ndata:PNodeDataL; node:PVirtualNode; s:string; np,i:integer; tb0:TABSTable;
begin
 with tv0 do begin
  s:=sTbl[Tag];
  case Tag of
   1: tb0:=tbAvt[nLib];
   2: tb0:=tbBook[nLib];
   3: tb0:=tbSer[nLib];
  end;
  BeginUpdate;
  NodeDataSize:=SizeOf(TNodeDataL);
   case sFiltr1 of
    0: s:='';
    1..1000: s:='L='+inttostr(sFiltr1);
    -1: s:='L<'+inttostr(ord('A'));
    -2: s:='L>='+inttostr(ord('А'));
    -3: s:='L>='+inttostr(ord('A'))+' AND L<'+inttostr(ord('А'));
   end;
 with tb0 do begin
  Filtered:=false; Filter:=s; Filtered:=true;
  i:=0;
  np:=(RecordCount div (n2-n1))+1;
  while not eof do begin
   Node:=GetNodeByText(tv0,Fields[1].Value);
   if not Assigned(Node) then begin
    Node := AddChild(RootNode);
    ndata := GetNodeData(Node);
    ndata.Text:=Fields[1].Value;
    ndata.sID := Fields[0].Value;
    nData.sDB:=inttostr(nLib);
   end else begin
    ndata := GetNodeData(Node);
    nData.sDB:=nData.sDB+';'+inttostr(nLib);
    nData.sID:=nData.sID+';'+Fields[0].AsString;
   end;
   nData.n:=Fields[0].Value;
   Next; inc(i);
  if((i mod np)=0) then begin
   frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+1;
  end;
  end;
 end;
  EndUpdate;
  SortTree(0, nDirSortL[Tag], False);
 end;
 if(n1<n2) then n1:=n2; frmMain.StatProgress.Percent:=n1;
end;

function GetNodeByText(tv0:TVirtualStringTree;s0:string): PVirtualNode;
var ndata:PNodeDataL; node,node1:PVirtualNode;
begin
 with tv0 do begin
  Node:=nil;
  Node1:=GetFirstChild(RootNode);
  if Assigned(Node1) then
   repeat
    ndata:=GetNodeData(Node1);
    if(ndata.Text=s0) then begin Node:=Node1; break; end;
    Node1:=GetNextSibling(Node1);
   until not Assigned(Node1);
   result:=Node;
 end;
end;
function GetNodeByNL(tv0:TVirtualStringTree;n0:integer;flGoTo:boolean): PVirtualNode;
var ndata:PNodeDataL; node,node1:PVirtualNode;
begin
 with tv0 do begin
  Node:=nil;
  Node1:=GetFirstChild(RootNode);
  if Assigned(Node1) then
   repeat
    ndata:=GetNodeData(Node1);
    if(ndata.n=n0) then begin
     Node:=Node1;
     if flGoTo then begin result:=Node1; Selected[Node1]:=true; FocusedNode:=Node1; exit; end;
     break;
    end;
    Node1:=GetNextSibling(Node1);
   until not Assigned(Node1);
   result:=Node;
 end;
end;
function GetNodeByNB(tv0:TVirtualStringTree;n0,idB,idF,idL:integer;flGoTo:boolean): PVirtualNode;
label lb1;
var ndata:PNodeDataB; node,node1:PVirtualNode; fl:boolean;
begin
 with tv0 do begin
  Node:=nil;       fl:=false;
  Node1:=GetFirstChild(RootNode);
  if Assigned(Node1) then
   repeat
    ndata:=GetNodeData(Node1);
    if(n0>-1) then fl:=(ndata.n=n0); if not fl then goto lb1;
    if(idB>-1) then fl:=(ndata.idBook=idB); if not fl then goto lb1;
    if(idF>-1) then fl:=(ndata.idFil=idF); if not fl then goto lb1;
    if(idL>-1) then fl:=(ndata.idLib=idL); if not fl then goto lb1;
    if fl then begin
     Node:=Node1;
     if flGoTo then begin result:=Node1; Selected[Node1]:=true; FocusedNode:=Node1; exit; end;
     break;
    end;
lb1:
    Node1:=GetNextSibling(Node1);
   until not Assigned(Node1);
   result:=Node;
 end;
end;
function GetNodeBySubStr(tv0:TVirtualStringTree;SubS:string;flGoTo:boolean): PVirtualNode;
var ndata:PNodeDataL; node,node1:PVirtualNode; n:integer;
begin
 n:=length(SubS);
 with tv0 do begin
  Node:=nil;
  Node1:=GetFirstChild(RootNode);
  if Assigned(Node1) then
   repeat
    ndata:=GetNodeData(Node1);
    if(AnsiUpperCase(LeftStr(ndata.Text,n))=SubS) then begin
     Node:=Node1;
     if flGoTo then begin result:=Node1; Selected[Node1]:=true; FocusedNode:=Node1; exit; end;
     break;
    end;
    Node1:=GetNextSibling(Node1);
   until not Assigned(Node1);
   result:=Node;
 end;
end;
function GetNodeByNG(ANode:PVirtualNode;n0:integer;flGoTo:boolean): PVirtualNode;
var nd:PNodeDataL; NextNode:PVirtualNode;
begin
 with frmMain.tvGen do begin
  Result := nil;
  NextNode := ANode.FirstChild;
  if Assigned(NextNode) then
  repeat
   nd := GetNodeData(NextNode);
   if Assigned(nd) then
    if nd^.n = n0 then begin
     Result := NextNode;
     Selected[Result]:=true; FocusedNode:=Result;
     Exit;
    end;
   Result := GetNodeByNG(NextNode, n0,flGoTo);
   if(Result<>nil) then exit;
   NextNode := NextNode.NextSibling;
  until
  NextNode = nil;
 end;
end;

procedure FillTreeGen(flAll:boolean;var n1,n2:integer);
procedure Get_sDBsID(i0:integer;out sL,sI:string);
var k1,k2:integer; lsL,lsI:TStringList;
begin
 lsL:=TStringList.Create; lsL.Delimiter:=';';
 lsI:=TStringList.Create; lsI.Delimiter:=';';
 lsL.DelimitedText:=arGen[i0].sDB; lsI.DelimitedText:=arGen[i0].sID;
 sL:=''; sI:='';
 for k1:=nDB1 to nDB2 do for k2:=0 to lsL.Count-1 do
  if(inttostr(k1)=lsL.Strings[k2]) then begin
   if(sL='') then begin sL:=lsL.Strings[k2]; sI:=lsI.Strings[k2]; end
   else begin sL:=sL+';'+lsL.Strings[k2]; sI:=sI+';'+lsI.Strings[k2]; end;
 end;
 lsL.Free; lsI.Free;
end;
var i,j,j1,npar,nChild:integer; ndata:PNodeDataL; node,node1:PVirtualNode;
 sL,sI:string; ar0:array of integer; fl:boolean;
begin
 j1:=1;
 if not flAll then begin
  SetLength(ar0,1);
  for i:=nDB1 to nDB2 do begin
   with tbGen[i] do begin
    Open; Filtered:=false;
    SetLength(ar0,high(ar0)+1+RecordCount);
    First; j1:=1;
    while not eof do begin
     fl:=true;
     if(i>nDB1) then for j:=1 to j1-1 do if(Fields[2].AsInteger=ar0[j]) then begin fl:=false; break; end;
     if fl then ar0[j1]:=Fields[2].AsInteger;
     Next; inc(j1);
    end;
   end;
  end;
  if(j1>1) then SetLength(ar0,j1);
 end;

 with frmMain.tvGen do begin
  BeginUpdate;
  Clear; nChild:=0;
  NodeDataSize:=SizeOf(TNodeDataL);
  frmMain.StatProgress.Percent:=n1;
  for i:=1 to high(arGen) do begin
   if(arGen[i].n<=0) then continue;
   if not flAll then begin
    fl:=false;
    for j:=1 to j1-1 do if(arGen[i].n=ar0[j]) then begin fl:=true; break; end;
    if not fl then continue;
   end;
   npar:=arGen[i].nParent;
   if(arGen[i].name='') then continue;
   if(npar=0) then node1:=RootNode
   else node1:=GetNodeByNL(frmMain.tvGen,npar,false);
   if(node1=nil) then begin
     Node1:=AddChild(RootNode);
     ndata:=GetNodeData(Node1);
     ndata.n:=arGen[npar].n;
     ndata.nParent:=0;
     ndata.name:=arGen[npar].name;
     ndata.Text:=arGen[npar].Text;
   end;
   Node:=AddChild(Node1);
   ndata:=GetNodeData(Node);
   ndata.n:=arGen[i].n;
   ndata.nParent:=arGen[i].nParent;
   ndata.name:=arGen[i].name;
   ndata.Text:=arGen[i].Text;
   Get_sDBsID(i,sL,sI);
   ndata.sDB:=sL;
   ndata.sID:=sI;
   inc(nChild);
  end;
  EndUpdate;
  Header.Columns[0].Text:='Названия жанров ('+inttostr(nChild)+')';
 end;
 n2:=frmMain.StatProgress.Percent;
end;

procedure PrepTreeHeader(tv0:TVirtualStringTree);
var ntv,j,n:integer; fl:boolean;
begin
 ntv:=tv0.Tag;
 if(nnColsB[ntv]<1) then begin
  case ntv of
  1: begin
   nnColsB[ntv]:=9;
   nColsB[ntv,0]:=0;
   nColsB[ntv,1]:=101;
   nColsB[ntv,2]:=2;
   nColsB[ntv,3]:=203;
   nColsB[ntv,4]:=3;
   nColsB[ntv,5]:=304;
   nColsB[ntv,6]:=4;
   nColsB[ntv,7]:=5;
   nColsB[ntv,8]:=7;
   nColsB[ntv,9]:=6;
     end;
  2: begin
   nnColsB[ntv]:=7;
   nColsB[ntv,0]:=0;
   nColsB[ntv,1]:=1;
   nColsB[ntv,2]:=3;
   nColsB[ntv,3]:=4;
   nColsB[ntv,4]:=5;
   nColsB[ntv,5]:=7;
   nColsB[ntv,6]:=8;
   nColsB[ntv,7]:=6;
     end;
  3: begin
   nnColsB[ntv]:=5;
   nColsB[ntv,0]:=0;
   nColsB[ntv,1]:=1;
   nColsB[ntv,2]:=2;
   nColsB[ntv,3]:=4;
   nColsB[ntv,4]:=5;
   nColsB[ntv,5]:=8;
     end;
  4: begin
   nnColsB[ntv]:=5;
   nColsB[ntv,0]:=0;
   nColsB[ntv,1]:=1;
   nColsB[ntv,2]:=2;
   nColsB[ntv,3]:=3;
   nColsB[ntv,4]:=4;
   nColsB[ntv,5]:=5;
     end;
  5: begin
   nnColsB[ntv]:=5;
   nColsB[ntv,0]:=0;
   nColsB[ntv,1]:=1;
   nColsB[ntv,2]:=2;
   nColsB[ntv,3]:=3;
   nColsB[ntv,4]:=4;
   nColsB[ntv,5]:=5;
     end;
  end;
 end;

 fl:=false;
 for j:=0 to nnColsB[ntv] do begin
  if(nColsB[ntv,j]>100) then begin fl:=true; end;
  if(nColsB[ntv,j]<=nColsMain) then begin
   ColsBName[ntv,j]:=ColsMainName[nColsB[ntv,j]];
   ColsBSize[ntv,j]:=ColsMainSize[nColsB[ntv,j]];
  end;
 end;
 if fl then
  with tbDop do begin
   Filtered:=false; First;
   while not eof do begin
    n:=Fields[0].AsInteger+Fields[2].AsInteger;
    for j:=0 to nnColsB[ntv] do if(nColsB[ntv,j]=n) then begin
     ColsBName[ntv,j]:=Fields[1].AsString;
     if(ColsBSize[ntv,j]=0) then ColsBSize[ntv,j]:=50;
    end;
    Next;
   end;
  end;

 with tv0.Header.Columns do begin
  Clear;
  for j := 0 to nnColsB[ntv] do begin
   Add;
   Items[j].Text:=ColsBName[ntv,j];
   Items[j].Width:=ColsBSize[ntv,j];
   Items[j].Tag:=nColsB[ntv,j];
  end;
 end;
 if(nSortDirB[ntv]=sdAscending) then tv0.Header.SortDirection:=sdDescending
 else tv0.Header.SortDirection:=sdAscending;
 frmMain.tvBooksAHeaderClick(tv0.Header,nSortColB[tv0.Tag],mbLeft,[],0,0);
end;

function FillTreeBooks(sID,sDB,sFld:string;tv0:TVirtualStringTree):string;
 procedure DoArABSGF(nn,nar,mar,nr:integer;tb0:TABSTable);
 var j,i,n,k,k1:integer;
 begin
  with tb0 do begin
   IndexName:='idx';
   k1:=nar; nar:=0;
   for k:=0 to k1 do begin
    if not FindKey([arN0[k,nn]]) then continue;
    n:=Fields[0].AsInteger;
    for i:=1 to nr do if(arID[i,nn]=n) then begin
     inc(nar); arN[i,nn]:=nar;
     for j:=0 to mar do arABSGF[nn,nar,j]:=Fields[j].AsString;
    end;
   end;
  end;
 end;
 procedure DoArN0(var narB,narA,narF,narS,narG:integer;ds:TABSDataSet);
 var i,j,n:integer;
 begin
   i:=1;
   with ds do while not eof do begin
    for j:=0 to 5 do arID[i,j]:=Fields[j].AsInteger; 
    arSerN[i]:=Fields[6].AsString;
    n:=-1; for j:=0 to narB do if(arN0[j,1]=arID[i,1]) then begin n:=j; break; end;
    if(n<0) then begin inc(narB); arN0[narB,1]:=arID[i,1]; end;
    n:=-1; for j:=0 to narA do if(arN0[j,2]=arID[i,2]) then begin n:=j; break; end;
    if(n<0) then begin inc(narA); arN0[narA,2]:=arID[i,2]; end;
    n:=-1; for j:=0 to narF do if(arN0[j,3]=arID[i,3]) then begin n:=j; break; end;
    if(n<0) then begin inc(narF); arN0[narF,3]:=arID[i,3]; end;
    n:=-1; for j:=0 to narS do if(arN0[j,4]=arID[i,4]) then begin n:=j; break; end;
    if(n<0) then begin inc(narS); arN0[narS,4]:=arID[i,4]; end;
    n:=-1; for j:=0 to narG do if(arN0[j,5]=arID[i,5]) then begin n:=j; break; end;
    if(n<0) then begin inc(narG); arN0[narG,5]:=arID[i,5]; end;
    Next;
    inc(i);
   end;
 end;

label lbEnd;
var ntbl,nr,i,j,n,nproc,ncA,ncB,ncS,ncSN,ncG,ncD,ncSz,ncE,ncDF,ncSzF,ncEF,ncF,
nl,nDB,ID,nid:integer;
 sB,sF,sS:string;
 ndata:PNodeDataB; node:PVirtualNode;
 flB,flF,flS:boolean;
 lsI,lsL,lsID:TStringList;
 arID2DB:array of integer;
 sidB,sidA,sidS,sidG,sidF,sID0,sq1,sq2:string;
 narB,narA,narS,narG,narF,marL,marB,marA,marS,marG,marF:integer;
begin
 screen.Cursor:=crHourGlass;
 if(tv0.Header.SortDirection<>nSortDirB[tv0.Tag]) then
  frmMain.tvBooksAHeaderClick(tv0.Header,nSortColB[tv0.Tag],mbLeft,[],0,0);

 n:=0; for i:=0 to high(arLib) do if(arLib[i].ID>n) then n:=arLib[i].ID;
 SetLength(arID2DB,n+1);
 for i:=0 to high(arLib) do arID2DB[arLib[i].ID]:=i;

 ntbl:=tv0.Tag;
 ncA:=-1; ncB:=-1; ncS:=-1; ncSN:=-1; ncG:=-1; ncD:=-1; ncSz:=-1; ncE:=-1;
 ncDF:=-1; ncSzF:=-1; ncEF:=-1; ncF:=-1;
 nar0Dum:=0; for i:=1 to high(ar0Dum) do for j:=0 to 1 do ar0Dum[i,j]:=0;
 flB:=false; flF:=false; flS:=false; sB:=''; sF:=''; sS:='';
 for i := 0 to nnColsB[ntbl] do begin
  if(nColsB[ntbl,i]=1) then ncA:=i;
  if(nColsB[ntbl,i]=2) then ncB:=i;
  if(nColsB[ntbl,i]=3) then ncS:=i;
  if(nColsB[ntbl,i]=4) then ncSn:=i;
  if(nColsB[ntbl,i]=5) then ncG:=i;
  if(nColsB[ntbl,i]=6) then ncD:=i;
  if(nColsB[ntbl,i]=7) then ncSz:=i;
  if(nColsB[ntbl,i]=8) then ncE:=i;
  if(nColsB[ntbl,i]=9) then ncDF:=i;
  if(nColsB[ntbl,i]=10) then ncEF:=i;
  if(nColsB[ntbl,i]=11) then ncSzF:=i;
  if(nColsB[ntbl,i]=12) then ncF:=i;
  if(nColsB[ntbl,i]>100) then begin
   inc(nar0Dum); ar0Dum[nar0Dum,0]:=i; ar0Dum[nar0Dum,1]:=nColsB[ntbl,i];
   if(nColsB[ntbl,i]>300) then sS:=sS+','+inttostr(nColsB[ntbl,i]-300)
   else if(nColsB[ntbl,i]>200) then sF:=sF+','+inttostr(nColsB[ntbl,i]-200)
    else sB:=sB+','+inttostr(nColsB[ntbl,i]-100);
  end;
 end;

  nproc:=5;
 lsL:=TStringList.Create;
 ExtractStrings([';'],[],pchar(sDB),lsL);
 if(lsL.Count<1) then begin result:='0'; goto lbEnd; end;
 lsI:=TStringList.Create;
 ExtractStrings([';'],[],pchar(sID),lsI);
 lsID:=TStringList.Create; lsID.Delimiter:=',';
 for nl:=0 to lsL.Count-1 do begin
  frmMain.StatProgress.Percent:=5; nproc:=5;
   narDum:=0;
   nDB:=strtoint(lsL.Strings[nl]);
  if(ntbl<>5) then begin
   sID0:=trim(lsI.Strings[nl]);
   ID:=strtoint(sID0);
   sq1:=sID0;
   sq2:='';
   tbLinks[nDB].Filter:=sFld+'='+sID0;
   tbLinks[nDB].Filtered:=true;
   nr:=tbLinks[nDB].RecordCount;
  end else begin
   sq1:=StringReplace(lsI.Strings[0],'@idLib',inttostr(arLib[nDB].ID),[rfReplaceAll,rfIgnoreCase]);
   q1[nDB].SQL.Text:=sq1;
   q1[nDB].Open;
   nr:=q1[nDB].RecordCount;
   sq1:=lsI.Strings[1];
   sq2:=lsI.Strings[2];
  end;
  result:=inttostr(nr);
  if(nr<1) then continue;
  if(nMaxBooks>=0) and (nr>nMaxBooks) then
   if(MessageBox(0,pchar('Найдено записей: '+result+'. Выводить?'),'Подтверждение',
    MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON2)<>IDYES) then goto lbEnd;

 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(sB<>'') then GetDopFlds(sB,'tbDopB',sFld,sq1,sq2,ntbl,nDB,100);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(sF<>'') then GetDopFlds(sF,'tbDopF',sFld,sq1,sq2,ntbl,nDB,200);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(sS<>'') then GetDopFlds(sS,'tbDopS',sFld,sq1,sq2,ntbl,nDB,300);

   frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   tbAvt[nDB].Filtered:=false;
   tbBook[nDB].Filtered:=false;
   tbSer[nDB].Filtered:=false;
   tbGen[nDB].Filtered:=false;
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   narB:=-1; narA:=-1; narS:=-1; narG:=-1; narF:=-1;
   marL:=7;
   SetLength(arID,nr+1,marL+1); SetLength(arN,nr+1,marL+1);
   SetLength(arSerN,nr+1); SetLength(arN0,nr+1,marL+1);
   if(ntbl<>5) then DoArN0(narB,narA,narF,narS,narG,tbLinks[nDB])
   else DoArN0(narB,narA,narF,narS,narG,q1[nDB]);

 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   marA:=1; marB:=7; marS:=1; marG:=1; marF:=3;
   SetLength(arABSGF,7,nr+1,8);
   if(ncA>0) then DoArABSGF(2,narA,marA,nr,tbAvt[nDB]);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(ncB>0) or (ncD>0) or (ncSz>0) or (ncE>0) or (ncDF>0) then
    DoArABSGF(1,narB,marB,nr,tbBook[nDB]);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(ncS>0) then DoArABSGF(4,narS,marS,nr,tbSer[nDB]);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(ncG>0) then DoArABSGF(5,narG,marG,nr,tbGen[nDB]);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
   if(ncSzF>0) or (ncDF>0) or (ncEF>0) or (ncF>0) then
    DoArABSGF(3,narF,marF,nr,tbFile[nDB]);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;

   nproc:=nr div (100-frmMain.StatProgress.Percent) +1;
   with tv0 do begin
    NodeDataSize:=SizeOf(TNodeDataB);
    BeginUpdate;
    for i:=1 to nr do begin
     Node := AddChild(RootNode);
     ndata := GetNodeData(Node);
     ndata.n :=arID[i,0];
     ndata.IDBook := arID[i,1];
     ndata.IDFil := arID[i,3];
     ndata.IDLib :=nDB;
     if(ncSn>0) then ndata.flds[ncSn]:=arSerN[i];
     if(ncSz>0) then ndata.flds[ncSz]:=arABSGF[1,arN[i,1],5];
     if(ncE>0) then ndata.flds[ncE]:=arExt[strtoint(arABSGF[1,arN[i,1],6])].Name;
     if(ncB>0) then ndata.flds[ncB]:=arABSGF[1,arN[i,1],1];
     if(ncD>0) then ndata.flds[ncD]:=arABSGF[1,arN[i,1],2];
     if(ncA>0) then ndata.flds[ncA]:=arABSGF[2,arN[i,2],1];
     if(ncS>0) then ndata.flds[ncS]:=arABSGF[4,arN[i,4],1];
     if(ncG>0) then ndata.flds[ncG]:=GenreTitByNam(arABSGF[5,arN[i,5],1]);
     if(ncSzF>0) then ndata.flds[ncSzF]:=arABSGF[3,arN[i,3],2];
     if(ncEF>0) then ndata.flds[ncEF]:=arExt[strtoint(arABSGF[3,arN[i,3],3])].Name;
     if(ncF>0) then ndata.flds[ncF]:=arABSGF[3,arN[i,3],1];
     if(ncDF>0) then ndata.flds[ncDF]:=arABSGF[1,arN[i,1],7];
     for j:=1 to narDum do if(ndata.idBook=ar1Dum[j]) then begin
       ndata.flds[ar2Dum[j]]:=ar3Dum[j];
     end;
     if((i mod nproc)=0) then frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+1;
    end;
    EndUpdate;
   end;
 end;
 result:=inttostr(tv0.RootNodeCount);
 tv0.SortTree(nSortColB[tv0.Tag], nSortDirB[tv0.Tag], False);
lbEnd:
 lsL.Free; lsI.Free; lsID.Free;
 frmMain.StatProgress.Percent:=100;
 screen.Cursor:=crDefault;
end;

procedure BookClear(p0:TPanel;nfl:integer);
var i:integer;
begin
 if(nfl=0) then begin
  (fCtrl(p0,101) as TLabel).Caption:='...';
  (fCtrl(p0,102) as TLabel).Caption:='()';
 end;
 for i:=201 to 211 do (fCtrl(p0,i) as TLabel).Caption:='';
 (fCtrl(p0,301) as TImage).Picture:=nil;
 (fCtrl(p0,302) as TMemo).Clear;
 if(nfl=3) then begin
 (fCtrl(p0,500) as TLabel).Caption:='';
 for i:=501 to 506 do (fCtrl(p0,i) as TLabel).Caption:='';
 end;
end;

procedure BookShow(ntv,idBook,idFil,idLib:integer);
var file0,arhfile,ftmp:string;
   zip0:TZipForge;
   fs0:TMemoryStream;
   ArchiveItem:TZFArchiveItem;
begin
 q1[idLib].SQL.Text:='SELECT name,nextf FROM tbFile WHERE id='+inttostr(idFil);
 q1[idLib].Open;
 file0:=q1[idLib].Fields[0].AsString;
 file0:=arLib[idLib].PathLib+file0;
 if(q1[idLib].Fields[1].AsInteger=1) then begin
  q1[idLib].SQL.Text:='SELECT arhfile,nextf FROM tbBook WHERE id='+inttostr(idBook);
  q1[idLib].Open;
  arhfile:=q1[idLib].Fields[0].AsString;
  Zip0 := TZipForge.Create(nil);
  fs0 := TMemoryStream.Create;
  with zip0 do begin
   FileName := file0;
   BaseDir := AppPath;
   OpenArchive;
   if (FindFirst(arhfile,ArchiveItem,faAnyFile-faDirectory)) then
    repeat
     fs0.Clear;
     ExtractToStream(ArchiveItem.FileName,fs0);
     fs0.SaveToFile(TmpFile);
    until (not FindNext(ArchiveItem));
  end;
  fs0.Free;
  Zip0.Free;
  ftmp:=TmpFile;
 end else ftmp:=file0;
  case ntv of
   0: fb2Pars(ftmp,file0,frmInfo.PanelA,idBook,idFil,idLib);
   1: fb2Pars(ftmp,file0,frmMain.PanelA,idBook,idFil,idLib);
   2: fb2Pars(ftmp,file0,frmMain.PanelB,idBook,idFil,idLib);
   3: fb2Pars(ftmp,file0,frmMain.PanelS,idBook,idFil,idLib);
   4: fb2Pars(ftmp,file0,frmMain.PanelG,idBook,idFil,idLib);
   5: fb2Pars(ftmp,file0,frmMain.PanelT,idBook,idFil,idLib);
  end;
end;

function GetTreeCellInfo(PageIndex:integer;out nTB,n0,idBook,idLib,idFld,
 nSel,nCheck:integer; out sText:string): Boolean;
var nd:PNodeDataB; tv0:TVirtualStringTree;
begin
 result:=false; idFld:=0; nSel:=0; sText:=''; nCheck:=0;
 with frmMain do
  case Pages.ActivePageIndex of
   iPageA: tv0:=tvBooksA;
   iPageS: tv0:=tvBooksS;
   iPageG: tv0:=tvBooksG;
   iPageB: tv0:=tvBooksB;
   iPageT: tv0:=tvBooksT
   else exit;
  end;
 with tv0 do begin
  nTB:=Tag;
  result:=(RootNodeCount>0);
  nSel:=SelectedCount;
  nCheck:=CheckedCount;
  if(FocusedColumn<1) or not Assigned(FocusedNode) then exit;
  idFld:=Header.Columns.Items[FocusedColumn].Tag;
  nd:=GetNodeData(FocusedNode);
  n0:=nd.n;
  idBook:=nd.idBook;
  idLib:=arLib[nd.idLib].ID;
  sText:=trim(nd.flds[FocusedColumn]);
 end;
end;

procedure UpdTreeBook(tv0:TVirtualStringTree;n0,idFld0:integer;sVal:string);
var nd:PNodeDataB; Node1:PVirtualNode; i,nc:integer;
begin
 nc:=-1;
 for i:=1 to tv0.Header.Columns.Count-1 do
  if(tv0.Header.Columns.Items[i].Tag=idFld0) then begin nc:=i; break; end;
 if(nc<1) then exit;
 Node1:=GetNodeByNB(tv0,abs(n0),-1,-1,-1,false);
 if not Assigned(Node1) then exit;
 nd:=tv0.GetNodeData(Node1);
 if((idFld0 div 100)=1) then
  if strtobool(sVal) then sVal:=arFldBool[idFld0-100,0]
  else sVal:=arFldBool[idFld0-100,1];
 if(n0<0) then sVal:='';
 nd.flds[nc]:=sVal;
end;

procedure CopyNFld();
var s:string; i:integer; nd:PNodeDataB; tv0:TVirtualStringTree;
begin
 with frmMain do
  case Pages.ActivePageIndex of
   iPageA: tv0:=tvBooksA;
   iPageS: tv0:=tvBooksS;
   iPageG: tv0:=tvBooksG;
   iPageB: tv0:=tvBooksB;
   iPageT: tv0:=tvBooksT
   else exit;
  end;
 with tv0 do begin
  nd:=GetNodeData(FocusedNode);
  s:='';
  if(nflCopyNFld<0) then s:=nd.flds[FocusedColumn]
  else for i:=1 to nflCopyNFld do s:=s+nd.flds[i]+chr(9);
 end;
 PutStringIntoClipBoard(s);
end;

procedure PutStringIntoClipBoard(const Str: WideString);
var
Size: Integer;
Data: THandle;
DataPtr: Pointer;
begin
Size:=Length(Str);
if Size = 0 then exit;
if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
   Clipboard.AsText:=Str
else
begin
   Size:=Size shl 1 + 2;
   Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Size);
   try
     DataPtr := GlobalLock(Data);
     try
       Move(Pointer(Str)^, DataPtr^, Size);
       Clipboard.SetAsHandle(CF_UNICODETEXT, Data);
     finally
       GlobalUnlock(Data);
     end;
   except
     GlobalFree(Data);
     raise;
   end;
end;
end;

procedure SelAllBooks(flSel,flPic:boolean);
var tv0:TVirtualStringTree; node1:PVirtualNode; cs:TCheckState;
begin
 case frmMain.Pages.ActivePageIndex of
  iPageA: tv0:=frmMain.tvBooksA;
  iPageS: tv0:=frmMain.tvBooksS;
  iPageG: tv0:=frmMain.tvBooksG;
  iPageB: tv0:=frmMain.tvBooksB;
  iPageT: tv0:=frmMain.tvBooksT
  else exit;
 end;
 if flSel then cs:=csCheckedNormal else cs:=csUnCheckedNormal;
 with tv0 do begin
   Node1:=GetFirstChild(RootNode);
   if Assigned(Node1) then
    repeat
     if not flPic then Node1.CheckState:=cs
     else if Selected[Node1] then Node1.CheckState:=csCheckedNormal;
     Node1:=GetNextSibling(Node1);
    until not Assigned(Node1);
    Repaint;
 end;
end;

procedure BooksCopyTo(nfl:integer);
var tv0:TVirtualStringTree; n:integer; Dir0,tit:string;
ndata:PNodeDataB; node1:PVirtualNode;
begin
 case frmMain.Pages.ActivePageIndex of
  iPageA: tv0:=frmMain.tvBooksA;
  iPageS: tv0:=frmMain.tvBooksS;
  iPageG: tv0:=frmMain.tvBooksG;
  iPageB: tv0:=frmMain.tvBooksB;
  iPageT: tv0:=frmMain.tvBooksT
  else exit;
 end;
 n:=tv0.CheckedCount;
 if(n<1) then begin MessageBox(0,'Нет отмеченных книг','Ошибка',MB_OK+MB_ICONERROR); exit; end;
 case nfl of
  1: begin Dir0:=Dir1; tit:='Папка на устройстве'; end;
  2: begin Dir0:=Dir2; tit:='Папка ''Для чтения'''; end
  else exit;
 end;
 if((nfl=1) and flDir1Ask) or ((nfl=2) and flDir2Ask) then with frmMain do begin
   DirDial.Caption:=tit;
   DirDial.Directory:=Dir0;
   if not DirDial.Execute then exit;
   Dir0:=DirDial.Directory;
 end;
 if not DirectoryExists(Dir0) then begin
  MessageBox(0,pchar('Не найден путь '+Dir0),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if((nfl=1) and flDir1Ask) or ((nfl=2) and flDir2Ask) then
  if(MessageBox(frmMain.Handle,pchar('Скопировать '+inttostr(n)+' книг в папку '+Dir0+'?'),
   'Подтверждение',MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON1)<>IDYES) then exit;

 Dir0:=IncludeTrailingPathDelimiter(Dir0);
 n:=0;
 with tv0 do begin
  Node1:=GetFirstChecked;
  if Assigned(Node1) then
   repeat
    ndata:=GetNodeData(Node1);
    if BookCopyTo(nfl,ndata.idBook,ndata.idFil,ndata.idLib,Dir0) then inc(n);
    Node1:=GetNextChecked(Node1);
   until not Assigned(Node1);
 end;
 MessageBox(0,pchar('Скопировано '+inttostr(n)+' книг'),'Информация',MB_OK+MB_ICONINFORMATION);
end;

function BookCopyTo(nfl,idBook,idFil,idLib:integer;Dir0:string): Boolean;
var filFrom,filBook0,filTo:string; nextf,nextb:integer;
   zip0:TZipForge;
   ArchiveItem:TZFArchiveItem;
   fs0:TMemoryStream;
 si : TSTARTUPINFO;
 pi : TPROCESSINFORMATION;
begin
 result:=false;
 with q1[idLib] do begin
  SQL.Text:='SELECT name,nextf FROM tbFile WHERE id='+inttostr(idFil); Open;
  if(RecordCount<>1) then begin MessageBox(0,'Файл не найден в БД','Error',MB_OK); exit; end;
  filFrom:=Fields[0].AsString;
  nextf:=Fields[1].AsInteger;
  SQL.Text:='SELECT arhfile,nextf FROM tbBook WHERE id='+inttostr(idBook); Open;
  if(RecordCount<>1) then begin MessageBox(0,'Файл не найден в архиве','Error',MB_OK); exit; end;
  filBook0:=Fields[0].AsString;
  nextB:=Fields[1].AsInteger;
  if(trim(filBook0)='') then filBook0:=filFrom;
  filTo:=Dir0+ExtractFileName(filFrom);
  filFrom:=arLib[idLib].PathLib+filFrom;
 end;
 if not FileExists(filFrom) then begin
   MessageBox(0,pchar('Не найден файл '+filFrom),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 if(nextf=1) and ((nfl=0) or (((nfl=2) and flDir2Unzip))) then begin
  Zip0 := TZipForge.Create(nil);
  FS0 := TMemoryStream.Create;
    try
     with zip0 do begin
      FileName := filFrom;
      BaseDir := AppPath;
      OpenArchive;
      if (FindFirst(filBook0,ArchiveItem,faAnyFile-faDirectory)) then
       repeat
        fs0.Clear;
        ExtractToStream(ArchiveItem.FileName,fs0);
        fs0.SaveToFile(TmpFile);
        filFrom:=TmpFile;
       until (not FindNext(ArchiveItem));
       CloseArchive;
     end;
     filTo:=Dir0+filBook0;
    except
   MessageBox(0,pchar('Ошибка распаковки '+filBook0),'Ошибка',MB_OK+MB_ICONERROR); exit;
    end;
  fs0.Free;
  Zip0.Free;
 end;
 if(nfl>0) then begin
  result:=CopyFile(pchar(filFrom),pchar(filTo),false);
  if not result then MessageBox(0,pchar(ErrMsg(filTo)),'Ошибка',MB_OK+MB_ICONERROR);
 end else begin
  filTo:=arExt[nextb].Prog;
  if not FileExists(filTo) then begin
   MessageBox(0,pchar('Не найдена программа '+filTo),'Ошибка',MB_OK+MB_ICONERROR); exit;
  end;
   ZeroMemory(@si, SizeOf(si));
   ZeroMemory(@pi, SizeOf(pi));
   si.cb := SizeOf(si);
   si.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
   si.wShowWindow := SW_SHOWNORMAL;
  result:=CreateProcess(nil,pchar(filTo+' "'+filFrom+'"'),nil,nil,false,
   NORMAL_PRIORITY_CLASS,nil,pchar(AppPath),si,pi);
  if not result then MessageBox(0,pchar(ErrMsg(filTo)),'Ошибка',MB_OK+MB_ICONERROR);
 end;
end;

procedure SaveTree2File(tv0:TVirtualStringTree;stit:string;flBooks:boolean);
const st=chr(9);
var sfile,s:string; ls:TStringList; j:integer;
 ndL:PNodeDataL; ndB:PNodeDataB; node1:PVirtualNode;
begin
 if(tv0.RootNodeCount<1) then begin
   MessageBox(0,'Нет списка для сохранения','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 with frmMain.SaveDial do begin
   Title:='Сохранить список '+stit;
   InitialDir:=AppPath;
   Filter:='Текстовые файлы (*.txt)|*.txt|Все файлы (*.*)|*.*';
   FileName:='Список '+stit+'.txt';
   if not Execute then exit;
   sfile:=FileName;
 end;
 ls:=TStringList.Create;
 ls.Add('Список '+stit);
 ls.Add('');
 with tv0 do begin
  if flBooks then begin
   s:='';
   for j:=1 to nnColsB[Tag] do s:=s+Header.Columns.Items[j].Text+st;
   ls.Add(s);
   ls.Add('');
  end;
  Node1:=GetFirstChild(RootNode);
  if Assigned(Node1) then
   repeat
    if flBooks then begin
     ndB:=GetNodeData(Node1);
     s:='';
     for j:=1 to nnColsB[Tag] do
      if((nColsB[Tag,j] div 100)<>1) then s:=s+ndB.flds[j]+st
      else begin
       if(ndB.flds[j]='') then s:=s+st
       else s:=s+booltostr(strtobool(ndB.flds[j]),true)+st;
      end;
    end else begin
     ndL:=GetNodeData(Node1);
     s:=ndL.Text;
    end;
    ls.Add(s);
    Node1:=GetNextSibling(Node1);
   until not Assigned(Node1);
 end;
 ls.SaveToFile(sfile);
 ls.Free;
end;

end.
