unit unSubDB;

interface

uses unSub, unSubTree, DB, ABSMain, VirtualTrees,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ComCtrls;

  procedure FieldsDefs();
  procedure PrepDBMain();
  procedure BoolVals();
  procedure PrepDB(nDB:integer);
  procedure CreatTab(tb0:TABSTable;nDB,nTB:integer);
  procedure ReadDBMain(nfl:integer);
  function ValGetI1(sFiltr:string;tb0:TABSTable;q00:TABSQuery;flAdd:boolean;Rec1:array of const): Integer;
  function GetNewID(tb0:TABSTable;q00:TABSQuery): Integer;
  procedure GetLibStatictic(sID:string);
  procedure GetDopFlds(sS,sDopT,sFld,sq1,sq2:string;ntbl,nDB,nShift:integer);
  procedure DeleteLib();
  procedure GenresUpdInDB(nDB:integer);
  function UpdDopVal(n0,idRec,idFld0,idBook0,idLib0:integer;sVal:string):Boolean;
  procedure PrepTotFld(item0:integer);
  procedure GetTotFldVals(item0:integer);
  procedure TotalFind();

const FileDB='DB.abs';
      FileDBExt='abs';
      FileGenres='genres_fb2.txt';

var
 q0,qD:TABSQuery;
 db0:TABSDatabase;
 tbLib,tbDop,tbDopB,tbDopF,tbDopS,tbImgBool,tbGenList,tbExt:TABSTable;
 q1:array of TABSQuery;
 db1:array of TABSDatabase;
 tbLinksD,tbBookD,tbFileD:TABSTable;
 tbLinksD1,tbBookD1,tbFileD1:TABSTable;
 tbLinks,tbFile,tbBook,tbAvt,tbSer,tbGen:array of TABSTable;
 DefTabsNam:array[0..13] of string;
 DefTabsNum:array[0..13,0..1] of integer;
 DefFNam:array[0..13,0..12] of string;
 DefFTyp:array[0..13,0..12] of TFieldType;
 DefFSiz:array[0..13,0..12] of integer;
 DefFReq:array[0..13,0..12] of boolean;
 DefINam,DefIFld:array[0..13,0..12] of string;
 DefITyp:array[0..13,0..12] of TIndexOptions;
 narDum,nar0Dum:integer;
 ar1Dum,ar2Dum:array of integer;
 ar3Dum:array of string;
 ar0Dum:array[0..nColsMax,0..1] of integer;
 arFldBool:array of array of string;

implementation

uses unMain, unLibNew, unSets;

procedure FieldsDefs();
begin
 DefTabsNam[0]:='tbLib';   DefTabsNum[0,0]:=4; DefTabsNum[0,1]:=1;
 DefTabsNam[1]:='tbLinks'; DefTabsNum[1,0]:=7; DefTabsNum[1,1]:=6;
 DefTabsNam[2]:='tbFile';  DefTabsNum[2,0]:=5; DefTabsNum[2,1]:=1;
 DefTabsNam[3]:='tbBook';  DefTabsNum[3,0]:=8; DefTabsNum[3,1]:=3;
 DefTabsNam[4]:='tbAvt';   DefTabsNum[4,0]:=6; DefTabsNum[4,1]:=2;
 DefTabsNam[5]:='tbSer';   DefTabsNum[5,0]:=3; DefTabsNum[5,1]:=2;
 DefTabsNam[6]:='tbGen';   DefTabsNum[6,0]:=3; DefTabsNum[6,1]:=1;
  DefTabsNam[7]:='tbDop';  DefTabsNum[7,0]:=5; DefTabsNum[7,1]:=1;
  DefTabsNam[8]:='tbDopB'; DefTabsNum[8,0]:=5; DefTabsNum[8,1]:=6;
  DefTabsNam[9]:='tbDopF'; DefTabsNum[9,0]:=5; DefTabsNum[9,1]:=6;
  DefTabsNam[10]:='tbDopS'; DefTabsNum[10,0]:=5; DefTabsNum[10,1]:=6;
  DefTabsNam[11]:='tbImgBool'; DefTabsNum[11,0]:=4; DefTabsNum[11,1]:=1;
  DefTabsNam[12]:='tbGenList'; DefTabsNum[12,0]:=5; DefTabsNum[12,1]:=2;
  DefTabsNam[13]:='tbExt'; DefTabsNum[13,0]:=3; DefTabsNum[12,1]:=1;
 DefFNam[0,0]:='id'; DefFTyp[0,0]:=ftAutoInc; DefFSiz[0,0]:=0; DefFReq[0,0]:=true;
 DefFNam[0,1]:='name'; DefFTyp[0,1]:=ftString; DefFSiz[0,1]:=128; DefFReq[0,1]:=true;
 DefFNam[0,2]:='PathFile'; DefFTyp[0,2]:=ftString; DefFSiz[0,2]:=255; DefFReq[0,2]:=true;
 DefFNam[0,3]:='PathLib'; DefFTyp[0,3]:=ftString; DefFSiz[0,3]:=255; DefFReq[0,3]:=true;
 DefINam[0,0]:='idx'; DefIFld[0,0]:=DefFNam[0,0]; DefITyp[0,0]:=[ixPrimary];
 DefFNam[1,0]:='id'; DefFTyp[1,0]:=ftAutoInc; DefFSiz[1,0]:=0; DefFReq[1,0]:=true;
 DefFNam[1,1]:='idBook'; DefFTyp[1,1]:=ftInteger; DefFSiz[1,1]:=0; DefFReq[1,1]:=true;
 DefFNam[1,2]:='idAvt'; DefFTyp[1,2]:=ftInteger; DefFSiz[1,2]:=0; DefFReq[1,2]:=true;
 DefFNam[1,3]:='idFile'; DefFTyp[1,3]:=ftInteger; DefFSiz[1,3]:=0; DefFReq[1,3]:=true;
 DefFNam[1,4]:='idSer'; DefFTyp[1,4]:=ftInteger; DefFSiz[1,4]:=0; DefFReq[1,4]:=false;
 DefFNam[1,5]:='idGen'; DefFTyp[1,5]:=ftInteger; DefFSiz[1,5]:=0; DefFReq[1,5]:=false;
 DefFNam[1,6]:='NSer'; DefFTyp[1,6]:=ftString; DefFSiz[1,6]:=10; DefFReq[1,6]:=false;
 DefINam[1,0]:='idx'; DefIFld[1,0]:=DefFNam[1,0]; DefITyp[1,0]:=[ixPrimary];
 DefINam[1,1]:='idxB'; DefIFld[1,1]:=DefFNam[1,1]; DefITyp[1,1]:=[];
 DefINam[1,2]:='idxA'; DefIFld[1,2]:=DefFNam[1,2]; DefITyp[1,2]:=[];
 DefINam[1,3]:='idxF'; DefIFld[1,3]:=DefFNam[1,3]; DefITyp[1,3]:=[];
 DefINam[1,4]:='idxS'; DefIFld[1,4]:=DefFNam[1,4]; DefITyp[1,4]:=[];
 DefINam[1,5]:='idxG'; DefIFld[1,5]:=DefFNam[1,6]; DefITyp[1,5]:=[];
 DefFNam[2,0]:='id'; DefFTyp[2,0]:=ftAutoInc; DefFSiz[2,0]:=0; DefFReq[2,0]:=true;
 DefFNam[2,1]:='name'; DefFTyp[2,1]:=ftString; DefFSiz[2,1]:=255; DefFReq[2,1]:=true;
 DefFNam[2,2]:='sizef'; DefFTyp[2,2]:=ftInteger; DefFSiz[2,2]:=0; DefFReq[2,2]:=true;
 DefFNam[2,3]:='nextf'; DefFTyp[2,3]:=ftInteger; DefFSiz[2,3]:=0; DefFReq[2,3]:=false;
 DefFNam[2,4]:='dat'; DefFTyp[2,4]:=ftDate; DefFSiz[2,4]:=0; DefFReq[2,4]:=false;
 DefINam[2,0]:='idx'; DefIFld[2,0]:=DefFNam[2,0]; DefITyp[2,0]:=[ixPrimary];
 DefFNam[3,0]:='id'; DefFTyp[3,0]:=ftAutoInc; DefFSiz[3,0]:=0; DefFReq[3,0]:=true;
 DefFNam[3,1]:='name'; DefFTyp[3,1]:=ftString; DefFSiz[3,1]:=255; DefFReq[3,1]:=true;
 DefFNam[3,2]:='dat'; DefFTyp[3,2]:=ftDate; DefFSiz[3,2]:=0; DefFReq[3,2]:=false;
 DefFNam[3,3]:='arhfile'; DefFTyp[3,3]:=ftString; DefFSiz[3,3]:=250; DefFReq[3,3]:=false;
 DefFNam[3,4]:='L'; DefFTyp[3,4]:=ftInteger; DefFSiz[3,4]:=0; DefFReq[3,4]:=true;
 DefFNam[3,5]:='sizef'; DefFTyp[3,5]:=ftInteger; DefFSiz[3,5]:=0; DefFReq[3,5]:=false;
 DefFNam[3,6]:='nextf'; DefFTyp[3,6]:=ftInteger; DefFSiz[3,6]:=0; DefFReq[3,6]:=false;
 DefFNam[3,7]:='datarh'; DefFTyp[3,7]:=ftDate; DefFSiz[3,7]:=0; DefFReq[3,7]:=false;
 DefINam[3,0]:='idx'; DefIFld[3,0]:=DefFNam[3,0]; DefITyp[3,0]:=[ixPrimary];
 DefINam[3,1]:='idxL'; DefIFld[3,1]:=DefFNam[3,4]; DefITyp[3,1]:=[];
 DefINam[3,2]:='idxD'; DefIFld[3,2]:=DefFNam[3,2]; DefITyp[3,2]:=[];
 DefFNam[4,0]:='id'; DefFTyp[4,0]:=ftAutoInc; DefFSiz[4,0]:=0; DefFReq[4,0]:=true;
 DefFNam[4,1]:='name'; DefFTyp[4,1]:=ftString; DefFSiz[4,1]:=128; DefFReq[4,1]:=true;
 DefFNam[4,2]:='name1'; DefFTyp[4,2]:=ftString; DefFSiz[4,2]:=64; DefFReq[4,2]:=false;
 DefFNam[4,3]:='name2'; DefFTyp[4,3]:=ftString; DefFSiz[4,3]:=64; DefFReq[4,3]:=false;
 DefFNam[4,4]:='name3'; DefFTyp[4,4]:=ftString; DefFSiz[4,4]:=64; DefFReq[4,4]:=false;
 DefFNam[4,5]:='L'; DefFTyp[4,5]:=ftInteger; DefFSiz[4,5]:=0; DefFReq[4,5]:=true;
 DefINam[4,0]:='idx'; DefIFld[4,0]:=DefFNam[4,0]; DefITyp[4,0]:=[ixPrimary];
 DefINam[4,1]:='idxL'; DefIFld[4,1]:=DefFNam[4,5]; DefITyp[4,1]:=[];
 DefFNam[5,0]:='id'; DefFTyp[5,0]:=ftAutoInc; DefFSiz[5,0]:=0; DefFReq[5,0]:=true;
 DefFNam[5,1]:='name'; DefFTyp[5,1]:=ftString; DefFSiz[5,1]:=128; DefFReq[5,1]:=true;
 DefFNam[5,2]:='L'; DefFTyp[5,2]:=ftInteger; DefFSiz[5,2]:=0; DefFReq[5,2]:=true;
 DefINam[5,0]:='idx'; DefIFld[5,0]:=DefFNam[5,0]; DefITyp[5,0]:=[ixPrimary];
 DefINam[5,1]:='idxL'; DefIFld[5,1]:=DefFNam[5,2]; DefITyp[5,1]:=[];
 DefFNam[6,0]:='id'; DefFTyp[6,0]:=ftAutoInc; DefFSiz[6,0]:=0; DefFReq[6,0]:=true;
 DefFNam[6,1]:='name'; DefFTyp[6,1]:=ftString; DefFSiz[6,1]:=64; DefFReq[6,1]:=true;
 DefFNam[6,2]:='idList'; DefFTyp[6,2]:=ftInteger; DefFSiz[6,2]:=0; DefFReq[6,2]:=false;
 DefINam[6,0]:='idx'; DefIFld[6,0]:=DefFNam[6,0]; DefITyp[6,0]:=[ixPrimary];
 DefFNam[7,0]:='id'; DefFTyp[7,0]:=ftAutoInc; DefFSiz[7,0]:=0; DefFReq[7,0]:=true;
 DefFNam[7,1]:='name'; DefFTyp[7,1]:=ftString; DefFSiz[7,1]:=32; DefFReq[7,1]:=true;
 DefFNam[7,2]:='Typ'; DefFTyp[7,2]:=ftInteger; DefFSiz[7,2]:=0; DefFReq[7,2]:=true;
 DefFNam[7,3]:='vTrue'; DefFTyp[7,3]:=ftString; DefFSiz[7,3]:=10; DefFReq[7,3]:=false;
 DefFNam[7,4]:='vFalse'; DefFTyp[7,4]:=ftString; DefFSiz[7,4]:=10; DefFReq[7,4]:=false;
 DefINam[7,0]:='idx'; DefIFld[7,0]:=DefFNam[7,0]; DefITyp[7,0]:=[ixPrimary];
 DefFNam[8,0]:='id'; DefFTyp[8,0]:=ftAutoInc; DefFSiz[8,0]:=0; DefFReq[8,0]:=true;
 DefFNam[8,1]:='idFld'; DefFTyp[8,1]:=ftInteger; DefFSiz[8,1]:=0; DefFReq[8,1]:=true;
 DefFNam[8,2]:='idBook'; DefFTyp[8,2]:=ftInteger; DefFSiz[8,2]:=0; DefFReq[8,2]:=true;
 DefFNam[8,3]:='idLib'; DefFTyp[8,3]:=ftInteger; DefFSiz[8,3]:=0; DefFReq[8,3]:=true;
 DefFNam[8,4]:='val'; DefFTyp[8,4]:=ftBoolean; DefFSiz[8,4]:=0; DefFReq[8,4]:=true;
 DefINam[8,0]:='idx'; DefIFld[8,0]:=DefFNam[8,0]; DefITyp[8,0]:=[ixPrimary];
 DefINam[8,1]:='idxB'; DefIFld[8,1]:=DefFNam[8,1]; DefITyp[8,1]:=[];
 DefINam[8,2]:='idxF'; DefIFld[8,2]:=DefFNam[8,2]; DefITyp[8,2]:=[];
 DefINam[8,3]:='idxL'; DefIFld[8,3]:=DefFNam[8,3]; DefITyp[8,3]:=[];
 DefINam[8,4]:='idxV'; DefIFld[8,4]:=DefFNam[8,4]; DefITyp[8,4]:=[];
 DefINam[8,5]:='idxUn'; DefIFld[8,5]:=DefFNam[8,1]+';'+DefFNam[8,2]+';'+DefFNam[8,3]; DefITyp[8,5]:=[ixUnique];
 DefFNam[9,0]:='id'; DefFTyp[9,0]:=ftAutoInc; DefFSiz[9,0]:=0; DefFReq[9,0]:=true;
 DefFNam[9,1]:='idFld'; DefFTyp[9,1]:=ftInteger; DefFSiz[9,1]:=0; DefFReq[9,1]:=true;
 DefFNam[9,2]:='idBook'; DefFTyp[9,2]:=ftInteger; DefFSiz[9,2]:=0; DefFReq[9,2]:=true;
 DefFNam[9,3]:='idLib'; DefFTyp[9,3]:=ftInteger; DefFSiz[9,3]:=0; DefFReq[9,3]:=true;
 DefFNam[9,4]:='val'; DefFTyp[9,4]:=ftFloat; DefFSiz[9,4]:=0; DefFReq[9,4]:=true;
 DefINam[9,0]:='idx'; DefIFld[9,0]:=DefFNam[9,0]; DefITyp[9,0]:=[ixPrimary];
 DefINam[9,1]:='idxB'; DefIFld[9,1]:=DefFNam[9,1]; DefITyp[9,1]:=[];
 DefINam[9,2]:='idxF'; DefIFld[9,2]:=DefFNam[9,2]; DefITyp[9,2]:=[];
 DefINam[9,3]:='idxL'; DefIFld[9,3]:=DefFNam[9,3]; DefITyp[9,3]:=[];
 DefINam[9,4]:='idxV'; DefIFld[9,4]:=DefFNam[9,4]; DefITyp[9,4]:=[];
 DefINam[9,5]:='idxUn'; DefIFld[9,5]:=DefFNam[9,1]+';'+DefFNam[9,2]+';'+DefFNam[9,3]; DefITyp[9,5]:=[ixUnique];
 DefFNam[10,0]:='id'; DefFTyp[10,0]:=ftAutoInc; DefFSiz[10,0]:=0; DefFReq[10,0]:=true;
 DefFNam[10,1]:='idFld'; DefFTyp[10,1]:=ftInteger; DefFSiz[10,1]:=0; DefFReq[10,1]:=true;
 DefFNam[10,2]:='idBook'; DefFTyp[10,2]:=ftInteger; DefFSiz[10,2]:=0; DefFReq[10,2]:=true;
 DefFNam[10,3]:='idLib'; DefFTyp[10,3]:=ftInteger; DefFSiz[10,3]:=0; DefFReq[10,3]:=true;
 DefFNam[10,4]:='val'; DefFTyp[10,4]:=ftString; DefFSiz[10,4]:=128; DefFReq[10,4]:=true;
 DefINam[10,0]:='idx'; DefIFld[10,0]:=DefFNam[10,0]; DefITyp[10,0]:=[ixPrimary];
 DefINam[10,1]:='idxB'; DefIFld[10,1]:=DefFNam[10,1]; DefITyp[10,1]:=[];
 DefINam[10,2]:='idxF'; DefIFld[10,2]:=DefFNam[10,2]; DefITyp[10,2]:=[];
 DefINam[10,3]:='idxL'; DefIFld[10,3]:=DefFNam[10,3]; DefITyp[10,3]:=[];
 DefINam[10,4]:='idxV'; DefIFld[10,4]:=DefFNam[10,4]; DefITyp[10,4]:=[];
 DefINam[10,5]:='idxUn'; DefIFld[10,5]:=DefFNam[10,1]+';'+DefFNam[10,2]+';'+DefFNam[10,3]; DefITyp[10,5]:=[ixUnique];
 DefFNam[11,0]:='id'; DefFTyp[11,0]:=ftAutoInc; DefFSiz[11,0]:=0; DefFReq[11,0]:=true;
 DefFNam[11,1]:='Siz'; DefFTyp[11,1]:=ftInteger; DefFSiz[11,1]:=0; DefFReq[11,1]:=true;
 DefFNam[11,2]:='Typ'; DefFTyp[11,2]:=ftString; DefFSiz[11,2]:=3; DefFReq[11,2]:=true;
 DefFNam[11,3]:='Img'; DefFTyp[11,3]:=ftBLOB; DefFSiz[11,3]:=0; DefFReq[11,3]:=false;
 DefINam[11,0]:='idx'; DefIFld[11,0]:=DefFNam[11,0]; DefITyp[11,0]:=[ixPrimary];
 DefFNam[12,0]:='id'; DefFTyp[12,0]:=ftAutoInc; DefFSiz[12,0]:=0; DefFReq[12,0]:=true;
 DefFNam[12,1]:='idPar'; DefFTyp[12,1]:=ftInteger; DefFSiz[12,1]:=0; DefFReq[12,1]:=true;
 DefFNam[12,2]:='name'; DefFTyp[12,2]:=ftString; DefFSiz[12,2]:=64; DefFReq[12,2]:=false;
 DefFNam[12,3]:='title'; DefFTyp[12,3]:=ftString; DefFSiz[12,3]:=64; DefFReq[12,3]:=true;
 DefFNam[12,4]:='flFB2'; DefFTyp[12,4]:=ftBoolean; DefFSiz[12,4]:=0; DefFReq[12,4]:=true;
 DefINam[12,0]:='idx'; DefIFld[12,0]:=DefFNam[12,0]; DefITyp[12,0]:=[ixPrimary];
 DefINam[12,1]:='idxN'; DefIFld[12,1]:=DefFNam[12,2]; DefITyp[12,1]:=[];
 DefFNam[13,0]:='id'; DefFTyp[13,0]:=ftAutoInc; DefFSiz[13,0]:=0; DefFReq[13,0]:=true;
 DefFNam[13,1]:='name'; DefFTyp[13,1]:=ftString; DefFSiz[13,1]:=16; DefFReq[13,1]:=true;
 DefFNam[13,2]:='reader'; DefFTyp[13,2]:=ftString; DefFSiz[13,2]:=255; DefFReq[13,2]:=false;
 DefINam[13,0]:='idx'; DefIFld[13,0]:=DefFNam[13,0]; DefITyp[13,0]:=[ixPrimary];
end;

procedure CreatTab(tb0:TABSTable;nDB,nTB:integer);
var i:integer; tmp:TBitmap;
begin
  with tb0 do begin
   if(nDB<0) then begin
    InMemory:=true;
    if(nDB=-1) then TableName:=DefTabsNam[nTB]+'D'
    else TableName:=DefTabsNam[nTB]+'D1';
   end else begin
    if(nDB<10000) then DatabaseName:=db1[nDB].DatabaseName
    else DatabaseName:=db0.DatabaseName;
    TableName:=DefTabsNam[nTB];
   end;
    if not Exists then begin
     FieldDefs.Clear;
     for i := 0 to DefTabsNum[nTB,0] - 1 do
       FieldDefs.Add(DefFNam[nTB,i],DefFTyp[nTB,i],DefFSiz[nTB,i],DefFReq[nTB,i]);
     if(nDB=10000) then
     for i := 0 to DefTabsNum[nTB,1] - 1 do
       IndexDefs.Add(DefINam[nTB,i],DefIFld[nTB,i],DefITyp[nTB,i]);
     CreateTable;
     Open;
 if(nDB<0) then exit;

     case nTB of
     7: begin
     AppendRecord([nil,'Прочитано',100,'1','']);
     AppendRecord([nil,'В плане',100,'да','нет']);
     AppendRecord([nil,'Оценка',200]);
     AppendRecord([nil,'Заметки',300]);
       end;
     8: begin
     AppendRecord([nil,1,2,1,true]);
     AppendRecord([nil,1,4,1,true]);
       end;
     9: begin
      AppendRecord([nil,3,2,1,5]);
      AppendRecord([nil,3,5,1,3.14]);
       end;
     10: AppendRecord([nil,4,2,1,'что-нибудь']);
     11: begin
       tmp:=TBitmap.Create;
       frmMain.ImgList0.GetBitmap(0,tmp);
       tbImgBool.AppendRecord([nil,16,'bmp']);
       tbImgBool.Edit;
       (tbImgBool.FieldByName('Img') as TBlobField).Assign(tmp);
       tbImgBool.Post;
       tmp.Free;
         end;
    13: begin
      AppendRecord([nil,'zip']);
      AppendRecord([nil,'fb2','HaaliReader.exe']);
       end;
     end;
    end else Open;
  end;
end;

procedure PrepDBMain();
begin
  db0:=TABSDatabase.Create(frmMain);
  with db0 do begin
    DatabaseFileName:=AppPath+FileDB;
    DatabaseName:=copy(FileDB,1,Pos('.',FileDB)-1);
    MaxConnections:=5;
  end;
  if (not db0.Exists) then db0.CreateDatabase;

  q0:=TABSQuery.Create(frmMain);
  q0.DatabaseName:=db0.DatabaseName;

  tbLib:=TABSTable.Create(frmMain);
  tbDop:=TABSTable.Create(frmMain);
  tbDopB:=TABSTable.Create(frmMain);
  tbDopF:=TABSTable.Create(frmMain);
  tbDopS:=TABSTable.Create(frmMain);
  tbImgBool:=TABSTable.Create(frmMain);
  tbGenList:=TABSTable.Create(frmMain);
  tbExt:=TABSTable.Create(frmMain);

  CreatTab(tbLib,10000,0);
  CreatTab(tbDop,10000,7);
  CreatTab(tbDopB,10000,8);
  CreatTab(tbDopF,10000,9);
  CreatTab(tbDopS,10000,10);
  CreatTab(tbImgBool,10000,11);
  CreatTab(tbGenList,10000,12);
  CreatTab(tbExt,10000,13);

  if(tbGenList.RecordCount<1) then GenresFile2BD(AppPath+FileGenres,true);

end;

procedure BoolVals();
var n,id:integer;
begin
  q0.SQL.Text:='SELECT MAX(id) FROM tbDop'; q0.Open;
  SetLength(arFldBool,q0.Fields[0].AsInteger+1,2);
  with tbDop do begin
   Filtered:=false; First;
   while not eof do begin
    arFldBool[Fields[0].asInteger,0]:=Fields[3].AsString;
    arFldBool[Fields[0].AsInteger,1]:=Fields[4].AsString;
    if(Fields[2].AsInteger=100) then begin
     try n:=strtoint(Fields[3].AsString); except n:=-1; end;
     if(n>0) then begin
      id:=-1;
      if(high(idImgBool)>=n) then id:=idImgBool[n];
      if(id<0) then arFldBool[Fields[0].AsInteger,0]:='да';
     end;
     try n:=strtoint(Fields[4].AsString); except n:=-1; end;
     if(n>0) then begin
      id:=-1;
      if(high(idImgBool)>=n) then id:=idImgBool[n];
      if(id<0) then arFldBool[Fields[0].AsInteger,0]:='нет';
     end;
    end;
    Next;
   end;
  end;
end;

procedure PrepDB(nDB:integer);
begin
 if(nDB<0) then with frmLibNew do begin
  tbLinksD:=TABSTable.Create(frmLibNew);
  tbBookD:=TABSTable.Create(frmLibNew);
  tbFileD:=TABSTable.Create(frmLibNew);
  qD:=TABSQuery.Create(frmLibNew);
  qD.InMemory:=true;
  CreatTab(tbLinksD,nDB,1);
  CreatTab(tbBookD,nDB,3);
  CreatTab(tbFileD,nDB,2);

  tbLinksD1:=TABSTable.Create(frmLibNew);
  tbBookD1:=TABSTable.Create(frmLibNew);
  tbFileD1:=TABSTable.Create(frmLibNew);
  CreatTab(tbLinksD1,nDB-1,1);
  CreatTab(tbBookD1,nDB-1,3);
  CreatTab(tbFileD1,nDB-1,2);

 end else begin
  db1[nDB]:=TABSDatabase.Create(frmMain);
  with db1[nDB] do begin
    DatabaseFileName:=arLib[nDB].PathFile;
    DatabaseName:=arLib[nDB].Name;
    MaxConnections:=5;
    Exclusive:=true; MultiUser:=false;
  end;
  if (not db1[nDB].Exists) then db1[nDB].CreateDatabase;

  q1[nDB]:=TABSQuery.Create(frmMain);
  q1[nDB].DatabaseName:=db1[nDB].DatabaseName;

  tbLinks[nDB]:=TABSTable.Create(frmMain);
  tbFile[nDB]:=TABSTable.Create(frmMain);
  tbBook[nDB]:=TABSTable.Create(frmMain);
  tbAvt[nDB]:=TABSTable.Create(frmMain);
  tbSer[nDB]:=TABSTable.Create(frmMain);
  tbGen[nDB]:=TABSTable.Create(frmMain);

  CreatTab(tbLinks[nDB],nDB,1);
  CreatTab(tbFile[nDB],nDB,2);
  CreatTab(tbBook[nDB],nDB,3);
  CreatTab(tbAvt[nDB],nDB,4);
  CreatTab(tbSer[nDB],nDB,5);
  CreatTab(tbGen[nDB],nDB,6);
 end;
end;

procedure ReadDBMain(nfl:integer);
var n:integer; item0: TListItem;
begin
if(nfl=0) or (nfl=2) then begin
 q0.SQL.Text:='SELECT MAX(id) FROM tbExt'; q0.Open;
 SetLength(arExt,q0.Fields[0].asInteger+1);
 for n:=0 to high(arExt) do begin arExt[n].ID:=-1; arExt[n].Name:=''; arExt[n].Prog:=''; end;
 with tbExt do begin
  Open; Filtered:=false;
  First; 
  while not eof do begin
   arExt[Fields[0].AsInteger].ID:=Fields[0].AsInteger;
   arExt[Fields[0].AsInteger].Name:=Fields[1].AsString;
   arExt[Fields[0].AsInteger].Prog:=Fields[2].AsString;
   Next;
  end;
 end;
 with frmLibNew.lvExt do begin
  Clear;
  for n := 0 to High(arExt) do begin
   if(arExt[n].ID<1) then continue;
   Item0 := Items.Add;
   Item0.Caption := arExt[n].Name;
   Item0.Checked:=(arExt[n].ID<3);
   Item0.SubItems.Add(inttostr(arExt[n].ID));
  end;
 end;
 with frmSets.lvReaders do begin
  Clear; Columns[2].Caption:='ID';
  for n := 0 to High(arExt) do begin
   if(arExt[n].ID<2) then continue;
   Item0 := Items.Add;
   Item0.Caption := arExt[n].Name;
   Item0.SubItems.Add(arExt[n].Prog);
   Item0.SubItems.Add(inttostr(arExt[n].ID));
  end;
 end;
end;
if(nfl=0) or (nfl=1) then begin
 with tbLib do begin
  Open; Filtered:=false;
  nnDB:=RecordCount; SetLength(arLib,nnDB);
  if(nnDB=0) then begin nDB1:=-1; nDB2:=nDB1-1; exit; end;
  First; n:=0;
  while not eof do begin
   arLib[n].ID:=Fields[0].Value;
   arLib[n].Name:=Fields[1].Value;
   arLib[n].PathFile:=Fields[2].Value;
   arLib[n].PathLib:=Fields[3].Value;
   Next; inc(n);
  end;
 end;
end;
end;

function ValGetI1(sFiltr:string;tb0:TABSTable;q00:TABSQuery;flAdd:boolean;
 Rec1:array of const): Integer;
begin
 result:=-1;
 if(sFiltr<>'') then begin
  tb0.Filter:=sFiltr;
  tb0.Filtered:=true;
  if(tb0.RecordCount>0) then begin result:=tb0.Fields[0].Value; exit; end;
 end;
 if not flAdd then exit;
 try
  tb0.AppendRecord(Rec1);
  result:=GetNewID(tb0,q00);
 except
  result:=0;
 end;
end;

function GetNewID(tb0:TABSTable;q00:TABSQuery): Integer;
begin
 result:=-1;
 try
 q00.SQL.Text:='SELECT LastAutoinc('+tb0.TableName+', '+tb0.Fields[0].FieldName
   +') FROM '+tb0.TableName;
  q00.Open;
  if(q00.RecordCount<1) then exit;
  result:=q00.Fields[0].Value;
 finally
  q00.Close;
 end;
end;

procedure GetLibStatictic(sID:string);
var stbLib,stbLinks,stbBook,stbAvt,stbFil,stbSer,stbGen:string;
 i,sum,nproc,id0,nr:integer; ar1:array of integer;
 ls:TStringList;
begin
 if(sID='') then exit;
 ls:=TStringList.Create;
 ls.Delimiter:=';'; ls.DelimitedText:=sID;
 try id0:=strtoint(ls.Strings[0]); except id0:=-1; end;
 SetLength(ar1,high(arExt)+1); for i:=0 to high(ar1) do ar1[i]:=-1;
 ls.Free;
 if(id0<0) then begin exit; end;
 stbLib:=DefTabsNam[0]; stbLinks:=DefTabsNam[1];
 stbBook:=DefTabsNam[3]; stbAvt:=DefTabsNam[4];
 stbSer:=DefTabsNam[5]; stbGen:=DefTabsNam[6];
 stbFil:=DefTabsNam[2];
 nproc:=100 div (high(arExt)+10);
 frmMain.StatProgress.Percent:=nproc;
 tbExt.Open; tbExt.Filtered:=false;
 with frmMain.sgLib do begin
  RowCount:=10+tbExt.RecordCount;
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  Cells[1,1]:=arLib[id0].Name;
  Cells[1,2]:=arLib[id0].PathLib;
  q1[id0].SQL.Text:='SELECT idBook FROM '+stbLinks+' GROUP BY idBook';
  q1[id0].Open;
  Cells[1,3]:=inttostr(q1[id0].RecordCount);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT idAvt FROM '+stbLinks+' GROUP BY idAvt';
  q1[id0].Open;
  Cells[1,4]:=inttostr(q1[id0].RecordCount);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT idFile FROM '+stbLinks+' GROUP BY idFile';
  q1[id0].Open;
  Cells[1,5]:=inttostr(q1[id0].RecordCount);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT idSer FROM '+stbLinks+' GROUP BY idSer';
  q1[id0].Open;
  Cells[1,6]:=inttostr(q1[id0].RecordCount);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT idGen FROM '+stbLinks+' GROUP BY idGen';
  q1[id0].Open;
  Cells[1,7]:=inttostr(q1[id0].RecordCount);
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  for i := 0 to high(ar1) do ar1[i]:=0; sum:=0;
  q1[id0].SQL.Text:='SELECT SUM(sizef),nextf FROM '+stbBook+' GROUP BY nextf';
  q1[id0].Open;
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].First;
  while not q1[id0].Eof do begin
   ar1[q1[id0].Fields[1].AsInteger]:=q1[id0].Fields[0].AsInteger;
   q1[id0].Next; sum:=sum+round(q1[id0].Fields[0].AsInteger/1024);
  end;
  Cells[1,8]:=inttostr(round(sum))+' Кб';
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT SUM(sizef) FROM '+stbFil;
  q1[id0].Open;
  Cells[1,9]:=inttostr(round(q1[id0].Fields[0].AsInteger/1024))+' Кб';
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  q1[id0].SQL.Text:='SELECT COUNT(id),SUM(sizef) FROM '+stbFil+' WHERE nextf=1';
  q1[id0].Open;
  Cells[0,10]:=arExt[1].Name;
  Cells[1,10]:=q1[id0].Fields[0].AsString
   +' ('+inttostr(round(q1[id0].Fields[1].AsInteger/1024))+' Кб)';
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  nr:=0;
  for i:= 2 to high(arExt) do begin
   if(arExt[i].ID<=0) then continue;
   q1[id0].SQL.Text:='SELECT DISTINCT id FROM '+stbBook+' WHERE nextf='+inttostr(arExt[i].ID);
   q1[id0].Open;
   nr:=nr+1;
   Cells[0,10+nr]:=arExt[i].Name;
   Cells[1,10+nr]:=inttostr(q1[id0].RecordCount)+' ('+inttostr(round(ar1[i]/1024))+' Кб)';
 frmMain.StatProgress.Percent:=frmMain.StatProgress.Percent+nproc;
  end;
 end;
 frmMain.StatProgress.Percent:=0;
end;

procedure GetDopFlds(sS,sDopT,sFld,sq1,sq2:string;ntbl,nDB,nShift:integer);
var j,n:integer; sdb:string;
begin
 sS[1]:=' ';
 sdb:=QuotedStr(db1[nDB].DatabaseFileName);
 if(ntbl<>5) then begin
  q0.SQL.Text:='SELECT idFld,idBook,val FROM '+sDopT+' INNER JOIN '+sdb+'.tbLinks a '
   +'ON '+sDopT+'.idBook=a.idBook WHERE ('+sDopT+'.idLib='+inttostr(arLib[nDB].ID)+') AND ('
   +'a.'+sFld+'='+sq1+') AND ('+sDopT+'.idFld IN ('+sS+'))';
 end else begin
  sq1:=StringReplace(sq1,'@dbFile',sdb,[rfReplaceAll,rfIgnoreCase]);
  sq1:=StringReplace(sq1,'@sDopT',sDopT,[rfReplaceAll,rfIgnoreCase]);
  sq1:=StringReplace(sq1,'@idFld',sS,[rfReplaceAll,rfIgnoreCase]);
  sq1:=StringReplace(sq1,'@idLib',inttostr(arLib[nDB].ID),[rfReplaceAll,rfIgnoreCase]);
  sq2:=StringReplace(sq2,'@sDopT',sDopT,[rfReplaceAll,rfIgnoreCase]);
  sq2:=StringReplace(sq2,'@idFld',sS,[rfReplaceAll,rfIgnoreCase]);
  sq2:=StringReplace(sq2,'@idLib',inttostr(arLib[nDB].ID),[rfReplaceAll,rfIgnoreCase]);
  if(sq2='') then q0.SQL.Text:=sq1
  else if(sDopT<>sFld) then q0.SQL.Text:=sq1 else q0.SQL.Text:=sq2;
 end;

 with q0 do begin
  Open; First;
  SetLength(ar1Dum,narDum+RecordCount+1);
  SetLength(ar2Dum,narDum+RecordCount+1);
  SetLength(ar3Dum,narDum+RecordCount+1);
  while not Eof do begin
   inc(narDum);
   ar1Dum[narDum]:=Fields[1].AsInteger;
   if(nShift<>100) then ar3Dum[narDum]:=Fields[2].AsString
   else begin
     if Fields[2].AsBoolean then ar3Dum[narDum]:=arFldBool[Fields[0].AsInteger,0]
     else ar3Dum[narDum]:=arFldBool[Fields[0].AsInteger,1];
   end;
   n:=Fields[0].AsInteger;
   for j:=1 to nar0Dum do
    if(n=ar0Dum[j,1]-nShift) then begin ar2Dum[narDum]:=ar0Dum[j,0]; break; end;
   Next;
  end;
 end;
end;

procedure DeleteLib();
var flDelFile:boolean; mr0,i,j:integer; sfile,sid:string;
begin
mr0:=IDNO;
 if(nDB1<>nDB2) then begin
  if(MessageBox(0,pchar('Удалить все коллекции?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)<>IDYES) then exit;
  if(MessageBox(0,pchar('Точно удалить все коллекции?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)<>IDYES) then exit;
 end else begin
  if(MessageBox(0,pchar('Удалить коллекцию '+QuotedStr(arLib[nDB1].Name)+'?'),
   'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)<>IDYES) then exit;
  if(MessageBox(0,pchar('Точно удалить всю коллекцию?'),'Подтверждение',MB_YESNOCANCEL+MB_ICONEXCLAMATION+MB_DEFBUTTON2)<>IDYES) then exit;
 end;
 case mr0 of
  IDYES: flDelFile:=true;
  IDNO:  flDelFile:=false
  else exit;
 end;
 for i:=nDB1 to nDB2 do begin
  sid:=inttostr(arLib[i].ID);
  tbLib.Filtered:=false; tbLib.Filter:='ID='+sid; tbLib.Filtered:=true;
  sfile:=tbLib.FieldByName('PathFile').Value;
  tbLib.Delete; tbLib.Refresh;
  q0.SQL.Text:='DELETE FROM tbDopB WHERE idLib='+sid; q0.ExecSQL;
  q0.SQL.Text:='DELETE FROM tbDopF WHERE idLib='+sid; q0.ExecSQL;
  q0.SQL.Text:='DELETE FROM tbDopS WHERE idLib='+sid; q0.ExecSQL;
  if flDelFile then DeleteFile(sfile);
  MessageBox(0,pchar('Коллекция '+arLib[i].Name+' удалена'),'Информация',MB_OK+MB_ICONINFORMATION);
 end;

 for i:=0 to nnDB-1 do begin
  with tbLinks[i] do begin Close; Free; end;
  with tbAvt[i] do begin Close; Free; end;
  with tbBook[i] do begin Close; Free; end;
  with tbSer[i] do begin Close; Free; end;
  with tbGen[i] do begin Close; Free; end;
  with tbFile[i] do begin Close; Free; end;
  with q1[i] do begin Close; Free; end;
  with db1[i] do begin Close; Free; end;
 end;
 with frmMain do begin
  tvAvt.Clear; tvSer.Clear; tvGen.Clear; tvBook.Clear; tvLib.Clear; sgLib.Cols[1].Clear;
  tvBooksA.Clear; tvBooksS.Clear; tvBooksG.Clear; tvBooksB.Clear; tvBooksT.Clear;
  BookClear(PanelA,0); BookClear(PanelS,0); BookClear(PanelG,0); BookClear(PanelB,0); BookClear(PanelT,0);
 end;

 nnDB:=nnDB-1;
 ReadDBMain(0);

 SetLength(db1,nnDB);
 SetLength(q1,nnDB);
 SetLength(tbLinks,nnDB);
 SetLength(tbFile,nnDB);
 SetLength(tbBook,nnDB);
 SetLength(tbAvt,nnDB);
 SetLength(tbSer,nnDB);
 SetLength(tbGen,nnDB);
 for j:=0 to nnDB-1 do PrepDB(j);
 PrepLibList;

 frmMain.miLibChoise.Items[0].Click;
end;

procedure GenresUpdInDB(nDB:integer);
var i,n1,n2:integer;
begin
 if(nDB<0) then begin n1:=0; n2:=nnDB-1; end else begin n1:=nDB; n2:=nDB; end;
 tbGenList.Open; tbGenList.First;
 for i:=n1 to n2 do tbGen[i].Close;
 while not tbGenList.Eof do begin
  for i:=0 to nnDB-1 do begin
   q1[i].SQL.Text:='UPDATE tbGen SET idList='+tbGenList.Fields[0].AsString
    +' WHERE name='+QuotedStr(tbGenList.Fields[2].AsString);
   q1[i].ExecSQL;
  end;
  tbGenList.Next;
 end;
end;

function UpdDopVal(n0,idRec,idFld0,idBook0,idLib0:integer;sVal:string):Boolean;
var idType:integer; stb:string;
begin
 result:=false;
 idType:=(idFld0 div 100)*100;
 case idType of
  100: begin stb:='tbDopB'; end;
  200: begin stb:='tbDopF'; sVal:=StringReplace(sVal,',','.',[]); end;
  300: begin stb:='tbDopS'; sVal:=QuotedStr(sVal); end
  else exit;
 end;
 if(n0<0) then q0.SQL.Text:='DELETE FROM '+sTB+' WHERE id='+inttostr(idRec)
 else begin
  q0.SQL.Text:='SELECT id, val FROM '+stb+' WHERE idFld='+inttostr(idFld0-100)
   +' AND idBook='+inttostr(idBook0)+' AND idLib='+inttostr(idLib0);
  q0.Open;
  if(q0.RecordCount>0) then idRec:=q0.Fields[0].AsInteger else idRec:=-1;
  if(idType=100) then begin
   if(idRec>0) then sVal:=booltostr(not q0.Fields[1].AsBoolean) else sVal:=booltostr(true);
  end;
  if(idRec<1) then q0.SQL.Text:='INSERT INTO '+stb+' (idFld,idBook,idLib,val) VALUES ('
    +inttostr(idFld0-idType)+','+inttostr(idBook0)+','+inttostr(idLib0)+','+sVal+')'
  else q0.SQL.Text:='UPDATE '+stb+' SET val='+sVal+' WHERE id='+inttostr(idRec);
 end;
 q0.ExecSQL;
 if(q0.RowsAffected<1) then begin
   MessageBox(0,'Не получилось :(','Ошибка',MB_OK+MB_ICONERROR); exit;
 end;
 result:=true;
 UpdTreeBook(frmMain.tvBooksA,n0,idFld0,sval);
 UpdTreeBook(frmMain.tvBooksB,n0,idFld0,sval);
 UpdTreeBook(frmMain.tvBooksS,n0,idFld0,sval);
 UpdTreeBook(frmMain.tvBooksG,n0,idFld0,sval);
 UpdTreeBook(frmMain.tvBooksT,n0,idFld0,sval);
end;

procedure PrepTotFld(item0:integer);
var nFld,nTyp:integer;
begin
 nFld:=strtoint(frmMain.cbFldsT.Value);
 nTyp:=nFld div 100;
 with frmMain do begin
  cbTotVal.Clear; edTotVal.Text:='';
  case nTyp of
   0: begin btTotS.Down:=true; rbTot.ItemIndex:=1; rbTot.Enabled:=true; end;
   1: begin btTotB.Down:=true; rbTot.ItemIndex:=0; rbTot.Enabled:=false; end;
   2: begin btTotF.Down:=true; rbTot.ItemIndex:=0; rbTot.Enabled:=true; end;
   3: begin btTotS.Down:=true; rbTot.ItemIndex:=1; rbTot.Enabled:=true; end;
  end;
  case nFld of
   1,2,3,5,7,9,11: rbTot.Enabled:=false;
  end;
  rbTotClick(nil);
 end;
end;

procedure GetTotFldVals(item0:integer);
var nFld,nTyp,i,j,n:integer; stb,sfld:string;
 ls:TStringList;
begin
 ls:=TStringList.Create; ls.Clear;
 nFld:=strtoint(frmMain.cbFldsT.Value);
 nTyp:=nFld div 100; nFld:=nFld mod 100;
 if(nTyp=0) then begin
  case nFld of
  1: begin stb:='tbAvt'; sfld:='name'; end;
  2: begin stb:='tbBook'; sfld:='name'; end;
  3: begin stb:='tbSer'; sfld:='name'; end;
  4: begin stb:='tbLinks'; sfld:='NSer'; end;
  5: begin stb:='tbGen'; sfld:='name'; end;
  6: begin stb:='tbBook'; sfld:='dat'; end;
  7: begin stb:='tbLinks'; sfld:='sizef'; end;
  8: begin stb:='tbLinks'; sfld:='nextf'; end;
  9: begin stb:='tbFile'; sfld:='dat'; end;
  10: begin stb:='tbFile'; sfld:='nextf'; end;
  11: begin stb:='tbFile'; sfld:='sizef'; end;
  end;
  for i:=nDB1 to nDB2 do begin
    q1[i].SQL.Text:='SELECT DISTINCT '+sfld+' FROM '+stb;
    q1[i].Open; q1[i].First;
    while not q1[i].Eof do begin
     n:=-1;
     if(i>nDB1) then for j:=0 to ls.Count-1 do
      if(ls.Strings[j]=q1[i].Fields[0].AsString) then begin n:=j; break; end;
     if(n<0) then begin ls.Add(q1[i].Fields[0].AsString); end;
     q1[i].Next;
    end;
  end;
  if(nFld=8) or (nFld=10) then for j:=0 to ls.Count-1 do
   try ls.Strings[j]:=arExt[strtoint(ls.Strings[j])].Name; except ls.Strings[j]:=' '; end;
  ls.Sort;
  for j:=0 to ls.Count-1 do
   if(trim(ls.Strings[j])<>'') then frmMain.cbTotVal.Add(ls.Strings[j]);
 end else begin
  case nTyp of
   1: stb:='tbDopB';
   2: stb:='tbDopF';
   3: stb:='tbDopS';
  end;
  q0.SQL.Text:='SELECT DISTINCT val FROM '+stb+' WHERE idFld='+inttostr(nFld);
  q0.Open; q0.First;
  while not q0.Eof do begin
   if(trim(q0.Fields[0].AsString)<>'') then ls.Add(q0.Fields[0].AsString);
   q0.Next;
  end;
  ls.Sort;
  for j:=0 to ls.Count-1 do frmMain.cbTotVal.Add(ls.Strings[j]);
 end;
 if(frmMain.cbTotVal.Items.Count>0) then frmMain.cbTotVal.ItemIndex:=0;
 ls.Free;
end;

procedure TotalFind();
var nOp,nValTyp,idFld,nTyp,i,nFTyp,nFTypU,n:integer;
 s,s1,s2,s3,sOp,sValTyp,sVal,sID,sDB,sFld,sq0,sq1,sq2:string;
begin
 with frmMain do begin
  if edTotVal.Visible then sVal:=trim(edTotVal.Text) else sVal:=cbTotVal.Text;
  if not btTotO6.Down then begin
   if not btTotS.Down then
    if(trim(sVal)='') then begin MessageBox(handle,'Нет значения','Ошибка',MB_OK+MB_ICONERROR); exit; end;
   if btTotD.Down then try StrToDate(sVal);
   except MessageBox(handle,'Требуется дата','Ошибка',MB_OK+MB_ICONERROR); exit; end;
   if btTotF.Down then try StrToFloat(sVal);
   except MessageBox(handle,'Требуется число','Ошибка',MB_OK+MB_ICONERROR); exit; end;
   if btTotB.Down then try StrToBool(sVal);
   except MessageBox(handle,'Требуется true или false','Ошибка',MB_OK+MB_ICONERROR); exit; end;
  end;
  nOp:=0; nValTyp:=0; nFTypU:=0; nFTyp:=0;
  if btTotS.Down then begin nValTyp:=1; sValTyp:='текст'; nFTypU:=1; end;
  if btTotF.Down then begin nValTyp:=2; sValTyp:='число'; nFTypU:=2; end;
  if btTotD.Down then begin nValTyp:=3; sValTyp:='дата'; nFTypU:=3; end;
  if btTotB.Down then begin nValTyp:=4; sValTyp:='да/нет'; nFTypU:=4; end;
  if btTotO1.Down then begin nOp:=1; sOp:='='; end;
  if btTotO2.Down then begin nOp:=2; sOp:='<>'; end;
  if btTotO3.Down then begin nOp:=3; sOp:='>'; end;
  if btTotO4.Down then begin nOp:=4; sOp:='<'; end;
  if btTotO5.Down then begin nOp:=5; sOp:=' LIKE '; sVal:='%'+sVal+'%'; end;
  if btTotO6.Down then begin nOp:=6; sOp:='есть'; end;
  idFld:=strtoint(frmMain.cbFldsT.Value);
  nTyp:=idFld div 100; idFld:=idFld mod 100;
  s3:=sVal;
  if(nValTyp=1) or (nValTyp=3) then sVal:=QuotedStr(sVal);
  s:=cbFldsT.Text+' ('+sValTyp+') '+sOp; if(nOp<>6) then s:=s+' '+sVal;
  if(idFld=10) or (idFld=8) then begin
   n:=-1;
   for i:=1 to high(arExt) do if(s3=arExt[i].Name) then begin n:=i; break; end;
   if(n>0) then sVal:=inttostr(arExt[n].ID) else sVal:='-1';
   if(nValTyp=1) or (nValTyp=3) then s3:=QuotedStr(s3);
  end;
  (fCtrl(PanelT,101) as TLabel).Caption:=s;
 end;

 sID:=''; sDB:=''; sFld:=''; sq0:=''; sq1:=''; sq2:='';
 sFld:='idBook'; s3:='val';
 case nTyp of
  0: begin
    case idFld of
     1: begin sFld:='idAvt'; s1:='id'; s2:='tbAvt'; s3:='name'; nFTyp:=1; end;
     2: begin sFld:='idBook'; s1:='id'; s2:='tbBook'; s3:='name'; nFTyp:=1; end;
     3: begin sFld:='idSer'; s1:='id'; s2:='tbSer'; s3:='name'; nFTyp:=1; end;
     4: begin sFld:='id'; s1:='id'; s2:='tbLinks'; s3:='NSer'; nFTyp:=1; end;
     5: begin sFld:='idGen'; s1:='id'; s2:='tbGen'; s3:='name'; nFTyp:=1; end;
     6: begin sFld:='idBook'; s1:='id'; s2:='tbBook'; s3:='dat'; nFTyp:=3; end;
     7: begin sFld:='idBook'; s1:='id'; s2:='tbBook'; s3:='sizef'; nFTyp:=2; end;
     8: begin sFld:='idBook'; s1:='id'; s2:='tbBook'; s3:='nextf'; nFTyp:=2; end;
     9: begin sFld:='idFile'; s1:='id'; s2:='tbBook'; s3:='datarh'; nFTyp:=3; end;
    10: begin sFld:='idFile'; s1:='id'; s2:='tbFile'; s3:='nextf'; nFTyp:=2; end;
    11: begin sFld:='idFile'; s1:='id'; s2:='tbFile'; s3:='sizef'; nFTyp:=2; end;
    12: begin sFld:='idFile'; s1:='id'; s2:='tbFile'; s3:='name'; nFTyp:=1; end;
    else exit;
    end;
    if(idFld=4) then begin
     sq0:='SELECT * FROM tbLinks b WHERE ';
     sq1:='SELECT idFld,idBook,val FROM @sDopT INNER JOIN @dbFile'
      +'.tbLinks b ON @sDopT.idBook=b.idBook WHERE (@sDopT.idLib=@idLib) '
      +'AND (@sDopT.idFld IN (@idFld)) AND ';
    end else begin
     sq0:='SELECT * FROM tbLinks INNER JOIN '+s2+' b ON tbLinks.'+sFld
     +'='+s2+'.id WHERE ';
     sq1:='SELECT idFld,idBook,val FROM @sDopT INNER JOIN @dbFile'
      +'.tbLinks a ON @sDopT.idBook=a.idBook INNER JOIN @dbFile'
      +'.'+s2+' b WHERE (@sDopT.idLib=@idLib) AND (@sDopT.idFld IN (@idFld)) AND ';
    end;
     end;
  1: begin nFTyp:=4; s2:='tbDopB'; end;
  2: begin nFTyp:=2; s2:='tbDopF'; end;
  3: begin nFTyp:=1; s2:='tbDopS'; end;
 end;
 if(nTyp>0) then begin
  sq0:='SELECT * FROM tbLinks a INNER JOIN "'+db0.DatabaseFileName+'".'+s2
   +' b ON a.idBook=b.idBook WHERE b.idFld='+inttostr(idFld)+' AND (b.idLib=@idLib) AND ';
  sq1:='SELECT a.idFld,a.idBook,a.val FROM @sDopT a INNER JOIN '+s2
   +' b ON a.idBook=b.idBook WHERE (a.idLib=@idLib) '
   +'AND (a.idFld IN (@idFld)) AND ';
  sq2:='SELECT b.idFld,b.idBook,b.val FROM '+s2+' b WHERE (b.idLib=@idLib) AND ';
  sFld:=s2;
  s3:='val';
 end;

 s3:='b.'+s3;
 if(nFTyp<>nFTypU) then
  case nFTypU of
   1: if(idFld<>10) and (idFld<>8) then s3:='CAST('+s3+' AS string) ';
   2: s3:='CAST('+s3+' AS float) ';
   3: s3:='CAST('+s3+' AS datetime) ';
   4: s3:='CAST('+s3+' AS boolean) ';
   end;

 if(nOp<>6) then s1:=sOp+sVal else s1:='<>''''';
 sq0:=sq0+s3+s1;
 sq1:=sq1+s3+s1;
 sq2:=sq2+s3+s1;

 sDB:='';
 if(nTyp=0) then for i:=nDB1 to nDB2 do sDB:=sDB+';'+inttostr(i)
 else with q0 do begin
  SQL.Text:='SELECT DISTINCT idLib FROM '+s2+' b WHERE idFld='+inttostr(idFld)+' AND '+s3+s1;
  Open;
  while not eof do begin
   for i:=nDB1 to nDB2 do if(arLib[i].ID=Fields[0].AsInteger) then sDB:=sDB+';'+inttostr(i);
   Next;
  end;
 end;
 if(sDB<>'') then sDB[1]:=' '; sDB:=trim(sDB);
 with frmMain do begin
  tvBooksT.Clear;
  s1:=sq0+';'+sq1+'; '+sq2;
  (fCtrl(PanelT,102) as TLabel).Caption:='('+FillTreeBooks(s1,sDB,sFld,tvBooksT)+')';
 end; 

end;

end.
