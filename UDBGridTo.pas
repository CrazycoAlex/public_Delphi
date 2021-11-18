unit UDBGridTo;

interface
  //для отчета
uses  SysUtils,ComCtrls,Classes,DB,DBGrids, Windows,
      ActiveX{TOLEEnum},ExcelXP{TExcelApplication},OLEServer{ckNewInstance},Forms,Variants,Grids,
      Graphics{TColor},Contnrs{TObjectList}, DBGridEh;

 type
  TDBGridToHTML = class(TComponent)
   procedure DBGridToHtml(Grid : TDBGrid; TitleName : String);
   procedure DBGridToHtmlEh(Grid : TDBGridEh; TitleName : String);
   procedure StringGridToExcel(Grid : TStringGrid; TitleName : String);
  private
   { Private declarations }
   const SW_SHOWMAXIMIZED = 3;
   var GetVisible : Boolean;
       Get_ShablonFile   : String;
       Get_TemporaryDir  : String;

   procedure Set_ShablonFile(Value    : String);
   procedure Set_TemporaryDir(Value    : String);
   procedure SetVisible(Value : Boolean);
  public
   { Public declarations }
   property Visible : Boolean read GetVisible write SetVisible default True;
   property ShablonFile   : String  read Get_ShablonFile   write Set_ShablonFile;
   property TemporaryDir  : String  read Get_TemporaryDir  write Set_TemporaryDir;
 end;

var
  DBGridToHTML : TDBGridToHTML;

implementation

uses ShellAPI, Dialogs, math;

//TDBGridToHTML
procedure TDBGridToHTML.SetVisible(Value : Boolean);
 begin
  GetVisible:=Value;
 end;

procedure TDBGridToHTML.Set_ShablonFile(Value    : String);
 begin
  Get_ShablonFile := Value;
 end;
//
procedure TDBGridToHTML.Set_TemporaryDir(Value    : String);
 begin
  Get_TemporaryDir := Value;
 end;
//Работа с Html
procedure TDBGridToHTML.DBGridToHtml(Grid : TDBGrid; TitleName : String);
 var TempFile : TStringList;
     NowDay, NowMonth, NowYear : Word;
     NowHour, NowMin, NowSec   : Word;
     NowMSec                   : Word;
     TempNameWide              : PWideChar;
     TempName                  : String;
     i                         : Integer;
 begin
  try
   //вывод отчета в html
   DecodeDate(Now, NowYear, NowMonth, NowDay);
   DecodeTime(Now, NowHour, NowMin, NowSec, NowMSec);
   TempName := ExtractFilePath(Application.ExeName) + TitleName + {IntToStr(NowHour) + '_' + IntToStr(NowMin) + '_'
             +  IntToStr(NowSec) + '__' + IntToStr(NowDay) + '_' + IntToStr(NowMonth) + '_' + IntToStr(NowYear) +} '.html';
   TempNameWide := PWideChar(TempName);
   if FileExists(TempName) then DeleteFile(TempNameWide);
   TempFile := TStringList.Create;
   try
    TempFile.Clear;
    TempFile.Add('<html>');
    TempFile.Add('<body>');
    TempFile.Add('<H2 align=center>' + TitleName +'</H2>');
    TempFile.Add('<title align=center>' + TitleName +'</title>');
    TempFile.Add('<div>');
    TempFile.Add('<table align=center border=5>');
    TempFile.Add('<tr>');
    //формирование заголовков столбцов
    for i := 0 to Grid.DataSource.DataSet.Fields.Count - 1 do
     begin
      if(Grid.DataSource.DataSet.Fields[i].Visible) then
       TempFile.Add('<td align=center>' + Grid.DataSource.DataSet.Fields[i].DisplayLabel + '</td>');
     end;
    TempFile.Add('</tr>');
    Grid.DataSource.DataSet.First;
    while not Grid.DataSource.DataSet.Eof do
     begin
      TempFile.Add('<tr>');
      for i := 0 to Grid.DataSource.DataSet.Fields.Count - 1 do
       begin
        if(Grid.DataSource.DataSet.Fields[i].Visible) then
         TempFile.Add('<td align=center>'+ Grid.DataSource.DataSet.Fields[i].AsString +'</td>');
       end;
      TempFile.Add('</tr>');
      Grid.DataSource.DataSet.Next;
     end;
    TempFile.Add('</table>');
    TempFile.Add('<br>');
    TempFile.Add('<p align=right>По состоянию на ' + DateTimeToStr(Now));
    TempFile.Add('</div>');
    TempFile.Add('</body>');
    TempFile.Add('</html>');
    try
     TempFile.SaveToFile(TempName);
    except
     MessageDlg('Ошибка записи файла. Отсутствует разрешение на запись, либо отсутствует свободное место '
              + 'для записи. Обратитесь к системному администратору.', mtError, [mbok], 0);
    end;
    try
     ShellExecute(Application.MainForm.Handle,'open',TempNameWide,nil,nil,SW_SHOWMAXIMIZED);
    except
     MessageDlg('Не удалось отобразить отчет. Не совместимая версия Internet Explorer. '
              + 'Файл отчета расположен по адресу:"' + TempName + '".', mtError, [mbok], 0);
    end;
   finally
    if Assigned(TempFile) then FreeAndNil(TempFile);
   end;
 except
 end;

 end;
//Работа с Html
procedure TDBGridToHTML.DBGridToHtmlEh(Grid : TDBGridEh; TitleName : String);
 var TempFile : TStringList;
     NowDay, NowMonth, NowYear : Word;
     NowHour, NowMin, NowSec   : Word;
     NowMSec                   : Word;
     TempNameWide              : PWideChar;
     TempName                  : String;
     i                         : Integer;
 begin
  try
   //вывод отчета в html
   DecodeDate(Now, NowYear, NowMonth, NowDay);
   DecodeTime(Now, NowHour, NowMin, NowSec, NowMSec);
   if(TemporaryDir<>'') then
    begin
     if(TemporaryDir[Length(TemporaryDir)]='\') then TempName := TemporaryDir
     else TempName := TemporaryDir + '\';
     TempName := TempName  + TitleName + {IntToStr(NowHour) + '_' + IntToStr(NowMin) + '_'
             +  IntToStr(NowSec) + '__' + IntToStr(NowDay) + '_' + IntToStr(NowMonth) + '_' + IntToStr(NowYear) +} '.html';
    end
   else
    begin
     TempName := ExtractFilePath(Application.ExeName) + TitleName + {IntToStr(NowHour) + '_' + IntToStr(NowMin) + '_'
             +  IntToStr(NowSec) + '__' + IntToStr(NowDay) + '_' + IntToStr(NowMonth) + '_' + IntToStr(NowYear) +} '.html';
    end;
   TempNameWide := PWideChar(TempName);
   if FileExists(TempName) then DeleteFile(TempNameWide);
   TempFile := TStringList.Create;
   try
    TempFile.Clear;
    TempFile.Add('<html>');
    TempFile.Add('<body>');
    TempFile.Add('<H2 align=center>' + TitleName +'</H2>');
    TempFile.Add('<title align=center>' + TitleName +'</title>');
    TempFile.Add('<div>');
    TempFile.Add('<table align=center border=5>');
    TempFile.Add('<tr>');
    //формирование заголовков столбцов
    for i := 0 to Grid.DataSource.DataSet.Fields.Count - 1 do
     begin
      if(Grid.DataSource.DataSet.Fields[i].Visible) then
       TempFile.Add('<td align=center>' + Grid.DataSource.DataSet.Fields[i].DisplayLabel + '</td>');
     end;
    TempFile.Add('</tr>');
    Grid.DataSource.DataSet.First;
    while not Grid.DataSource.DataSet.Eof do
     begin
      TempFile.Add('<tr>');
      for i := 0 to Grid.DataSource.DataSet.Fields.Count - 1 do
       begin
        if(Grid.DataSource.DataSet.Fields[i].Visible) then
         TempFile.Add('<td align=center>'+ Grid.DataSource.DataSet.Fields[i].AsString +'</td>');
       end;
      TempFile.Add('</tr>');
      Grid.DataSource.DataSet.Next;
     end;
    TempFile.Add('</table>');
    TempFile.Add('<br>');
    TempFile.Add('<p align=right>По состоянию на ' + DateTimeToStr(Now));
    TempFile.Add('</div>');
    TempFile.Add('</body>');
    TempFile.Add('</html>');
    try
     TempFile.SaveToFile(TempName);
    except
     MessageDlg('Ошибка записи файла. Отсутствует разрешение на запись, либо отсутствует свободное место '
              + 'для записи. Обратитесь к системному администратору.', mtError, [mbok], 0);
    end;
    try
     ShellExecute(Application.MainForm.Handle,'open',TempNameWide,nil,nil,SW_SHOWMAXIMIZED);
    except
     MessageDlg('Не удалось отобразить отчет. Не совместимая версия Internet Explorer. '
              + 'Файл отчета расположен по адресу:"' + TempName + '".', mtError, [mbok], 0);
    end;
   finally
    if Assigned(TempFile) then FreeAndNil(TempFile);
   end;
 except
 end;

 end;
//Работа с Html
procedure TDBGridToHTML.StringGridToExcel(Grid : TStringGrid; TitleName : String);
 var TempFile : TStringList;
     NowDay, NowMonth, NowYear : Word;
     NowHour, NowMin, NowSec   : Word;
     NowMSec                   : Word;
     TempNameWide              : PWideChar;
     TempName                  : String;
     i, j                      : Integer;
 begin
  try
   //вывод отчета в html
   DecodeDate(Now, NowYear, NowMonth, NowDay);
   DecodeTime(Now, NowHour, NowMin, NowSec, NowMSec);
   TempName := ExtractFilePath(Application.ExeName) + TitleName + {IntToStr(NowHour) + '_' + IntToStr(NowMin) + '_'
             +  IntToStr(NowSec) + '__' + IntToStr(NowDay) + '_' + IntToStr(NowMonth) + '_' + IntToStr(NowYear) +} '.html';
   TempNameWide := PWideChar(TempName);
   if FileExists(TempName) then DeleteFile(TempNameWide);
   TempFile := TStringList.Create;
   try
    TempFile.Clear;
    TempFile.Add('<html>');
    TempFile.Add('<body>');
    TempFile.Add('<H2 align=center>' + TitleName +'</H2>');
    TempFile.Add('<title align=center>' + TitleName +'</title>');
    TempFile.Add('<div>');
    TempFile.Add('<table align=center border=5>');
    TempFile.Add('<tr>');
    //формирование заголовков столбцов
    for i := 0 to Grid.ColCount do
     begin
      TempFile.Add('<td align=center>' + Grid.Cells[i,0] + '</td>');
     end;
    TempFile.Add('</tr>');
    for j := 1 to Grid.RowCount do
     begin
      TempFile.Add('<tr>');
      for i := 0 to Grid.ColCount do
       begin
        TempFile.Add('<td align=center>'+ Grid.Cells[i,j] +'</td>');
       end;
      TempFile.Add('</tr>');
     end;
    TempFile.Add('</table>');
    TempFile.Add('<br>');
    TempFile.Add('<p align=right>По состоянию на ' + DateTimeToStr(Now));
    TempFile.Add('</div>');
    TempFile.Add('</body>');
    TempFile.Add('</html>');
    try
     TempFile.SaveToFile(TempName);
    except
     MessageDlg('Ошибка записи файла. Отсутствует разрешение на запись, либо отсутствует свободное место '
              + 'для записи. Обратитесь к системному администратору.', mtError, [mbok], 0);
    end;
    try
     ShellExecute(Application.MainForm.Handle,'open',TempNameWide,nil,nil,SW_SHOWMAXIMIZED);
    except
     MessageDlg('Не удалось отобразить отчет. Не совместимая версия Internet Explorer. '
              + 'Файл отчета расположен по адресу:"' + TempName + '".', mtError, [mbok], 0);
    end;
   finally
    if Assigned(TempFile) then FreeAndNil(TempFile);
   end;
 except
 end;

 end;




end.
