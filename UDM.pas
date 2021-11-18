unit UDM;

interface

uses
  SysUtils, Classes, uADGUIxIntf, uADGUIxFormsWait, uADStanIntf, uADStanOption,
  uADStanError, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager, DB,
  uADCompDataSet, uADCompClient, uADCompGUIx, uADPhysPG, uADPhysODBCBase,
  uADPhysODBC;

type
  TDM1 = class(TDataModule)
    ADPhysODBCDriverLink1: TADPhysODBCDriverLink;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADCInformix: TADConnection;
    ADCPostgre: TADConnection;
    ADQSel: TADQuery;
    ADQDel: TADQuery;
    q: TADQuery;
    procedure ADCInformixAfterConnect(Sender: TObject);
    procedure ADCPostgreAfterConnect(Sender: TObject);
  private
    { Private declarations }
    function SetConnection(Value : TADConnection) : Boolean;
  public
    { Public declarations }
   function TestColumnInDBTable(ValueTab : String; ValueCol : String) : Boolean;
   function TestTableInDB(Value : String) : Boolean;
   function CountTableInDB(Value : String) : Integer;
   function MaxValueDB(QField : AnsiString; QTable : AnsiString; QSQLtexts : AnsiString; Qtemp : TADQuery) : Integer;
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}
  function TDM1.SetConnection(Value : TADConnection) : Boolean;
  var i : Integer;
  begin
    try
      for i := 0 to DM1.ComponentCount - 1 do
      begin
        if (DM1.Components[i] IS TADQuery) then (DM1.Components[i] AS TADQuery).Connection:= Value;
      end;
      Result := True;
    except
      Result := False;
    end;
  end;

  function TDM1.TestColumnInDBTable(ValueTab : String; ValueCol : String) : Boolean;
  begin
    try
      with ADQSel do
      begin
        if(Active) then Close;
        SQL.Clear;
        if(Connection = ADCPostgre) then
        begin
          SQL.Add('SELECT syst.Column_Name FROM INFORMATION_SCHEMA.COLUMNS syst ');
          SQL.Add('WHERE syst.Table_Name =:tabname AND syst.tabColumn_Name =:columnname ');
        end
        else
        begin
          SQL.Add('SELECT sysc.colname FROM syscolumns sysc ');
          SQL.Add('LEFT OUTER JOIN systables syst ON sysc.tabid=syst.tabid ');
          SQL.Add('WHERE syst.tabname=:tabname AND sysc.colname=:columnname ');
        end;
        ParamByName('tabname').ParamType := ptInput;
        ParamByName('tabname').DataType := ftString;
        ParamByName('tabname').ArrayType := atScalar;
        ParamByName('tabname').AsString := ValueTab;
        ParamByName('columnname').ParamType := ptInput;
        ParamByName('columnname').DataType := ftString;
        ParamByName('columnname').ArrayType := atScalar;
        ParamByName('columnname').AsString := ValueCol;
        Open;

        if(IsEmpty) then Result := False
        else Result := True;
        Close;
      end;
    except
      ADQSel.Close;
      Result := False;
    end;
  end;

  function TDM1.TestTableInDB(Value : String) : Boolean;
  begin
    try
      if(Value <> '') then
      begin
        with ADQSel do
        begin
          if(Active) then Close;
          SQL.Clear;
          if(Connection=ADCPostgre) then
          begin
            SQL.Add('SELECT tablename AS TableName FROM pg_tables WHERE tablename = :tablename ');
          end
          else
          begin
            SQL.Add('SELECT tabname AS TableName FROM systables WHERE tabname = :tablename ');
          end;
          ParamByName('tablename').ParamType := ptInput;
          ParamByName('tablename').DataType  := ftString;
          ParamByName('tablename').ArrayType := atScalar;
          ParamByName('tablename').AsString  := Value;
          Open;

          if(IsEmpty) then Result := False
          else Result := True;
          Close;
        end;
      end
      else Result := False;
    except
      ADQSel.Close;
      Result := False;
    end;
  end;

procedure TDM1.ADCInformixAfterConnect(Sender: TObject);
begin
  SetConnection(ADCInformix);
end;

procedure TDM1.ADCPostgreAfterConnect(Sender: TObject);
begin
  SetConnection(ADCPostgre);
end;

function TDM1.CountTableInDB(Value : String) : Integer;
  begin
    try
      if(Value <> '') then
      begin
        with ADQSel do
        begin
          if(Active) then Close;
          SQL.Clear;
          if(Connection=DM1.ADCPostgre) then
          begin
            SQL.Add('SELECT COUNT(*) as CountTables FROM pg_tables WHERE tablename = :tablename ');
          end
          else
          begin
            SQL.Add('SELECT COUNT(*) as CountTables FROM systables WHERE tabname = :tablename ');
          end;
          ParamByName('tablename').ParamType := ptInput;
          ParamByName('tablename').DataType  := ftString;
          ParamByName('tablename').ArrayType := atScalar;
          ParamByName('tablename').AsString  := Value;
          Open;

          if(IsEmpty) then Result := 0
          else Result := FieldByName('CountTables').AsInteger;
        end;
      end
      else Result := 0;
    except
      ADQSel.Close;
      Result := -1;
    end;
  end;

function TDM1.MaxValueDB(QField : AnsiString; QTable : AnsiString; QSQLtexts : AnsiString; Qtemp : TADQuery) : Integer;
  begin
   try
    with Qtemp do
     begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(' + String(QField + AnsiString(') FROM ') + QTable + AnsiString(' ') + QSQLtexts));
      Open;
      if IsEmpty then Result := 0
      else Result := Fields[0].AsInteger;
      Close;
      SQL.Clear;
     end;
   except
    Result := 0;
   end;
  end;

end.
