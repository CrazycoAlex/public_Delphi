unit ULogCreate;
//класс лога(самостоятельное сохранение записанной информации в файл при удалении)
//
//разработчик: Куреев А.В.
//
interface

 uses StdCtrls{TMemo},Classes{TComponent};

 const DefFileName='Log';

 //класс лога(самостоятельное сохранение записанной информации в файл при удалении)
 type TMLog=class(TStringList)
  private
   GetAutoSave : Boolean;
   GetFileName : String;
   //F1 : Text;
   procedure SetAutoSave(Value : Boolean);
   //процедура определения названия, с которого начинается наименование файла лога
   procedure SetFileName(Value : String);
  public
   FilePath : String;
   //конструктор класса
   constructor Create;
   //деструктор класса
   destructor Destroy; override;
   //название, с которого начинается наименование файла лога
   property FileName : String read GetFileName write SetFileName;
   //автоматическое сохранение лога в файл при уничтожении объекта
   property AutoSave : Boolean read GetAutoSave write SetAutoSave;
   //процедура записи лога в файл
   procedure SaveLog;
   //функция проверки на существование файла с указанным названием
   function CheckFileName(FileName : String) : String;
   //функция записи строки в лог
   function ToLog(Value : String) : Boolean;
 end;

implementation

uses SYSUtils{ExtractFilePath,FileExists,IntToStr}, DateUtils{Dayof,MonthOf,YearOf}, Forms{Application},SvcMgr;

//конструктор класса
constructor TMLog.Create;
 begin
  inherited Create;

  GetAutoSave := True;

  if(Application is TServiceApplication) then FilePath := 'C:\Tmp'
  else FilePath := ExtractFilePath(Forms.Application.ExeName);
 end;

 //деструктор класса
destructor TMLog.Destroy;
 begin
  if(GetAutoSave) then SaveLog;
  inherited Destroy;
 end;

procedure TMLog.SetAutoSave(Value : Boolean);
begin
  GetAutoSave := Value;
end;

//процедура определения названия, с которого начинается наименование файла лога
procedure TMLog.SetFileName(Value : String);
 begin
  GetFileName := Value;
 end;

 //Запись лога в файл
procedure TMLog.SaveLog;
  var TempDate : TDateTime;
      FileName : String;
 begin
  if(NOT DirectoryExists(FilePath + '\Logs')) then ForceDirectories(FilePath + '\Logs');
  try
   TempDate := Now;
   FileName := FilePath + '\Logs\' + GetFileName + '_' + IntToStr(Dayof(TempDate)) + '_'
                                          + IntToStr(MonthOf(TempDate)) + '_'
                                          + IntToStr(YearOf(TempDate)) + '.txt';
   //Lines.SaveToFile(CheckFileName(FileName));//для TMemo
   SaveToFile(CheckFileName(FileName));//для TStringList
  except
   raise Exception.Create('Ошибка записи лога программы в файл(название файла:"' + FileName
                          + '"). Возможно отсутствуют права на запись. Обратитесь к системному администратору Вашего объекта.');
  end;
 end;
//проверка на существование файла с указанным названием
//возвращает предлагаемое название файла, которого не существует в указанной директории
function TMLog.CheckFileName(FileName : String) : String;
  var i,j : Integer;
      TempFileName : String;
      TempExtention: String;
      TempName     : String;
 begin
  if(FileExists(FileName)) then
   begin
    TempExtention := '';
    for I := Length(FileName) downto 1 do
     if FileName[i]='.' then
      begin
       for j := 1 to i - 1 do TempName := TempName + FileName[j];
       for j := i to Length(FileName) do TempExtention := TempExtention + FileName[j];
       break;
      end;

    for i := 1 to 2147483646 do
     begin
      TempFileName := TempName + '~' + IntToStr(i) + TempExtention;
      if(NOT FileExists(TempFileName)) then
       begin
        CheckFileName := TempFileName;
        break;
       end;
     end;
   end
  else CheckFileName := FileName;
 end;

 //функция записи строки в лог
function TMLog.ToLog(Value : String) : Boolean;
 begin
  try
   //Lines.Add(DateTimeToStr(now) + ': ' + Value);//для TMemo
   Add(DateTimeToStr(now) + ': ' + Value); //для TStringList
   ToLog := True;
  except
   ToLog := False;
  end;
 end;

end.

