unit UUDPCommands;

interface

 uses SysUtils;
 //запись команды, передоваемой через порт
 type TUDPCommand = record
  Number   : Integer;  //номер команды
  Text     : String;   //текст команды
  TimeCode : TDateTime;//тайм код команды
  Adressee : Integer;  //адресат команды
  Sender   : Integer;  //отправитель команды
  Error    : Integer;  //индикатор ошибки
 end;
 //прибавление строки S типа "String" к массиву байтов Bytes типа "TBytes"
 procedure AppendStringToBuffer(var Bytes: TBytes; const S: String);
 //извлечение строки S типа "String" из массива байтов Bytes типа "TBytes"
 function ReadStringFromBuffer(const Bytes: TBytes; var Index: Integer): String;
 //преобразование записи SendRecord типа "TUDPCommand" в массив байтов SendBuf типа "TBytes"
 function EncryptRecToBuf(var SendBuf: TBytes; const SendRecord : TUDPCommand) : Boolean;
 //преобразование массива байтов SendBuf типа "TBytes" в запись SendRecord типа "TUDPCommand"
 function DecryptBufToRec(var SendRecord : TUDPCommand; const SendBuf: TBytes) : Boolean;

 const
  cAdresseeIsService     = 1;//Адресат - служба
  cAdresseeIsApplication = 2;//Адресат - приложение
  cSenderIsService     = 1;//Отправитель - служба
  cSenderIsApplication = 2;//Отправитель - приложение
  cErrorNoError     = 0; //Нет ошибок
  cErrorCritical    = 1; //Критическая ошибка
  cErrorLostConnect = 2; //Потеряно соединение с БД
  cErrorNotCritical = 3; //Некритическая ошибка
  cErrorNotReady    = 4; //Ошибка неготовности к приему команд
  cErrorPaused      = 5; //Ошибка - служба приостановлена
  cErrorStoped      = 6; //Ошибка - служба остановлена
  cCommandStatus  = 1; //Команда на выдачу статуса сервиса
  cCommandRun     = 2; //Команда на запуск сервиса
  cCommandStop    = 3; //Команда на остановку сервиса
  cCommandResume  = 4; //Команда на продолжение работы сервиса
  cCommandPause   = 5; //Команда на приостановку сервиса
  cCommandLoad    = 6; //Команда на загрузку новых правил
  cCommandLog     = 7; //Команда на сохранение лога работы в файле
  cCommandInit    = 8; //Команда на инициализацию
  cCommandNewForm = 9; //Получение новой ФО

  cConnectTime = 1000; //время подключения к БД;

implementation

 uses IdGlobal;
//преобразование записи SendRecord типа "TUDPCommand" в массив байтов SendBuf типа "TBytes"
 function EncryptRecToBuf(var SendBuf: TBytes; const SendRecord : TUDPCommand) : Boolean;
  begin
   try
    AppendStringToBuffer(SendBuf, IntToStr(SendRecord.Number));
    AppendStringToBuffer(SendBuf, SendRecord.Text);
    AppendStringToBuffer(SendBuf, DateTimeToStr(SendRecord.TimeCode));
    AppendStringToBuffer(SendBuf, IntToStr(SendRecord.Sender));
    AppendStringToBuffer(SendBuf, IntToStr(SendRecord.Adressee));
    AppendStringToBuffer(SendBuf, IntToStr(SendRecord.Error));
    Result := True;
   except
    Result := False;
   end;
  end;
//преобразование массива байтов SendBuf типа "TBytes" в запись SendRecord типа "TUDPCommand"
 function DecryptBufToRec(var SendRecord : TUDPCommand; const SendBuf: TBytes) : Boolean;
  var Index : Integer;
  begin
   try
    Index := 0;
    SendRecord.Number   := StrToInt(ReadStringFromBuffer(SendBuf, Index));
    SendRecord.Text     := ReadStringFromBuffer(SendBuf, Index);
    SendRecord.TimeCode := StrToDateTime(ReadStringFromBuffer(SendBuf, Index));
    SendRecord.Sender   := StrToInt(ReadStringFromBuffer(SendBuf, Index));
    SendRecord.Adressee := StrToInt(ReadStringFromBuffer(SendBuf, Index));
    SendRecord.Error    := StrToInt(ReadStringFromBuffer(SendBuf, Index));
    Result := True;
   except
    try
     Index := 0;
     SendRecord.Number   := StrToInt(ReadStringFromBuffer(SendBuf, Index));
     SendRecord.Text     := ReadStringFromBuffer(SendBuf, Index);
     SendRecord.TimeCode := StrToDateTime(ReadStringFromBuffer(SendBuf, Index));
     SendRecord.Sender   := cSenderIsService;
     SendRecord.Adressee := StrToInt(ReadStringFromBuffer(SendBuf, Index));
     SendRecord.Error    := StrToInt(ReadStringFromBuffer(SendBuf, Index));
     Result := True;
    except
     Result := False;
    end;
   end;
  end;
//прибавление строки S типа "String" к массиву байтов Bytes типа "TBytes"
 procedure AppendStringToBuffer(var Bytes: TBytes; const S: String);
  var
   Tmp: TBytes;
   Len: Byte;
  begin
   Tmp := ToBytes(S, enUTF8);
   Len := Length(Tmp);
   AppendByte(Bytes, Len);
   AppendBytes(Bytes, Tmp);
  end;
//извлечение строки S типа "String" из массива байтов Bytes типа "TBytes"
 function ReadStringFromBuffer(const Bytes: TBytes; var Index: Integer): String;
  var
   Len: Integer;
  begin
   Len := Bytes[Index];
   Inc(Index);
   if Len > 0 then
    begin
     Result := BytesToString(Bytes, Index, Len, enUTF8);
     Inc(Index, Len);
    end
   else
    Result := '';
  end;

end.
