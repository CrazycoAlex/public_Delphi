unit UnitConnector;

interface

uses
  SysUtils, uADCompClient, uADStanOption, uADStanIntf, USetAppParams, UnitParamReading;

type
 TConnector=class
  private

   procedure SetUserName(Value: String);
   procedure SetPassword(Value: String);
   procedure SetAlias(Value: String);
   procedure SetServer(Value: String);
   procedure SetPort(Value: String);
   procedure SetDataBase(Value: String);
   procedure SetCharacterSet(Value: String);
   procedure SetUnknownFormat(Value: String);
   procedure SetMetaDefSchema(Value: String);
   procedure SetDriver(Value: Integer);
   procedure SetDataMappingRules(Value : Integer);
   const
    DriverNames : array [0..1] of String = (('ODBC'),('PG'));
   var
    fDriverName  : String;
    fAlias       : String;
    fUserName    : String;
    fPassword    : String;
    fServer      : String;
    fPort        : String;
    fCharacterSet: String;
    fDataBase    : String;
    fUnknownFormat:String;
    fMetaDefSchema:String;
    fErrorText   : String;
    fDriver      : Integer;
    GetDataMappingRules : Integer;
    fIsConnected : boolean;
  public
   constructor Create; overload;

   function Connect(var ValueDatabase:TADConnection) : Boolean;
   function Initialize(vAppParams : TApplicationParams) : Boolean; overload;
   function Initialize(vAppParams : TParamDataReader) : Boolean; overload;

   //����� ������������
   property UserName      : String  read fUserName        write SetUserName;
   //������ ������������
   property Password      : String  read fPassword        write SetPassword;
   //��������� ��
   property Alias         : String  read fAlias           write SetAlias;
   //�������� ��������
   property DriverName    : String  read fDriverName;
   //IP ����� ������� ��
   property Server        : String  read fServer          write SetServer;
   //���� ������� ��
   property Port          : String  read fPort            write SetPort;
   //���������
   property CharacterSet  : String  read fCharacterSet    write SetCharacterSet;
   //�������� �� �� ������� ��
   property DataBase      : String  read fDataBase        write SetDataBase;
   //������������� ������������ �������
   property UnknownFormat : String  read fUnknownFormat   write SetUnknownFormat;
   //�������� ����� ����������
   property MetaDefSchema : String  read fMetaDefSchema   write SetMetaDefSchema;
   //������� �� (�������� - 0: ODBC Informix, 1: Postgree; �� ��������� - 0)
   property Driver        : Integer read fDriver          write SetDriver        default 0;
   //������
   property ErrorText     : String  read fErrorText;
   //���������� � ��?
   property IsConnected   : Boolean read fIsConnected;
    //������� �������������� ����� ������ (��������: 0 - ���������, 1 - ��������)
   property DataMappingRules : Integer read GetDataMappingRules write SetDataMappingRules;

   var IsInformix : Boolean;
 end;

 const
  ErrorDBConnect='������ ����������� � ���� ������. ��������� ��������� �������(usu,pwu,dru,alu,usc,pwc,drc,alc)';
  DescriptionParamDriver  = 'DriverID=';
  DescriptionParamAlias   = 'DataSource=';
  DescriptionParamUserName= 'User_name=';
  DescriptionParamPassword= 'Password=';
  DescriptionParamServer  = 'Server=';
  DescriptionParamPort    = 'Port=';
  DescriptionParamDataBase= 'Database=';
  DescriptionParamCharacterSet='CharacterSet=';
  DescriptionParamUnknownFormat='UnknownFormat=';
  DescriptionParamMetaDefSchema='MetaDefSchema=';
{ TConnector }
implementation

//����������� ������
constructor TConnector.Create;
begin
 inherited Create;
 fIsConnected := False;
 fDriver      := 0;
 fDriverName  := '';
 fAlias       := '';
 fServer      := '';
 fPort        := '';
 fCharacterSet:= '';
 fDataBase    := '';
 fUnknownFormat:= '';
 fMetaDefSchema:= '';
 fErrorText := '';
end;

//���������� ������ ������������
procedure TConnector.SetUserName(Value: String);
begin
 if(Value<>'') then fUserName:=Value;
end;

//���������� ������ ������������
procedure TConnector.SetPassword(Value: String);
begin
 if(Value<>'') then fPassword:=Value;
end;

//���������� ���������� ��
procedure TConnector.SetAlias(Value: String);
begin
 fAlias:=Value;
end;

//���������� �������� ��
procedure TConnector.SetDriver(Value: Integer);
begin
 if(Value>=0) then
  begin
   fDriver:=Value;
   fDriverName:= DriverNames[Value];
  end;
end;

//���������� ������� �������������� ����� ������
procedure TConnector.SetDataMappingRules(Value : Integer);
 begin
  GetDataMappingRules := Value;
 end;

//���������� �������� ������� ��
procedure TConnector.SetServer(Value: String);
begin
 if(Value<>'') then fServer:=Value;
end;

//���������� ����� ����� � ��
procedure TConnector.SetPort(Value: String);
begin
 if(Value<>'') then fPort:=Value;
end;

//���������� ��������� ��
procedure TConnector.SetCharacterSet(Value: String);
begin
 if(Value<>'') then fCharacterSet:=Value;
end;

//���������� �������� �� �� ������� ��
procedure TConnector.SetDataBase(Value: String);
begin
 if(Value<>'') then fDataBase:=Value;
end;

//���������� ������������� ������������ �������
procedure TConnector.SetUnknownFormat(Value: String);
begin
 if(Value<>'') then fUnknownFormat:=Value;
end;

//���������� �������� ����� ����������
procedure TConnector.SetMetaDefSchema(Value: String);
begin
 if(Value<>'') then fMetaDefSchema:=Value;
end;

//
function TConnector.Connect(var ValueDatabase : TADConnection) : Boolean;
var i : Integer;
begin
 try
  ValueDatabase.Close;
  ValueDatabase.Params.Clear;

  try
   if(fDriver = 0) then
    begin
     ValueDatabase.Params.Add(Trim(DescriptionParamAlias+fAlias));
     ValueDatabase.Params.Add(Trim(DescriptionParamDriver+fDriverName));
     ValueDatabase.Params.Add(Trim(DescriptionParamUserName+fUserName));
     ValueDatabase.Params.Add(Trim(DescriptionParamPassword+fPassword));
    end
   else
    begin
     if(fAlias<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamAlias+fAlias));
     if(fDriverName<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamDriver+fDriverName));
     if(fServer<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamServer+fServer));
     if(fPort<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamPort+fPort));
     if(fDataBase<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamDataBase+fDataBase));
     if(fCharacterSet<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamCharacterSet+fCharacterSet));
     if(fUnknownFormat<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamUnknownFormat+fUnknownFormat));
     if(fMetaDefSchema<>'') then ValueDatabase.Params.Add(Trim(DescriptionParamMetaDefSchema+fMetaDefSchema));
     ValueDatabase.Params.Add(Trim(DescriptionParamUserName+fUserName));
     ValueDatabase.Params.Add(Trim(DescriptionParamPassword+fPassword));
    end;
  except
   On E : Exception do
    begin
     fErrorText := fErrorText + #13 + #10 + E.Message;
    end;
  end;

  if((IsInformix)AND(GetDataMappingRules = 1)) then
  begin
    with ValueDatabase do
    begin
      try
        FetchOptions.AssignedValues := [evCache];
        FetchOptions.Cache := [fiBlobs,fiDetails];        FormatOptions.AssignedValues :=[fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale];        FormatOptions.OwnMapRules := True;
      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;

      try
        FormatOptions.MapRules.Clear;
        with FormatOptions.MapRules.Add() DO
        begin
          SourceDataType := dtBCD;
          TargetDataType := dtDouble;        end;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;
      try        with FormatOptions.MapRules.Add() DO
        begin
          SourceDataType := dtInt64;
          TargetDataType := dtDouble;        end;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;
      try        with FormatOptions.MapRules.Add() DO
        begin
          SourceDataType := dtDateTimeStamp;          TargetDataType := dtDateTime;        end;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;

      try
        with FormatOptions.MapRules.Add() DO
        begin
          SourceDataType := dtByte;
          TargetDataType := dtInt16;        end;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;

      try
        with ValueDatabase.FormatOptions.MapRules.Add() DO
        begin
          SourceDataType := dtGUID;
          TargetDataType := dtByteString;        end;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;
      try        FormatOptions.MaxBcdPrecision :=2147483647;
        FormatOptions.MaxBcdScale := 2147483647;      except
        On E : Exception do
        begin
          fErrorText := fErrorText + #13 + #10 + E.Message;
        end;
      end;
    end;
  end;

  try
    ValueDatabase.Connected := True;
  except
    On E : Exception do
    begin
      fErrorText := fErrorText + #13 + #10 + E.Message;
    end;
  end;

  if(ValueDatabase.Connected) then
  begin
    fIsConnected := True;
  end
  else
  begin
    fIsConnected := False;
    fErrorText := fErrorText + #13 + #10 + '��������� �����������:';
    for i := 0 to ValueDatabase.Params.Count - 1 do
    begin
      fErrorText := fErrorText + #13 + #10 + ValueDatabase.Params[i];
    end;
  end;

  Result := fIsConnected;
 except
  Result := False;

  fErrorText := fErrorText + #13 + #10 + ErrorDBConnect + '(��������� �����������: ';
  fErrorText := fErrorText + ValueDatabase.Params.Text + ', ';

  for i := 0 to  ValueDatabase.Params.Count - 1 do fErrorText := fErrorText + ValueDatabase.Params[i] + ', ';
  fErrorText := fErrorText + ')'+ #13 + #10;
 end;
end;

function TConnector.Initialize(vAppParams : TApplicationParams) : Boolean;
 begin
  try
   fIsConnected := False;
   fDriver      := vAppParams.TypeSQLUDB;
   fDriverName  := DriverNames[vAppParams.TypeSQLUDB];
   fAlias       := vAppParams.AliasUDB;
   fUserName    := vAppParams.UserNameUDB;
   fPassword    := vAppParams.PasswordUDB;
   //��� postgre
   {fServer      := '192.168.2.180';
   fPort        := '5432';
   fCharacterSet:= 'WIN1251';
   fDataBase    := 'test2_global3';
   fUnknownFormat:= 'BYTEA';
   fMetaDefSchema:= 'metadata';}
   result := True;
  except
   result := False
  end;
 end;

function TConnector.Initialize(vAppParams : TParamDataReader) : Boolean;
 begin
  try
   fIsConnected := False;
   fDriver      := vAppParams.DriverUDB;
   fDriverName  := DriverNames[vAppParams.DriverUDB];
   fAlias       := vAppParams.AliasUDB;
   fUserName    := vAppParams.UserNameUDB;
   fPassword    := vAppParams.PasswordUDB;
   result := True;
  except
   result := False
  end;
 end;

end.
