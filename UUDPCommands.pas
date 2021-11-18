unit UUDPCommands;

interface

 uses SysUtils;
 //������ �������, ������������ ����� ����
 type TUDPCommand = record
  Number   : Integer;  //����� �������
  Text     : String;   //����� �������
  TimeCode : TDateTime;//���� ��� �������
  Adressee : Integer;  //������� �������
  Sender   : Integer;  //����������� �������
  Error    : Integer;  //��������� ������
 end;
 //����������� ������ S ���� "String" � ������� ������ Bytes ���� "TBytes"
 procedure AppendStringToBuffer(var Bytes: TBytes; const S: String);
 //���������� ������ S ���� "String" �� ������� ������ Bytes ���� "TBytes"
 function ReadStringFromBuffer(const Bytes: TBytes; var Index: Integer): String;
 //�������������� ������ SendRecord ���� "TUDPCommand" � ������ ������ SendBuf ���� "TBytes"
 function EncryptRecToBuf(var SendBuf: TBytes; const SendRecord : TUDPCommand) : Boolean;
 //�������������� ������� ������ SendBuf ���� "TBytes" � ������ SendRecord ���� "TUDPCommand"
 function DecryptBufToRec(var SendRecord : TUDPCommand; const SendBuf: TBytes) : Boolean;

 const
  cAdresseeIsService     = 1;//������� - ������
  cAdresseeIsApplication = 2;//������� - ����������
  cSenderIsService     = 1;//����������� - ������
  cSenderIsApplication = 2;//����������� - ����������
  cErrorNoError     = 0; //��� ������
  cErrorCritical    = 1; //����������� ������
  cErrorLostConnect = 2; //�������� ���������� � ��
  cErrorNotCritical = 3; //������������� ������
  cErrorNotReady    = 4; //������ ������������ � ������ ������
  cErrorPaused      = 5; //������ - ������ ��������������
  cErrorStoped      = 6; //������ - ������ �����������
  cCommandStatus  = 1; //������� �� ������ ������� �������
  cCommandRun     = 2; //������� �� ������ �������
  cCommandStop    = 3; //������� �� ��������� �������
  cCommandResume  = 4; //������� �� ����������� ������ �������
  cCommandPause   = 5; //������� �� ������������ �������
  cCommandLoad    = 6; //������� �� �������� ����� ������
  cCommandLog     = 7; //������� �� ���������� ���� ������ � �����
  cCommandInit    = 8; //������� �� �������������
  cCommandNewForm = 9; //��������� ����� ��

  cConnectTime = 1000; //����� ����������� � ��;

implementation

 uses IdGlobal;
//�������������� ������ SendRecord ���� "TUDPCommand" � ������ ������ SendBuf ���� "TBytes"
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
//�������������� ������� ������ SendBuf ���� "TBytes" � ������ SendRecord ���� "TUDPCommand"
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
//����������� ������ S ���� "String" � ������� ������ Bytes ���� "TBytes"
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
//���������� ������ S ���� "String" �� ������� ������ Bytes ���� "TBytes"
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
