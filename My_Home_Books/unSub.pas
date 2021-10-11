unit unSub;

interface

uses unSubTree, DB, ABSMain, VirtualTrees, ZipForge, ALfcnString,
  JPEG, PngImage, IniFiles, Menus,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ExtCtrls;

type
  TLib = record
    ID:integer;
    Name,PathFile,PathLib: String;
  end;
  TExt = record
    ID:integer;
    Name,Prog: String;
  end;
 TarSh=array of array of array of string;
 TariSh=array of array of integer;
 Tar4Sh=array[0..6] of string;

 
  function ErrMsg(s0:string):string;
  function c_GetTempPath: String;
  procedure PrepStart();
  procedure LoadState(nfl:integer);
  function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:Integer): Integer; Overload;
  function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:Boolean): Boolean; Overload;
  function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:String): String; Overload;
  procedure IniRWArr(fIni:TIniFile;flInput:boolean;sSect,sKey:string;
   var ar0:array of integer;ls:TStringList);
  function InitMain(flInput:boolean):Boolean;
  function InitSkin(flInput:boolean;SkinFile0:string):boolean;
  procedure PrepExit();
  function fCtrl(p1:TCustomPanel;nTag:integer):TControl;
  function GetUtf(s:string):boolean;
  function TagValGetS1(sbuf,tag1,tag2:string;var nshift:integer): string;
  procedure TagValGetS2(sbuf:string;var nshift:integer; out s1,s2:string);
  procedure TagValGetS3(sbuf,tagA1,TagA2:string;var nshift:integer; out s1,s2,s3:string);
  procedure GenresArPrep();
  function GenresFile2BD(file0:string;flFB2:boolean):integer;
  function GenreTitByNam(sg:string):string;
  procedure GetImg(st,sf:string;nt,nd:integer;img0:TImage);
  function base64_decode(const CinLine: string): string;
  function GetAuthors(st,tag1,tag2:string):string;
  procedure PrepLibList();
  procedure fb2Pars(ftmp,file0:string;p1:TPanel;idBook,idFil,idLib:integer);
  procedure LoadImgBool();
  function GetShablon(sh:string; var arSh:TarSh; var ariSh:TariSh):boolean;
  function GetFromShablon(s:string;arSh:TarSh;ariSh:TariSh;var ar4Sh:Tar4Sh):boolean;
  function GetByShablon(arSh:TarSh;ariSh:TariSh;ar4Sh:Tar4Sh): String;

const  AppTit:string='MyHomeBooks';
 stab=chr(9);
 wAll:string='Все';
 wNone:string='_';
 Shab0:array[0..6] of char=('l','f','n','o','t','s','#');
 iPageA=0;
 iPageB=3;
 iPageS=1;
 iPageG=2;
 iPageT=4;
 iPageL=5;

var AppPath,DBPath,TmpPath,TmpFile,Dir1,Dir2:string;
 SkinFile:string='skin.ini';
 flDir1Ask,flDir2Ask,flDir2Unzip:boolean;
 nnDB,nDB1,nDB2:integer;
 arGen,arGenRoot:array of TNodeDataL;
 arExt:array of TExt;
 arLib:array of TLib;
 sFiltrs:array[1..nTabs] of string;
 nFocusL,nFocusB:array[1..nTabs] of integer;
 idImgBool:array of integer;
 nActiveTab:integer;
 flBoolDblClick:boolean;
 nflCopyNFld,nMaxBooks:integer;
 flShowTools,flShowRus,flShowEng,flShowCbLib,flShowTabsTab,
  flShowTabsBt,flShowTabsBtShort,flShowRight:boolean;
 fntMain,fntRus,fntEng,fntLeftT,fntLeftTv,fntLeftTvH,fntBookT,fntBookTv,fntBookTvH,fntBookN,
  fntBookA,fntBookG1,fntBookG2,fntRightM,fntRightB1,fntRightB2:TFont;
 clMain,clRus,clEng,clLeft,clLeftTv,clBook,clBookTv,clRight,clRightM:TColor;

implementation

uses unMain, unSubDB, unLibNew, unSets, unSplash;

function ErrMsg(s0:string):string;
var ErrorCode:integer;
 buf: array[byte] of char;
begin
   ErrorCode := GetLastError;
   FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil,
    ErrorCode, LOCALE_USER_DEFAULT, Buf, sizeof(Buf), nil);
   result:=s0+': '+buf;
end;

procedure PrepStart();
var i:integer;
begin
 AppPath:=ExtractFilePath(Application.ExeName);
 TmpPath:=c_GetTempPath;
 TmpFile:=TmpPath+StringReplace(ExtractFileName(Application.ExeName),'exe','tmp',[rfIgnoreCase]);
 DBPath:=AppPath;
 SkinFile:=AppPath+SkinFile;
 nActiveTab:=0;
 flBoolDblClick:=true;
 nflCopyNFld:=-1;
 nMaxBooks:=4000;
 flShowRight:=true;
 flShowTools:=true; flShowRus:=true; flShowEng:=true;
 flShowCbLib:=true; flShowTabsTab:=true; flShowTabsBt:=true; flShowTabsBtShort:=false;
 Dir1:='C:\'; flDir1Ask:=true;
 Dir2:=AppPath; flDir2Ask:=true; flDir2Unzip:=true;
 nDB1:=-1; nDB2:=-2; nnDB:=0;
 for i:=1 to nTabs do begin
  nSortColB[i]:=1;
  nSortDirB[i]:=sdAscending;
  nDirSortL[i]:=sdAscending;
  sFiltrs[i]:='*';
  nFocusL[i]:=0;
  nFocusB[i]:=0;
 end;
 sFiltrs[4]:='0';
 frmMain.Stat0.Caption:='';

 fntMain:=TFont.Create; fntRus:=TFont.Create; fntEng:=TFont.Create; fntLeftT:=TFont.Create;
 fntLeftTv:=TFont.Create; fntLeftTvH:=TFont.Create; fntBookT:=TFont.Create;
 fntBookTv:=TFont.Create; fntBookTvH:=TFont.Create; fntBookN:=TFont.Create;
 fntBookA:=TFont.Create; fntBookG1:=TFont.Create; fntBookG2:=TFont.Create;
 fntRightM:=TFont.Create; fntRightB1:=TFont.Create; fntRightB2:=TFont.Create;
 LoadSkin(0);

 InitMain(true);

 InitSkin(true,SkinFile);
 LoadSkin(2);
 LoadSkin(3);

 FieldsDefs;

 PrepDBMain;
 ReadDBMain(0);
 if(nnDB>0) and (nDB2=-2) then begin nDB1:=0; nDB2:=nDB1; end;

 SetLength(db1,nnDB);
 SetLength(q1,nnDB);
 SetLength(tbLinks,nnDB);
 SetLength(tbFile,nnDB);
 SetLength(tbBook,nnDB);
 SetLength(tbAvt,nnDB);
 SetLength(tbSer,nnDB);
 SetLength(tbGen,nnDB);
 for i:=0 to nnDB-1 do begin
  if not FileExists(arLib[i].PathFile) then begin
    MessageBox(frmMain.handle,pchar('Не найден файл '+arLib[i].PathFile),'Ошибка',MB_OK+MB_ICONERROR);
    nnDB:=0; nDB1:=-1; nDB2:=-2; break;
  end;
  PrepDB(i);
 end;

 PrepLibList;
 GenresArPrep;
 LoadImgBool;
 BoolVals;

 PrepTreeHeader(frmMain.tvBooksA);
 PrepTreeHeader(frmMain.tvBooksB);
 PrepTreeHeader(frmMain.tvBooksS);
 PrepTreeHeader(frmMain.tvBooksG);
 PrepTreeHeader(frmMain.tvBooksT);

 BookClear(frmMain.PanelA,0);
 BookClear(frmMain.PanelB,0);
 BookClear(frmMain.PanelS,0);
 BookClear(frmMain.PanelG,0);
 BookClear(frmMain.PanelT,0);

 frmSets.LoadSets;
 LoadState(0);

end;

procedure LoadState(nfl:integer);
var i,n:integer; nFocusLDum:array[1..nTabs] of integer;
begin
 with frmMain do begin
  MainBar.Visible:=flShowTools;
  RusBar.Visible:=flShowRus;
  EngBar.Visible:=flShowEng;
  MainBar.Top:=0;
  PanelRightA.Visible:=flShowRight;
  PanelRightB.Visible:=flShowRight;
  PanelRightS.Visible:=flShowRight;
  PanelRightG.Visible:=flShowRight;
  PanelRightT.Visible:=flShowRight;
  cbLib.Visible:=flShowCbLib; btCbLibSeparator.Visible:=cbLib.Visible;
 for i:=0 to Pages.PageCount-1 do Pages.Pages[i].TabVisible:=flShowTabsTab;
 TabSheet8.TabVisible:=false;
  with btTabA do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageA].Caption[1]
   else Caption:=Pages.Pages[iPageA].Caption;
  end;
  with btTabA do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageA].Caption[1]
   else Caption:=Pages.Pages[iPageA].Caption;
  end;
  with btTabS do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageS].Caption[1]
   else Caption:=Pages.Pages[iPageS].Caption;
  end;
  with btTabG do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageG].Caption[1]
   else Caption:=Pages.Pages[iPageG].Caption;
  end;
  with btTabB do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageB].Caption[1]
   else Caption:=Pages.Pages[iPageB].Caption;
  end;
  with btTabT do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:=Pages.Pages[iPageT].Caption[1]
   else Caption:=Pages.Pages[iPageT].Caption;
  end;
  with btTabL do begin
   Visible:=flShowTabsBt;
   if flShowTabsBtShort then Caption:='Л'
   else Caption:=Pages.Pages[iPageL].Caption;
  end;

  if(nfl=1) then exit;

  if(nDB1<0) then exit;

  if(nDB1=nDB2) then n:=nDB1+1 else n:=0;
  for i:=1 to nTabs do nFocusLDum[i]:=nFocusL[i];
  miLibChoise.Items[n].Click;
  if(nFocusLDum[1]>0) then GetNodeByNL(tvAvt,nFocusLDum[1],true);
  if(nFocusLDum[2]>0) then GetNodeByNL(tvBook,nFocusLDum[2],true);
  if(nFocusLDum[3]>0) then GetNodeByNL(tvSer,nFocusLDum[3],true);
  if(nFocusLDum[4]>0) then GetNodeByNG(tvGen.RootNode,nFocusLDum[4],true);
   if(nFocusB[1]>0) then GetNodeByNB(tvBooksA,nFocusB[1],-1,-1,-1,true);
   if(nFocusB[2]>0) then GetNodeByNB(tvBooksB,nFocusB[2],-1,-1,-1,true);
   if(nFocusB[3]>0) then GetNodeByNB(tvBooksS,nFocusB[3],-1,-1,-1,true);
   if(nFocusB[4]>0) then GetNodeByNB(tvBooksG,nFocusB[4],-1,-1,-1,true);
 end;
 if(frmMain.Stat0.Caption='') then frmMain.Stat0.Caption:='Коллекций: '+inttostr(nnDB);
end;

function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:Integer): Integer; Overload;
begin
 if flInput then result:=fIni.ReadInteger(sSect,sKey,Val)
 else begin fIni.WriteInteger(sSect,sKey,Val); result:=val; end;
end;
function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:Boolean): Boolean; Overload;
begin
 if flInput then result:=fIni.ReadBool(sSect,sKey,Val)
 else begin fIni.WriteBool(sSect,sKey,Val); result:=val; end;
end;
function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:String): String; Overload;
begin
 if flInput then result:=fIni.ReadString(sSect,sKey,Val)
 else begin fIni.WriteString(sSect,sKey,Val); result:=val; end;
end;
function IniRW(fIni:TIniFile;flInput:boolean;sSect,sKey:string;Val:TFont): TFont; Overload;
begin
 with val do begin
  if flInput then begin
   Name    := fIni.ReadString (sSect,sKey+'_Name',Name);
   Charset := fIni.ReadInteger(sSect,sKey+'_Charset',Charset);
   Color   := fIni.ReadInteger(sSect,sKey+'_Color', Color);
   Height  := fIni.ReadInteger(sSect,sKey+'_Height',Height);
   Size    := fIni.ReadInteger(sSect,sKey+'_Size',Size);
   Style   := TFontStyles(Byte(fIni.ReadInteger(sSect,sKey+'_Style',0)));
  end else begin
   fIni.WriteString (sSect,sKey+'_Name', Name);
   fIni.WriteInteger(sSect,sKey+'_Charset', Charset);
   fIni.WriteInteger(sSect,sKey+'_Color', Color);
   fIni.WriteInteger(sSect,sKey+'_Height', Height);
   fIni.WriteInteger(sSect,sKey+'_Size', Size);
   fIni.WriteInteger(sSect,sKey+'_Style',Byte(Style));
  end;
 end;
 result:=TFont.Create;
 result.Assign(val);
end;

procedure IniRWArr(fIni:TIniFile;flInput:boolean;sSect,sKey:string;
 var ar0:array of integer;ls:TStringList);
var i,n1,n2:integer; s:string;
begin
 n1:=low(ar0); n2:=high(ar0); s:='';
 for i:=n1 to n2 do s:=s+inttostr(ar0[i])+';';
 ls.DelimitedText:=IniRW(fIni,flInput,sSect,sKey,s);
 for i:=n1 to n2 do ar0[i]:=strtoint(ls.Strings[i]);
end;

function InitMain(flInput:boolean):Boolean;
var FIni:TIniFile; i,n:integer; ls,ls1:TStringList; s,s1:string;
begin
 result:=false;
 s:=StringReplace(Application.ExeName,'.exe','.ini',[rfIgnoreCase]);
 if flInput and not FileExists(s) then begin
  frmMain.Stat0.Caption:='Нет ini-файла'; exit;
 end;
 FIni:= TIniFile.Create(s);
 ls:=TStringList.Create; ls.Clear; ls.Delimiter:=';';
 ls1:=TStringList.Create; ls1.Clear; ls1.Delimiter:=';';
 if(nDB1=nDB2) then n:=nDB1 else n:=-1;
 n:=IniRW(fIni,flInput,'Lib','ActivLib',n);
 if(n<0) then begin nDB1:=0; nDB2:=nnDB-1; end else begin nDB1:=n; nDB2:=n; end;
 flShowRight:=IniRW(fIni,flInput,'Sets','ShowRight',flShowRight);
 flShowTools:=IniRW(fIni,flInput,'Sets','ShowTools',flShowTools);
 flShowRus:=IniRW(fIni,flInput,'Sets','ShowRus',flShowRus);
 flShowEng:=IniRW(fIni,flInput,'Sets','ShowEng',flShowEng);
 flBoolDblClick:=IniRW(fIni,flInput,'Sets','BoolDblClick',flBoolDblClick);
 flShowCbLib:=IniRW(fIni,flInput,'Sets','ShowCbLib',flShowCbLib);
 flShowTabsTab:=IniRW(fIni,flInput,'Sets','ShowTabsTab',flShowTabsTab);
 flShowTabsBt:=IniRW(fIni,flInput,'Sets','ShowTabsBt',flShowTabsBt);
 flShowTabsBtShort:=IniRW(fIni,flInput,'Sets','ShowTabsBtShort',flShowTabsBtShort);
 nflCopyNFld:=IniRW(fIni,flInput,'Sets','CopyNFld',nflCopyNFld);
 nMaxBooks:=IniRW(fIni,flInput,'Sets','MaxBooks',nMaxBooks);
 Dir1:=IniRW(fIni,flInput,'Sets','Dir1',Dir1);
 flDir1Ask:=IniRW(fIni,flInput,'Sets','Dir1Ask',flDir1Ask);
 Dir2:=IniRW(fIni,flInput,'Sets','Dir2',Dir2);
 flDir2Ask:=IniRW(fIni,flInput,'Sets','Dir2Ask',flDir2Ask);
 flDir2Unzip:=IniRW(fIni,flInput,'Sets','Dir2Unzip',flDir2Unzip);
 s:=SkinFile;
 SkinFile:=IniRW(fIni,flInput,'Sets','Skin',SkinFile);
 if(trim(SkinFile)='') then SkinFile:=s;

 frmMain.Pages.ActivePageIndex:=IniRW(fIni,flInput,'Tables','ActiveTab',frmMain.Pages.ActivePageIndex);
 IniRWArr(fIni,flInput,'Tables','SortCols',nSortColB,ls);
 s:=''; s1:='';
 for i:=1 to nTabs do begin
  if(nSortDirB[i]=sdDescending) then s1:=s1+'0;' else s1:=s1+'1;';
 end;
 ls1.DelimitedText:=IniRW(fIni,flInput,'Tables','SortDirs',s1);
 for i:=1 to nTabs do begin
   if(ls1.Strings[i-1]='0') then nSortDirB[i]:=sdDescending else nSortDirB[i]:=sdAscending;
 end;
 IniRWArr(fIni,flInput,'Tables','nCols',nnColsB,ls);
 for i:=1 to nTabs do IniRWArr(fIni,flInput,'Tables','Cols'+inttostr(i),nColsB[i],ls);
 for i:=1 to nTabs do sFiltrs[i]:=IniRW(fIni,flInput,'Tables','Filter'+inttostr(i),sFiltrs[i]);
 IniRWArr(fIni,flInput,'Tables','FocusL',nFocusL,ls);
 IniRWArr(fIni,flInput,'Tables','FocusB',nFocusB,ls);

 ls.Free; ls1.Free; FIni.Free;
 result:=true;
end;

function InitSkin(flInput:boolean;SkinFile0:string):boolean;
var FIni:TIniFile;
begin
 result:=false;
 if flInput and not FileExists(SkinFile0) then exit;
 FIni:= TIniFile.Create(SkinFile0);
 fntMain.Assign(IniRW(fIni,flInput,'Vid','Main',fntMain));
 fntRus.Assign(IniRW(fIni,flInput,'Vid','Rus',fntRus));
 fntEng.Assign(IniRW(fIni,flInput,'Vid','Eng',fntEng));
 fntLeftT.Assign(IniRW(fIni,flInput,'Vid','LeftT',fntLeftT));
 fntLeftTv.Assign(IniRW(fIni,flInput,'Vid','LeftTv',fntLeftTv));
 fntLeftTvH.Assign(IniRW(fIni,flInput,'Vid','LeftTvH',fntLeftTvH));
 fntBookT.Assign(IniRW(fIni,flInput,'Vid','BookT',fntBookT));
 fntBookTv.Assign(IniRW(fIni,flInput,'Vid','BookTv',fntBookTv));
 fntBookTvH.Assign(IniRW(fIni,flInput,'Vid','BookTvH',fntBookTvH));
 fntBookA.Assign(IniRW(fIni,flInput,'Vid','BookA',fntBookA));
 fntBookN.Assign(IniRW(fIni,flInput,'Vid','BookN',fntBookN));
 fntBookG1.Assign(IniRW(fIni,flInput,'Vid','BookG1',fntBookG1));
 fntBookG2.Assign(IniRW(fIni,flInput,'Vid','BookG2',fntBookG2));
 fntRightM.Assign(IniRW(fIni,flInput,'Vid','RightM',fntRightM));
 fntRightB1.Assign(IniRW(fIni,flInput,'Vid','RightB1',fntRightB1));
 fntRightB2.Assign(IniRW(fIni,flInput,'Vid','RightB2',fntRightB2));
 clMain:=StringToColor(IniRW(fIni,flInput,'Vid','clMain',ColorToString(clMain)));
 clRus:=StringToColor(IniRW(fIni,flInput,'Vid','clRus',ColorToString(clRus)));
 clEng:=StringToColor(IniRW(fIni,flInput,'Vid','clEng',ColorToString(clEng)));
 clLeft:=StringToColor(IniRW(fIni,flInput,'Vid','clLeft',ColorToString(clLeft)));
 clLeftTv:=StringToColor(IniRW(fIni,flInput,'Vid','clLeftTv',ColorToString(clLeftTv)));
 clBook:=StringToColor(IniRW(fIni,flInput,'Vid','clBook',ColorToString(clBook)));
 clBookTv:=StringToColor(IniRW(fIni,flInput,'Vid','clBookTv',ColorToString(clBookTv)));
 clRight:=StringToColor(IniRW(fIni,flInput,'Vid','clRight',ColorToString(clRight)));
 clRightM:=StringToColor(IniRW(fIni,flInput,'Vid','clRightM',ColorToString(clRightM)));
 result:=true;
 fIni.Free;
end;

procedure PrepExit();
var i:integer;
begin
 InitMain(false);
 if not FileExists(SkinFile) then InitSkin(false,SkinFile);
try
 with tbLib do begin Active:=false; Free; end;
 with tbDop do begin Active:=false; Free; end;
 with tbDopB do begin Active:=false; Free; end;
 with tbDopF do begin Active:=false; Free; end;
 with tbDopS do begin Active:=false; Free; end;
 with tbImgBool do begin Active:=false; Free; end;
 with tbGenList do begin Active:=false; Free; end;
 with q0 do begin Active:=false; Free; end;
 with db0 do begin Connected:=false; Free; end;
 for i := 0 to nnDB - 1 do begin
  with tbLinks[i] do begin Active:=false; Free; end;
  with tbAvt[i] do begin Active:=false; Free; end;
  with tbBook[i] do begin Active:=false; Free; end;
  with tbSer[i] do begin Active:=false; Free; end;
  with tbGen[i] do begin Active:=false; Free; end;
  with tbFile[i] do begin Active:=false; Free; end;
  with q1[i] do begin Active:=false; Free; end;
  with db1[i] do begin Connected:=false; Free; end;
 end;
 fntMain.Free; fntRus.Free; fntEng.Free; fntLeftT.Free; fntLeftTv.Free;
 fntLeftTvH.Free; fntBookT.Free; fntBookTv.Free; fntBookTvH.Free;
 fntBookN.Free; fntBookA.Free; fntBookG1.Free; fntBookG2.Free;
 fntRightM.Free; fntRightB1.Free; fntRightB2.Free;
finally

end;
end;

function fCtrl(p1:TCustomPanel;nTag:integer):TControl;
var i:integer;
begin
 result:=nil;
 for i:=0 to P1.ControlCount-1 do begin
  if(P1.Controls[i] is TCustomPanel) then begin
   result:=fCtrl((P1.Controls[i] as TCustomPanel),nTag); if(result<>nil) then exit;
  end else begin
   if(P1.Controls[i].Tag=nTag) then begin result:=P1.Controls[i]; exit; end;
  end;
 end;
end;

function c_GetTempPath: String;
var Buffer: array[0..1023] of Char;
begin
 SetString(Result, Buffer, GetTempPath(Sizeof(Buffer)-1,Buffer));
end;

function GetUtf(s:string):boolean;
const tag001='encoding='; tag002='?';
var n1,n2:integer;
begin
 result:=false;
 n1:=ALPosEx(tag001,s,1);
 if(n1<1) then exit;
 n1:=n1+length(tag001);
 n2:=ALPosEx('?',s,n1);
 s:=ALStringReplace(copy(s,n1,n2-n1),'"','',[rfReplaceAll]);
 result:=(ALLowerCase(s[1])='u');
end;

function TagValGetS1(sbuf,tag1,tag2:string;var nshift:integer): string;
var n1,n2:integer;
begin
 result:='';
 n1:=ALPosEx(tag1,sbuf,nshift); if(n1<1) then exit;
 n1:=n1+length(tag1);
 n2:=ALPosEx(tag2,sbuf,n1); if(n2<=n1) then exit;
 if(ord(sbuf[n1])=160) then sbuf[n1]:=' ';
 result:=trim(copy(sbuf,n1,n2-n1)); nshift:=n2+length(tag2);
end;

procedure TagValGetS2(sbuf:string;var nshift:integer; out s1,s2:string);
const
 tagA1='<sequence'; tagA2='/>';
 tagA11='name="'; tagA12='"';
 tagA21='number="'; tagA22='"';
var n1:integer; sbuf1:string;
begin
 s1:=''; s2:='';
 sbuf1:=TagValGetS1(sbuf,tagA1,tagA2,nshift); if(sbuf1='') then exit;
 n1:=1; s1:=TagValGetS1(sbuf1,tagA11,tagA12,n1); if(s1='') then exit;
 n1:=1; s2:=TagValGetS1(sbuf1,tagA21,tagA22,n1);
end;

procedure TagValGetS3(sbuf,tagA1,TagA2:string;var nshift:integer; out s1,s2,s3:string);
var n1:integer; sbuf1:string;
begin
 s1:=''; s2:=''; s3:='';
 sbuf1:=TagValGetS1(sbuf,tagA1,tagA2,nshift); if(sbuf1='') then exit;
 n1:=1; s1:=TagValGetS1(sbuf1,'<last-name>','</last-name>',n1); if(s1='') then exit;
 n1:=1; s2:=TagValGetS1(sbuf1,'<first-name>','</first-name>',n1);
 n1:=1; s3:=TagValGetS1(sbuf1,'<middle-name>','/<middle-name>',n1);
end;

procedure GenresArPrep();
var i,nDB,n:integer;
begin
 q0.SQL.Text:='SELECT MAX(id) FROM tbGenList';
 q0.Open;
 n:=q0.Fields[0].AsInteger;
 SetLength(arGen,n+1);
 for i:=0 to high(arGen) do begin arGen[i].n:=0; arGen[i].name:=''; arGen[i].Text:=''; end;
 with tbGenList do begin
  Open; Filtered:=false; First;
  while not eof do begin
   n:=Fields[0].AsInteger;
   arGen[n].n:=n;
   arGen[n].nParent:=Fields[1].AsInteger;
   arGen[n].name:=Fields[2].AsString;
   arGen[n].Text:=Fields[3].AsString;
   arGen[n].sDB:=''; arGen[n].sID:='';
   for nDB:=0 to nnDB-1 do begin
    tbGen[nDB].Filter:='name='+QuotedStr(arGen[n].name);
    tbGen[nDB].Filtered:=true;
    if(tbGen[nDB].RecordCount>0) then begin
     if(arGen[n].sDB='') then arGen[n].sDB:=inttostr(nDB)
     else arGen[n].sDB:=arGen[n].sDB+';'+inttostr(nDB);
     if(arGen[n].sID='') then arGen[n].sID:=tbGen[nDB].FieldByName('id').AsString
     else arGen[n].sID:=arGen[n].sID+';'+tbGen[nDB].FieldByName('id').AsString;
    end;
   end;
   Next;
  end;
 end;
end;

function GenresFile2BD(file0:string;flFB2:boolean):integer;
var ls,ls1:TStringList; i,j,n,n1,ngens,npar,nchild,ngensR:integer; s:string;
begin
 result:=0;
 if not FileExists(file0) then exit;
 ls:=TStringList.Create; ls1:=TStringList.Create;
 ls.LoadFromFile(file0);
 ls.Text:=Utf8ToAnsi(ls.Text);
 SetLength(arGen,ls.Count); ngens:=-1;
 SetLength(arGenRoot,ls.Count); ngensR:=-1;
 for i:=0 to high(arGen) do begin
  arGen[i].sID:=''; arGen[i].sDB:='';
  arGenRoot[i].sID:=''; arGenRoot[i].sDB:=''; arGenRoot[i].name:=''; arGenRoot[i].nParent:=0;
 end;
 for i := 0 to ls.Count - 1 do begin
  if(ls.Strings[i][1]='#') then continue;
  n:=Pos(' ',ls.Strings[i]);
  ls1.Delimiter:='.';
  ls1.DelimitedText:=copy(ls.Strings[i],1,n-1);
  npar:=strtoint(ls1.Strings[ls1.Count-2]);
  nchild:=strtoint(ls1.Strings[ls1.Count-1]);
  s:=copy(ls.Strings[i],n+1,1000); n1:=Pos(';',s); if(n1<1) then n1:=length(s)+1;
  if(npar=0) then begin
   arGenRoot[nchild].n:=nchild;
   if(nchild=0) then arGenRoot[nchild].name:=wnone;
   arGenRoot[nchild].Text:=copy(s,1,n1-1);
   if(ngensR<nchild) then ngensR:=nchild;
  end else begin
   inc(ngens);
   arGen[ngens].n:=nchild;
   arGen[ngens].nParent:=npar;
   arGen[ngens].Text:=copy(s,n1+1,length(s));
   arGen[ngens].name:=copy(s,1,n1-1);
  end;
 end;
 SetLength(arGen,ngens+1);
 SetLength(arGenRoot,ngensR+1);
 ls.Free; ls1.Free;
 result:=ngens;
 if(ngens<1) then exit;

 tbGenList.Close;
 tbGenList.EmptyTable;
 tbGenList.Open;
 for i:=0 to ngensR do begin
  tbGenList.AppendRecord([nil,0,arGenRoot[i].name,arGenRoot[i].Text,flFB2]);
  n:=GetNewID(tbGenList,q0);
  for j:=0 to ngens do if(arGen[j].nParent=arGenRoot[i].n) then
   tbGenList.AppendRecord([nil,n,arGen[j].name,arGen[j].Text,flFB2]);
 end;
 GenresUpdInDB(-1);
end;

function GenreTitByNam(sg:string):string;
var i,j:integer;
begin
 j:=-1;
 for i := 0 to high(arGen) do if(arGen[i].name=sg) then begin j:=i; break; end;
 if(j<0) then result:=sg else result:=arGen[j].Text;
end;

procedure PrepLibList();
var i,n:integer; s:string; mItem:TMenuItem;
 ndata:PNodeDataL; node:PVirtualNode;
begin
 with frmMain.cbLib do begin
  s:=Text; n:=-1;
  Clear;
  Add(wAll);
  for i:=0 to nnDB-1 do Add(arLib[i].Name);
  for i:=0 to Items.Count-1 do if(Items[i]=s) then begin n:=i; break; end;
  if(n>=0) then ItemIndex:=n;
 end;
 with frmMain do begin
  for i:=miLibChoise.Count-1 downto 1 do begin
   mItem:=miLibChoise.Items[i]; mItem.Free;
  end;
  for i:=0 to nnDB-1 do begin
   mItem := TMenuItem.Create(miLibChoise);
   mItem.Caption:=arLib[i].Name;
   mItem.OnClick := miLibAll.OnClick;
   mItem.OnAdvancedDrawItem:=miLibAll.OnAdvancedDrawItem;
   mItem.Tag:=i+1;
   miLibChoise.Add(mItem);
  end;
 end;
 frmMain.Stat0.Caption:='Коллекций: '+inttostr(nnDB);

 with frmMain.tvLib do begin
  Clear;
  BeginUpdate;
  NodeDataSize:=SizeOf(TNodeDataL);
   q0.SQL.Text:='SELECT DISTINCT id, name FROM tbLib';
  q0.Open; q0.First; i:=0;
  while not q0.eof do begin
    Node := AddChild(RootNode);
    ndata := GetNodeData(Node);
    ndata.Text:=q0.Fields[1].Value;
    ndata.sID :=q0.Fields[0].AsString;
    nData.sDB:=inttostr(i);
   q0.Next; inc(i);
  end;
  EndUpdate;
 end;

end;

procedure fb2Pars(ftmp,file0:string;p1:TPanel;idBook,idFil,idLib:integer);
const
 tag01='<title-info>'; tag02='</title-info>';
 tagG1='<genre>'; tagG2='</genre>';
 tagB1='<book-title>'; tagB2='</book-title>';
var ls:TStringList; n1,i,nd,idAvt:integer; flUtf:boolean;
 sd,st,sp,s,sAnn,sCov:string;
 ss:array[201..211] of string;
begin
 if not FileExists(file0) then begin
   MessageBox(0,pchar('Файл не найден '+file0),'Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 ss[204]:=ExtractFilePath(file0);
 ss[205]:=ExtractFileName(file0);
 ls:=TStringList.Create;
 ls.LoadFromFile(ftmp);
 flUtf:=GetUtf(ls.Text);
 n1:=1; nd:=1;
 sd:=TagValGetS1(ls.Text,'<description>','</description>',nd);
 if(sd='') then begin
  with q1[idLib] do begin
   SQL.Text:='SELECT idAvt FROM tbLinks WHERE idBook='+inttostr(idBook)
    +' AND idFile='+inttostr(idFil); Open;
   idAvt:=Fields[0].AsInteger;
   SQL.Text:='SELECT name FROM tbBook WHERE id='+inttostr(idBook); Open;
   ss[201]:=Fields[0].AsString;
   SQL.Text:='SELECT name FROM tbAvt WHERE id='+inttostr(idAvt); Open;
   ss[202]:=Fields[0].AsString;
  end;
  for i:=206 to 211 do ss[i]:=''; sAnn:=''; ss[203]:='';
 end else begin
  st:=TagValGetS1(sd,'<title-info>','</title-info>',n1); n1:=1;
  sp:=TagValGetS1(sd,'<publish-info>','</publish-info>',n1); n1:=1;
  TagValGetS2(sp,n1,ss[209],s); n1:=1;
  ss[203]:=TagValGetS1(st,'<genre>','</genre>',n1); n1:=1;
  ss[203]:=GenreTitByNam(ss[203]);
  ss[201]:=TagValGetS1(st,'<book-title>','</book-title>',n1); n1:=1;
  sAnn:=TagValGetS1(st,'<annotation>','</annotation>',n1); n1:=1;
  sAnn:=ALStringReplace(sAnn,'</p>',chr(13),[rfReplaceAll]);
  sAnn:=ALStringReplace(trim(sAnn),'<p>','',[rfReplaceAll]);
  ss[206]:=TagValGetS1(sp,'<publisher>','</publisher>',n1); n1:=1;
  ss[207]:=TagValGetS1(sp,'<city>','</city>',n1); n1:=1;
  ss[208]:=TagValGetS1(sp,'<year>','</year>',n1); n1:=1;
  ss[211]:=TagValGetS1(sp,'<isbn>','</isbn>',n1); n1:=1;
  ss[202]:=GetAuthors(st,'<author>','</author>');
  ss[210]:=GetAuthors(st,'<translator>','</translator>');
  if flUtf then begin
   ss[201]:=Utf8ToAnsi(ss[201]);
   ss[202]:=Utf8ToAnsi(ss[202]);
   ss[206]:=Utf8ToAnsi(ss[206]);
   ss[207]:=Utf8ToAnsi(ss[207]);
   ss[209]:=Utf8ToAnsi(ss[209]);
   ss[210]:=Utf8ToAnsi(ss[210]);
   sAnn:=Utf8ToAnsi(sAnn);
  end;
 end;
 for i:=201 to 211 do (fCtrl(p1,i) as TLabel).Caption:=ss[i];
 (fCtrl(p1,302) as TMemo).Text:=sAnn;
 sCov:=TagValGetS1(st,'<coverpage>','</coverpage>',n1);
 if(sCov<>'') then GetImg(sCov,ls.Text,1,nd,(fCtrl(p1,301) as TImage));
 ls.Free;
end;

procedure GetImg(st,sf:string;nt,nd:integer;img0:TImage);
var sC,sp:string; n1,n2,nflPic:integer;
 jpg:TJpegImage; png:TPngObject; fsp:TMemoryStream;
begin
 if(ALPos('jpg',st)>0) then nflPic:=1 else
  if(ALPos('png',st)>0) then nflPic:=2 else exit;
 fsp:=TMemoryStream.Create;
 sC:=TagValGetS1(st,'href=','/>',nt);
 sC:=ALStringReplace(sC,'"','',[rfReplaceAll]);
 sC:=ALStringReplace(sC,'#','',[rfReplaceAll]);
 n1:=ALPosEx(sC+'">',sf,nd); if(n1<1) then exit;
 n1:=n1+length(sC+'">');
 n2:=ALPosEx('</binary>',sf,n1+1);
 sp:=copy(sf,n1,n2-n1);
  sp:=Base64_Decode(sp);
   fsp.Clear;
   fsp.WriteBuffer(pointer(sp)^,length(sp));
   fsp.Seek(0, soBeginning);
   case nflPic of
   1: begin
    jpg:=TJpegImage.Create;
    jpg.LoadFromStream(fsp);
    img0.Picture.Assign(jpg);
    jpg.Free;
      end;
   2: begin
    png:=TPngObject.CreateBlank(COLOR_PALETTE,1,0,0);
    png.LoadFromStream(fsp);
    img0.Picture.Assign(png);
    png.Free;
      end;
   end;
 fsp.Free;
end;

function base64_decode(const CinLine: string): string;
const RESULT_ERROR = -2;
var inLineIndex: Integer;
    c: Char;
    x: SmallInt;
    c4: Word;
    StoredC4: array[0..3] of SmallInt;
    InLineLength: Integer;
begin
Result := '';
inLineIndex := 1;
c4 := 0;
InLineLength := Length(CinLine);
while inLineIndex <= InLineLength do
  begin
  while (inLineIndex <= InLineLength) and (c4 < 4) do
  begin
  c := CinLine[inLineIndex];
  case c of
          '+'    : x := 62;  
          '/'    : x := 63;  
          '0'..'9': x := Ord(c) - (Ord('0')-52);  
          '='    : x := -1;  
          'A'..'Z': x := Ord(c) - Ord('A');  
          'a'..'z': x := Ord(c) - (Ord('a')-26);  
        else  
          x := RESULT_ERROR;  
  end;
  if x <> RESULT_ERROR then  
    begin  
    StoredC4[c4] := x;  
    Inc(c4);  
    end;  
  Inc(inLineIndex);  
  end;  
  if c4 = 4 then  
  begin  
  c4 := 0;  
  Result := Result + Char((StoredC4[0] shl 2) 
            or (StoredC4[1] shr 4));  
  if StoredC4[2] = -1 then Exit;
  Result := Result + Char((StoredC4[1] shl 4)
            or (StoredC4[2] shr 2));
  if StoredC4[3] = -1 then Exit;
  Result := Result + Char((StoredC4[2] shl 6)
            or (StoredC4[3]));
  end;
  end;
end;

function GetAuthors(st,tag1,tag2:string):string;
var kAvt,n1,i:integer;
 aAvt:array[1..3,1..3] of string;
begin
 kAvt:=0; n1:=1; result:='';
 for i := 1 to 3 do begin
  TagValGetS3(st,tag1,tag2,n1,aAvt[i,1],aAvt[i,2],aAvt[i,3]);
  if(aAvt[i,1]='') then break;
  inc(kAvt);
 end;
 if(kAvt>1) then begin
  for i:=1 to kAvt do begin
   result:=result+aAvt[i,1];
   if(aAvt[i,2]<>'') then result:=result+' '+aAvt[i,2];
   if(i<kAvt) then result:=result+', ';
  end; 
 end else result:=trim(aAvt[1,1]+' '+aAvt[1,2]+' '+aAvt[1,3]);
end;

procedure LoadImgBool();
var tmp:TBitmap; st:TStream; n:integer;
begin
 tbImgBool.Filtered:=false;
 q0.SQL.Text:='SELECT MAX(id) FROM tbImgBool';
 q0.Open;
 if(q0.RecordCount<1) then exit;
 tmp:=TBitmap.Create;
 n:=q0.Fields[0].AsInteger;
 SetLength(idImgBool,n+1); for n:=0 to high(idImgBool) do idImgBool[n]:=-1;
 tbImgBool.First;
 with frmMain.ilBool do begin
  Clear;
  while not tbImgBool.Eof do begin
   st:=tbImgBool.CreateBlobStream(tbImgBool.FieldByName('Img'),bmRead);
   tmp.LoadFromStream(st);
   n:=AddMasked(tmp,tmp.TransparentColor);
   idImgBool[tbImgBool.Fields[0].AsInteger]:=n;
   tbImgBool.Next;
   st.Free;
  end;
 end;
 tmp.Free;
end;

function GetShablon(sh:string; var arSh:TarSh; var ariSh:TariSh):boolean;
label lb1;
var i,j,k1,k2:integer; ls,ls1:TStringList;
begin
 result:=false;
  ls:=TStringList.Create; ls1:=TStringList.Create;
  ls.Clear;
  ExtractStrings(['\'],[],pchar(sh),ls);
  SetLength(arSh,ls.Count);
  SetLength(ariSh,ls.Count);
  for i:=0 to ls.Count-1 do begin
   SetLength(arSh[i],2); SetLength(arSh[i,0],0);
   if(length(ls.Strings[i])<2) then goto lb1;
   if(ls.Strings[i][1]<>'%') then goto lb1;
   k1:=-1; k2:=-1;
   for j:=0 to high(Shab0) do begin
    if(ls.Strings[i][2]=Shab0[j]) then begin k1:=j; end;
    if(ls.Strings[i][length(ls.Strings[i])]=Shab0[j]) then begin k2:=j; end;
   end;
   if(k1<0) or (k2<0) then goto lb1;
   ls1.Clear;
   ExtractStrings(['%'],[],pchar(ls.Strings[i]),ls1);
   if(ls1.Count<1) then goto lb1;
   SetLength(arSh[i,0],ls1.Count);
   SetLength(arSh[i,1],ls1.Count);
   SetLength(ariSh[i],ls1.Count);
   arSh[i,0,0]:='';
   for j:=0 to ls1.Count-1 do begin
    k1:=-1;
    for k2:=0 to high(Shab0) do
     if(ls1.Strings[j][1]=Shab0[k2]) then begin k1:=k2; break; end;
    if(k1<0) then goto lb1;
    if(j<ls1.Count-1) then arSh[i,0,j+1]:=copy(ls1.Strings[j],2,100);
    arSh[i,1,j]:=ls1.Strings[j][1];
    ariSh[i,j]:=k1;
   end;
  end;
 result:=true;
lb1:
  ls.Free; ls1.Free;
end;

function GetFromShablon(s:string;arSh:TarSh;ariSh:TariSh;var ar4Sh:Tar4Sh):boolean;
var n1,n2,n3,i,j,len:integer;
begin
  ar4Sh[0]:=UpperCase(s[1]); len:=0;
  for j:=1 to high(ar4Sh) do ar4Sh[j]:='';
  for i:=0 to high(arSh) do begin
   if(high(arSh[i])<1) then continue;
   n2:=1;  n3:=0;
   for j:=0 to high(arSh[i,0]) do begin
    n1:=n2+n3;
    if(j=high(arSh[i,0])) then begin n2:=1000; n3:=0; end
    else begin
     n2:=ALPosEx(arSh[i,0,j+1],s,n1+length(arSh[i,0,j]));
     n3:=length(arSh[i,0,j+1]);
    end;
    ar4Sh[ariSh[i,j]]:=copy(s,n1,n2-n1);
    len:=len+length(ar4Sh[ariSh[i,j]]);
   end;
  end;
 result:=(len>0);
end;

function GetByShablon(arSh:TarSh;ariSh:TariSh;ar4Sh:Tar4Sh): String;
var i,j:integer;
begin
 result:='';
 for i:=0 to high(arSh) do begin
  for j:=0 to high(arSh[i,0]) do begin
   if(ar4Sh[ariSh[i,j]]<>'') then begin
    if(i>0) and (j=0) then result:=result+'\';
    result:=result+arSh[i,0,j]+ar4Sh[ariSh[i,j]];
   end;
  end;
 end; 
end;

end.
