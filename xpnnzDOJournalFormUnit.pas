unit xpnnzDOJournalFormUnit;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  xpFormUnit, AdvGlowButton, ExtCtrls, cxGraphics, cxControls, cxContainer,
  cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, ImgList, cxCustomData,
  cxStyles,
  cxTL, cxInplaceContainer, xpTreeListUnit, cxCalendar, DB, nnzDBClient,
  Menus, xpDesignAgentUnit, DateUtils, cxLookAndFeels, cxLookAndFeelPainters,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinsDefaultPainters, cxCheckComboBox,
  cxLabel, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, ComCtrls, cxCheckBox, cxImage, cxSplitter,
  cxMemo, cxButtonEdit, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver;

type
  TnnzJournalCellInfo = record
    isAllowTicher: Boolean;
    isChangeComments: Boolean;
    isOut: Boolean;
    isHoliday_with_nocarry: Boolean;
    isHoliday_with_carry: Boolean;
    // Edited              : Boolean;
    cancel_predmet: Boolean;
    LessonDate: TDateTime;
    GradeMid: Integer;
    GradeDate: TDateTime;
    GradeComment: string;
    // комментарий к оценке (раньше сидел в невидимой Column2)
  end;

  PnnzJournalCellInfo = ^TnnzJournalCellInfo;

  TxpnnzDOJournalForm = class(TxpForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CancelButton: TAdvGlowButton;
    ImageList: TImageList;
    PrintButton: TAdvGlowButton;
    OkButton: TAdvGlowButton;
    Grid: TxpTreeList;
    StudentColumn: TcxTreeListColumn;
    Panel3: TPanel;
    TeacherLabel: TLabel;
    Trimestr1Column: TcxTreeListColumn;
    Exam1Column: TcxTreeListColumn;
    Itog1Column: TcxTreeListColumn;
    AdvGlowButton1: TAdvGlowButton;
    cxStyleRepository1: TcxStyleRepository;
    cxDZStyle: TcxStyle;
    RefreshButton: TAdvGlowButton;
    AVGColumn: TcxTreeListColumn;
    AdvGlowButton2: TAdvGlowButton;
    SaveDialog: TSaveDialog;
    NumColumn: TcxTreeListColumn;
    lblPrepod: TLabel;
    PopupMenu1: TPopupMenu;
    Panel4: TPanel;
    ClassNameEdit: TcxComboBox;
    PredmetEdit: TcxComboBox;
    TrimestrEdit: TcxComboBox;
    BegDateEdit: TcxDateEdit;
    YearEdit: TcxComboBox;
    Label19: TLabel;
    JournalRadioButton2: TRadioButton;
    JournalOnDate: TRadioButton;
    PenEditButton: TAdvGlowButton;
    BandStyle: TcxStyle;
    ClassNameColumn: TcxTreeListColumn;
    Trimestr2Column: TcxTreeListColumn;
    Exam2Column: TcxTreeListColumn;
    Itog2Column: TcxTreeListColumn;
    YearExamColumn: TcxTreeListColumn;
    Trimestr3Column: TcxTreeListColumn;
    Exam3Column: TcxTreeListColumn;
    Itog3Column: TcxTreeListColumn;
    YearTotalColumn: TcxTreeListColumn;
    Trimestr4Column: TcxTreeListColumn;
    Exam4Column: TcxTreeListColumn;
    Itog4Column: TcxTreeListColumn;
    YearColumn: TcxTreeListColumn;
    chkVisibleItog: TcxCheckComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    pnlShModFact: TPanel;
    cxGridRightPart: TxpTreeList;
    PassedColumn: TcxTreeListColumn;
    GrpFactColumn: TcxTreeListColumn;
    EvTypeColumn: TcxTreeListColumn;
    EvDateColumn: TcxTreeListColumn;
    ShModFactColumn: TcxTreeListColumn;
    HWColumn: TcxTreeListColumn;
    TeacherCommentColumn: TcxTreeListColumn;
    cxSplitter1: TcxSplitter;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PredmetEditPropertiesChange(Sender: TObject);
    procedure PrevButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GridEdited(Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn);
    procedure GridDblClick(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure GridEditing(Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RefreshButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure YearEditPropertiesChange(Sender: TObject);
    procedure GridEditValueChanged(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn);
    procedure PenEditButtonClick(Sender: TObject);
    procedure TrimestrEditPropertiesChange(Sender: TObject);
    procedure GridCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure GridCustomDrawHeaderCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListHeaderCellViewInfo;
      var ADone: Boolean);
    procedure BegDateEditPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridInitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
    procedure ClassNameEditPropertiesChange(Sender: TObject);
    procedure chkVisibleItogPropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
    procedure GridDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridRightPartCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxGridRightPartDblClick(Sender: TObject);
    procedure cxGridRightPartDeletion(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode);
    procedure cxGridRightPartEditing(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure cxGridRightPartEditValueChanged(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn);
    procedure cxGridRightPartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PassedColumnPropertiesChange(Sender: TObject);
    procedure GridFocusedColumnChanged(Sender: TcxCustomTreeList;
      APrevFocusedColumn, AFocusedColumn: TcxTreeListColumn);
  private
    FOutOfDate: String;
    FLockCurrentDays,
    FLockTermDays: string;
    DateLockCurrent,
    DateLockTerm: TDateTime;
    Query: TnnzQuery;
    BandHints: TStringList;
    CheckedCell: TStringList;
    JournalAdmin,
    JournalMode: string;
    // Содержат информацию о том, что загружено в гриде (на случай если юзер начнёт дёргать комбобоксы).
    // Обновляются на LoadData.
    Trid: Integer;
    TrimID: string;
    TrimestrDesc: string;
    TrimIndex: Integer;
    OnDate: string;
    CourseID: string;
    CourseDesc: string;
    CurTermBeg, CurTermEnd: TDate;
    GroupID: string;
    GroupDesc: string;
    MaxLenItogColumn: Integer;
    FHintWindow : THintWindow;
    procedure GridLoadData;
    procedure SetGroupsItems;
    procedure SetTemaPlanner(Band: TcxTreeListBand);
    procedure SetHomeWork(Column: TcxTreeListColumn; Band: TcxTreeListBand);
    procedure OnShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: Controls.THintInfo);
    procedure ShowInfo(Node: TcxTreeListNode);
    procedure PopupMenu1Click(Sender: TObject);
    function AllowEdit(AColumn: TcxTreeListColumn): Boolean;
    function ExistsAllowTeacher(ColIndex: Integer): Boolean;
    // Проверяет есть ли в колонке с индексом ColIndex ячейка с isAllowTicher = True
    procedure ClearGridNodesData;
    function IsItogColumn(Column: TcxTreeListColumn): Boolean;
    function IsFIOColumn(Column: TcxTreeListColumn): Boolean;
    function GetCurTrimestrColumn(StartColumn: TcxTreeListColumn)
      : TcxTreeListColumn;
    procedure SaveGrade(sh_id, w_id, gr, m_id, comm: string);
    // Сохраняет оценку и комментарий
    procedure SaveTermGrade(trmt_id, gr, m_id, comm: string);
    // Сохраняет оценку и комментарий по уч. периоду
    procedure SaveYearGrade(y_gr_type_id, gr, m_id, comm: string);
    // Сохраняет оценку и комментарий по уч. году
    function GetTrmtidByColumt(AColumn: TcxTreeListColumn): string;
    // Возвращает тип триместра по итоговой колонке
    function GetYGrTypeidByColumt(AColumn: TcxTreeListColumn): string;
    // Возвращает тип годовой оценки по итоговой колонке
    function GetComment(StartColumn: TcxTreeListColumn): String;
    function DecimalReplace(s: string): string;
    // заменяет разделить дробной и целой части на символ из региональных настроек
    function ExistsTrueDate(ColIndex: Integer; d: TDateTime): TDateTime;
    procedure ClearRightGridNodesData;
    procedure RightPartLoadData;
  protected
    function GetAccessRazdelName: String; override;
    function GetAccessObjectName: String; override;
    function AllowEditTotalGrade(AColumn: TcxTreeListColumn;
      ANode: TcxTreeListNode): Boolean;
  public
    dd: Integer;
    // Используются при инициализации формы, например, когда она вызывается из тематич. планирования.
    cid, gid: Integer;
    JDate: TDateTime;
    fHint: string;
    InitializeStartData: Boolean;
    // Помогает отслеживать ситуацию загрузки (перезагрузки исходных данных)
    opt_termType: Integer; // тип триместра по умолчанию
    procedure OnDoShow; override;
    procedure SetAccess; override;
    procedure FormLoadDataForTrim;
    // Грузит первоначальные данные для случая триместра
    procedure FormLoadDataForFixDate;
    // Грузит первоначальные данные для случая указанной даты (используется при вызове из тематического планирования)
    procedure CallCommentEdit;
    // Среднее по дате
    procedure AvgGradeForCol(AColumn: TcxTreeListColumn);
    // Среднее по ученику
    procedure AvgGradeForNode(AColumn: TcxTreeListColumn;
      ANode: TcxTreeListNode);
    procedure LoadPremetItems;
    procedure LoadTrimestrItems;
    function GetCellInfo(ANode: TcxTreeListNode; ColumnIndex: Integer) : PnnzJournalCellInfo;
  end;

implementation

uses
  Math,
  cxClasses,
  rxStrUtils,
  xpAppUnit,
  xpDataModuleUnit,
  xpFindIndicatorFormUnit,
  xpTrimestrQueryUnit,
  xpConstUnit,
  xpMessageUnit,
  xpUtilUnit,
  xpTemaPlannerEditFormUnit,
  xpnnzHomeWorkEditFormUnit,
  xpMemParamManagerUnit,
  xpReportEditFormUnit,
  xpRoleAccessUnit,
  xpSmalInfoFormUnit,
  xpDateUnit,
  StrUtils,
  xpCommentFormUnit, xpnnzDOTemaPlannerFactEditFormUnit, JournalPrintDialogUnit;

type
  TcxTreeListHeaderCellViewInfoAccess = class(TcxTreeListHeaderCellViewInfo);
  TcxCustomEditHack = class(TcxCustomEdit);
  TcxTextEditPropertiesHack = class(TcxTextEditProperties);

  TnnzJournalNodeInfo = class
    mid: Integer;
    middle_grade: Integer;
    TransferCause: string; // Информация о переводе или отчислении
    TransferDate: TDate; // Дата о перевода или отчисления
    AllowItog: Boolean;
    FCellInfo: TList;
    // Edited     : Boolean;
  private
    function GetHaveTransfer: Boolean;
    function GetCellInfo(N: Integer): PnnzJournalCellInfo;
    function GetCellInfoCount: Integer;
    procedure SetCellInfoCount(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    property HaveTransfer: Boolean read GetHaveTransfer;
    property CellInfo[N: Integer]: PnnzJournalCellInfo read GetCellInfo;
    // а write-то где?
    property CellInfoCount: Integer read GetCellInfoCount
      write SetCellInfoCount;
  end;

  TColumnInfo = class
    MyColumnTag: Integer;
    TeacherMids: TStringList;
    // AllowTicherSheid: Boolean;
    gid: Integer;
    FullLessonDate: TDateTime;
    destructor Destroy; override;
  end;

  TnnzRigtPartJournalNodeInfo = class
    sheid: Integer;
    week_id: Integer;
    gid_J: Integer;
    lesson_date: TDateTime;
    sh_mod_fact_id: Integer;
    teacher_mid: Integer;
    event_type_J: Integer;
    module_id_J: Integer;
    event_type: Integer;
    module_id: Integer;
    work_count_J: Integer;
    hw_text_J: String;
    AllowEdit: Boolean;
    HolidayName: String;
  end;

{$R *.dfm}

function Null_If_0(i: Integer): string;
begin
  if i <> 0 then
    result := IntToStr(i)
  else
    result := 'null';
end;

procedure TxpnnzDOJournalForm.OnDoShow;
begin
  inherited;
  AdvGlowButton1.Enabled := not FReadOnly;
end;

procedure TxpnnzDOJournalForm.SetAccess;
begin
  inherited;
  FReadOnly := FReadOnly and not AnsiSameText
    (AccessObject('Режимы', 'Журнал ДО.Администратор'), 'Полный');
end;

function TxpnnzDOJournalForm.GetAccessRazdelName: String;
begin
  result := 'Режимы';
end;

function TxpnnzDOJournalForm.GetCellInfo(ANode: TcxTreeListNode;
  ColumnIndex: Integer): PnnzJournalCellInfo;
begin
  if Assigned(ANode.Data) then
    result := TnnzJournalNodeInfo(ANode.Data).CellInfo[ColumnIndex]
  else
    result := nil;
end;

function TxpnnzDOJournalForm.GetComment(StartColumn: TcxTreeListColumn): String;
var
  Column: TcxTreeListColumn;
begin
  Column := GetCurTrimestrColumn(StartColumn);
  if Column = Grid.FocusedColumn then
    result := GetCellInfo(Grid.FocusedNode, Column.ItemIndex - 1).GradeComment
  else
    result := '';
end;

function TxpnnzDOJournalForm.GetCurTrimestrColumn
  (StartColumn: TcxTreeListColumn): TcxTreeListColumn;
var
  Index: Integer;
begin
  Index := xpDataModule.GetValueFromSQL('select xp_fget_term_num(' +
    IntToStr(Trid) + ') - 1 as f');
  if Index >= 0 then
    result := Grid.Columns[StartColumn.ItemIndex + Index * 3]
  else
    result := StartColumn;
end;

function TxpnnzDOJournalForm.GetTrmtidByColumt
  (AColumn: TcxTreeListColumn): string;
begin
  result := '';
  if IsItogColumn(AColumn) then
  begin
    if (AColumn = Trimestr1Column) or (AColumn = Trimestr2Column) or
      (AColumn = Trimestr3Column) or (AColumn = Trimestr4Column) then
      result := '7';
    if (AColumn = Exam1Column) or (AColumn = Exam2Column) or
      (AColumn = Exam3Column) or (AColumn = Exam4Column) then
      result := '9';
    if (AColumn = Itog1Column) or (AColumn = Itog2Column) or
      (AColumn = Itog3Column) or (AColumn = Itog4Column) then
      result := '8';
  end;
end;

function TxpnnzDOJournalForm.GetYGrTypeidByColumt
  (AColumn: TcxTreeListColumn): string;
begin
  result := '0';
  if AColumn = YearColumn then
    result := '1';
  if AColumn = YearExamColumn then
    result := '2';
  if AColumn = YearTotalColumn then
    result := '3';
end;

function TxpnnzDOJournalForm.GetAccessObjectName: String;
begin
  result := 'Журнал ДО';
end;

procedure TxpnnzDOJournalForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TxpnnzDOJournalForm.chkVisibleItogPropertiesClickCheck
  (Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  i: Integer;
  s: String;
begin
  Grid.Columns[Trimestr1Column.ItemIndex + ItemIndex].Visible :=
    chkVisibleItog.States[ItemIndex] = cbsUnchecked;
  s := '';
  for i := Trimestr1Column.ItemIndex to YearTotalColumn.ItemIndex do
    if Grid.Columns[i].Visible then
    begin
      if s <> '' then
        s := s + ',';
      // Номер триместра (0..3) + '|' + Тип колонки (term_grade_type)
      // либо '9|' + тип годовой оценки (для годовых оценок)
      if i < YearColumn.ItemIndex then
      begin
        s := s + IntToStr((i - Trimestr1Column.ItemIndex) div 3) + '|';
        case (i - Trimestr1Column.ItemIndex) mod 3 of
          0:
            s := s + '7'; // триместр
          1:
            s := s + '9'; // экзамен
          2:
            s := s + '8'; // итог
        end;
      end
      else // Годовые оценки
      begin
        if i = YearColumn.ItemIndex then
          s := s + '9|1';
        if i = YearExamColumn.ItemIndex then
          s := s + '9|2';
        if i = YearTotalColumn.ItemIndex then
          s := s + '9|3';
      end;
    end; // if
  if xpDataModule.GetValueFromSQL
    ('SELECT Count(*) Count FROM xp_visible_itog WHERE mid = ' +
    IntToStr(App.UserInfo.ID) + ' AND trmid = ' + IntToStr(Trid)) > 0 then
    xpDataModule.ExecuteSQL('UPDATE xp_visible_itog SET do_grade_types = ' +
      StringAsSQL(s) + ' WHERE mid = ' + IntToStr(App.UserInfo.ID) +
      ' AND trmid = ' + IntToStr(Trid))
  else
    xpDataModule.ExecuteSQL
      ('INSERT INTO xp_visible_itog (mid, trmid, do_grade_types) VALUES (' +
      IntToStr(App.UserInfo.ID) + ', ' + IntToStr(Trid) + ', ' +
      StringAsSQL(s) + ')');
end;

procedure TxpnnzDOJournalForm.ClassNameEditPropertiesChange(Sender: TObject);
begin
  Grid.BeginUpdate;
  try
    ClearGridNodesData;
    Grid.Clear;
    CheckedCell.Clear;
    BandHints.Clear;
    Self.Caption := 'Журнал ДО';
  finally
    Grid.EndUpdate;
    PrintButton.Enabled := False;
  end;
end;

procedure TxpnnzDOJournalForm.ClearGridNodesData;
var
  N: TcxTreeListNode;
begin
  N := Grid.TopNode;
  while Assigned(N) do
  begin
    TnnzJournalNodeInfo(N.Data).Free;
    N.Data := nil;
    N := N.GetNext;
  end;
end;

procedure TxpnnzDOJournalForm.ClearRightGridNodesData;
var
  N: TcxTreeListNode;
begin
  N := cxGridRightPart.TopNode;
  while Assigned(N) do
  begin
    TnnzRigtPartJournalNodeInfo(N.Data).Free;
    N.Data := nil;
    N := N.GetNext;
  end;
end;


procedure TxpnnzDOJournalForm.cxGridRightPartCustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  if (not(AViewInfo.Node.Focused and AViewInfo.Column.Focused)) and
    (AViewInfo.Node.Data <> nil) then
  begin
    if Assigned(AViewInfo.Node) then
    begin
      with TnnzRigtPartJournalNodeInfo(AViewInfo.Node.Data) do
        if HolidayName <> '' then
          ACanvas.Brush.Color := $FE9B9B
        else if AllowEdit then
          ACanvas.Brush.Color := clCream
        else
          ACanvas.Brush.Color := clWhite;
    end;
  end;
end;

procedure TxpnnzDOJournalForm.cxGridRightPartDblClick(Sender: TObject);
var
  d: TDateTime;
  v: variant;
  editor: TxpnnzDOTemaPlannerFactEditForm;
begin
  if Assigned(cxGridRightPart.FocusedNode) then
  begin
    if TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .AllowEdit and not FReadOnly then
    begin
      editor := TxpnnzDOTemaPlannerFactEditForm.Create(Self);
      with editor do
        try
          LessonTypeID := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).event_type;
          LessonTitleID := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).module_id;
          cid := Integer(PredmetEdit.Properties.Items.Objects
            [PredmetEdit.ItemIndex]);
          sheid := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).sheid;
          week_id := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).week_id;
          Teacher_id := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).teacher_mid;
          if Teacher_id = 0 then
            begin
              v := xpDataModule.GetValueFromSQL(
                'select max(o.teacher_mid) as teacher_mid'#13#10 +
                'from nnz_do_sh_module_fact m '+
                'inner join xp_do_organizations o on (m.module_id = o.xp_do_oid) '+
                'where m.sheid = ' + IntToStr(sheid) + #13#10 +
                'and m.week_id = ' + IntToStr(week_id));
              if not(VarIsNull(v)) then
                Teacher_id := v;
            end;
          Year_id := Integer(YearEdit.Properties.Items.Objects
            [YearEdit.ItemIndex]);
          // комбобокс уч. года корректно выставляется и при запросе журнала на дату
          PredmetLabel.Caption := PredmetEdit.Text;
          d := TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
            .lesson_date;
          Day := DateTimeToStr
            (TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
            .lesson_date);
          cxpagePlanAndHomeWork.ActivePageIndex := 0;
          // Данные для вкладки "Домашнее задание"
          gid := TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).gid_J;
          LessonDateLabel.Caption := FormatDateTime('dd.mm.yyyy', d) + ', ' +
            bmDayOfWeekDStr(d);
          Day := bmDayOfWeekDStr(d);
          HWPredmetLabel.Caption := PredmetEdit.Text;
          HWClassNameLabel.Caption :=
            VarToStr(xpDataModule.GetValueFromSQL
            ('select `name` from xp_group where xp_key = ' + IntToStr(gid)));
          HWTable.KeyFilter :=
            IntToStr(TnnzRigtPartJournalNodeInfo
            (cxGridRightPart.FocusedNode.Data).sh_mod_fact_id);
          if HWTable.KeyFilter = '' then
            HWTable.KeyFilter := '0';
          HWTable.Open;
          if HWTable.RecordCount > 0 then
            HWTable.Edit // Если запись с ДЗ есть - редактируем,
          else
            HWTable.Append; // если нет - добавляем.
          cxFilesTabSheet.TabVisible := True;
          ShowModal;
        finally
          Free;
        end;
      // Refresh
      RightPartLoadData;
    end;
  end;
end;


procedure TxpnnzDOJournalForm.cxGridRightPartDeletion(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode);
begin
  TnnzRigtPartJournalNodeInfo(ANode.Data).Free;
  ANode.Data := nil;
end;

procedure TxpnnzDOJournalForm.cxGridRightPartEditing(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  Allow := TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
    .AllowEdit and not FReadOnly;
end;

procedure TxpnnzDOJournalForm.cxGridRightPartEditValueChanged(
  Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn);
var
  s, sheid, week_id, event_type_J, module_id_J, work_count_J, hw_text_J: string;
  sh_mod_fact_id: Integer;
begin
  if AColumn = TeacherCommentColumn then
  begin
    s := VarToStr(AColumn.TreeList.InplaceEditor.EditValue);
    sh_mod_fact_id := TnnzRigtPartJournalNodeInfo
      (cxGridRightPart.FocusedNode.Data).sh_mod_fact_id;
    sheid := Null_If_0(TnnzRigtPartJournalNodeInfo
      (cxGridRightPart.FocusedNode.Data).sheid);
    week_id := Null_If_0(TnnzRigtPartJournalNodeInfo
      (cxGridRightPart.FocusedNode.Data).week_id);
    event_type_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .event_type_J);
    module_id_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .module_id_J);
    work_count_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .work_count_J);
    hw_text_J := TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .hw_text_J;
    if sh_mod_fact_id = 0 then
    // Если записи не было - добавляем новую (с тем. планированием и дз)
    begin
      if s <> '' then
        xpDataModule.ExecuteSQL
          ('insert into nnz_do_sh_module_fact(SHEID, week_id, event_type, module_id, work_count, hw_text, teacher_comments)'#13#10
          + 'values(' + sheid + ', ' + week_id + ', ' + event_type_J + ', ' +
          module_id_J + ', ' + work_count_J + ', ' + xpUtilUnit.StringAsSQL(hw_text_J) + ', ' + xpUtilUnit.StringAsSQL(s) + ')');
    end
    else // Если была - апдейтим teacher_comments
    begin
      if s <> '' then
        xpDataModule.ExecuteSQL
          ('update nnz_do_sh_module_fact set teacher_comments = ' + xpUtilUnit.StringAsSQL(s) +
          ' where do_sh_mod_fact_id = ' + IntToStr(sh_mod_fact_id) + ';')
      else
        xpDataModule.ExecuteSQL
          ('update nnz_do_sh_module_fact set teacher_comments = null where do_sh_mod_fact_id = '
          + IntToStr(sh_mod_fact_id) + ';');
    end;
    // Refresh
    RightPartLoadData;
  end;
end;


procedure TxpnnzDOJournalForm.cxGridRightPartMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Node: TcxTreeListNode;
  Rect: TRect;
begin
  Node := cxGridRightPart.GetNodeAt(X, Y);
  if Assigned(Node) and (TnnzRigtPartJournalNodeInfo(Node.Data).HolidayName
    <> '') then
  begin
    if FHintWindow = nil then
      FHintWindow := THintWindow.Create(Self);
    Rect := FHintWindow.CalcHintRect(300, TnnzRigtPartJournalNodeInfo(Node.Data)
      .HolidayName, nil);
    with cxGridRightPart.ClientToScreen(Point(X, Y)) do
      OffsetRect(Rect, X + 20, Y);
    FHintWindow.ActivateHint(Rect, TnnzRigtPartJournalNodeInfo(Node.Data)
      .HolidayName);
  end
  else
  begin
    if Assigned(FHintWindow) then
      FHintWindow.ReleaseHandle;
    FreeAndNil(FHintWindow);
  end;
end;


function TxpnnzDOJournalForm.ExistsAllowTeacher(ColIndex: Integer): Boolean;
var
  N: TcxTreeListNode;
begin
  result := False;
  N := Grid.TopNode;
  while Assigned(N) do
  begin
    if TnnzJournalNodeInfo(N.Data).CellInfo[ColIndex].isAllowTicher then
    begin
      result := True;
      Exit;
    end;
    N := N.GetNext;
  end;
end;

function TxpnnzDOJournalForm.ExistsTrueDate(ColIndex: Integer; d: TDateTime)
  : TDateTime;
var
  N: TcxTreeListNode;
  YY, MM, dd: Word;
begin
  result := d;
  N := Grid.TopNode;
  while Assigned(N) do
  begin
    DecodeDate(TnnzJournalNodeInfo(N.Data).CellInfo[ColIndex].LessonDate,
      YY, MM, dd);
    if YY > 1950 then
    begin
      result := TnnzJournalNodeInfo(N.Data).CellInfo[ColIndex].LessonDate;
      Exit;
    end;
    N := N.GetNext;
  end;
end;

procedure TxpnnzDOJournalForm.SetGroupsItems;
var
  SQL, term_type: String;
  Index: Integer;
begin
  ClassNameEdit.Properties.Items.Clear;
  if TrimestrEdit.ItemIndex > -1 then
  begin
    term_type := xpDataModule.GetStrValueFromSQL
      ('select term_type_id from terms where trmid = ' +
      GetStrFromCombo(TrimestrEdit));
    SQL := 'SELECT g.xp_key gid, g.`Name`' + sLineBreak + 'FROM xp_group g' +
      sLineBreak +
      'INNER JOIN xp_group_term_types g_tt ON g_tt.xp_group_id = g.xp_key AND g_tt.term_type_id = '
      + term_type + ' AND g_tt.s_year_id = ' + GetStrFromCombo(YearEdit) +
      sLineBreak + 'WHERE g.xp_key IN' + sLineBreak +
      '  (SELECT DISTINCT g.xp_key AS gid' + sLineBreak + '   FROM xp_group g' +
      sLineBreak + '   INNER JOIN nnz_do_schedule sh ON sh.gid = g.xp_key' +
      sLineBreak + '   INNER JOIN nnz_weeks w ON w.do_sh_var_id = sh.sh_var_id'
      + sLineBreak +
      '   INNER JOIN term_weeks tw ON tw.week_id = w.week_id AND tw.trmid = ' +
      GetStrFromCombo(TrimestrEdit) + sLineBreak;
    if AnsiSameText(AccessObject('Режимы', 'Журнал ДО.Администратор'),
      'Нет') then
      SQL := SQL +
        '   INNER JOIN dop_sheduleteachers dpt ON dpt.sheid = sh.sheid AND dpt.teacher = '
        + IntToStr(App.UserInfo.ID) + sLineBreak + '   UNION' + sLineBreak +
        '   SELECT adg.gid' + sLineBreak + '   FROM addepartments_groups adg' +
        sLineBreak +
        '   INNER JOIN departments d ON d.did = adg.did AND d.mid = ' +
        IntToStr(App.UserInfo.ID) + sLineBreak + '   UNION' + sLineBreak +
        '   SELECT g.xp_key AS gid' + sLineBreak + '   FROM xp_group g' +
        sLineBreak +
        '   INNER JOIN addepartments_courses adc ON adc.cid = g.xp_cid' +
        sLineBreak +
        '   INNER JOIN departments d ON d.did = adc.did AND d.mid = ' +
        IntToStr(App.UserInfo.ID) + sLineBreak;
    SQL := SQL + '  ) AND g.xp_CID = ' + GetStrFromCombo(PredmetEdit) +
      sLineBreak + 'ORDER BY g.`Name`;';
    xpDataModule.SetItemsFromSQL(ClassNameEdit, SQL, False);
  end; // if
  if gid = 0 then
  begin
    if ClassNameEdit.Properties.Items.Count > 0 then
      ClassNameEdit.ItemIndex := 0;
  end
  else // Если задан стартовый gid (если форма вызывается с заданными cid и gid) - первый раз на них
  // позиционируемся и обнуляем
  begin
    Index := ClassNameEdit.Properties.Items.IndexOfObject(TObject(gid));
    if Index >= 0 then
      ClassNameEdit.ItemIndex := Index
    else if ClassNameEdit.Properties.Items.Count > 0 then
      ClassNameEdit.ItemIndex := 0;
    gid := 0;
  end;
end;

procedure TxpnnzDOJournalForm.LoadPremetItems;
var
  SQL, Trimestr_type: string;
  Trimestr, Index: Integer;
  HasAdminRights: Boolean;
begin
  xpDataModule.CheckSQLConnect;
  PredmetEdit.Properties.Items.Clear;
  if TrimestrEdit.ItemIndex > -1 then
  begin
    Trimestr := GetIntFromCombo(TrimestrEdit);
    Trimestr_type := xpDataModule.GetStrValueFromSQL
      ('select term_type_id from terms where trmid = ' + IntToStr(Trimestr));
    // Заявка 2805: "должны присутствовать все предметы, занятия по которым есть в расписании за соответствующий учебный период"
    { SQL := 'SELECT eee.cid, eee.Title '#13 +
      'FROM ( SELECT Courses.xp_key cid, Courses.name Title'#13 +
      '       FROM xp_courses Courses '#13 +
      '       inner join dop_schedule sh ON sh.xp_CID = Courses.xp_key '#13 +
      '       LEFT OUTER JOIN dop_sheduleteachers dpt ON dpt.sheid = sh.sheid '#13 +
      '       INNER JOIN terms t ON PeriodDateOk(STR_TO_DATE(t.term_begin, ''%d.%m.%Y''), STR_TO_DATE(t.term_end, ''%d.%m.%Y''), sh.begin, sh.end) = 1 '#13 +
      ' WHERE '; }
    // LMS-2932
    HasAdminRights := not AnsiSameText(AccessObject('Режимы',
      'Журнал ДО.Администратор'), 'Нет');
    SQL := 'SELECT eee.cid, eee.Title '#13 +
      'FROM ( SELECT Courses.xp_key cid, Courses.name Title '
      + '       FROM xp_courses Courses inner join nnz_do_schedule sh on (sh.CID = Courses.xp_key) '
      + '                               inner join nnz_weeks w on (w.do_sh_var_id = sh.sh_var_id '
      + '                                                          and (sh.day_of_week - 1) between weekday(w.wstart_date) and weekday(w.wend_date) ) '
      + '                               inner join term_weeks tw on (tw.week_id = w.week_id) '
      + '                               inner join xp_group g on (g.xp_key = sh.gid '
      + '                                       and g.term_type_id = '+ Trimestr_type + ')';
    if (not HasAdminRights) then
      SQL := SQL +  Format(
        'left join ( ' +
        ' select gr.xp_cid, d.mid from xp_group gr ' +
        '  inner join addepartments_groups adg on (adg.gid = gr.xp_key) ' +
        '   inner join departments d on d.did = adg.did ' +
        ') g1 on g1.xp_cid = Courses.xp_key and g1.mid = %0:d ' +
        'left join ( ' +
        ' select adc.cid, d2.mid from addepartments_courses adc ' +
        '  inner join departments d2 on d2.did = adc.did ' +
        ') g2 on g2.cid = Courses.xp_key  and g2.mid = %0:d ' +
        'left join dop_sheduleteachers dpt ON dpt.sheid = sh.sheid  and dpt.`teacher` = %0:d ',
        [App.UserInfo.ID]);
    SQL := SQL +
    // '       INNER JOIN terms t ON PeriodDateOk(STR_TO_DATE(t.term_begin, ''%d.%m.%Y''), STR_TO_DATE(t.term_end, ''%d.%m.%Y''), sh.begin, sh.end) = 1 '#13 +
      ' WHERE ';
    SQL := SQL + ' tw.trmid =' + IntToStr(Trimestr);
    if (not HasAdminRights) then
      SQL := SQL + ' and COALESCE(g1.mid,g2.mid,dpt.teacher) IS NOT NULL';
    SQL := SQL + ') eee group by eee.cid, eee.Title  ORDER BY Title';
    xpDataModule.SetItemsFromSQL(PredmetEdit, SQL, False);
  end;

  if cid = 0 then
  begin
    if PredmetEdit.Properties.Items.Count > 0 then
      PredmetEdit.ItemIndex := 0;
  end
  else // Если задан стартовый cid (если форма вызывается с заданными cid и gid) - первый раз на них
  // позиционируемся и обнуляем
  begin
    Index := PredmetEdit.Properties.Items.IndexOfObject(TObject(cid));
    if Index >= 0 then
      PredmetEdit.ItemIndex := Index
    else if PredmetEdit.Properties.Items.Count > 0 then
      PredmetEdit.ItemIndex := 0;
    cid := 0;
  end;
end;

procedure TxpnnzDOJournalForm.LoadTrimestrItems;
var
  SQL: string;
  Index, termType_trmid: Integer;
begin
  xpDataModule.CheckSQLConnect;
  // Список триместров (заполняем с учётом выбранного учебного года)
  if YearEdit.Properties.Items.Count > 0 then
  begin
    SQL := 'select trmid, concat(title, '' ('', term_begin, '' - '', term_end, '')'') as F'#13#10
      + 'from terms'#13#10 + 'where year = ' + GetStrFromCombo(YearEdit) +
      #13#10 + 'order by term_type_id, str_to_date(term_begin, ''%d.%m.%Y'');';
    xpDataModule.SetItemsFromSQL(TrimestrEdit, SQL, False);
    termType_trmid := GetCurTrim(JDate, Integer(YearEdit.ItemObject),
      opt_termType);
    if not(InitializeStartData) then
    begin
      Index := TrimestrEdit.Properties.Items.IndexOfObject
        (TObject(termType_trmid));
      if Index >= 0 then
        TrimestrEdit.ItemIndex := Index
      else if TrimestrEdit.Properties.Items.Count > 0 then
        TrimestrEdit.ItemIndex := 0;
    end;
  end;
end;

procedure TxpnnzDOJournalForm.FormLoadDataForFixDate;
var
  Index, id_cur_year, id_cur_trim: Integer;
  term_type: string;
begin
  xpDataModule.CheckSQLConnect;
  InitializeStartData := True;
  // Считаем, что нужная дата установлена в JDate
  // Уч. год по дате:
  xpDataModule.SetItemsFromSQL(YearEdit,
    'select xp_key, Name from school_year order by BegDate', False);
  YearEdit.Properties.Items.AddObject('', TObject(StrToIntDef('0', 0)));
  id_cur_year := xpDataModule.GetValueFromSQL('select xp_fget_cur_school_year('
    + DateAsSQL(JDate) + ') as F');
  if id_cur_year > 0 then
  begin
    Index := YearEdit.Properties.Items.IndexOfObject(TObject(id_cur_year));
    if Index >= 0 then
      YearEdit.ItemIndex := Index
    else if YearEdit.Properties.Items.Count > 0 then
      YearEdit.ItemIndex := 0;
  end;
  // Спозиционировать комбобокс триместров на нужный.
  // Чтобы тип уч. периода совпадал с типом уч. периода группы.
  term_type := VarToStr(xpDataModule.GetValueFromSQL
    ('select term_type_id from xp_group where xp_key = ' + IntToStr(gid)));
  if term_type = '' then
    term_type := '0';
  id_cur_trim := xpDataModule.GetValueFromSQL('select xp_fget_cur_trim_by_type('
    + DateAsSQL(JDate) + ', ' + term_type + ') as F');
  if id_cur_trim > 0 then
  begin
    Index := TrimestrEdit.Properties.Items.IndexOfObject(TObject(id_cur_trim));
    if Index >= 0 then
      TrimestrEdit.ItemIndex := Index
    else if TrimestrEdit.Properties.Items.Count > 0 then
      TrimestrEdit.ItemIndex := 0;
  end;
  InitializeStartData := False;
end;

procedure TxpnnzDOJournalForm.FormLoadDataForTrim;
var
  Index, id_cur_year, cur_trim: Integer;
  v: variant;
begin
  InitializeStartData := True;
  xpDataModule.SetItemsFromSQL(YearEdit,
    'select xp_key, Name from school_year order by BegDate', False);
  YearEdit.Properties.Items.AddObject('', TObject(StrToIntDef('0', 0)));
  // Спозиционировать YearEdit на текущий учебный год (исходя из текущего триместра).
  if CurTrimestr > 0 then
  begin
    v := xpDataModule.GetValueFromSQL('select `year` from terms where trmid = '
      + IntToStr(CurTrimestr));
    if not(VarIsNull(v)) then
      id_cur_year := v
    else
      id_cur_year := 0;
  end
  else
    id_cur_year := xpDataModule.GetValueFromSQL
      ('select xp_fget_cur_school_year(now())');
  Index := YearEdit.Properties.Items.IndexOfObject(TObject(id_cur_year));
  if Index >= 0 then
    YearEdit.ItemIndex := Index
  else if YearEdit.Properties.Items.Count > 0 then
    YearEdit.ItemIndex := 0;
  // Спозиционировать комбобокс триместров на нужный (в зависимости от типа триместра по-умолчанию)
  cur_trim := GetCurTrim(JDate, Integer(YearEdit.ItemObject), opt_termType);
  Index := TrimestrEdit.Properties.Items.IndexOfObject(TObject(cur_trim));
  TrimestrEdit.ItemIndex := Index;
  InitializeStartData := False;
end;

procedure TxpnnzDOJournalForm.FormShow(Sender: TObject);
var
  Item: TMenuItem;
  iQuery: TnnzQuery;
begin
  inherited;
  JournalAdmin := AccessObject('Режимы', 'Журнал ДО.Администратор');
  JournalMode := AccessObject('Режимы', 'Журнал ДО');
  BegDateEdit.Date := JDate;
  // На это присвоение выполняется FormLoadDataForFixDate (если JournalRadioButton1.Checked)
  if JournalRadioButton2.Checked then
    FormLoadDataForTrim;
  if JournalOnDate.Checked then
    GridLoadData;
  Grid.PopupMenu := nil;
  // PopupMenu1 := TPopupMenu.Create(Self);
  xpDataModule.CheckSQLConnect;
  iQuery := TnnzQuery.Create(Self);
  iQuery.Connection := xpDataModule.nnzConnection;
  iQuery.SQL.Text :=
    'select Value from schedule_grades_values order by IsGrade, Value';
  iQuery.Open;
  while not iQuery.Eof do
  begin
    Item := TMenuItem.Create(PopupMenu1);
    if iQuery.FieldValues['Value'] = '-' then
      Item.Caption := '"' + iQuery.FieldByName('Value').AsString + '"'
    else
      Item.Caption := iQuery.FieldByName('Value').AsString;
    Item.Hint := iQuery.FieldByName('Value').AsString;
    Item.OnClick := PopupMenu1Click;
    PopupMenu1.Items.Add(Item);
    iQuery.Next;
  end;
  // Максимальная длина значения в итоговых колонках.
  MaxLenItogColumn := xpDataModule.GetValueFromSQL
    ('select ifnull((select max(length(`Value`)) from schedule_grades_values), 0) as l');
end;

procedure TxpnnzDOJournalForm.PredmetEditPropertiesChange(Sender: TObject);
begin
  SetGroupsItems;
end;

procedure TxpnnzDOJournalForm.PrevButtonClick(Sender: TObject);
begin
  inherited;
  Close;
end;

function TxpnnzDOJournalForm.AllowEditTotalGrade(AColumn: TcxTreeListColumn;
  ANode: TcxTreeListNode): Boolean;
begin
  result := Assigned(ANode) and TnnzJournalNodeInfo(ANode.Data).AllowItog;
  if not(result and IsItogColumn(AColumn)) then
    Exit;
  if AColumn.ItemIndex < YearColumn.ItemIndex then
    result := (TrimIndex >= 0) and
      ((AColumn.ItemIndex - Trimestr1Column.ItemIndex) div 3 = TrimIndex);
  if result then
    result := TnnzJournalNodeInfo(ANode.Data).middle_grade <> 99999;
end;

procedure TxpnnzDOJournalForm.GridLoadData;
var
  AvgNodeExist: Boolean;
  i, StartGradesColNum: Integer;

  function GetNode: TcxTreeListNode;
  var
    tmp, j: Integer;
    fNode: TcxTreeListNode;
  begin
    fNode := Grid.TopNode;
    tmp := Query.FieldByName('mid').AsInteger;
    if tmp = 99999 then
      AvgNodeExist := True;
    while Assigned(fNode) and Assigned(fNode.Data) do
    begin
      if TnnzJournalNodeInfo(fNode.Data).mid = tmp then
      begin
        result := fNode;
        Exit;
      end;
      fNode := fNode.GetNext;
    end;
    Inc(i);
    result := Grid.Insert(fNode);
    result.Data := TnnzJournalNodeInfo.Create;
    TnnzJournalNodeInfo(result.Data).mid := tmp;
    TnnzJournalNodeInfo(result.Data).middle_grade := tmp;
    if not(Query.FieldByName('transfer_date').IsNull) then
      TnnzJournalNodeInfo(result.Data).TransferDate :=
        Query.FieldByName('transfer_date').AsDateTime
    else
      TnnzJournalNodeInfo(result.Data).TransferDate := EncodeDate(1913, 1, 1);
    TnnzJournalNodeInfo(result.Data).TransferCause :=
      Query.FieldByName('transfer_cause').AsString;
    result.Values[StudentColumn.ItemIndex] :=
      Query.FieldByName('student').AsString;
    if Query.FieldByName('Classname').AsString <> '' then
    begin
      result.Values[ClassNameColumn.ItemIndex] :=
        Query.FieldByName('Classname').AsString;
      ClassNameColumn.Visible := True;
    end;
    TnnzJournalNodeInfo(result.Data).CellInfoCount := Grid.ColumnCount;
    with TnnzJournalNodeInfo(result.Data) do
    begin
      AllowItog := False;
    end;
    if tmp <> 99999 then
    begin
      result.Values[NumColumn.ItemIndex] := i;
      if StartGradesColNum >= 0 then
        for j := StartGradesColNum to Grid.ColumnCount - 1 do
          with TnnzJournalNodeInfo(result.Data).CellInfo[j]^ do
          begin
            isAllowTicher := False;
            isOut := False;
            isChangeComments := False;
            isHoliday_with_nocarry := False;
            isHoliday_with_carry := False;
          end;
    end
    else
      for j := StartGradesColNum to Grid.ColumnCount - 1 do
        if TnnzJournalNodeInfo(result.Data).CellInfo[j] <> nil then
          TnnzJournalNodeInfo(result.Data).CellInfo[j]^.isAllowTicher := False;
  end; // GetNode

  procedure SetColumnWidth(Column: TcxTreeListColumn;
    const Appendix: String = '  ');
  begin
    Column.Width := _TextWidth(Grid.Handle, Grid.Font.Handle,
      Column.Caption.Text + Appendix);
  end;

  function GetItogColumn(StartColumn: TcxTreeListColumn): TcxTreeListColumn;
  var
    Index, trmid: Integer;
  begin
    trmid := Query.FieldByName('instance').AsInteger;
    if trmid = 0 then
      result := GetCurTrimestrColumn(StartColumn)
    else
    begin
      Index := xpDataModule.GetValueFromSQL('select xp_fget_term_num(' +
        IntToStr(trmid) + ') - 1 as f');
      if Index > 0 then
        result := Grid.Columns[StartColumn.ItemIndex + Index * 3]
      else
        result := StartColumn;
    end;
  end;

  function GetItogColumnByTerm(StartColumn: TcxTreeListColumn; trmid: Integer)
    : TcxTreeListColumn;
  var
    Index: Integer;
  begin
    Index := xpDataModule.GetValueFromSQL('select xp_fget_term_num(' +
      IntToStr(trmid) + ') - 1 as f');
    if Index > 0 then
      result := Grid.Columns[StartColumn.ItemIndex + Index * 3]
    else
      result := StartColumn;
  end;

var
  Col_Width: Integer;
  Node, FirstNode: TcxTreeListNode;
  Column: TcxTreeListColumn;
  Band: TcxTreeListBand;
  Caption, fName, SQL, tmp, day_closed, year_gr_types: string;
  IndicatorForm: TxpFindIndicatorForm;
  // AModalResult: TModalResult;
  SL, SLTypes, YTypes: TStringList;
  d: TDateTime;
  v: variant;
begin // TxpnnzJournalForm.GridLoadData
  AvgNodeExist := False;
  RefreshButton.SetFocus;
  if JournalOnDate.Checked and (BegDateEdit.Date < 10) then
  begin
    xpWarning('Укажите дату.');
    BegDateEdit.SetFocus;
    Exit;
  end;
  if JournalRadioButton2.Checked and (TrimestrEdit.ItemIndex < 0) then
  begin
    xpWarning('Укажите учебный период.');
    TrimestrEdit.SetFocus;
    Exit;
  end;
  if PredmetEdit.ItemIndex < 0 then
  begin
    xpWarning('Укажите дисциплину.');
    PredmetEdit.SetFocus;
    Exit;
  end;
  if ClassNameEdit.ItemIndex < 0 then
  begin
    xpWarning('Укажите группу.');
    ClassNameEdit.SetFocus;
    Exit;
  end;
  Grid.BeginUpdate;
  IndicatorForm := TxpFindIndicatorForm.Create(Self);
  try
    CheckedCell.Clear;
    ClearGridNodesData;
    Grid.Clear;
    BandHints.Clear;
    ClassNameColumn.Visible := False;
    Application.ProcessMessages;
    IndicatorForm.Caption := 'Загрузка...';
    IndicatorForm.Label1.Caption := 'Идет загрузка данных';
    IndicatorForm.Label1.Refresh;
    IndicatorForm.AdvCircularProgress.Position := 1;
    IndicatorForm.AdvCircularProgress.Max := 4;
    IndicatorForm.Show;
    Application.ProcessMessages;
    xpDataModule.ExecuteSQL('DROP TABLE IF EXISTS Tmp;'#13#10 +
      'CREATE TEMPORARY TABLE Tmp TYPE = HEAP'#13#10 +
      'SELECT M.sh_mod_id'#13#10 + 'FROM nnz_do_schedule S'#13#10 +
      'INNER JOIN nnz_weeks W ON W.sh_var_id = S.sh_var_id'#13#10 +
      'INNER JOIN holidays H ON H.`date` BETWEEN W.wstart_date AND W.wend_date AND'#13#10
      + '  H.`date` = date_add(W.wstart_date, interval (S.day_of_week - 1 - weekday(W.wstart_date)) day)'#13#10
      + 'INNER JOIN nnz_do_schedule_modules M ON M.SHEID = S.SHEID AND M.week_id = W.week_id;'#13#10
      +

      'DELETE FROM nnz_do_schedule_modules'#13#10 +
      'WHERE sh_mod_id IN (SELECT sh_mod_id FROM Tmp);'#13#10 +

      'DROP TABLE Tmp;'#13#10 + 'CREATE TEMPORARY TABLE Tmp TYPE = HEAP'#13#10 +
      'SELECT HW.hwid'#13#10 + 'FROM nnz_do_schedule S'#13#10 +
      'INNER JOIN nnz_weeks W ON W.sh_var_id = S.sh_var_id'#13#10 +
      'INNER JOIN holidays H ON H.`date` BETWEEN W.wstart_date AND W.wend_date AND'#13#10
      + '  H.`date` = date_add(W.wstart_date, interval (S.day_of_week - 1 - weekday(W.wstart_date)) day)'#13#10
      + 'INNER JOIN nnz_do_homework HW ON HW.sheid = S.SHEID AND HW.week_id = W.week_id;'#13#10
      +

      'DELETE FROM nnz_do_homework'#13#10 +
      'WHERE hwid IN (SELECT hwid FROM Tmp);'#13#10 + 'DROP TABLE Tmp;');
    // Запомнить параметры с которыми формировался журнал
    // (пригодится при печати и ещё может где, на случай когда юзер начнёт крутить комбобоксы без нажатия "Обновить").
    DateLockCurrent := EncodeDate(1900,1,1);
    DateLockTerm := DateLockCurrent;
    FOutOfDate := xpDataModule.GetValueFromSQL('select coalesce((select CAST(VALUE AS CHAR(10)) from options where name=''educ_periodend''),''01.01.2000'') as Dval');
    try
      DateLockCurrent := StrToDateFormat(FOutOfDate,'dd.mm.yyyy');
      DateLockTerm := DateLockCurrent;
    except
    end;
    if xpDataModule.GetValueFromSQL('select coalesce((select CAST(VALUE AS CHAR(10)) from options where name=''LockDOJournal''),''1'')')='1' then
      begin
        FLockCurrentDays := xpDataModule.GetValueFromSQL
          ('select coalesce((select CAST(VALUE AS CHAR(10)) from options where name=''Days_to_edit_current_grades''),''0'') as Dval');
        if StrToIntDef(FLockCurrentDays,0)>0 then
          DateLockCurrent := max(DateLockCurrent, Date - StrToIntDef(FLockCurrentDays,0)-1);
        FLockTermDays := xpDataModule.GetValueFromSQL
          ('select coalesce((select CAST(VALUE AS CHAR(10)) from options where name=''Days_to_edit_term_grades''),''0'') as Dval');
        if StrToIntDef(FLockTermDays,0)>0 then
          DateLockTerm := max(DateLockTerm, Date - StrToIntDef(FLockTermDays,0)-1);
      end;
    CourseID := IntToStr(Integer(PredmetEdit.Properties.Items.Objects
      [PredmetEdit.ItemIndex]));
    CourseDesc := PredmetEdit.Text;
    GroupID := IntToStr(Integer(ClassNameEdit.Properties.Items.Objects
      [ClassNameEdit.ItemIndex]));
    GroupDesc := ClassNameEdit.Text;

    if JournalOnDate.Checked then
    begin // за одну дату
      Trid := xpDataModule.GetValueFromSQL
        ('SELECT COALESCE((SELECT max(trmid)'#13#10 +
        '                 FROM terms'#13#10 + '                 WHERE ' +
        DateAsSQL(BegDateEdit.Date) +
        ' BETWEEN (STR_TO_DATE(term_begin, ''%d.%m.%Y'')) AND (STR_TO_DATE(term_end, ''%d.%m.%Y''))),'#13#10
        + '               0) AS F;');
      TrimID := '0';
      TrimestrDesc := DateToStr(BegDateEdit.Date);
      OnDate := DateAsSQL(BegDateEdit.Date);
      with xpDataModule.CreateDataSetFromSQL
        ('select str_to_date(term_begin, ''%d.%m.%Y'') t_Beg, str_to_date(term_end, ''%d.%m.%Y'') as t_End from terms where trmid = xp_fget_cur_trim('
        + OnDate + ')') do
        try
          CurTermBeg := FieldByName('t_Beg').AsDateTime;
          CurTermEnd := FieldByName('t_End').AsDateTime;
        finally
          Free;
        end;
    end
    else // за триместр
    begin
      Trid := Integer(TrimestrEdit.Properties.Items.Objects
        [TrimestrEdit.ItemIndex]);
      TrimID := IntToStr(Trid);
      TrimestrDesc := TrimestrEdit.Text;
      OnDate := DateAsSQL(Now());
      with xpDataModule.CreateDataSetFromSQL
        ('select str_to_date(term_begin, ''%d.%m.%Y'') t_Beg, str_to_date(term_end, ''%d.%m.%Y'') as t_End from terms where trmid = '
        + TrimID) do
        try
          CurTermBeg := FieldByName('t_Beg').AsDateTime;
          CurTermEnd := FieldByName('t_End').AsDateTime;
        finally
          Free;
        end;
    end;
    TrimIndex := xpDataModule.GetValueFromSQL('select xp_fget_term_num(' +
      IntToStr(Trid) + ') - 1 as f');
    SQL := 'CALL nnz_fill_do_journal (' + TrimID + ',' + OnDate + ',' + CourseID
      + ',' + GroupID + ')';
    xpDataModule.ExecuteSQL(SQL);
    IndicatorForm.AdvCircularProgress.StepBy(1);
    IndicatorForm.AdvCircularProgress.Refresh;
    Application.ProcessMessages;

    Query.Close;
    Query.SQL.Text := 'SELECT journal.*,'#13 + ' case '#13 +
      '  when exists(select * from dop_sheduleteachers where teacher =' +
      IntToStr(App.UserInfo.ID) + ' and sheid = journal.sheid) then 1' +
      '   else 0'#13 + '  end teacher_edit, '#13 + '  case  ' +
      '   when ChangeComments <> '''' then 1' + '    else 0' +
      '  end  isChangeComments,' + '  case  ' +
      '   when holidayname <> '''' and HolidayChangeDate = '''' then 1' +
      '    else 0' + '  end  isholiday_with_nocarry,' + '  case  ' +
      '   when holidayname <> '''' and HolidayChangeDate <> '''' then 1' +
      '    else 0' + '  end  isholiday_with_carry, ' + '  case  ' +
      '   when in_out <> '''' then 1' + '    else 0' + '  end  isout ' +
      ' FROM journal'#13 +
      ' ORDER BY (case when mid = 99999 then 1 else 0 END), LessonUnixDate, gid, Student, LessonID;';
    Query.Open;

    SQL := 'SELECT COALESCE((' + sLineBreak +
      '                 SELECT CONCAT(p.LastName, '' '', p.FirstName, '' '', p.Patronymic) FIO'
      + sLineBreak + '                 FROM people P' + sLineBreak +
      '                 INNER JOIN groupname g ON P.mid = g.class_teacher' +
      sLineBreak +
      '                 LEFT OUTER JOIN groupname g2 ON g2.owner_gid = g.gid' +
      sLineBreak + '                 WHERE g.gid = ' + GroupID + ' OR g2.gid = '
      + GroupID + ' LIMIT 1) ,'''') FIO';

    lblPrepod.Caption := 'Преподаватель:' + sLineBreak +
      xpDataModule.GetStringListFromSQL
      ('SELECT CONCAT(p.LastName, '' '', p.FirstName, '' '', p.Patronymic) FIO'#13#10
      + 'FROM people P inner join dop_sheduleteachers on dop_sheduleteachers.teacher = P.mid'#13#10
      + '              INNER JOIN journal J ON J.sheid = dop_sheduleteachers.sheid'#13#10
      + 'where not exists (select 1 '#13#10 +
      '                  from xp_personal_file pf'#13#10 +
      '                  where pf.mid = p.mid'#13#10 +
      '                  and trim(upper(pf.WorkStatus)) = ''УВОЛЕН'''#13#10 +
      '                  and ifnull(pf.DateLeaveSchool, ''1913-01-01'') < ' +
      DateAsSQL(BegDateEdit.Date) + ')'#13#10 +
      'group by p.LastName, p.FirstName, p.Patronymic'#13#10 +
      'order by p.LastName;');

    Self.Caption := 'Журнал доп. образования. Группа: ' + ClassNameEdit.Text +
      ', дисциплина: ' + PredmetEdit.Text + ', ' + YearEdit.Text + 'г.';

    IndicatorForm.AdvCircularProgress.StepBy(1);
    IndicatorForm.AdvCircularProgress.Refresh;
    try
      StudentColumn.Caption.MultiLine := True;
      for i := Grid.ColumnCount - 1 downto 0 do
        if (Grid.Columns[i].Tag > 0) and
          // (Grid.Columns[i].Position.BandIndex=0) and
          (TColumnInfo(Grid.Columns[i].Tag).MyColumnTag >= MyColumnTag) then
        begin
          TColumnInfo(Grid.Columns[i].Tag).Free;
          Grid.Columns[i].Destroy;
        end;
      for i := Grid.Bands.Count - 1 downto 2 do
        Grid.Bands[i].Free;
      for i := Grid.ColumnCount - 1 downto 0 do
        if Grid.Columns[i].Position.Band = nil then
          Grid.Columns[i].Free;
      Column := nil;
      StartGradesColNum := -1;
      Col_Width := _TextWidth(Grid.Handle, Grid.Font.Handle, '00.00   '); // 37
      while not Query.Eof do
      begin
        if Query.FieldValues['HolidayChangeDate'] > '' then
        // Если есть перенос в праздниках
          Caption := Query.FieldValues['HolidayChangeDate']
        else
          Caption := Query.FieldByName('LessonDate').AsString;
        if Query['sheid'] > 0 then
        begin
          fName := 'c' + VarToStr(Query.FieldValues['instance']) + 'c' +
            VarToStr(Query.FieldValues['sheid']);
          Column := Grid.ColumnByName(fName);
          if Column = nil then
          begin
            Band := TcxTreeListBand.Create(Grid.Bands);
            if Query['holidayname'] <> '' then
              Band.Caption.Glyph.LoadFromResourceName(HInstance, 'eth')
            else
              Band.Caption.Glyph.LoadFromResourceName(HInstance,
                'et' + VarToStr(Query['LessonTypeID']));
            Band.Caption.GlyphAlignHorz := taCenter;
            Band.Caption.GlyphAlignVert := vaTop;
            tmp := Query.FieldByName('otitle').AsString;
            if Query.FieldByName('LessonFullDate').AsDateTime <= DateLockCurrent then
              day_closed := '. Период закрыт по ' + DateToStr(DateLockCurrent) + '.'
            else
              day_closed := '';

            Band.Caption.Text := VarToStr(Query['LessonTypeID']) + '#' +
              Query.FieldByName('LessonTitleID').AsString;
            if Query['holidayname'] <> '' then
              BandHints.AddObject(Query.FieldByName('holidayname').AsString +
                day_closed, Band)
            else if Query['ChangeComments'] <> '' then
              BandHints.AddObject(Query.FieldByName('ChangeComments').AsString +
                day_closed, Band)
            else
              BandHints.AddObject(tmp + day_closed, Band);

            Band.Styles.Header := BandStyle;
            Column := Grid.CreateColumn(Band);
            if StartGradesColNum = -1 then
              StartGradesColNum := Column.ItemIndex - 1;

            Column.Tag := Integer(TColumnInfo.Create);
            TColumnInfo(Column.Tag).MyColumnTag := MyColumnTag;

            TColumnInfo(Column.Tag).TeacherMids := TStringList.Create;
            TColumnInfo(Column.Tag).TeacherMids.DelimitedText :=
              Query.FieldByName('teacherMids').AsString;

            TColumnInfo(Column.Tag).gid := Query.FieldByName('gid').AsInteger;
            TColumnInfo(Column.Tag).FullLessonDate :=
              Query.FieldByName('LessonFullDate').AsDateTime;

            Column.Caption.Text := Caption;
            if (Query.FieldByName('LessonHomeWork').AsString <> '') or
              HomeWorkHasFiles(Query.FieldByName('sheid').AsInteger,
              Query.FieldByName('instance').AsInteger) then
              Band.Styles.Header := cxDZStyle;

            Column.Name := fName;
            Column.Caption.MultiLine := True;
            Column.Position.LineCount := 1;
            Column.DataBinding.ValueType := 'String';
            Column.Width := Col_Width;
            Column.Caption.AlignHorz := taCenter;
            Column.Caption.AlignVert := vaBottom;
            Column.PropertiesClass := TcxTextEditProperties;
            TcxTextEditProperties(Column.Properties).MaxLength := 20;
            TcxTextEditProperties(Column.Properties).Alignment.Horz := taCenter;
            TcxTextEditProperties(Column.Properties).Alignment.Vert :=
              taVCenter;
          end;
        end;
        Query.Next;
      end;
      Query.First;
      i := 0;
      FirstNode := nil;
      while not Query.Eof do
      begin
        Node := GetNode;
        if FirstNode = nil then
          FirstNode := Node;
        if Query['sheid'] > 0 then
        begin
          fName := 'c' + VarToStr(Query.FieldValues['instance']) + 'c' +
            VarToStr(Query.FieldValues['sheid']);
          Column := Grid.ColumnByName(fName);
          with TnnzJournalNodeInfo(Node.Data).CellInfo[Column.ItemIndex - 1]^ do
          begin
            isAllowTicher :=
              (AnsiSameText(AccessObject('Режимы', 'Журнал ДО.Администратор'),
              'Полный') or (Query.FieldByName('teacher_edit').AsString = '1'))
              and AnsiSameText(AccessObject('Режимы', 'Журнал ДО'), 'Полный');
            if Trim(FOutOfDate) > '' then
              isAllowTicher :=
                (isAllowTicher or (Query.FieldByName('teacher_edit').AsString = '1')) and
                (DateLockCurrent < Query.FieldByName('LessonFullDate')
                .AsDateTime)
            else
              isAllowTicher := isAllowTicher or
                (Query.FieldByName('teacher_edit').AsString = '1');
            isAllowTicher := isAllowTicher and
              (Query.FieldByName('mid').AsInteger <> 99999);
            LessonDate := Query.FieldByName('LessonFullDate').AsDateTime;
            isChangeComments := Query.FieldByName('isChangeComments')
              .AsString = '1';
            isOut := Query.FieldByName('isOut').AsString = '1';
            isHoliday_with_nocarry :=
              Query.FieldByName('isholiday_with_nocarry').AsInteger = 1;
            isHoliday_with_carry := Query.FieldByName('isholiday_with_carry')
              .AsString = '1';
            // Edited := False;
          end;
          if not TnnzJournalNodeInfo(Node.Data).AllowItog then
            TnnzJournalNodeInfo(Node.Data).AllowItog :=
              AnsiSameText(JournalAdmin, 'Полный') or
              (Query.FieldByName('teacher_edit').AsString = '1');
          if TnnzJournalNodeInfo(Node.Data).AllowItog then
            TnnzJournalNodeInfo(Node.Data).AllowItog :=
              TnnzJournalNodeInfo(Node.Data).TransferCause = '';
          // Заявка 2235:
          // Задача: закрывать Итоговые оценки для удаления и редактирования, если закрыта последняя дата учебного периода.
          // Например, усли учебный период с 07.04.2011 по 25.05.2011 и выставлена дата закрытия - 25.05.2011 (и позднее),
          // в этом случае Итоговые оценки закрыты для измениения и удаления. Если дата закрытия будет 24.05.2011 или ранее,
          // то Итоговые оценки доступны для измениения и удаления.
          if TnnzJournalNodeInfo(Node.Data).AllowItog then
            TnnzJournalNodeInfo(Node.Data).AllowItog := CurTermEnd > DateLockTerm;
        end
        else
          case Query.FieldByName('LessonID').AsInteger of
            1:
              Column := YearColumn; // год
            2:
              Column := YearExamColumn; // Зачёт/экзамен (год)
            3:
              Column := YearTotalColumn; // Итоговая оценка (год)
            7:
              Column := GetItogColumn(Trimestr1Column); // триместр
            9:
              Column := GetItogColumn(Exam1Column); // экзамен
            8:
              Column := GetItogColumn(Itog1Column); // итог
            99:
              Column := AVGColumn; // среднее
          end; // case
        // Node.Values[Column.ItemIndex] := Query.FieldByName('Grade').AsString;
        Node.Values[Column.ItemIndex] :=
          DecimalReplace(Query.FieldByName('Grade').AsString);
        with TnnzJournalNodeInfo(Node.Data).CellInfo[Column.ItemIndex - 1]^ do
        begin
          if (Query['holidayname'] <> '') and
            (Query['HolidayChangeDate'] = '') then
            GradeComment := Query.FieldByName('holidayname').AsString
          else
            GradeComment := Query.FieldByName('GradeComment').AsString;
          if Query.FieldByName('Grade').AsString <> '' then
          // раньше GradeMid и GradeDate присваивались CellInfo для Column2
          begin
            GradeMid := Query.FieldByName('GradeMid').AsInteger;
            GradeDate := Query.FieldByName('GradeDate').AsDateTime;
          end;
        end;
        Query.Next;
      end; // while
      if not AvgNodeExist then
      begin
        Node := Grid.Insert(nil);
        Node.Data := TnnzJournalNodeInfo.Create;
        TnnzJournalNodeInfo(Node.Data).middle_grade := 99999;
        Node.Values[StudentColumn.ItemIndex] := 'Ср. балл';
        TnnzJournalNodeInfo(Node.Data).CellInfoCount := Grid.ColumnCount;
        with TnnzJournalNodeInfo(Node.Data) do
        begin
          TransferDate := EncodeDate(1913, 1, 1);
          TransferCause := '';
          AllowItog := False;
          // for I := Trimestr1Column.ItemIndex-1 to Year4Column.ItemIndex-1 do CellInfo[I].Edited := False;
        end; // with
      end; // if
      SetColumnWidth(AVGColumn);
      SetColumnWidth(Trimestr1Column, '    00');
      SetColumnWidth(Itog1Column);
      SetColumnWidth(Exam1Column);
      SetColumnWidth(Trimestr2Column, '    00');
      SetColumnWidth(Itog2Column);
      SetColumnWidth(Exam2Column);
      SetColumnWidth(Trimestr3Column, '    00');
      SetColumnWidth(Itog3Column);
      SetColumnWidth(Exam3Column);
      SetColumnWidth(Trimestr4Column, '    00');
      SetColumnWidth(Itog4Column);
      SetColumnWidth(Exam4Column);
      SetColumnWidth(YearColumn, '    00');
      SetColumnWidth(YearExamColumn, '    00');
      SetColumnWidth(YearTotalColumn, '    00');
      // Прячем лишние колонки
      chkVisibleItog.Properties.Items.Clear;
      for i := Trimestr1Column.ItemIndex to YearTotalColumn.ItemIndex do
      begin
        Grid.Columns[i].Visible := False;
        with chkVisibleItog.Properties.Items.Add do
        begin
          Description := Grid.Columns[i].Caption.Text;
          Tag := -Grid.Columns[i].Tag;
          Enabled := False;
        end;
      end;
      if YearEdit.Properties.Items.Count > 0 then
      begin
        SLTypes := TStringList.Create;
        try
          with xpDataModule.CreateDataSetFromSQL
            ('SELECT do_grade_types FROM xp_visible_itog WHERE mid = ' +
            IntToStr(App.UserInfo.ID) + ' AND trmid = ' + IntToStr(Trid)) do
            try
              if not IsEmpty then
                SepStrToStringList(Fields[0].AsString, ',', SLTypes);
            finally
              Free;
            end;
          SL := TStringList.Create;
          try
            with xpDataModule.CreateDataSetFromSQL
              ('SELECT trmid, term_grade_types FROM terms'#13#10 +
              'WHERE `year` = ' + GetStrFromCombo(YearEdit) + #13#10 +
              'and term_type_id = (select t.term_type_id from terms t where t.trmid = '
              + GetStrFromCombo(TrimestrEdit) + ')') do
              try
                while not Eof do
                begin
                  SepStrToStringList(FieldByName('term_grade_types')
                    .AsString, ',', SL);
                  for i := 0 to SL.Count - 1 do
                  begin
                    if SL[i] <> '' then
                      case SL[i][1] of
                        '7':
                          Column := GetItogColumnByTerm(Trimestr1Column,
                            Fields[0].AsInteger); // триместр
                        '9':
                          Column := GetItogColumnByTerm(Exam1Column,
                            Fields[0].AsInteger); // экзамен
                        '8':
                          Column := GetItogColumnByTerm(Itog1Column,
                            Fields[0].AsInteger); // итог
                      else
                        Column := nil;
                      end // case
                    else
                      Column := nil;
                    if Assigned(Column) then
                    begin
                      if Column.ItemIndex - Trimestr1Column.ItemIndex <
                        chkVisibleItog.Properties.Items.Count then
                        chkVisibleItog.Properties.Items
                          [Column.ItemIndex - Trimestr1Column.ItemIndex]
                          .Enabled := True;
                      // Номер триместра (0..3) + '|' + Тип колонки (term_grade_type)
                      if SLTypes.IndexOf
                        (IntToStr((Column.ItemIndex - Trimestr1Column.ItemIndex)
                        div 3) + '|' + SL[i][1]) >= 0 then
                      begin
                        Column.Visible := True;
                        chkVisibleItog.States
                          [Column.ItemIndex - Trimestr1Column.ItemIndex] :=
                          cbsChecked;
                      end;
                    end; // if
                  end; // for
                  Next;
                end; // while
              finally
                Free;
              end; // try

            // Годовые оценки
            v := xpDataModule.GetValueFromSQL
              ('select year_grade_types from school_year where xp_key = ' +
              IntToStr(Integer(YearEdit.Properties.Items.Objects
              [YearEdit.ItemIndex])));
            year_gr_types := VarToStr(v);
            if year_gr_types <> '' then
            begin
              YTypes := TStringList.Create;
              try
                SepStrToStringList(year_gr_types, ',', YTypes);
                for i := 0 to YTypes.Count - 1 do
                begin
                  case YTypes[i][1] of
                    '1':
                      Column := YearColumn; // Год
                    '2':
                      Column := YearExamColumn; // Зачёт/экзамен
                    '3':
                      Column := YearTotalColumn; // Итоговая оценка
                  else
                    Column := nil;
                  end;
                  if Assigned(Column) then
                  begin
                    chkVisibleItog.Properties.Items
                      [Column.ItemIndex - Trimestr1Column.ItemIndex]
                      .Enabled := True;
                    // Номер триместра (0..3) + '|' + Тип колонки (term_grade_type)
                    if SLTypes.IndexOf('9|' + YTypes[i][1]) >= 0 then
                    begin
                      Column.Visible := True;
                      chkVisibleItog.States
                        [Column.ItemIndex - Trimestr1Column.ItemIndex] :=
                        cbsChecked;
                    end;
                  end;
                end;
              finally
                YTypes.Free;
              end;
            end; // if year_gr_types <> '' ...
          finally
            SL.Free;
          end; // try
        finally
          SLTypes.Free;
        end; // try
      end; // if
      IndicatorForm.AdvCircularProgress.StepBy(1);
      IndicatorForm.AdvCircularProgress.Refresh;
    finally
      // OkButton.Enabled := False;
    end;
    // Grid.Bands[1].ApplyBestFit;
    Grid.SetFocusedNode(FirstNode, []);
    RightPartLoadData;
  finally
    Grid.EndUpdate;
    IndicatorForm.Close;
    IndicatorForm.Free;
    PrintButton.Enabled := True;
  end;
end;

procedure TxpnnzDOJournalForm.NextButtonClick(Sender: TObject);
begin
  GridLoadData;
end;

procedure TxpnnzDOJournalForm.SaveGrade(sh_id, w_id, gr, m_id, comm: string);
var
  e: string;
begin
  gr := AnsiReplaceText(gr, '''', '');
  comm := AnsiReplaceText(comm, '''', '');
  try
    xpDataModule.ExecuteSQL('call xp_upsave_do_journal_grade (' + sh_id + ',' +
      // SHEID
      w_id + ',' + // week_id (instance),
      StringAsSQL(gr) + ',' + // grade
      'null' + ',' + // grade_date
      m_id + ',' + // MID
      IntToStr(App.UserInfo.ID) + ',' + // teacher_mid
      StringAsSQL(copy(comm, 1, 1000)) + // comment
      ')');
    e := VarToStr(xpDataModule.GetValueFromSQL
      ('select ErrMessage from ErrMsg'));
    if e <> '' then
      xpError('Ошибка при сохранении оценки.' + e);
  except  on e: Exception do
    xpError(format('Ошибка при сохранении оценки: %s',[e.Message]));
  end;
end;

procedure TxpnnzDOJournalForm.SaveTermGrade(trmt_id, gr, m_id, comm: string);
var
  e: string;
begin
  if Trid > 0 then
    try
      comm := AnsiReplaceText(comm, '''', '');
      gr := AnsiReplaceText(gr, '''', '');
      xpDataModule.ExecuteSQL('call xp_upsave_do_term_grades (' + IntToStr(Trid)
        + ',' + // строковый id текущего триместра
        trmt_id + ',' + // trmtid
        CourseID + ',' + // CID
        StringAsSQL(gr) + ',' + // grade
        m_id + ',' + // MID
        IntToStr(App.UserInfo.ID) + ',' + // teacher_mid
        'null' + ',' + // grade_date
        StringAsSQL(copy(comm, 1, 1000)) + // comment
        ')');
      e := VarToStr(xpDataModule.GetValueFromSQL
        ('select ErrMessage from ErrMsg'));
      if e <> '' then
        xpError('Ошибка при сохранении итоговой оценки.' + e);
    except on  e: Exception do
      xpError(format('Ошибка при сохранении итоговой оценки: %s',[e.Message]));
    end;
end;

procedure TxpnnzDOJournalForm.SaveYearGrade(y_gr_type_id, gr, m_id,
  comm: string);
var
  e: string;
  year_id: variant;
begin
  if not(AnsiContainsText('123', y_gr_type_id)) then
  begin
    xpWarning('Не удалось определить тип годовой оценки!');
    Exit;
  end;

  if Trid > 0 then
  begin
    year_id := xpDataModule.GetValueFromSQL
      ('select `year` from terms where trmid = ' + IntToStr(Trid));
    if VarIsNull(year_id) then
    begin
      xpWarning('Не удалось определить учебный год!');
      Exit;
    end;

    try
      comm := AnsiReplaceText(comm, '''', '');
      gr := AnsiReplaceText(gr, '''', '');
      xpDataModule.ExecuteSQL('call xp_upsave_year_grades (' + VarToStr(year_id)
        + ',' + // trmid
        y_gr_type_id + ',' + // trmtid
        CourseID + ',' + // CID
        StringAsSQL(gr) + ',' + // grade
        m_id + ',' + // MID
        IntToStr(App.UserInfo.ID) + ',' + // teacher_mid
        'null' + ',' + // grade_date
        StringAsSQL(copy(comm, 1, 1000)) + ',' + // comment
        '''A'')'); // ed_type
      e := VarToStr(xpDataModule.GetValueFromSQL
        ('select ErrMessage from ErrMsg'));
      if e <> '' then
        xpError('Ошибка при сохранении итоговой оценки.' + e);
    except  on e: Exception do
      xpError(format('Ошибка при сохранении итоговой оценки: %s',[e.Message]));
    end;
  end;
end;

procedure TxpnnzDOJournalForm.GridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Node: TcxTreeListNode;
  Column: TcxTreeListColumn;
  Index: Integer;
begin
  inherited;
  Hint := '';
  if Grid.HitTest.HitAtBandHeader then
  begin
    Index := BandHints.IndexOfObject(Grid.HitTest.HitBand);
    if Index > -1 then
    begin
      if Grid.Hint <> BandHints[Index] then
      begin
        Application.CancelHint;
        Grid.Hint := BandHints[Index];
      end;
    end
    else
      Grid.Hint := '';
  end
  else if Grid.HitTest.HitAtNode then
  begin
    Node := Grid.GetNodeAt(X, Y);
    if Node <> nil then
    begin
      Column := Grid.FocusedColumn;
      if Column <> nil then
      begin
        if Column.Position.BandIndex = 1 then
        // для комментариев к итоговым оценкам.
        begin
          Column := Grid.ColumnByName(Column.Name);
          if Column <> nil then
            Grid.Hint := GC_MakeHint(GetCellInfo(Node, Column.ItemIndex - 1).GradeComment);
        end
        else // для комментариев к обычным оценкам.
          if (Column.ItemIndex - 1 >= 0) then
          Grid.Hint := GC_MakeHint(GetCellInfo(Node, Column.ItemIndex - 1).GradeComment);
      end;
    end
    else
      Grid.Hint := '';
  end
  else
    Grid.Hint := '';
end;

procedure TxpnnzDOJournalForm.GridEdited(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn);
begin
  inherited;
  // OkButton.Enabled := not FReadOnly;
  TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[AColumn.ItemIndex - 1]
    .GradeMid := App.UserInfo.ID;
  AvgGradeForCol(AColumn);
  // В некоторых случаях, напр., при выходе из ячейки по Enter к моменту этого события менялся FocusedNode
  // в результате Edited = True присваивалось не тому
  // перенёс присвоение в EditValueChanged.
  // TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[AColumn.ItemIndex - 1].Edited :=  True;
end;

procedure TxpnnzDOJournalForm.AvgGradeForCol(AColumn: TcxTreeListColumn);
var
  v_a: array of single;

  procedure AddToArray(node_string: string);
  var
    j, v: Integer;
  begin
    if node_string <> '' then
    begin
      for j := 1 to length(node_string) do
        if TryStrToInt(node_string[j], v) then
        begin
          SetLength(v_a, length(v_a) + 1);
          v_a[length(v_a) - 1] := v;
        end;
    end;
  end;

var
  Node: TcxTreeListNode;
begin
  Grid.BeginUpdate;
  try
    Node := Grid.TopNode;

    SetLength(v_a, 0);
    while (Node <> nil) and (TnnzJournalNodeInfo(Node.Data).middle_grade
      <> 99999) do
    begin
      AddToArray(VarToStr(Node.Values[AColumn.ItemIndex]));
      Node := Node.GetNext;
    end;
    if length(v_a) = 0 then
      Node.Values[AColumn.ItemIndex] := ''
    else
      Node.Values[AColumn.ItemIndex] :=
        DecimalReplace(Format('%.2f', [Mean(v_a)]));
  finally
    Grid.EndUpdate;
  end;
end;

procedure TxpnnzDOJournalForm.AvgGradeForNode(AColumn: TcxTreeListColumn;
  ANode: TcxTreeListNode);
var
  mid: Integer;
  v: variant;
  X: double;
begin
  Grid.BeginUpdate;
  try
    mid := TnnzJournalNodeInfo(ANode.Data).mid;
    if JournalOnDate.Checked then // Если журнал за дату - среднее за дату
      v := xpDataModule.GetValueFromSQL
        ('select round(xp_avg_grade(xp_fget_do_mid_grades(' + CourseID + ',' +
        IntToStr(mid) + ', ' + DateAsSQL(BegDateEdit.Date) + ',' +
        DateAsSQL(BegDateEdit.Date) + ')), 2) as f')
    else // Если журнал за триместр
      v := xpDataModule.GetValueFromSQL
        ('select round(xp_avg_grade(xp_fget_do_mid_grades(' + CourseID + ',' +
        IntToStr(mid) + ', ' + DateAsSQL(CurTermBeg) + ',' +
        DateAsSQL(CurTermEnd) + ')), 2) as f');

    if (VarIsNull(v)) or (v = 0) then
      ANode.Values[AVGColumn.ItemIndex] := ''
    else
    begin
      X := VarAsType(v, varDouble);
      ANode.Values[AVGColumn.ItemIndex] := DecimalReplace(Format('%.2f', [X]));
    end;
  finally
    Grid.EndUpdate;
  end;
end;

procedure TxpnnzDOJournalForm.BegDateEditPropertiesChange(Sender: TObject);
begin
  inherited;
  if JournalOnDate.Checked then
  begin
    JDate := BegDateEdit.Date;
    FormLoadDataForFixDate;
  end;
end;

procedure TxpnnzDOJournalForm.GridDblClick(Sender: TObject);
begin
  if Grid.HitTest.HitAtColumn and Grid.HitTest.HitAtNode and
    (Grid.FocusedColumn <> NumColumn) and not GetCellInfo(Grid.FocusedNode,
    Grid.FocusedColumn.ItemIndex - 1).isHoliday_with_nocarry and
    (TnnzJournalNodeInfo(Grid.FocusedNode.Data).middle_grade <> 99999) then
    CallCommentEdit;
end;

procedure TxpnnzDOJournalForm.GridDeletion(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode);
begin
  TnnzJournalNodeInfo(ANode.Data).Free;
  ANode.Data := nil;
end;

procedure TxpnnzDOJournalForm.CallCommentEdit;

  procedure SetComment(StartColumn: TcxTreeListColumn; const Comment: String);
  var
    Column: TcxTreeListColumn;
  begin
    Column := GetCurTrimestrColumn(StartColumn);
    if Column = Grid.FocusedColumn then
      TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[Column.ItemIndex - 1]
        .GradeComment := Comment;
  end;

var
  Comment,
  Note : string;
  i,w: Integer;
  fNode: TcxTreeListNode;
  Column: TcxTreeListColumn;
  s, tmp: string;
  Allow: Boolean;
begin
  if Grid.FocusedNode <> nil then
  begin
    Allow := False;
    if (Grid.FocusedColumn <> nil) and
      (TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo
      [Grid.FocusedColumn.ItemIndex - 1] <> nil) then
    begin
      if IsItogColumn(Grid.FocusedColumn) then
        Allow := AllowEditTotalGrade(Grid.FocusedColumn, Grid.FocusedNode)
      else
        Allow := (Grid.FocusedColumn.ItemIndex < TnnzJournalNodeInfo
          (Grid.FocusedNode.Data).CellInfoCount) and
          TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo
          [Grid.FocusedColumn.ItemIndex - 1].isAllowTicher and
          not(TnnzJournalNodeInfo(Grid.FocusedNode.Data)
          .CellInfo[Grid.FocusedColumn.ItemIndex - 1].isOut);
    end;
    if Allow or (CheckedCell.Count > 0) or (AnsiSameText(JournalAdmin, 'Чтение')) then
    begin
      if ((Grid.FocusedColumn.Tag > 0) and
      // (Grid.FocusedColumn.Position.BandIndex=0) and
      (TColumnInfo(Grid.FocusedColumn.Tag).MyColumnTag = MyColumnTag)) or IsItogColumn(Grid.FocusedColumn) then
      begin
        if (Grid.FocusedColumn.Tag > 0) and
          (TColumnInfo(Grid.FocusedColumn.Tag).MyColumnTag = MyColumnTag) then
          Comment := TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[Grid.FocusedColumn.ItemIndex - 1].GradeComment
        else
        begin
          if Grid.FocusedColumn.ItemIndex < YearColumn.ItemIndex then
          begin
            Comment := GetComment(Trimestr1Column);
            if Comment = '' then
              Comment := GetComment(Itog1Column);
            if Comment = '' then
              Comment := GetComment(Exam1Column);
          end
          else
          begin
            Comment := GetCellInfo(Grid.FocusedNode, Grid.FocusedColumn.ItemIndex - 1).GradeComment;
          end;
        end;
        if Allow and not IsItogColumn(Grid.FocusedColumn) and (GetCellInfo(Grid.FocusedNode, Grid.FocusedColumn.ItemIndex - 1).LessonDate > Now)  then
        begin
          Allow := false;
          xpWarning('Это занятие еще не проведено!');
          exit;
        end;
        if (CheckedCell.Count > 0)  then
        begin
          if InputComment('Отмечено позиций: ' + IntToStr(CheckedCell.Count) +'. Укажите комментарий к ним.', Comment) then
          begin
            if not FReadOnly then
            begin
              for i := 0 to CheckedCell.Count - 1 do
              begin
                fNode := Grid.TopNode;
                tmp := ExtractWord(1, CheckedCell[i], ['z']);
                while Assigned(fNode) and
                  (IntToStr(TnnzJournalNodeInfo(fNode.Data).middle_grade)
                  <> tmp) do
                  fNode := fNode.GetNext;
                if (fNode <> nil) and (Grid.FocusedColumn.Tag > 0) and
                  // (Grid.FocusedColumn.Position.BandIndex=0) and
                  (TColumnInfo(Grid.FocusedColumn.Tag)
                  .MyColumnTag = MyColumnTag) then
                begin
                  Column := Grid.ColumnByName
                    (ExtractWord(2, CheckedCell[i], ['z']));
                  if  (GetCellInfo(fNode, Column.ItemIndex - 1).LessonDate <= Now)  then
                  begin
                    TnnzJournalNodeInfo(fNode.Data).CellInfo[Column.ItemIndex - 1]
                      .GradeComment := Comment;
                    TnnzJournalNodeInfo(fNode.Data).CellInfo[Column.ItemIndex - 1]
                      .GradeDate := Now;
                    SaveGrade(ExtractWord(2, Column.Name, ['c']),
                      ExtractWord(1, Column.Name, ['c']),
                      Trim(VarToStr(fNode.Values[Column.ItemIndex])),
                      IntToStr(TnnzJournalNodeInfo(fNode.Data).mid), Comment);
                  end;
                end;
              end; // for
            end
            else
              xpWarning(
                'Недостаточно прав для добавления/редактирования комментария.');
            CheckedCell.Clear;
            // OkButton.Enabled := not FReadOnly;
          end;
        end
        else
        begin // Если не отмечено несколько записей
          i := GetCellInfo(Grid.FocusedNode, Grid.FocusedColumn.ItemIndex -
            1).GradeMid;
          if i > 0 then
          begin
            s := VarToStr(xpDataModule.GetValueFromSQL
              ('SELECT CONCAT(LastName, '' '', FirstName, '' '', Patronymic) FIO FROM people WHERE MID = '
              + IntToStr(i)));
            if s <> '' then
              s := 'Оценка поставлена:' + sLineBreak + s + sLineBreak +
                DateTimeToStr(GetCellInfo(Grid.FocusedNode,
                Grid.FocusedColumn.ItemIndex - 1).GradeDate) + sLineBreak;
          end
          else
            s := '';
          Note:=GC_Split(Comment);
          w := 0;
          if AnsiSameText(JournalAdmin, 'Чтение') then
          // Если "только чтение" - просто показать юзеру комментарий
          begin
            InputCommentWithNote(s + 'Комментарий к оценке', Comment, Note, w , True)
          end
          else if InputCommentWithNote(s + 'Укажите комментарий к оценке', Comment, Note, w) then
          begin
            Comment := GC_Combine(Comment,Note);
            if not FReadOnly then
            begin
              if (Grid.FocusedColumn.Tag > 0) and
                // (Grid.FocusedColumn.Position.BandIndex=0) and
                (TColumnInfo(Grid.FocusedColumn.Tag)
                .MyColumnTag = MyColumnTag) then
              begin
                TnnzJournalNodeInfo(Grid.FocusedNode.Data)
                  .CellInfo[Grid.FocusedColumn.ItemIndex - 1].GradeComment
                  := Comment;
                TnnzJournalNodeInfo(Grid.FocusedNode.Data)
                  .CellInfo[Grid.FocusedColumn.ItemIndex - 1].GradeDate := Now;
                SaveGrade(ExtractWord(2, Grid.FocusedColumn.Name, ['c']),
                  ExtractWord(1, Grid.FocusedColumn.Name, ['c']),
                  Trim(VarToStr(Grid.FocusedNode.Values
                  [Grid.FocusedColumn.ItemIndex])),
                  IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data)
                  .mid), Comment);
              end
              else
              begin
                if Grid.FocusedColumn.ItemIndex < YearColumn.ItemIndex then
                begin
                  SetComment(Trimestr1Column, Comment);
                  SetComment(Itog1Column, Comment);
                  SetComment(Exam1Column, Comment);
                  SaveTermGrade(GetTrmtidByColumt(Grid.FocusedColumn),
                    Trim(VarToStr(Grid.FocusedNode.Values
                    [Grid.FocusedColumn.ItemIndex])), // grade
                    IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid),
                    // MID
                    Trim(Comment)); // comm
                end
                else
                begin
                  TnnzJournalNodeInfo(Grid.FocusedNode.Data)
                    .CellInfo[Grid.FocusedColumn.ItemIndex - 1].GradeComment
                    := Comment;
                  SaveYearGrade(GetYGrTypeidByColumt(Grid.FocusedColumn),
                    Trim(VarToStr(Grid.FocusedNode.Values
                    [Grid.FocusedColumn.ItemIndex])), // grade
                    IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid),
                    // MID
                    Trim(Comment)); // comm
                end;
              end;
            end
            else
              xpWarning(
                'Недостаточно прав для добавления/редактирования комментария.');
          end; // if (указать комментарий если не только чтение)
        end; // if (если не отмечено несколько записей)
      end;
    end; // if Allow or (CheckedCell.Count > 0) ...
  end;
end;

procedure TxpnnzDOJournalForm.GridCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  i: Integer;
  Allow: Boolean;
  showfocused: boolean;
begin
  showfocused := AViewInfo.Node.Focused AND ((AViewInfo.Column=Grid.FocusedColumn) OR (AViewInfo.Column.Position.BandIndex = 0));
  if not showFocused and (AViewInfo.Node.Data <> nil) then
  begin
    ACanvas.Font.Color := clBlack;
    if IsItogColumn(AViewInfo.Column) then
    begin
      if AllowEditTotalGrade(AViewInfo.Column, AViewInfo.Node) then
        ACanvas.Brush.Color := clCream
      else if TnnzJournalNodeInfo(AViewInfo.Node.Data).TransferCause <> '' then
        ACanvas.Brush.Color := $DDE4FC
      else
        ACanvas.Brush.Color := clWhite;
      if (AViewInfo.Column.Position.BandIndex = 1) and
        (AViewInfo.Node <> Grid.FocusedNode) and
        (GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
        .GradeComment <> '') and
        (GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
        .GradeComment <> #127) then
        ACanvas.Brush.Color := clSilver;
    end
    else if (AViewInfo.Column.Tag > 0) and
      // (AviewInfo.Column.Position.BandIndex=0) and
      (TColumnInfo(AViewInfo.Column.Tag).MyColumnTag = MyColumnTag) and
      (TnnzJournalNodeInfo(AViewInfo.Node.Data).middle_grade <> 99999) then
    begin
      Allow := GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
        .isAllowTicher;
      if (Allow) and (AViewInfo.Node <> Grid.FocusedNode) then
        ACanvas.Brush.Color := clCream
      else
        ACanvas.Brush.Color := clWhite;
      Allow := GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
        .isHoliday_with_nocarry;
      if Allow then
        ACanvas.Brush.Color := $FE9B9B
      else
      begin
        Allow := GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
          .isHoliday_with_carry;
        if Allow then
          ACanvas.Brush.Color := clGreen
        else
        begin
          Allow := GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
            .isChangeComments;
          if Allow then
          begin
            if BandHints[BandHints.IndexOfObject(AViewInfo.Band)
              ] = 'Отмена занятия' then
              ACanvas.Brush.Color := $FE9B9B
            else
              ACanvas.Brush.Color := clMoneyGreen;
          end
          else
          begin
            if AViewInfo.Column.Position.BandIndex = 1 then
            begin
              if (AViewInfo.Node <> Grid.FocusedNode) then
              begin
                ACanvas.Brush.Color := $C9D5FF;
                if VarToStr(AViewInfo.Node.Values[AViewInfo.Column.ItemIndex +
                  1]) <> '' then
                  ACanvas.Brush.Color := clSilver;
              end;
            end
            else
            begin
              Allow := not GetCellInfo(AViewInfo.Node,
                AViewInfo.Column.ItemIndex - 1).isOut;
              if Allow then
              begin
                if (GetCellInfo(AViewInfo.Node, AViewInfo.Column.ItemIndex - 1)
                  .GradeComment <> '') and (AViewInfo.Column.Tag > 0) and
                  // (AViewInfo.Column.Position.BandIndex=0) and
                  (TColumnInfo(AViewInfo.Column.Tag)
                  .MyColumnTag = MyColumnTag) then
                  ACanvas.Brush.Color := clSilver;
                if CheckedCell.Count > 0 then
                  for i := 0 to CheckedCell.Count - 1 do
                    if (ExtractWord(1, CheckedCell[i], ['z'])
                      = IntToStr(TnnzJournalNodeInfo(AViewInfo.Node.Data)
                      .middle_grade)) and
                      (ExtractWord(2, CheckedCell[i], ['z'])
                      = AViewInfo.Column.Name) then
                      ACanvas.Brush.Color := clRed;
              end
              else
                ACanvas.Brush.Color := $DDE4FC;
            end; // if
          end; // if
        end; // if
      end; // if
      if (AViewInfo.Column = StudentColumn) and Assigned(AViewInfo.Node.Data) and
        (TnnzJournalNodeInfo(AViewInfo.Node.Data).HaveTransfer) then
        ACanvas.Font.Color := clRed;
    end;
  end
  else
    begin
      ACanvas.Brush.color := clHighLight;
      ACanvas.Font.Color := clHighlightText;
    end;
  if AViewInfo.Column = AVGColumn then
    ACanvas.Brush.Color := clMedGray;
  if Assigned(AViewInfo.Node.Data) and
    (TnnzJournalNodeInfo(AViewInfo.Node.Data).middle_grade = 99999) then
    ACanvas.Brush.Color := clMedGray;

end;

procedure TxpnnzDOJournalForm.GridCustomDrawHeaderCell
  (Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListHeaderCellViewInfo; var ADone: Boolean);
var
  // Band: TcxTreeListBand;
  Column: TcxTreeListColumn;
begin
  Column := TcxTreeListHeaderCellViewInfoAccess(AViewInfo)
    .Item as TcxTreeListColumn;
  if (Column.Tag > 0) and
  // (Column.Position.BandIndex=0) and
  (TColumnInfo(Column.Tag).MyColumnTag = MyColumnTag)
    and (Column.Position.Band.Styles.Header = cxDZStyle) then
    ACanvas.Font.Style := [fsBold];
  // Заявка 2236
  if Column=grid.FocusedColumn then
    begin
      ACanvas.Font.Color := clHighlightText;
      ACanvas.Brush.Color := clHighlight;
    end
  else
  begin
      ACanvas.Font.Color := clHighlightText;
      ACanvas.Brush.Color := clBtnFace;
      ACanvas.Font.Color := clBlack;
  if (Column.Tag > 0) and
  // (Column.Position.BandIndex=0) and
  (TColumnInfo(Column.Tag).MyColumnTag = MyColumnTag)
    and (TColumnInfo(Column.Tag).FullLessonDate <= DateLockCurrent) then
    ACanvas.Font.Color := clRed;
  end;
  { Это не работает
    if TcxTreeListHeaderCellViewInfoAccess(AViewInfo).Item is TcxTreeListBand then
    begin
    Band := TcxTreeListBand(TcxTreeListHeaderCellViewInfoAccess(AViewInfo).Item);
    if (Band.Columns[0].Tag > 0) and (TColumnInfo(Band.Columns[0].Tag).MyColumnTag = MyColumnTag) then
    if (Band.Styles.Header = cxDZStyle) then
    begin
    cxApplyViewParams(ACanvas, AViewInfo.ViewParams);
    ACanvas.Font.Style := [fsBold];
    ACanvas.FillRect(AViewInfo.VisibleRect);
    ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.VisibleRect, 36, True);   //4+32=36 - по центру и верт. и гориз.
    ACanvas.FrameRect(AViewInfo.VisibleRect, clBlack, 1);
    ADone := True;
    end;
    end; }
end;

procedure TxpnnzDOJournalForm.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Node: TcxTreeListNode;
  Column: TcxTreeListColumn;
  s: string;
  i: Integer;
  B: Boolean;
begin
  if FReadOnly then
    Exit;
  if (Button = mbLeft) and (ssCtrl in Shift) and
    (((Grid.FocusedColumn.Tag > 0) and
    // (Grid.FocusedColumn.Position.BandIndex=0) and
    (TColumnInfo(Grid.FocusedColumn.Tag)
    .MyColumnTag = MyColumnTag)) or IsItogColumn(Grid.FocusedColumn)) and
    AllowEdit(Grid.FocusedColumn) then
  begin
    PopupMenu1.Popup(TxpForm(Self).Left + X, TxpForm(Self).Top + Y);
    // PopupMenu1.Popup(TxpForm(Self.Owner).Left + Grid.Left + X, TxpForm(Self.Owner).Top + Grid.Top + Y);
    Exit;
  end;
  if (Button = mbRight) and (Grid.FocusedColumn <> NumColumn) and
    (Grid.FocusedColumn <> StudentColumn) and (Grid.FocusedColumn <> AVGColumn)
    and not IsItogColumn(Grid.FocusedColumn) then
  begin
    Node := Grid.GetNodeAt(X, Y);
    if (Node <> nil) and (TnnzJournalNodeInfo(Node.Data).middle_grade <>
      99999) then
    begin
      Column := Grid.FocusedColumn;
      if Column <> nil then
      begin
        if GetCellInfo(Node, Column.ItemIndex - 1).isAllowTicher then
        begin
          if ssCtrl in Shift then
          begin
            B := False;
            Node := Grid.TopNode;
            while (Node <> nil) and (TnnzJournalNodeInfo(Node.Data).middle_grade
              <> 99999) do
            begin
              s := IntToStr(TnnzJournalNodeInfo(Node.Data).middle_grade) + 'z' +
                Column.Name;
              B := CheckedCell.IndexOf(s) < 0;
              if B then
                Break;
              Node := Node.GetNext;
            end;
            CheckedCell.Clear;
            if B then
            begin
              Node := Grid.TopNode;
              while (Node <> nil) and
                (TnnzJournalNodeInfo(Node.Data).middle_grade <> 99999) do
              begin
                s := IntToStr(TnnzJournalNodeInfo(Node.Data).middle_grade) + 'z'
                  + Column.Name;
                CheckedCell.Add(s);
                Node := Node.GetNext;
              end;
            end;
          end
          else
          begin
            s := IntToStr(TnnzJournalNodeInfo(Node.Data).middle_grade) + 'z' +
              Column.Name;
            i := CheckedCell.IndexOf(s);
            if i > -1 then
              CheckedCell.Delete(i)
            else
              CheckedCell.Add(s);
          end;
        end;
      end;
    end;
    Grid.Repaint;
  end;
end;

function TxpnnzDOJournalForm.IsFIOColumn(Column: TcxTreeListColumn): Boolean;
begin
  result := False;
  if Column <> nil then
    result := (Column = NumColumn) or (Column = StudentColumn);
end;

function TxpnnzDOJournalForm.IsItogColumn(Column: TcxTreeListColumn): Boolean;
begin
  result := False;
  if Column <> nil then
    result := (Column.ItemIndex >= Trimestr1Column.ItemIndex) and
      (Column.ItemIndex <= YearTotalColumn.ItemIndex);
end;

procedure TxpnnzDOJournalForm.GridClick(Sender: TObject);
begin
  if Assigned(Grid.FocusedNode) then
  begin
    if Grid.HitTest.HitAtColumnHeader and (Grid.HitTest.HitColumn <> NumColumn)
      and not GetCellInfo(Grid.FocusedNode, Grid.HitTest.HitColumn.ItemIndex -
      1).isHoliday_with_nocarry then
      SetHomeWork(Grid.HitTest.HitColumn,
        Grid.Bands[Grid.HitTest.HitColumn.Position.BandIndex]);
    if Grid.HitTest.HitAtBandHeader and
      (Grid.HitTest.HitBand.Columns[0] <> NumColumn) and
      not GetCellInfo(Grid.FocusedNode, Grid.HitTest.HitBand.Columns[0]
      .ItemIndex - 1).isHoliday_with_nocarry then
      SetTemaPlanner(Grid.HitTest.HitBand);
  end;
  if Grid.HitTest.HitAtColumn and Grid.HitTest.HitAtNode and
    (Grid.FocusedNode <> nil) and (Grid.HitTest.HitColumn = StudentColumn) and
    (TnnzJournalNodeInfo(Grid.FocusedNode.Data).middle_grade <> 99999) then
    ShowInfo(Grid.FocusedNode);
end;

procedure TxpnnzDOJournalForm.SetTemaPlanner(Band: TcxTreeListBand);
var
  Form: TxpTemaPlannerEditForm;
  less_d: TDateTime;
  Allowt: Boolean;
  Index: Integer;
  v: variant;
  SQL: string;
begin
  if Band.Columns[0].Tag <= 0 then
    Exit;
  Allowt := not AnsiSameText(JournalAdmin, 'Нет');
  if not Allowt then
  begin
    // Allowt := TColumnInfo(Band.Columns[0].Tag).TeacherMid = App.UserInfo.ID;
    TColumnInfo(Band.Columns[0].Tag).TeacherMids.Sort;
    Allowt := TColumnInfo(Band.Columns[0].Tag)
      .TeacherMids.Find(IntToStr(App.UserInfo.ID), Index);
    TColumnInfo(Band.Columns[0].Tag).TeacherMids.Sorted := False;
  end;
  if (Grid.FocusedNode <> nil) and (copy(Band.Columns[0].Name, 1, 1) = 'c') then
  begin
    less_d := 0;
    if TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfoCount > 0 then
      less_d := TnnzJournalNodeInfo(Grid.FocusedNode.Data)
        .CellInfo[Band.Columns[0].ItemIndex - 1].LessonDate;
    if less_d < 10 then
      less_d := ExistsTrueDate(Band.Columns[0].ItemIndex - 1, less_d);
    Form := TxpTemaPlannerEditForm.Create(Self);
    try
      Form.LessonTypeID := StrToIntDef(ExtractWord(1, Band.Caption.Text,
        ['#']), 0);
      Form.LessonTitleID := StrToIntDef(ExtractWord(2, Band.Caption.Text,
        ['#']), 0);
      Form.cid := Integer(PredmetEdit.Properties.Items.Objects
        [PredmetEdit.ItemIndex]);
      Form.sheid := StrToIntDef(ExtractWord(2, Band.Columns[0].Name, ['c']), 0);
      Form.instance := StrToIntDef(ExtractWord(1, Band.Columns[0].Name,
        ['c']), 0);
      Form.year_id := Integer(YearEdit.Properties.Items.Objects
        [YearEdit.ItemIndex]);
      // комбобокс уч. года корректно выставляется и при запросе журнала на дату
      v := xpDataModule.GetValueFromSQL
        ('select coalesce(m.teacher,max(o.teacher_mid)) as teacher_mid'#13#10 +
        'from nnz_do_schedule_modules m '#13#10 +
        'inner join xp_do_organizations o on (m.module_id = o.xp_do_oid)'#13#10 +
        'where m.sheid = ' + IntToStr(Form.sheid) + #13#10 +
        'and m.week_id = ' + IntToStr(Form.instance));
      if not(VarIsNull(v)) then
        Form.Teacher_id := v;
      Form.PredmetLabel.Caption := PredmetEdit.Text;
      Form.cxHomeWorkTabSheet.TabVisible := False;
      Form.Day := DateTimeToStr(less_d);
      Form.cxpagePlanAndHomeWork.ActivePageIndex := 0;
      if TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfoCount > 0 then
        Form.isAllowEdit := Allowt and
          ExistsAllowTeacher(Band.Columns[0].ItemIndex - 1);
      // TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[Band.Columns[0].ItemIndex - 1].isAllowTicher;
      // Вышестоящая строчка закомментарена и изменена не в первый раз.
      // isAllowTicher у конкретной клеточки м.б. и false, если чел, например, занимается в подгруппе.
      // Надо проверять, есть ли у кого-то вообще в этой колонке допуск.
      Form.ShowModal;
      if Form.OkResult then
      begin
        if Form.et > 0 then
        begin
          Band.Caption.Glyph.LoadFromResourceName(HInstance,
            'et' + IntToStr(Integer(Form.EventTypeEdit.Properties.Items.Objects
            [Form.EventTypeEdit.ItemIndex])));
          Band.Caption.Text := IntToStr(Form.et) + '#' + Form.module_id_str;
        end
        else
        begin
          Band.Caption.Glyph.LoadFromResourceName(HInstance, 'et0');
          Band.Caption.Text := '0#0';
        end;
        BandHints.Delete(BandHints.IndexOfObject(Band));
        BandHints.AddObject(Form.otitle, Band);
        if pnlShModFact.Visible then
          begin
          SQL := format(
            'UPDATE  nnz_do_sh_module_fact f '+
            ' LEFT JOIN nnz_do_schedule_modules m ON f.sheid=m.sheid AND f.week_id=m.week_id '+
            ' SET f.event_type=m.event_type, f.module_id=m.module_id, f.work_count=m.work_count '+
            'WHERE f.sheid=%d AND f.week_id=%d ',
            [Form.sheid,Form.instance]);
          xpDataModule.ExecuteSQL(SQL);
          RightPartLoadData;
          end;

      end;
    finally
      Form.Free;
    end;
  end;
end;

procedure TxpnnzDOJournalForm.SetHomeWork(Column: TcxTreeListColumn;
  Band: TcxTreeListBand);
var
  Form: TxpnnzHomeWorkEditForm;
  Allowt: Boolean;
  Style: TcxStyle;
  Index: Integer;
  Node: TcxTreeListNode;
  pcInfo: PnnzJournalCellInfo;
  gyStr: string;
begin
  if Column.Tag <= 0 then
    Exit;
  Allowt := not AnsiSameText(JournalAdmin, 'Нет');
  if not Allowt then
  begin
    // Allowt := TColumnInfo(Column.Tag).TeacherMid = App.UserInfo.ID;
    TColumnInfo(Band.Columns[0].Tag).TeacherMids.Sort;
    Allowt := TColumnInfo(Band.Columns[0].Tag)
      .TeacherMids.Find(IntToStr(App.UserInfo.ID), Index);
    TColumnInfo(Band.Columns[0].Tag).TeacherMids.Sorted := False;
  end;
  if (Grid.FocusedNode <> nil) and (copy(Band.Columns[0].Name, 1, 1) = 'c') then
  begin
    Form := TxpnnzHomeWorkEditForm.Create(Self);
    try
      Form.HW_Type := 'D';
      Form.gid := TColumnInfo(Column.Tag).gid;
      // Integer(ClassNameEdit.Properties.Items.Objects[ClassNameEdit.Properties.Items.IndexOf(ClassNameEdit.Text)]);
      Form.sheid := StrToIntDef(ExtractWord(2, Column.Name, ['c']), 0);
      Form.week_id := StrToIntDef(ExtractWord(1, Column.Name, ['c']), 0);
      Form.LessonDateLabel.Caption := xpUtilUnit.cutOnCR(Column.Caption.Text);
      Form.PredmetLabel.Caption := PredmetEdit.Text;
      Form.ClassNameLabel.Caption := ClassNameEdit.Text;
      {
      gyStr := xpDataModule.GetStrValueFromSQL(Format('SELECT year FROM group_history gh WHERE gid = %d AND gh.school_year = %d',[form.gid,GetIntFromCombo(YearEdit)]));
      if (Length(gyStr) > 0) then
        Form.group_year := StrToInt(gyStr)
      else }
        Form.group_year := 0;

      Form.RecordID := xpDataModule.GetValueFromSQL
        ('select coalesce(hwid, 0) AS F from nnz_do_homework where sheid=' +
        IntToStr(Form.sheid) + ' and week_id = ' + IntToStr(Form.week_id));
      if TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfoCount > 0 then
        Form.isAllowEdit := Allowt and
          ExistsAllowTeacher(Band.Columns[0].ItemIndex - 1);
      Node := Grid.TopNode;
      while (Assigned(Node) and (TnnzJournalNodeInfo(Node.Data).middle_grade <>
        99999)) do
      begin
        pCInfo := GetCellInfo(Node,Column.ItemIndex - 1);
        if (pcInfo.isAllowTicher and (not pCInfo.isOut)) then
          Form.personalHWStudents.AddObject
            (Node.Values[StudentColumn.ItemIndex], // fio
            TObject(TnnzJournalNodeInfo(Node.Data).mid)); // mid
        Node := Node.GetNext;
      end;
      Form.LoadData;
      Form.ShowModal;
      Style := nil;
      if Form.OkResult then
        if (Form.RecordID <> 0) and (Form.RecordID <> Null) and
          (Trim(xpDataModule.GetValueFromSQL
          ('SELECT Text from nnz_do_homework where hwid = ' +
          VarToStr(Form.RecordID))) = '') then
        begin
          xpDataModule.ExecuteSQL('delete from nnz_do_homework where hwid = ' +
            VarToStr(Form.RecordID));
          if HomeWorkHasFiles(Form.sheid, Form.week_id) then
            Style := cxDZStyle;
        end
        else
          Style := cxDZStyle
      else if ((Form.RecordID <> 0) and (Form.RecordID <> Null)) or
        HomeWorkHasFiles(Form.sheid, Form.week_id) then
        Style := cxDZStyle;
      Band.Styles.Header := Style;
    finally
      Form.Free;
    end;
  end;
end;

procedure TxpnnzDOJournalForm.FormCreate(Sender: TObject);
begin
  HelpRasdel := 'xpAddEduJournalFormUnit';
  BandHints := TStringList.Create;
  CheckedCell := TStringList.Create;
  Application.ShowHint := True;
  Application.OnShowHint := OnShowHint;
  Query := TnnzQuery.Create(Self);
  Query.Connection := xpDataModule.nnzConnection;
  JDate := Trunc(Now());
  opt_termType := xpDataModule.GetValueFromSQL
    ('select term_type_id from term_types where upper(term_type_name) = (select upper(cast(value as char(100))) from options where name = ''edu_period'')');
end;

procedure TxpnnzDOJournalForm.OnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: Controls.THintInfo);
begin
  if HintInfo.HintControl = Grid then
    with HintInfo do
      HintStr := Grid.Hint
  else
    HintStr := '';
end;

procedure TxpnnzDOJournalForm.FormDestroy(Sender: TObject);
begin
  BandHints.Free;
  CheckedCell.Free;
  Application.OnShowHint := nil;
end;

procedure TxpnnzDOJournalForm.AdvGlowButton1Click(Sender: TObject);
var
  Node: TcxTreeListNode;
  Allow: Boolean;
  FocusedColIndex: Integer;
begin
  if Grid.FocusedColumn <> nil then
  begin
    if (Grid.FocusedColumn.Tag > 0) and
      (TColumnInfo(Grid.FocusedColumn.Tag).MyColumnTag = MyColumnTag) then
    begin
      Allow := TnnzJournalNodeInfo(Grid.FocusedNode.Data)
        .CellInfo[Grid.FocusedColumn.ItemIndex - 1].isAllowTicher;
      // Query2.Locate('sheid', VarArrayOf([StrToIntDef(ExtractWord(2, Grid.FocusedColumn.Name, ['c']), 0)]), [loPartialKey]);
      if Allow then
      begin
        if xpConfirmationMsg('Удалить все оценки на ' +
          Grid.FocusedColumn.Caption.Text + '?') then
        begin
          Node := Grid.TopNode;
          FocusedColIndex := Grid.FocusedColumn.ItemIndex;
          // if Assigned(Node) then OkButton.Enabled := not FReadOnly;
          while Assigned(Node) and (TnnzJournalNodeInfo(Node.Data).middle_grade
            <> 99999) do
          begin
            // Присвоение Node.Values чего-нибудь жутко тормозит где-то в дебрях cx.
            // Сейчас, пока, хотя бы проверка - и так пустые не переприсваивать.
            if Node.Values[FocusedColIndex] <> '' then
              Node.Values[FocusedColIndex] := '';
            TnnzJournalNodeInfo(Node.Data).CellInfo[FocusedColIndex - 1]
              .GradeComment := '';
            TnnzJournalNodeInfo(Node.Data).CellInfo[FocusedColIndex - 1]
              .isAllowTicher := True;
            SaveGrade(ExtractWord(2, Grid.FocusedColumn.Name, ['c']), // SHEID
              ExtractWord(1, Grid.FocusedColumn.Name, ['c']),
              // week_id (instance),
              '', // grade
              IntToStr(TnnzJournalNodeInfo(Node.Data).mid), // MID
              ''); // comment
            AvgGradeForNode(Grid.FocusedColumn, Node);
            Node := Node.GetNext;
          end;
          AvgGradeForCol(Grid.FocusedColumn);
        end;
      end; // if
    end;
  end;
end;

procedure TxpnnzDOJournalForm.ShowInfo(Node: TcxTreeListNode);
var
  Form: TxpSmalInfoForm;
begin
  if TnnzJournalNodeInfo(Node.Data).mid > 0 then
  begin
    Form := TxpSmalInfoForm.Create(Self);
    try
      Form.mid := TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid;
{$IFDEF XPHIGHEDUCATION}
      Form.Mode := 0;
{$ENDIF}
      Form.ShowModal;
    finally
      Form.Free;
    end;
  end;
end;

function TxpnnzDOJournalForm.AllowEdit(AColumn: TcxTreeListColumn): Boolean;
begin
  if IsItogColumn(AColumn) then
    result := AllowEditTotalGrade(AColumn, Grid.FocusedNode)
  else if IsFIOColumn(AColumn) then
    result := False
  else
    result := TnnzJournalNodeInfo(Grid.FocusedNode.Data).middle_grade <> 99999;
  if result and (AColumn.Position.BandIndex > 1) then // кроме итоговых оценок
  begin
    result := not TnnzJournalNodeInfo(Grid.FocusedNode.Data)
      .CellInfo[AColumn.ItemIndex - 1].isHoliday_with_nocarry;
    if result then
      result := TnnzJournalNodeInfo(Grid.FocusedNode.Data)
        .CellInfo[AColumn.ItemIndex - 1].isAllowTicher;
    if result then
      result := not TnnzJournalNodeInfo(Grid.FocusedNode.Data)
        .CellInfo[AColumn.ItemIndex - 1].isOut;
    if not result then
      result := TnnzJournalNodeInfo(Grid.FocusedNode.Data)
        .CellInfo[AColumn.ItemIndex - 1].isChangeComments;
  end;
end;

procedure TxpnnzDOJournalForm.GridEditing(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  Allow := AllowEdit(AColumn) and not FReadOnly and
    (TnnzJournalNodeInfo(Grid.FocusedNode.Data).middle_grade <> 99999);
  if Allow and not IsItogColumn(AColumn) and (GetCellInfo(Grid.FocusedNode, AColumn.ItemIndex - 1).LessonDate > Now)  then
    begin
      Allow := false;
      xpWarning('Это занятие еще не проведено!');
    end;
end;

procedure TxpnnzDOJournalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grid.Post;
  ClearGridNodesData;
  inherited;
end;

procedure TxpnnzDOJournalForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) and (Shift = []) then
  begin
    GridLoadData;
    Key := 0;
  end;
  if (Key = VK_RETURN) then
  begin
    if Grid.FocusedNode <> nil then
      if Grid.FocusedNode.GetNext <> nil then
        Grid.FocusedNode.GetNext.Focused := True;
  end;
  if (Key = VK_DELETE) then
  begin
    if (Grid.FocusedNode <> nil) and (Grid.FocusedColumn <> nil) then
    begin
      if Grid.Focused and AllowEdit(Grid.FocusedColumn) and not FReadOnly then
      begin
        if xpConfirmationMsg('Очистить ячейку?') then
        begin
          Grid.FocusedNode.Values[Grid.FocusedColumn.ItemIndex] := '';
          GridEdited(Grid, Grid.FocusedColumn);
          if IsItogColumn(Grid.FocusedColumn) then
          begin
            if Grid.FocusedColumn.ItemIndex < YearColumn.ItemIndex then
            begin
              SaveTermGrade(GetTrmtidByColumt(Grid.FocusedColumn),
                Trim(VarToStr(Grid.FocusedNode.Values
                [Grid.FocusedColumn.ItemIndex])), // grade
                IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
                ''); // comm
            end
            else
            begin
              SaveYearGrade(GetYGrTypeidByColumt(Grid.FocusedColumn),
                Trim(VarToStr(Grid.FocusedNode.Values
                [Grid.FocusedColumn.ItemIndex])), // grade
                IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
                ''); // comm
            end;
          end
          else
            SaveGrade(ExtractWord(2, Grid.FocusedColumn.Name, ['c']), // SHEID
              ExtractWord(1, Grid.FocusedColumn.Name, ['c']),
              // week_id (instance),
              '', // grade
              IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
              ''); // comment
          AvgGradeForNode(Grid.FocusedColumn, Grid.FocusedNode);
        end;
        GetCellInfo(Grid.FocusedNode, Grid.FocusedColumn.ItemIndex - 1)
          .GradeComment := '';
      end; // if not(IsNUMFIOColumn(Grid.FocusedColumn))...
    end;
  end;
end;

procedure TxpnnzDOJournalForm.RefreshButtonClick(Sender: TObject);
begin
  Grid.Post;
  GridLoadData;
end;
type
TcxControlHack = class(TcxControl);
procedure TxpnnzDOJournalForm.RightPartLoadData;
var
  ds: TDataSet;
  Node: TcxTreeListNode;
  bmp: TBitMap;
  AImage: TcxImage;
  isAllowTicher: Boolean;
  Row: Integer;
  StartPos: Integer;
  SQL: string;
begin
  if not pnlShModFact.Visible then
    Exit;
  StartPos := TcxControlHack(cxGridRightPart).VScrollBar.Position;
  AImage := TcxImage.Create(nil);
  try
    bmp := TBitMap.Create;
    try
      Row := -1;
      with cxGridRightPart do
      begin
        BeginUpdate;
        try
          if cxGridRightPart.FocusedNode <> nil then
            Row := cxGridRightPart.FocusedNode.Index;
          ClearRightGridNodesData;
          Clear;
          GrpFactColumn.Visible := false;
          CheckedCell.Clear;
          xpDataModule.ExecuteSQL('drop table if exists tmp_sheid_weeks;'#13#10
            + 'create temporary table tmp_sheid_weeks '#13#10 +
            'select distinct sheid, `instance` as week_id, '
            +' LessonDate, LessonUnixDate, LessonFullDate, LessonTypeID,'#13#10
            + '  module_id, LessonHomeWork, LessonWorkCount, '
            +' part, gid, LessonID'#13#10
            + 'from journal'#13#10 + 'where mid <> 99999 and sheid <> 0;');
          SQL := 'select ifnull(f.do_sh_mod_fact_id, 0) as do_sh_mod_fact_id,'#13#10 +
            '  w.LessonFullDate, w.LessonUnixDate, '+
            ' w.SHEID, w.week_id,'#13#10 +
            '  if(f.do_sh_mod_fact_id is null, 0, 1) as Passed,'#13#10 +
            '  coalesce(f.event_type, 0) as event_type, m.event_type as  event_type_J, '#13#10
            + '  f.module_id, m.module_id as module_id_J, o.`title` as FactTheme,'#13#10
            + '  m.work_count as work_count_J,'#13#10 +
            '  replace(f.hw_text, concat(char(13), char(10)), '' '') as hw_text,'#13#10
            + '  w.LessonHomeWork as hw_text_J, f.teacher_comments, '#13#10
            + '  w.gid as gid_J, hd.`name` holidayname,'#13#10
            + '  grp.name as grpname, coalesce(f.teacher,p.teacher) as teacher '#13#10 +
            'from tmp_sheid_weeks w'#13#10 +
            'left outer join nnz_do_schedule_modules m ON m.sheid=w.sheid AND m.week_id=w.week_id '+
            'left outer join nnz_do_sh_module_fact f on w.sheid = f.sheid and w.week_id = f.week_id'#13#10 +
            'left outer join nnz_do_schedule_modules p on w.sheid = p.sheid and w.week_id = p.week_id'#13#10 +
            ' left outer join xp_group grp ON grp.xp_key=w.gid '#13#10+
            'left outer join eventtools e on f.event_type = e.TypeID'#13#10 +
            'left outer join xp_do_organizations o on f.module_id = o.xp_do_oid'#13#10 +
            'left outer join holidays hd on hd.`date` = w.LessonFullDate'#13#10 +
            'order by w.LessonUnixDate, w.part, w.LessonID;';
          ds := xpDataModule.CreateDataSetFromSQL(SQL);
          try
            isAllowTicher := AnsiSameText(JournalAdmin, 'Полный');
            while not(ds.EOF) do
            begin
              Node := Add;
              Node.Values[RecordIDColumn.ItemIndex] :=
                ds.FieldByName('do_sh_mod_fact_id').Value;
              if (ds.FieldByName('Passed').AsInteger = 1) and
                (ds.FieldByName('holidayname').AsString = '') then
                Node.Values[PassedColumn.ItemIndex] := True
              else
              begin
                Node.Values[PassedColumn.ItemIndex] := False;
                if ds.FieldByName('Passed').AsInteger = 1 then
                  xpDataModule.ExecuteSQL
                    ('delete from nnz_do_sh_module_fact where do_sh_mod_fact_id = ' +
                    ds.FieldByName('do_sh_mod_fact_id').AsString + ';');
              end;
              if ds.FieldByName('holidayname').AsString <> '' then
                bmp.LoadFromResourceName(HInstance, 'eth')
              else
                bmp.LoadFromResourceName(HInstance,
                  'et' + ds.FieldByName('event_type').AsString);
              AImage.Picture.Assign(bmp);
              Node.Values[EvTypeColumn.ItemIndex] := AImage.EditValue;
              Node.Values[EvDateColumn.ItemIndex] :=
                ds.FieldByName('LessonFullDate').Value;
              if ds.FieldByName('holidayname').AsString = '' then
              begin
                Node.Values[ShModFactColumn.ItemIndex] :=
                  ds.FieldByName('FactTheme').Value;
                Node.Values[HWColumn.ItemIndex] :=
                  ds.FieldByName('hw_text').Value;
                Node.Values[TeacherCommentColumn.ItemIndex] :=
                  ds.FieldByName('teacher_comments').Value;
              end;
              if ds.FieldByName('gid_J').AsString <> GroupID then
                begin
                  Node.Values[GrpFactColumn.ItemIndex] := ds.FieldByName('grpname').AsString;
                  GrpFactColumn.Visible := true;
                end;
              Node.Data := TnnzRigtPartJournalNodeInfo.Create;
              with TnnzRigtPartJournalNodeInfo(Node.Data) do
              begin
                sheid := ds.FieldByName('sheid').AsInteger;
                week_id := ds.FieldByName('week_id').AsInteger;
                gid_J := ds.FieldByName('gid_J').AsInteger;
                lesson_date := ds.FieldByName('LessonFullDate').AsDateTime;
                if ds.FieldByName('holidayname').AsString = '' then
                begin
                  sh_mod_fact_id := ds.FieldByName('do_sh_mod_fact_id').AsInteger;
                  event_type := ds.FieldByName('event_type').AsInteger;
                  module_id := ds.FieldByName('module_id').AsInteger;
                end;
                event_type_J := ds.FieldByName('event_type_J').AsInteger;
                module_id_J := ds.FieldByName('module_id_J').AsInteger;
                work_count_J := ds.FieldByName('work_count_J').AsInteger;
                hw_text_J := ds.FieldByName('hw_text_J').AsString;
                HolidayName := ds.FieldByName('holidayname').AsString;
                teacher_mid := ds.FieldByName('teacher').AsInteger;
              end;
              // Разрешение на редактирование строки
                TnnzRigtPartJournalNodeInfo(Node.Data).AllowEdit :=
                  (isAllowTicher or (TnnzRigtPartJournalNodeInfo(Node.Data).teacher_mid = App.UserInfo.ID)) and
                  (DateLockCurrent < ds.FieldByName('LessonFullDate')
                  .AsDateTime) and
                  (TnnzRigtPartJournalNodeInfo(Node.Data).HolidayName = '');

              ds.Next;
            end; // while
          finally
            ds.Free;
          end; // try
        finally
          if (Row > -1) and (Row < cxGridRightPart.Count) then
          begin
            cxGridRightPart.SetFocus;
            Node := cxGridRightPart.Items[Row];
            Node.Focused := True;
            Node.MakeVisible;
          end;
          EndUpdate;
        end; // try
      end; // with
    finally
      bmp.Free;
    end;
  finally
    AImage.Free;
  end; // try

  if StartPos <> 0 then
    try
      cxGridRightPart.Visible := False;
      while TcxControlHack(cxGridRightPart).VScrollBar.Position < StartPos do
        cxGridRightPart.ScrollContent(dirDown);
    finally
      cxGridRightPart.Visible := True;
    end;

end;


procedure TxpnnzDOJournalForm.PrintButtonClick(Sender: TObject);

const
  LessonsPerPagePortrait = 14;
  LessonsPerPageLandscape = 23;
var
  fVariables, fParam: TxpMemParamManager;
  lessonsPerPage: Word;
  sGradeTypes: string;
  pOrient: integer;
  pItogi, pFilled: boolean;
  i: integer;
  SQL: string;
procedure FillPodpis(Variables: TxpMemParamManager);
var
  zamID: integer;
begin
  try     //   LMS-4998, иногда ругается на нулевые записи
    Variables['Class_Teacher'] := QuotedStr(xpDataModule.GetValueFromSQL(Format(
            'SELECT xp_f_get_mid_fio(coalesce(g2.class_teacher,g.class_teacher,0),0) FROM groupname g '+
            ' LEFT JOIN groupname g2 ON g2.gid=g.owner_gid '+
            'WHERE g.gid=%d',
            [getIntFromCombo(ClassNameEdit)]),'')) ;
  Except
    Variables['Class_Teacher'] := '';
  end;

  ZamID := StrToIntDef(xpDataModule.GetValueFromSQL('SELECT COALESCE((SELECT CAST(Value as CHAR(20)) FROM options WHERE name=''zam_uch_mid'' ),''0'')','0'),0);
  Variables['Zam1_fio'] := QuotedStr(xpDataModule.GetValueFromSQL('SELECT xp_f_get_mid_fio('+inttostr(zamID)+',0)',''));
  ZamID := StrToIntDef(xpDataModule.GetValueFromSQL('SELECT COALESCE((SELECT CAST(Value as CHAR(20)) FROM options WHERE name=''zam_vosp_mid'' ),''0'')','0'),0);
  Variables['Zam2_fio'] := QuotedStr(xpDataModule.GetValueFromSQL('SELECT xp_f_get_mid_fio('+inttostr(zamID)+',0)',''));

  Variables['Zam1_post'] :=  QuotedStr(xpDataModule.GetValueFromSQL('SELECT COALESCE((SELECT CAST(Value as CHAR(200)) FROM options WHERE name=''zam_uch_post_name'' ),''Зам. по уч. работе'')','Зам. по уч. работе'));
  Variables['Zam2_post'] :=  QuotedStr(xpDataModule.GetValueFromSQL('SELECT COALESCE((SELECT CAST(Value as CHAR(200)) FROM options WHERE name=''zam_vosp_post_name'' ),''Зам. по восп. работе '')','Зам. по восп. работе '));
  Variables['Dop_Obr'] := 1;
end;
begin
  inherited;
  JournalPrintDialog := TJournalPrintDialog.Create(self);
  try
    if JournalPrintDialog.ShowModal=mrOK then
      begin
        pOrient := JournalPrintDialog.PrintOrientation.ItemIndex;
        pItogi := JournalPrintDialog.cbItogi.Checked;
        pFilled := JournalPrintDialog.cbFilled.Checked;
      end
    else
      exit;
  finally
    JournalPrintDialog.Free;
  end;
  if AnsiSameText(AccessObject('Отчеты', 'Классный журнал'), 'Нет') then
  begin
    xpWarning('Вы не имеете права составлять данный отчёт.');
    Exit;
  end;

  case (pOrient) of
  0: lessonsPerPage := LessonsPerPagePortrait;
  1: lessonsPerPage := LessonsPerPageLandscape;
  end;
  if not pItogi then
    begin
      // if OkButton.Enabled then if xpConfirmationMsg('Несохраненные данные не войдут в отчёт. Сохранить изменения?') then SaveData;
      Grid.Post;
      SQL :=
        'CALL nnz_fill_do_journal (' + TrimID + ',' + OnDate +
        ',' + CourseID + ',' + GroupID + ');' + sLineBreak +
        // Иначе правильно печатать не будет
        'DROP TABLE IF EXISTS ReportTable;' + sLineBreak +

        // current trim
        'UPDATE journal SET `instance` = ' + IntToStr(Trid) + ' WHERE `instance` = 0 AND lessonid IN (5, 7, 8, 9);' + sLineBreak +

        // term num
        'UPDATE journal SET LessonDate = toRoman(xp_fget_term_num(`instance`)) WHERE lessonid IN (5, 7, 8, 9);' + sLineBreak +

        'UPDATE journal' + sLineBreak +
        'SET LessonDate = CASE lessonid' + sLineBreak +
        '    WHEN 9 THEN CONCAT(LessonDate, '' Экз'')' + sLineBreak +
        '    WHEN 8 THEN CONCAT(LessonDate, '' Итог'')' + sLineBreak +
        '    WHEN 2 THEN ''Экз''' + sLineBreak +
        '    WHEN 3 THEN ''Итог''' + sLineBreak +
        '    ELSE LessonDate' + sLineBreak +
        '  END' + sLineBreak +
        'WHERE lessonid IN (1, 2, 3, 5, 7, 8, 9);';

      xpDataModule.ExecuteSQL(SQL);
      SQL :=
        'DROP TABLE IF EXISTS ReportTableMidsTmp;' + sLineBreak +
        'SET @curRow = 0;' + sLineBreak +
        'CREATE TEMPORARY TABLE ReportTableMidsTmp' + sLineBreak +
        'SELECT @curRow := @curRow+1 as Row, mid, Student' + sLineBreak +
        'FROM (SELECT mid, Student FROM journal' + sLineBreak +
        'WHERE mid <> 99999 AND lessonid <> 99' + sLineBreak + // средний балл за дату и за экзамен
        //'GROUP BY mid, Student;' + sLineBreak +                                   // 27.05.2016
        'GROUP BY mid, Student ORDER BY Student) t;';
        xpDataModule.ExecuteSQL(SQL);
      SQL :=
      'DROP TABLE IF EXISTS ReportTableLessonsTmp;' + sLineBreak +
        'CREATE TEMPORARY TABLE ReportTableLessonsTmp' + sLineBreak +
        'SELECT journal.sheid,sh.period,  `instance` as week_id, LessonUnixDate, LessonDate, LessonID' + sLineBreak +
        'FROM journal' + sLineBreak +
        ' JOIN nnz_do_schedule sh ON sh.sheid=journal.sheid '+
        'GROUP BY sheid, week_id, LessonUnixDate, LessonDate, LessonID '+
        'ORDER BY LessonDate;';
         xpDataModule.ExecuteSQL(SQL);
      SQL :=
      'CREATE TEMPORARY TABLE ReportTable AS ' + sLineBreak +
        'SELECT t1.row, t1.mid, t1.Student, t2.sheid,t2.period,  t2.week_id, t2.LessonUnixDate, t2.LessonDate, t2.LessonID,  CAST(NULL AS char(20)) Grade ' + sLineBreak +
        'FROM ReportTableMidsTmp t1' + sLineBreak +
        '  CROSS JOIN ReportTableLessonsTmp t2;' + sLineBreak +

//      'DROP TABLE IF EXISTS ReportTableMidsTmp;' + sLineBreak +
        'DROP TABLE IF EXISTS ReportTableLessonsTmp;';
        xpDataModule.ExecuteSQL(SQL  );
      SQL :=
      'UPDATE ReportTable rt' + sLineBreak +
        '  INNER JOIN (' + sLineBreak +
        '    SELECT mid, sheid, `instance` as week_id, LessonID, group_concat(Grade SEPARATOR '''') Grade' + sLineBreak +
        '    FROM journal' + sLineBreak +
        '    WHERE mid <> 99999 AND lessonid <> 99' + sLineBreak +
        '    GROUP BY mid, sheid, `instance`, LessonID) t' + sLineBreak +
        '  ON t.mid = rt.mid AND t.sheid = rt.sheid AND t.week_id = rt.week_id AND t.LessonID = rt.LessonID' + sLineBreak +
        'SET rt.Grade = t.Grade;';
      xpDataModule.ExecuteSQL(SQL);
      SQL :=
      'SET @curRow = 0;' + sLineBreak +
        'DROP TABLE IF EXISTS ReportTableWeeks;' + sLineBreak +
        'CREATE TEMPORARY TABLE ReportTableWeeks' + sLineBreak +
        'SELECT  FLOOR(((@curRow := @curRow + 1) - 1) / ' + IntToStr(lessonsPerPage) + ') AS PageNumber, t.*' + sLineBreak +
        'FROM (' + sLineBreak +
        '    SELECT' + sLineBreak +
        '      sheid, `instance` as week_id, LessonDate, LessonFullDate, LessonTypeID,' + sLineBreak +
        '      module_id, LessonHomeWork, LessonWorkCount,  gid, part, LessonID, mid' + sLineBreak +
        '    FROM journal' + sLineBreak +
        '    WHERE mid <> 99999 AND lessonid <> 99' + sLineBreak +
        '    GROUP BY sheid, `instance`, LessonDate, LessonFullDate, LessonTypeID,' + sLineBreak +
        '      module_id, LessonHomeWork, LessonWorkCount,  gid, part, LessonID' + sLineBreak +
        '    ORDER BY LessonUnixDate' + sLineBreak +
        '  ) t; ';
        xpDataModule.ExecuteSQL(SQL);
      fVariables := TxpMemParamManager.Create;
      fParam := TxpMemParamManager.Create;
      try

        fVariables['Триместр'] := QuotedStr(TrimestrDesc);
        fVariables['Предмет'] := QuotedStr(CourseDesc);
        // fVariables['Класс'] := ClassNameEdit.Text + #13#10;
        fVariables['Класс'] := QuotedStr(GroupDesc);
        fVariables['UserName'] := QuotedStr(App.UserInfo.Fullname);
        // App.UserInfo.Name + #13#10;
        fVariables['GOU_Logo'] := QuotedStr(IntToStr(Integer(App.GOU_Logo.Picture)));
        fVariables['GOU_Name'] := QuotedStr(ReplaceStr(App.GOU_Name, #13#10, ' '));
        fVariables['Dep_Logo'] := QuotedStr(IntToStr(Integer(App.Dep_Logo.Picture)));
        fVariables['Dep_Name'] := QuotedStr(ReplaceStr(App.Dep_Name, #13#10, ' '));
        fVariables['IsPortrait'] := QuotedStr(inttostr(1-pOrient));
        FillPodpis(fVariables);
        if JournalOnDate.Checked then
          fVariables['Teachers'] := QuotedStr(xpDataModule.GetValueFromSQL(format(
            'SELECT COALESCE(( '+
            ' SELECT '+
            '   GROUP_CONCAT(xp_format_fio(p.LastName,p.FirstName,p.Patronymic,0) '+
            '    ORDER BY p.LastName,p.FirstName,p.Patronymic '+
            '    SEPARATOR '', '')   teachers '+
            ' FROM ( '+
            '   SELECT t.teacher '+
            '   FROM nnz_do_schedule s '+
            '   JOIN xp_group  g ON g.xp_key=s.gid '+
            '     JOIN dop_sheduleteachers t ON t.sheid = s.SHEID '+
            '   JOIN nnz_weeks w ON w.do_sh_var_id=s.sh_var_id '+
            '   WHERE '+
            '     (g.xp_key=%0:d ) '+
            '     AND s.cid=%1:d '+
            '     AND COALESCE(s.st_state_id,0)=0 '+
            '     AND DATE_ADD(w.wstart_date, INTERVAL (s.day_of_week -WEEKDAY(w.wstart_date)-1) DAY) = %2:s '+
            '   GROUP BY t.teacher '+
            '   ) rasp '+
            '   JOIN people p ON p.mid=rasp.teacher '+

            '),'''')',
            [getIntFromCombo(ClassnameEdit),getIntFromCombo(PredmetEdit),DateAsSQL(BegDateEdit.Date)]),''))
        else
          fVariables['Teachers'] := QuotedStr(xpDataModule.GetValueFromSQL(format(
            'SELECT COALESCE(( '+
            'SELECT '+
            '  GROUP_CONCAT(xp_format_fio(p.LastName,p.FirstName,p.Patronymic,0) '+
            '   ORDER BY p.LastName,p.FirstName,p.Patronymic '+
            '   SEPARATOR '', '')   teachers '+
            'FROM ( '+
            '   SELECT st.teacher '+
            '   FROM nnz_do_schedule s '+
            '   JOIN xp_group  g ON g.xp_key=s.gid '+
            '    JOIN dop_sheduleteachers st ON st.sheid = s.SHEID '+
            '   JOIN nnz_weeks w ON w.do_sh_var_id=s.sh_var_id '+
            '     JOIN term_weeks tw ON tw.week_id=w.week_id '+
            '       JOIN terms t ON t.trmid=tw.trmid '+
            '   WHERE '+
            '     (g.xp_key=%0:d ) '+
            '     AND s.cid=%1:d '+
            '     AND COALESCE(s.st_state_id,0)=0 '+
            '     AND t.trmid =%2:d '+
            '   GROUP BY st.teacher '+
            '   ) rasp '+
            '  JOIN people p ON p.mid=rasp.teacher),'''')',
            [getIntFromCombo(ClassnameEdit),getIntFromCombo(PredmetEdit),getIntFromCombo(TrimestrEdit)]),''));
        ShowReportWithParam('Классный журнал (ДО)', fVariables, fParam);
      finally
       // xpDataModule.ExecuteSQL('DROP TABLE IF EXISTS ReportTable;');
       // xpDataModule.ExecuteSQL('DROP TABLE IF EXISTS ReportTableWeeks;');
        fVariables.Free;
        fParam.Free;
      end;
    end
  else
    begin
      sGradeTypes := '0';
      for i := 0 to chkVisibleItog.Properties.Items.Count-1 do
         if ((1 shl i) and integer(chkVisibleItog.Value))<>0 then
            sGradeTypes := sGradeTypes + ',' +inttostr(chkVisibleItog.Properties.Items[i].Tag);
      case pOrient of
        0: SQL := Format(
          'CALL fill_report_journal_do_itog(%d,%d,%d,%s,%d,20);',
          [getIntFromCombo(YearEdit),getIntFromCombo(PredmetEdit),getIntFromCombo(ClassNameEdit),
           stringAsSQL(sGradeTypes), integer(pFilled)]);
        1: SQL := Format(
          'CALL fill_report_journal_do_itog(%d,%d,%d,%s,%d,24);',
          [getIntFromCombo(YearEdit),getIntFromCombo(PredmetEdit),getIntFromCombo(ClassNameEdit),
           stringAsSQL(sGradeTypes), integer(pFilled)]);
      end;
      xpDataModule.ExecuteSQL(SQL);
     fVariables := nil;
      fParam := TxpMemParamManager.Create;
      try
        fVariables := TxpMemParamManager.Create;
        fVariables['Предмет'] := QuotedStr(CourseDesc);
        // fVariables['Класс'] := ClassNameEdit.Text + #13#10;
        fVariables['Класс'] := QuotedStr(GroupDesc);
        fVariables['UserName'] := QuotedStr(App.UserInfo.Fullname);
        fVariables['sYear'] := QuotedStr(YearEdit.Text);
        // App.UserInfo.Name + #13#10;
        fVariables['GOU_Logo'] := QuotedStr(IntToStr(Integer(App.GOU_Logo.Picture)));
        fVariables['GOU_Name'] := QuotedStr(ReplaceStr(App.GOU_Name, #13#10, ' '));
        fVariables['Dep_Logo'] := QuotedStr(IntToStr(Integer(App.Dep_Logo.Picture)));
        fVariables['Dep_Name'] := QuotedStr(ReplaceStr(App.Dep_Name, #13#10, ' '));
        fVariables['Year_Name'] := QuotedStr(YearEdit.Text);
        fVariables['IsPortrait'] := QuotedStr(inttostr(1-pOrient));
        FillPodpis(fVariables);
        ShowReportWithParam('Классный журнал (итоги)', fVariables, fParam);
      finally
        fVariables.Free;
        fParam.Free;
      end;
    end;

{
  if AnsiSameText(AccessObject('Отчеты', 'Классный журнал'), 'Нет') then
  begin
    xpWarning('Вы не имеете права составлять данный отчёт.');
    Exit;
  end;
  // if OkButton.Enabled then if xpConfirmationMsg('Несохраненные данные не войдут в отчёт. Сохранить изменения?') then SaveData;
  Grid.Post;
  xpDataModule.ExecuteSQL('CALL nnz_fill_do_journal (' + TrimID + ',' + OnDate +
    ',' + CourseID + ',' + GroupID + ');' + sLineBreak +
    // Иначе правильно печатать не будет

    'DROP TABLE IF EXISTS ReportTable;' + sLineBreak +
    'CREATE TEMPORARY TABLE ReportTable' + sLineBreak +
    'SELECT mid, LessonUnixDate, LessonID, LessonDate, Student, group_concat(Grade SEPARATOR '''') Grade'
    + sLineBreak + 'FROM journal' + sLineBreak +
    'WHERE (instance = 0 OR LessonID NOT IN (5, 7, 8, 9)) AND mid <> 99999' +
    sLineBreak + 'GROUP BY mid, LessonDate, Student;' + sLineBreak +

    'INSERT INTO ReportTable' + sLineBreak +
    'SELECT mid, LessonUnixDate, LessonID, LessonDate, Student, Grade' +
    sLineBreak + 'FROM journal' + sLineBreak +
    'WHERE instance = 0 AND mid = 99999;' + sLineBreak +

    'INSERT INTO ReportTable' + sLineBreak +
    'SELECT 99999 mid, LessonUnixDate, Max(LessonID) LessonID, LessonDate, ''Ср. балл'' Student,'
    + sLineBreak +
    '  ROUND(xp_avg_grade(group_concat(Grade SEPARATOR '''')), 2) Grade' +
    sLineBreak + 'FROM journal' + sLineBreak +
    'WHERE Grade <> '''' AND instance <> 0 AND mid <> 99999 AND LessonID NOT IN (5, 7, 8, 9)'
    + sLineBreak + 'GROUP BY LessonUnixDate;');
  fVariables := nil;
  fParam := TxpMemParamManager.Create;
  try
    fVariables := TxpMemParamManager.Create;
    fVariables['Триместр'] := TrimestrDesc + #13#10;
    fVariables['Предмет'] := CourseDesc + #13#10;
    // fVariables['Класс'] := ClassNameEdit.Text + #13#10;
    fVariables['Класс'] := GroupDesc + #13#10;
    fVariables['UserName'] := App.UserInfo.Fullname + #13#10;
    // App.UserInfo.Name + #13#10;
    fVariables['GOU_Logo'] := IntToStr(Integer(App.GOU_Logo.Picture)) + #13#10;
    fVariables['GOU_Name'] := ReplaceStr(App.GOU_Name, char(13) + char(10),
      ' ') + #13#10;
    fVariables['Dep_Logo'] := IntToStr(Integer(App.Dep_Logo.Picture)) + #13#10;
    fVariables['Dep_Name'] := ReplaceStr(App.Dep_Name, char(13) + char(10),
      ' ') + #13#10;
    ShowReportWithParam('Классный журнал', fVariables, fParam);
  finally
    xpDataModule.ExecuteSQL('DROP TABLE IF EXISTS ReportTable;');
    fVariables.Free;
    fParam.Free;
  end;
  }
end;

procedure TxpnnzDOJournalForm.AdvGlowButton2Click(Sender: TObject);
begin
  inherited;
  if Grid.TopNode = nil then
    Exit;
  SaveDialog.Filter := 'Excel files (*.xls)|*.XLS';
  SaveDialog.DefaultExt := '*.xls';
  if SaveDialog.Execute then
    if Grid.ExportToExcel(SaveDialog.FileName) then
      xpInformation('Создан файл "' + SaveDialog.FileName + '".');
end;

procedure TxpnnzDOJournalForm.YearEditPropertiesChange(Sender: TObject);
begin
  if YearEdit.Properties.Items.Count > 0 then
    LoadTrimestrItems;
end;

procedure TxpnnzDOJournalForm.GridEditValueChanged(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn);
var
  s, trmt_id, comm: string;
begin
  inherited;
  s := VarToStr(AColumn.TreeList.InplaceEditor.EditValue);
  comm := TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo
    [AColumn.ItemIndex - 1].GradeComment;
  TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[AColumn.ItemIndex - 1]
    .GradeDate := Now;
  if IsItogColumn(AColumn) then
  begin
    if length(s) > MaxLenItogColumn then
      AColumn.TreeList.InplaceEditor.EditValue := copy(s, 1, MaxLenItogColumn);
    if (Trim(s) > '') and
      VarIsNull(xpDataModule.GetValueFromSQL
      ('select ValID from schedule_grades_values where `Value` = ' +
      StringAsSQL(s))) then
    begin
      // AColumn.TreeList.InplaceEditor.EditValue := '';
      xpWarning('Недопустимый символ');
      Abort;
    end;
    if Grid.FocusedColumn.ItemIndex < YearColumn.ItemIndex then
    begin
      trmt_id := GetTrmtidByColumt(AColumn);
      SaveTermGrade(trmt_id, Trim(s), // grade
        IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
        Trim(comm)); // comm
    end
    else
    begin
      SaveYearGrade(GetYGrTypeidByColumt(Grid.FocusedColumn), Trim(s), // grade
        IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
        Trim(comm)); // comm
    end;
  end
  else
  begin
    if length(s) > 11 then
      AColumn.TreeList.InplaceEditor.EditValue := copy(s, 1, 11);
    if (xpDataModule.GetValueFromSQL('select CheckGrades(' + StringAsSQL(s) +
      ') as b') = 0) then // Может, на клиенте проверить будет быстрее?
    begin
      // AColumn.TreeList.InplaceEditor.EditValue := '';
      xpWarning('Недопустимый символ');
      Abort;
    end;
    SaveGrade(ExtractWord(2, AColumn.Name, ['c']), // SHEID
      ExtractWord(1, AColumn.Name, ['c']), // week_id (instance),
      Trim(s), // grade
      IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
      Trim(comm)); // comment
    AvgGradeForNode(AColumn, Grid.FocusedNode);
    // тут Node.Value ещё не присвоился (среднее по колонке считать рано)
  end;
  // Раньше нижеследующее присвоение было на OnEdited
  // TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[AColumn.ItemIndex - 1].Edited := True; // св-ва Edited будут не нужны
  // TnnzJournalNodeInfo(Grid.FocusedNode.Data).Edited := True;
end;

procedure TxpnnzDOJournalForm.GridFocusedColumnChanged(
  Sender: TcxCustomTreeList; APrevFocusedColumn,
  AFocusedColumn: TcxTreeListColumn);
begin
  inherited;
  Grid.Invalidate;
end;

procedure TxpnnzDOJournalForm.GridInitEdit(Sender, AItem: TObject;
  AEdit: TcxCustomEdit);
begin
  if IsItogColumn(Grid.FocusedColumn) then
    TcxTextEditPropertiesHack(TcxCustomEditHack(AEdit).Properties).MaxLength :=
      MaxLenItogColumn
  else
    TcxTextEditPropertiesHack(TcxCustomEditHack(AEdit).Properties)
      .MaxLength := 11;
end;

procedure TxpnnzDOJournalForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Node: TcxTreeListNode;
  N: Integer;
begin
  if Key = VK_TAB then
  begin
    if Assigned(Grid.FocusedNode) then
    begin
      N := Grid.FocusedColumn.ItemIndex;
      if ssShift in Shift then
      begin
        Node := Grid.FocusedNode.GetPrev;
        if Node = nil then
        begin
          Node := Grid.LastNode;
          Dec(N);
        end;
      end
      else
      begin
        Node := Grid.FocusedNode.GetNext;
        if Node = nil then
        begin
          Node := Grid.TopNode;
          Inc(N);
        end;
      end;
      if (N >= 0) and (N < Grid.ColumnCount) then
      begin
        Grid.FocusedNode := Node;
        Grid.FocusedColumn := Grid.Columns[N];
      end;
    end; // if
    Key := 0;
  end; // if
end;

procedure TxpnnzDOJournalForm.PopupMenu1Click(Sender: TObject);
var
  Comment: string;
begin
  if (Grid.FocusedNode <> nil) and (Grid.FocusedColumn <> nil) then
  begin
    Grid.FocusedNode.Values[Grid.FocusedColumn.ItemIndex] :=
      TMenuItem(Sender).Hint;
    // TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo[Grid.FocusedColumn.ItemIndex - 1].Edited := True;
    // TnnzJournalNodeInfo(Grid.FocusedNode.Data).Edited := True;
    GridEdited(Grid, Grid.FocusedColumn);
    Grid.FocusedNode.EndEdit(True);

    if IsItogColumn(Grid.FocusedColumn) then
    begin
      if Grid.FocusedColumn.ItemIndex < YearColumn.ItemIndex then
      begin
        Comment := GetComment(Trimestr1Column);
        if Comment = '' then
          Comment := GetComment(Itog1Column);
        if Comment = '' then
          Comment := GetComment(Exam1Column);
        SaveTermGrade(GetTrmtidByColumt(Grid.FocusedColumn),
          Trim(VarToStr(Grid.FocusedNode.Values[Grid.FocusedColumn.ItemIndex])),
          // grade
          IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
          Trim(Comment)); // comm
      end
      else
      begin
        Comment := GetCellInfo(Grid.FocusedNode, Grid.FocusedColumn.ItemIndex -
          1).GradeComment;
        SaveYearGrade(GetYGrTypeidByColumt(Grid.FocusedColumn),
          Trim(VarToStr(Grid.FocusedNode.Values[Grid.FocusedColumn.ItemIndex])),
          // grade
          IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
          Trim(Comment)); // comm
      end;
    end
    else
    begin
      SaveGrade(ExtractWord(2, Grid.FocusedColumn.Name, ['c']), // SHEID
        ExtractWord(1, Grid.FocusedColumn.Name, ['c']), // week_id (instance),
        Trim(VarToStr(Grid.FocusedNode.Values[Grid.FocusedColumn.ItemIndex])),
        // grade
        IntToStr(TnnzJournalNodeInfo(Grid.FocusedNode.Data).mid), // MID
        TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo
        [Grid.FocusedColumn.ItemIndex - 1].GradeComment); // comment
      AvgGradeForNode(Grid.FocusedColumn, Grid.FocusedNode);
    end;
    TnnzJournalNodeInfo(Grid.FocusedNode.Data).CellInfo
      [Grid.FocusedColumn.ItemIndex - 1].GradeDate := Now();
  end;
end;

function TxpnnzDOJournalForm.DecimalReplace(s: string): string;
begin
  result := StringReplace(StringReplace(s, '.', FormatSettings.DecimalSeparator,
    []), ',', FormatSettings.DecimalSeparator, []);
end;

procedure TxpnnzDOJournalForm.PassedColumnPropertiesChange(Sender: TObject);
var
  sheid, week_id, event_type_J, module_id_J, work_count_J, hw_text_J: string;
  sh_mod_fact_id: Integer;
begin
  // По заявке 365:
  // Если поле 'Проведен' в гриде = 0, то все остальные поля по строке должны быть пустыми.
  // Если поле 'Проведен' в гриде = 1, то поля Дата, Что пройдено на уроке и Домашнее задание заполняются по умолчанию из Тем. планирования
  sh_mod_fact_id := TnnzRigtPartJournalNodeInfo
    (cxGridRightPart.FocusedNode.Data).sh_mod_fact_id;
  if StrToDateFormat(VarToStr(cxGridRightPart.FocusedNode.Values[EvDateColumn.ItemIndex]),'dd.mm.yyyy')>Now() then
    cxGridRightPart.FocusedNode.Values[PassedColumn.ItemIndex] := false;
  if VarToStr(cxGridRightPart.FocusedNode.Values[PassedColumn.ItemIndex])
    = 'True' then
  begin
    sheid := Null_If_0(TnnzRigtPartJournalNodeInfo
      (cxGridRightPart.FocusedNode.Data).sheid);
    week_id := Null_If_0(TnnzRigtPartJournalNodeInfo
      (cxGridRightPart.FocusedNode.Data).week_id);
    event_type_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .event_type_J);
    module_id_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .module_id_J);
    work_count_J :=
      Null_If_0(TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .work_count_J);
    hw_text_J := TnnzRigtPartJournalNodeInfo(cxGridRightPart.FocusedNode.Data)
      .hw_text_J;
    if sh_mod_fact_id = 0 then // Если записи не было - добавляем новую
    begin
      xpDataModule.ExecuteSQL
        ('insert into nnz_do_sh_module_fact(SHEID, week_id, event_type, module_id, work_count, hw_text)'#13#10
        + 'values(' + sheid + ', ' + week_id + ', ' + event_type_J + ', ' +
        module_id_J + ', ' + work_count_J + ', ' + xpUtilUnit.StringAsSQL(hw_text_J) + ')');
    end
    else // Если была - сначала удаляем то, что было, потом добавляем новую
    begin
      xpDataModule.ExecuteSQL
        ('delete from nnz_do_sh_module_fact where do_sh_mod_fact_id = ' +
        IntToStr(sh_mod_fact_id) + ';');
      xpDataModule.ExecuteSQL
        ('insert into nnz_do_sh_module_fact(SHEID, week_id, event_type, module_id, work_count, hw_text)'#13#10
        + 'values(' + sheid + ', ' + week_id + ', ' + event_type_J + ', ' +
        module_id_J + ', ' + work_count_J + ', ' + xpUtilUnit.StringAsSQL(hw_text_J) + ')');
    end;
  end
  else
    xpDataModule.ExecuteSQL
      ('delete from nnz_do_sh_module_fact where do_sh_mod_fact_id = ' +
      IntToStr(sh_mod_fact_id) + ';');
  // Refresh
  RightPartLoadData;
end;

procedure TxpnnzDOJournalForm.PenEditButtonClick(Sender: TObject);
begin
  inherited;
  CallCommentEdit;
end;

procedure TxpnnzDOJournalForm.TrimestrEditPropertiesChange(Sender: TObject);
begin
  LoadPremetItems;
end;

{ TnnzJournalNodeInfo }

constructor TnnzJournalNodeInfo.Create;
begin
  FCellInfo := TList.Create;
end;

destructor TnnzJournalNodeInfo.Destroy;
var
  i: Integer;
begin
  for i := 0 to FCellInfo.Count - 1 do
    Dispose(PnnzJournalCellInfo(FCellInfo[i]));
  FCellInfo.Free;
  inherited;
end;

function TnnzJournalNodeInfo.GetHaveTransfer: Boolean;
begin
  result := (YearOf(TransferDate) <> 1913) and (middle_grade <> 99999);
end;

function TnnzJournalNodeInfo.GetCellInfo(N: Integer): PnnzJournalCellInfo;
begin
  if (N >= 0) and (N < FCellInfo.Count) then
    result := FCellInfo[N]
  else
    result := nil;
end;

function TnnzJournalNodeInfo.GetCellInfoCount: Integer;
begin
  result := FCellInfo.Count;
end;

procedure TnnzJournalNodeInfo.SetCellInfoCount(const Value: Integer);
var
  i: Integer;
  P: PnnzJournalCellInfo;
begin
  if Value = FCellInfo.Count then
    Exit;
  if Value > FCellInfo.Count then
    for i := FCellInfo.Count to Value - 1 do
    begin
      New(P);
      FCellInfo.Add(P);
    end
  else
    for i := FCellInfo.Count - 1 downto Value do
    begin
      Dispose(PnnzJournalCellInfo(FCellInfo[i]));
      FCellInfo.Delete(i);
    end;
end;

{ TColumnInfo }

destructor TColumnInfo.Destroy;
begin
  if TeacherMids <> nil then
    TeacherMids.Free;
  inherited;
end;

end.
