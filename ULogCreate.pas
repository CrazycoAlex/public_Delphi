unit ULogCreate;
//����� ����(��������������� ���������� ���������� ���������� � ���� ��� ��������)
//
//�����������: ������ �.�.
//
interface

 uses StdCtrls{TMemo},Classes{TComponent};

 const DefFileName='Log';

 //����� ����(��������������� ���������� ���������� ���������� � ���� ��� ��������)
 type TMLog=class(TStringList)
  private
   GetAutoSave : Boolean;
   GetFileName : String;
   //F1 : Text;
   procedure SetAutoSave(Value : Boolean);
   //��������� ����������� ��������, � �������� ���������� ������������ ����� ����
   procedure SetFileName(Value : String);
  public
   FilePath : String;
   //����������� ������
   constructor Create;
   //���������� ������
   destructor Destroy; override;
   //��������, � �������� ���������� ������������ ����� ����
   property FileName : String read GetFileName write SetFileName;
   //�������������� ���������� ���� � ���� ��� ����������� �������
   property AutoSave : Boolean read GetAutoSave write SetAutoSave;
   //��������� ������ ���� � ����
   procedure SaveLog;
   //������� �������� �� ������������� ����� � ��������� ���������
   function CheckFileName(FileName : String) : String;
   //������� ������ ������ � ���
   function ToLog(Value : String) : Boolean;
 end;

implementation

uses SYSUtils{ExtractFilePath,FileExists,IntToStr}, DateUtils{Dayof,MonthOf,YearOf}, Forms{Application},SvcMgr;

//����������� ������
constructor TMLog.Create;
 begin
  inherited Create;

  GetAutoSave := True;

  if(Application is TServiceApplication) then FilePath := 'C:\Tmp'
  else FilePath := ExtractFilePath(Forms.Application.ExeName);
 end;

 //���������� ������
destructor TMLog.Destroy;
 begin
  if(GetAutoSave) then SaveLog;
  inherited Destroy;
 end;

procedure TMLog.SetAutoSave(Value : Boolean);
begin
  GetAutoSave := Value;
end;

//��������� ����������� ��������, � �������� ���������� ������������ ����� ����
procedure TMLog.SetFileName(Value : String);
 begin
  GetFileName := Value;
 end;

 //������ ���� � ����
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
   //Lines.SaveToFile(CheckFileName(FileName));//��� TMemo
   SaveToFile(CheckFileName(FileName));//��� TStringList
  except
   raise Exception.Create('������ ������ ���� ��������� � ����(�������� �����:"' + FileName
                          + '"). �������� ����������� ����� �� ������. ���������� � ���������� �������������� ������ �������.');
  end;
 end;
//�������� �� ������������� ����� � ��������� ���������
//���������� ������������ �������� �����, �������� �� ���������� � ��������� ����������
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

 //������� ������ ������ � ���
function TMLog.ToLog(Value : String) : Boolean;
 begin
  try
   //Lines.Add(DateTimeToStr(now) + ': ' + Value);//��� TMemo
   Add(DateTimeToStr(now) + ': ' + Value); //��� TStringList
   ToLog := True;
  except
   ToLog := False;
  end;
 end;

end.

