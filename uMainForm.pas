unit uMainForm;

{$I cef.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  {$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, LResources, DBGrids, Menus,
  PrintersDlgs, LR_Class, LR_E_TXT, LR_E_HTM, LR_E_CSV, //lr_e_pdf, lrPDFExport, fpdbexport,
  StrUtils,
  {$ENDIF}
  uCEFChromium, uCEFWindowParent, uCEFInterfaces, uCEFApplication, uCEFTypes,
  uCEFMiscFunctions, uCEFConstants, uCEFSentinel, uCEFChromiumWindow, ECTabCtrl,
  ECAccordion, Types, SQLDB, SQLite3Conn, DB;

const
  CEFBROWSER_DESTROYWNDPARENT = WM_APP + $100;
  CEFBROWSER_DESTROYTAB       = WM_APP + $101;
  CEFBROWSER_INITIALIZED      = WM_APP + $102;
  CEFBROWSER_CHECKTAGGEDTABS  = WM_APP + $103;

type

  TODPageControl = class(TPageControl)
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure PaintWindow(DC: HDC); override;
    procedure Change; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

  { TMainForm }

  TMainForm = class(TForm)
    Bevel1: TBevel;
    Btn_Close: TSpeedButton;
    Btn_CloseAll: TSpeedButton;
    Btn_CloseAll1: TSpeedButton;
    Btn_CloseAll10: TSpeedButton;
    Btn_PrintSQL: TSpeedButton;
    Btn_PopupTest: TSpeedButton;
    Btn_PdfSQL: TSpeedButton;
    Btn_CloseAll2: TSpeedButton;
    Btn_CloseAll7: TSpeedButton;
    Btn_PdfTxt: TSpeedButton;
    Btn_CloseAll9: TSpeedButton;
    Btn_PrintTxt: TSpeedButton;
    Btn_Commit: TSpeedButton;
    Btn_Run: TSpeedButton;
    Btn_CloseAll6: TSpeedButton;
    Btn_Rollback: TSpeedButton;
    Btn_New: TSpeedButton;
    Btn_Open: TSpeedButton;
    Btn_Save: TSpeedButton;
    ButtonPnl: TPanel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Deczoom1: TMenuItem;
    DevTools: TCEFWindowParent;
    DevTools1: TMenuItem;
    ImageList1: TImageList;
    Inczoom1: TMenuItem;
//    lrPDFExport1: TlrPDFExport;
    Memo1: TMemo;
    Memoryinfo1: TMenuItem;
    MenuItem1: TMenuItem;
    Print_htm_SQL: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Print_pdf_Memo: TMenuItem;
    Print_txt_Memo: TMenuItem;
    Print_htm_Memo: TMenuItem;
    Print_pdf_SQL: TMenuItem;
    Print_txt_SQL: TMenuItem;
    PopupMenu3: TPopupMenu;
    Print_Preview_Memo: TMenuItem;
    Print_Preview_SQL: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    NavButtonPnl: TPanel;
    OpenDialog1: TOpenDialog;
    Openfile1: TMenuItem;
    OpenfilewithaDAT1: TMenuItem;
    ConfigPnl: TPanel;
    Pnl_left: TPanel;
    Pnl_middle: TPanel;
    Pnl_RightClient: TPanel;
    Pnl_LeftClient: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Preferences1: TMenuItem;
    Print1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintinPDF1: TMenuItem;
    Resetzoom1: TMenuItem;
    Resolvehost1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Btn_Openfile: TSpeedButton;
    SD: TSaveDialog;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Btn_Print: TSpeedButton;
    Btn_SCapture: TSpeedButton;
    Btn_PDF: TSpeedButton;
    Btn_MemInfo: TSpeedButton;
    AddTabBtn: TSpeedButton;
    RemoveTabBtn: TSpeedButton;
    BackBtn: TSpeedButton;
    ForwardBtn: TSpeedButton;
    ReloadBtn: TSpeedButton;
    GoBtn: TSpeedButton;
    ConfigBtn: TSpeedButton;
    StopBtn: TSpeedButton;
    Btn_OpenfilewithaDAT: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Btn_Cfg: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SplitterRight: TSplitter;
    SplitterCenter: TSplitter;
    SQLConnector1: TSQLConnector;
    SQLConnector2: TSQLConnector;
    SQLite3Connection1: TSQLite3Connection;
    SQLite3Connection2: TSQLite3Connection;
    SQLPageControl: TPageControl;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    Left_SBar: TStatusBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar5: TToolBar;
    URLCbx: TComboBox;
    Zoom1: TMenuItem;
    procedure AddTabBtnClick(Sender: TObject);
    procedure Btn_CfgClick(Sender: TObject);
    procedure Btn_CloseAll2Click(Sender: TObject);
    procedure Btn_PdfTxtClick(Sender: TObject);
    procedure Btn_CommitClick(Sender: TObject);
    procedure Btn_MemInfoClick(Sender: TObject);
    procedure Btn_OpenfileClick(Sender: TObject);
    procedure Btn_OpenfilewithaDATClick(Sender: TObject);
    procedure Btn_PDFClick(Sender: TObject);
    procedure Btn_PrintClick(Sender: TObject);
    procedure Btn_RunClick(Sender: TObject);
    procedure Btn_RollbackClick(Sender: TObject);
    procedure Btn_CloseAllClick(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_PrintTxtClick(Sender: TObject);
    procedure Btn_SCaptureClick(Sender: TObject);
    procedure ConfigBtnClick(Sender: TObject);
    procedure Deczoom1Click(Sender: TObject);
    procedure DevTools1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frReportEnterRect(Memo: TStringList; View: TfrView);
    procedure frReportExportFilterSetup(Sender: TfrExportFilter);
    procedure Inczoom1Click(Sender: TObject);
    procedure Memoryinfo1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Openfile1Click(Sender: TObject);
    procedure OpenfilewithaDAT1Click(Sender: TObject);
    procedure Pnl_LeftTopPaint(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintinPDF1Click(Sender: TObject);
    procedure Print_htm_MemoClick(Sender: TObject);
    procedure Print_htm_SQLClick(Sender: TObject);
    procedure Print_pdf_MemoClick(Sender: TObject);
    procedure Print_pdf_SQLClick(Sender: TObject);
    procedure Print_Preview_MemoClick(Sender: TObject);
    procedure Print_Preview_SQLClick(Sender: TObject);
    procedure Print_txt_MemoClick(Sender: TObject);
    procedure Print_txt_SQLClick(Sender: TObject);
    procedure RemoveTabBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BackBtnClick(Sender: TObject);
    procedure ForwardBtnClick(Sender: TObject);
    procedure ReloadBtnClick(Sender: TObject);
    procedure Resetzoom1Click(Sender: TObject);
    procedure Resolvehost1Click(Sender: TObject);
    procedure Btn_NewClick(Sender: TObject);
    procedure Btn_OpenClick(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SQLPageControlChange(Sender: TObject);
    procedure SQLPageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StopBtnClick(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure URLCbxChange(Sender: TObject);
    procedure URLCbxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    FClosingTab : boolean;
    FCanClose   : boolean;
    FClosing    : boolean;
    _exeDevTool : boolean;
    _GridPrint  : boolean;

    procedure ShowDevTools(aPoint : TPoint); overload;
    procedure ShowDevTools; overload;
    procedure HideDevTools(TabIdx: Integer);

    procedure Chromium_OnAfterCreated(Sender: TObject; const browser: ICefBrowser);
    procedure Chromium_OnAddressChange(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
    procedure Chromium_OnTitleChange(Sender: TObject; const browser: ICefBrowser; const title: ustring);
    procedure Chromium_OnClose(Sender: TObject; const browser: ICefBrowser; var aAction : TCefCloseBrowserAction);
    procedure Chromium_OnBeforeClose(Sender: TObject; const browser: ICefBrowser);
    procedure Chromium_OnBeforePopup(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const targetUrl, targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo; var client: ICefClient; var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue; var noJavascriptAccess: Boolean; var Result: Boolean);

    procedure BrowserCreatedMsg(var aMessage : TMessage); message CEF_AFTERCREATED;
    procedure BrowserDestroyWindowParentMsg(var aMessage : TMessage); message CEFBROWSER_DESTROYWNDPARENT;
    procedure BrowserDestroyTabMsg(var aMessage : TMessage); message CEFBROWSER_DESTROYTAB;
    procedure BrowserCheckTaggedTabsMsg(var aMessage : TMessage); message CEFBROWSER_CHECKTAGGEDTABS;
    procedure CEFInitializedMsg(var aMessage : TMessage); message CEFBROWSER_INITIALIZED;
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;

    function  AllTabSheetsAreTagged : boolean;
    procedure CloseAllBrowsers;
    function  GetPageIndex(const aSender : TObject; var aPageIndex : integer) : boolean;
    procedure NotifyMoveOrResizeStarted;
    function  SearchChromium(aPageIndex : integer; var aChromium : TChromium) : boolean;
    function  SearchWindowParent(aPageIndex : integer; var aWindowParent : TCEFWindowParent) : boolean;

  private
    { private declarations }
    BeforePageControlIndex: Integer;
    PageControl1: TODPageControl;
  public
    { Public declarations }
    procedure __setGPrint(GPrint: Boolean);
    property  __getGPrint: Boolean read _GridPrint write __setGPrint;

    procedure setBeforePageControlIndex(Idx: Integer);
    function  getBeforePageControlIndex: Integer;

    procedure setExeDevTool(exeDevTool: Boolean);
    function  getExeDevTool: Boolean;

    procedure __AddTab;
    procedure __RemoveTab;

    procedure __AddSQLTab;
    procedure __RemoveSQLTab(Sender: TObject);
    procedure __RemoveALLSQLTab(Sender: TObject);
    function  __ActivePageIdx: Integer;
    procedure __MemoModified;
    function  __FirstToken(FStr: String): String;
    function  __QryDML: String;
    function  __ExtDML: TStringList;
    procedure __ExportMEMO(ExportFileType: Integer);
    procedure __ExportSQL(_SQL: String; _ExportFileType: Integer; _ReportLoadFile: String; _FieldSize: Integer); overload;
    procedure __ExportSQL(_SQL: String; _ExportFileType: Integer; _ExportFileName: String; _ReportLoadFile: String; _FieldSize: Integer); overload;
    procedure __PreviewSQL(_SQL: String; _ReportLoadFile: String; _FieldSize: Integer); overload;
  end;

var
  MainForm: TMainForm;
  _GStrList: TStringList;
  _ExtDML: TStringList;
  _TSheetCount: Integer;
  _Memo: array[0..500] of TMemo;
  _DBGrid: array[0..500] of TDBGrid;
  _Splitter: array[0..500] of TSplitter;
  _StatusBar: array[0..500] of TStatusBar;

const
  _HeadSign = '# ';
  _BLANK = 'about:blank';
  _lrfRepoert = '..\..\..\conf\ActiveMemo.lrf';
  _SQL_SYS_DMLS_QRY_FILE = '..\..\..\conf\SQL_SYS_DMLS_QRY.txt';
  _SQL_SYS_DMLS_EXT_FILE = '..\..\..\conf\SQL_SYS_DMLS_EXT.txt';
  _SQL_SYS_DMLS_QRY = ' SELECT TRIM(DML_NAME) AS DML_NAME FROM SYS_DMLS WHERE OWNER = ''SYS'' AND DML_NAME = ''SELECT''  ';
  _SQL_SYS_DMLS_EXT = ' SELECT TRIM(DML_NAME) AS DML_NAME FROM SYS_DMLS WHERE OWNER = ''SYS'' AND DML_NAME <> ''SELECT''  ';

//  _QryDML = 'SELECT';
//  _ExtDML: array [0..13] of String = ('INSERT','UPDATE','DELETE','CREATE','DROP','ALTER','TRUNCATE',
//                                      'GRANT','REVOKE','RENAME','COMMIT','ROLLBACK','SAVEPOINT','MERGE');

procedure CreateGlobalCEFApp;

implementation
uses Sqlite3DB;

{$R *.lfm}

procedure GlobalCEFApp_OnContextInitialized;
begin
  if (MainForm <> nil) and MainForm.HandleAllocated then
    PostMessage(MainForm.Handle, CEFBROWSER_INITIALIZED, 0, 0);
end;

procedure CreateGlobalCEFApp;
begin
  GlobalCEFApp                      := TCefApplication.Create;
  GlobalCEFApp.OnContextInitialized := GlobalCEFApp_OnContextInitialized;
end;

procedure TODPageControl.PaintWindow(DC: HDC);
begin
  MainForm.setBeforePageControlIndex(ActivePageIndex);
  inherited PaintWindow(DC);
end;

constructor TODPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TODPageControl.Destroy();
begin
  inherited Destroy();
end;

procedure TODPageControl.Change;
var
  TempChromium: TChromium;
begin
  with MainForm do begin

    if DevTools.Visible then begin
       HideDevTools(getBeforePageControlIndex);
       Application.ProcessMessages;
    end
    else begin
{
       if (TabIndex >= Tabs.Count - 1) then begin
            __AddTab;
            Application.ProcessMessages;

            PageControl1.PaintWindow(Handle);
            __RemoveTab;
         end;//end if
}
    end;//end if

  setExeDevTool(False);
  end;//end with

  if showing and MainForm.SearchChromium(TabIndex, TempChromium) then begin
//     MainForm.URLCbx.Text := TempChromium.DocumentURL;
     MainForm.URLCbx.Text := _BLANK;
  end;//end if

end;

procedure TODPageControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  r: TRect;
  i: integer;
begin
  if Button = mbLeft then begin
    i := IndexOfTabAt(Point(X,Y));
    r := TabRect(i);

    r.TopLeft.X := r.TopLeft.X + 8;
    r.TopLeft.Y := r.TopLeft.Y + 0;
    r.BottomRight.X := r.TopLeft.X + 10;
    r.BottomRight.Y := r.BottomRight.Y - 4;
//==============================================================================
//TEST
//==============================================================================
{
    ShowMessage(  ' X : ' + inttostr(X) +
                  ' Y : ' + inttostr(Y) +
                  '  =  ' +
                  ' r.TopLeft.X : ' + inttostr(r.TopLeft.X) +
                  ' r.BottomRight.X : ' + inttostr(r.BottomRight.X) +
                  ' r.TopLeft.Y : ' + inttostr(r.TopLeft.Y) +
                  ' r.BottomRight.Y : ' + inttostr(r.BottomRight.Y) +
                  '  =  ' +
                  '   x1 : ' + inttostr(  r.Top     ) +
                  '   y1 : ' + inttostr(  r.Bottom  ) +
                  '   x2 : ' + inttostr(  r.Left    ) +
                  '   y2 : ' + inttostr(  r.Right   ) );

    MainForm.memo1.Lines.add(
                  ' X : ' + inttostr(X) +
                  ' Y : ' + inttostr(Y) +
                  '  =  ' +
                  ' r.TopLeft.X : ' + inttostr(r.TopLeft.X) +
                  ' r.BottomRight.X : ' + inttostr(r.BottomRight.X) +
                  ' r.TopLeft.Y : ' + inttostr(r.TopLeft.Y) +
                  ' r.BottomRight.Y : ' + inttostr(r.BottomRight.Y) +
                  '  =  ' +
                  '   x1 : ' + inttostr(  r.Top     ) +
                  '   y1 : ' + inttostr(  r.Bottom  ) +
                  '   x2 : ' + inttostr(  r.Left    ) +
                  '   y2 : ' + inttostr(  r.Right   ) );

    if (  (  (r.TopLeft.X) <= X  ) and (  X <= (r.BottomRight.X)  ) and
          (  (r.TopLeft.Y) <= Y  ) and (  Y <= (r.BottomRight.Y)  )  ) then ShowMessage('OK')
    else ShowMessage('NO');
}
//==============================================================================
    if (((r.TopLeft.X) <= X) and (X <= (r.BottomRight.X))
          and
        ((r.TopLeft.Y) <= Y) and (Y <= (r.BottomRight.Y))) then begin

         with MainForm do begin
              PageControl1.PaintWindow(Handle);
              __RemoveTab;
         end;//end with
    end;//end if
//==============================================================================
  end;//end if
end;

procedure TMainForm.__setGPrint(GPrint: Boolean);
begin
  _GridPrint := GPrint;
end;

procedure TMainForm.setBeforePageControlIndex(Idx: Integer);
begin
  BeforePageControlIndex := Idx;
end;

function TMainForm.getBeforePageControlIndex: Integer;
begin
  result := BeforePageControlIndex;
end;

procedure TMainForm.setExeDevTool(exeDevTool: Boolean);
begin
  _exeDevTool := exeDevTool;
end;

function  TMainForm.getExeDevTool: Boolean;
begin
  result := _exeDevTool;
end;

procedure TMainForm.__AddTab;
var
  TempSheet        : TTabSheet;
  TempWindowParent : TCEFWindowParent;
  TempChromium     : TChromium;
begin
  ButtonPnl.Enabled    := False;
  PageControl1.Enabled := False;
  PageControl1.Images  := ImageList1;

  TempSheet             := TTabSheet.Create(PageControl1);
//TempSheet.Caption     := 'New Tab';
  TempSheet.PageControl := PageControl1;
  TempSheet.ImageIndex  := 0;

  TempWindowParent        := TCEFWindowParent.Create(TempSheet);
  TempWindowParent.Parent := TempSheet;
  TempWindowParent.Color  := clWhite;
  TempWindowParent.Align  := alClient;

  TempChromium                 := TChromium.Create(TempSheet);
  TempChromium.OnAfterCreated  := Chromium_OnAfterCreated;
  TempChromium.OnAddressChange := Chromium_OnAddressChange;
  TempChromium.OnTitleChange   := Chromium_OnTitleChange;
  TempChromium.OnClose         := Chromium_OnClose;
  TempChromium.OnBeforeClose   := Chromium_OnBeforeClose;
  TempChromium.OnBeforePopup   := Chromium_OnBeforePopup;

  TempChromium.CreateBrowser(TempWindowParent, '');
  PageControl1.ActivePage := TempSheet;
end;

procedure TMainForm.AddTabBtnClick(Sender: TObject);
begin
  PageControl1.PaintWindow(Handle);
  PageControl1.Change;
  __AddTab;
end;

procedure TMainForm.Btn_CfgClick(Sender: TObject);
var
  i: integer;
begin
    ShowMessage(  __Qrydml );

    __ExtDML;

    for i := 0 to _ExtDML.Count - 1 do begin
        ShowMessage(    _ExtDML[i]    );
    end;//end for
end;

procedure TMainForm.Btn_CloseAll2Click(Sender: TObject);
begin
  Memoryinfo1Click(Sender);
end;

procedure TMainForm.__PreviewSQL(_SQL: String;
                                 _ReportLoadFile: String;
                                 _FieldSize: Integer); overload;
var
  subSQLQuery: TSQLQuery;
  i: Integer;
  Str: String;
begin
  subSQLQuery := __QuerySQLite(_SQL, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);

  if subSQLQuery.RecordCount <= 0 then exit;
  if subSQLQuery.FieldCount <= 0 then exit;

  _GStrList.Clear;
  for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
      Str := Str + PadRight(subSQLQuery.Fields[i].FieldName, _FieldSize);
  end;//end for
  _GStrList.Add(Str);

  Str := '';
  with subSQLQuery do begin
       First;
       while Not Eof do begin
             for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
                 Str := Str + PadRight(subSQLQuery.Fields[i].AsString, _FieldSize);
             end;//end for
             _GStrList.Add(Str);
             Str := '';
       Next;
       end;//end while
  end;//end with

//  frReport.LoadFromFile(_ReportLoadFile);
//  frReport.ShowReport;
end;

procedure TMainForm.__ExportSQL(_SQL: String;
                                _ExportFileType: Integer;
                                _ReportLoadFile: String;
                                _FieldSize: Integer); overload;
var
  subSQLQuery: TSQLQuery;
  i: Integer;
  Str: String;
begin
  subSQLQuery := __QuerySQLite(_SQL, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);

  if subSQLQuery.RecordCount <= 0 then exit;
  if subSQLQuery.FieldCount <= 0 then exit;

  _GStrList.Clear;
  for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
      Str := Str + PadRight(subSQLQuery.Fields[i].FieldName, _FieldSize);
  end;//end for
  _GStrList.Add(Str);

  Str := '';
  with subSQLQuery do begin
       First;
       while Not Eof do begin
             for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
                 Str := Str + PadRight(subSQLQuery.Fields[i].AsString, _FieldSize);
             end;//end for
             _GStrList.Add(Str);
             Str := '';
       Next;
       end;//end while
  end;//end with

  case _ExportFileType of
  0 : begin
      SD.DefaultExt := 'pdf';
      SD.Filter := 'PDF files (*.pdf)|*.PDF|Any files (*.*)|*.*';
      end;
  1 : begin
      SD.DefaultExt := 'txt';
      SD.Filter := 'TXT files (*.txt)|*.TXT|Any files (*.*)|*.*';
      end;
  2 : begin
      SD.DefaultExt := 'html';
      SD.Filter := 'HTML files (*.html)|*.HTML;*.HTM|Any files (*.*)|*.*';
      end;
  3 : begin
      SD.DefaultExt := 'csv';
      SD.Filter := 'CSV files (*.csv)|*.CSV|Any files (*.*)|*.*';
      end;
  end;//end case

{
  frReport.LoadFromFile(_ReportLoadFile);
  if (frReport.PrepareReport) then begin
      SD.InitialDir := ExtractFilePath(Application.ExeName);
      if SD.Execute then begin
          case _ExportFileType of
          0 : begin
                   if frReport.ExportTo(TFrTNPDFExportFilter, SD.FileName) then
                      ShowMessage('Report successfully exported to PDF')
                   else ShowMessage(SysErrorMessage(GetLastOSError));
              end;
          1 : begin
                   if frReport.ExportTo(TfrTextExportFilter, SD.FileName) then
                      ShowMessage('Report successfully exported to TXT')
                   else ShowMessage(SysErrorMessage(GetLastOSError));
              end;
          2 : begin
                   if frReport.ExportTo(TfrHtmExportFilter, SD.FileName) then
                      ShowMessage('Report successfully exported to HTML')
                   else ShowMessage(SysErrorMessage(GetLastOSError));
              end;
          3 : begin //Warring! TfrCSVExportFilter exist error
                   if frReport.ExportTo(TfrCSVExportFilter, SD.FileName) then
                      ShowMessage('Report successfully exported to CSV')
                   else ShowMessage(SysErrorMessage(GetLastOSError));
              end;
          end;//end case
      end;//end if
  end;//end if
}
end;


procedure TMainForm.__ExportSQL(_SQL: String;
                                _ExportFileType: Integer;
                                _ExportFileName: String;
                                _ReportLoadFile: String;
                                _FieldSize: Integer); overload;
var
  subSQLQuery: TSQLQuery;
  i: Integer;
  Str: String;
begin
  subSQLQuery := __QuerySQLite(_SQL, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);

  if subSQLQuery.RecordCount <= 0 then exit;
  if subSQLQuery.FieldCount <= 0 then exit;

  _GStrList.Clear;
  for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
      Str := Str + PadRight(subSQLQuery.Fields[i].FieldName, _FieldSize);
  end;//end for
  _GStrList.Add(Str);

  Str := '';
  with subSQLQuery do begin
       First;
       while Not Eof do begin
             for i := 0 to Pred(subSQLQuery.FieldCount - 1) do begin
                 Str := Str + PadRight(subSQLQuery.Fields[i].AsString, _FieldSize);
             end;//end for
             _GStrList.Add(Str);
             Str := '';
       Next;
       end;//end while
  end;//end with

  {
  frReport.LoadFromFile(_ReportLoadFile);

  case _ExportFileType of
  0  : begin
            if (frReport.PrepareReport) then begin
                if frReport.ExportTo(TFrTNPDFExportFilter, _ExportFileName + '.pdf') then
                   ShowMessage('Report successfully exported to PDF')
                else ShowMessage(SysErrorMessage(GetLastOSError));
            end;//end if
       end;
  1  : begin
            if (frReport.PrepareReport) then begin
                if frReport.ExportTo(TfrTextExportFilter, _ExportFileName + '.txt') then
                   ShowMessage('Report successfully exported to TXT')
                else ShowMessage(SysErrorMessage(GetLastOSError));
            end;//end if
       end;
  2  : begin
            if (frReport.PrepareReport) then begin
                if frReport.ExportTo(TfrHtmExportFilter, _ExportFileName + '.html') then
                   ShowMessage('Report successfully exported to HTML')
                else ShowMessage(SysErrorMessage(GetLastOSError));
            end;//end if
       end;
  3  : begin //Warring! TfrCSVExportFilter exist error
            if (frReport.PrepareReport) then begin
                if frReport.ExportTo(TfrCSVExportFilter, _ExportFileName + '.csv') then
                   ShowMessage('Report successfully exported to CSV')
                else ShowMessage(SysErrorMessage(GetLastOSError));
            end;//end if
       end;
  end;//end case
}

end;

procedure TMainForm.Btn_PdfTxtClick(Sender: TObject);
begin
  with Btn_PdfTxt.ClientToScreen(point(0, 0)) do
       PopupMenu3.Popup(X, Y);
end;

procedure TMainForm.Btn_CommitClick(Sender: TObject);
begin
  if SQLPageControl.PageCount < 1 then exit;

  __Commit(SQLTransaction1);
  __Commit(SQLTransaction2);
  __EndTransaction(SQLTransaction1);
  __EndTransaction(SQLTransaction2);
  Btn_Commit.Enabled := False;
  Btn_Rollback.Enabled := False;

  if __FirstToken(_Memo[__ActivePageIdx].Lines.Text) = __QryDML then Btn_RunClick(Sender);
end;

procedure TMainForm.Btn_MemInfoClick(Sender: TObject);
begin
  Memoryinfo1Click(Sender);
end;

procedure TMainForm.Btn_OpenfileClick(Sender: TObject);
begin
  Openfile1Click(Sender);
end;

procedure TMainForm.Btn_OpenfilewithaDATClick(Sender: TObject);
begin
  OpenfilewithaDAT1Click(Sender);
end;

procedure TMainForm.Btn_PDFClick(Sender: TObject);
begin
  PrintinPDF1Click(Sender);
end;

procedure TMainForm.Btn_PrintClick(Sender: TObject);
begin
  Print1Click(Sender);
end;

procedure TMainForm.Btn_RollbackClick(Sender: TObject);
begin
  if SQLPageControl.PageCount < 1 then exit;

  __Rollback(SQLTransaction1);
  __Rollback(SQLTransaction2);
  __EndTransaction(SQLTransaction1);
  __EndTransaction(SQLTransaction2);
  Btn_Commit.Enabled := False;
  Btn_Rollback.Enabled := False;

  if __FirstToken(_Memo[__ActivePageIdx].Lines.Text) = __QryDML then Btn_RunClick(Sender);
end;

function TMainForm.__FirstToken(FStr: String): String;
var
  _List: TStringList;
const
  _Delimiter = ' ';
begin
  if SQLPageControl.PageCount < 1 then exit;
  if UpperCase(Trim(FStr)) = '' then exit;

  _List := TStringList.Create;
  try
    _List.Delimiter := _Delimiter;
    _List.StrictDelimiter := False;
    _List.DelimitedText := UpperCase(Trim(FStr));

    result := UpperCase(Trim(_List[0]));
  finally
    _List.Free;
  end;//end try
end;

function  TMainForm.__QryDML: String;
var
  StrList: TStringList;
begin
  try
    StrList := TStringList.Create;
    StrList.Clear;

    if FileExists(Application.Location + _SQL_SYS_DMLS_QRY_FILE) then begin
       StrList.LoadFromFile(Application.Location + _SQL_SYS_DMLS_QRY_FILE);
    end
    else begin
         StrList.Text := _SQL_SYS_DMLS_QRY;
    end;//end if

    __QuerySQLite(StrList.Text, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);
    result := SQLQuery1.FieldValues['DML_NAME'];
  finally
    StrList.Free;
  end;//end try
end;

function  TMainForm.__ExtDML: TStringList;
var
  locQry: TSQLQuery;
  StrList: TStringList;
begin
  try
    StrList := TStringList.Create;
    StrList.Clear;

    if FileExists(Application.Location + _SQL_SYS_DMLS_EXT_FILE) then begin
       StrList.LoadFromFile(Application.Location + _SQL_SYS_DMLS_EXT_FILE);
    end
    else begin
         StrList.Text := _SQL_SYS_DMLS_EXT;
    end;//end if

    locQry := __QuerySQLite(StrList.Text, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);
    try
       _ExtDML.Clear;
       with locQry do begin
            First;
            while Not Eof do begin
                  _ExtDML.AddText(FieldValues['DML_NAME']);
            Next;
            end;//end while
       end;//end with
    finally
      result := _ExtDML;
    end;//end try
  finally
    StrList.Free;
  end;//end try
end;

procedure TMainForm.Btn_RunClick(Sender: TObject);
var
  localSQL: String;
  i, ActivePageIdx: Integer;
  NotSQL: Boolean;
begin
  if SQLPageControl.PageCount < 1 then exit;

  NotSQL := True;  //This Text is no SQL
  if __FirstToken(_Memo[__ActivePageIdx].Lines.Text) = __QryDML then begin
     NotSQL := False; //SQL
  end
  else begin
       __ExtDML;
       for i := 0 to _ExtDML.Count - 1 do begin
           if _ExtDML[i] = __FirstToken(_Memo[__ActivePageIdx].Lines.Text) then begin
              NotSQL := False; //SQL
           end;//end if
       end;//end for
  end;//end if

  if NotSQL = True then exit; //This Text is no SQL

  ActivePageIdx := __ActivePageIdx; //Revoke 2th

  if Trim(_Memo[ActivePageIdx].Lines.Text) = '' then exit;

  localSQL := _Memo[ActivePageIdx].Lines.Text;

  try
     if __FirstToken(localSQL) = __QryDML then begin
        _DBGrid[ActivePageIdx].DataSource := DataSource1;
        __QuerySQLite(localSQL, SQLite3Connection1, SQLTransaction1, SQLQuery1, _DatabaseName, DataSource1, _Q_DML);
        _StatusBar[ActivePageIdx].SimpleText := ' Record Count : ' + IntToStr(SQLQuery1.RecordCount);
     end
     else begin
          _DBGrid[ActivePageIdx].DataSource := DataSource2;
          __QuerySQLite(localSQL, SQLite3Connection2, SQLTransaction2, SQLQuery2, _DatabaseName, DataSource2, _IDU_DML);
          _StatusBar[ActivePageIdx].SimpleText := ' Rows Affected Count : ' + IntToStr(SQLQuery2.RowsAffected);
          Btn_Commit.Enabled := True;
          Btn_Rollback.Enabled := True;
     end;//end if
  except
      on E: ESQLDatabaseError do ShowMessageFmt('ErrorCode : %d; Messsge: %s', [E.ErrorCode, E.Message]);
  end;//end try
end;

procedure TMainForm.ConfigBtnClick(Sender: TObject);
var
  TempPoint : TPoint;
begin
  TempPoint.x := ConfigBtn.left;
  TempPoint.y := ConfigBtn.top + ConfigBtn.Height;
  TempPoint   := ConfigPnl.ClientToScreen(TempPoint);

  PopupMenu1.Popup(TempPoint.x, TempPoint.y);
end;

procedure TMainForm.Deczoom1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.DecZoomStep;
end;

procedure TMainForm.DevTools1Click(Sender: TObject);
begin
  Application.ProcessMessages;

  if DevTools.Visible then begin
     HideDevTools(PageControl1.ActivePageIndex);
     setExeDevTool(False);
  end
  else begin
       ShowDevTools;
       setExeDevTool(True);
  end;//end if
end;

procedure TMainForm.ShowDevTools(aPoint : TPoint);
var
  TempChromium: TChromium;
begin
  SplitterRight.Visible := True;
  DevTools.Visible := True;
  DevTools.Width := Width div 4;

  if SearchChromium(PageControl1.TabIndex, TempChromium) then
     TempChromium.ShowDevTools(aPoint, DevTools);
end;

procedure TMainForm.ShowDevTools;
var
  TempPoint : TPoint;
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     TempPoint.x := low(integer);
     TempPoint.y := low(integer);
  end;//end if

  ShowDevTools(TempPoint);
end;

procedure TMainForm.HideDevTools(TabIdx: Integer);
var
  TempChromium: TChromium;
begin
  if SearchChromium(TabIdx, TempChromium) then TempChromium.CloseDevTools(DevTools);

  SplitterRight.Visible := False;
  DevTools.Visible := False;
  DevTools.Width := 0;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  __RemoveAllSQLTab(Sender);

  __closeDataBase(SQLConnector1);
  __closeDataBase(SQLConnector2);
  __closeSQLite3(SQLite3Connection1);
  __closeSQLite3(SQLite3Connection2);
  _GStrList.Free;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  __MemoModified;

  if (Key = VK_N) and (Shift = [ssCtrl]) then begin
     Btn_NewClick(Sender);
  end
  else if (Key = VK_O) and (Shift = [ssCtrl]) then begin
       Btn_OpenClick(Sender);
  end
  else if (Key = VK_S) and (Shift = [ssCtrl]) then begin
       Btn_SaveClick(Sender);
  end
  else if (Key = VK_F3) and (Shift = [ssCtrl]) then begin
       Btn_CloseAllClick(Sender);
  end
  else if (Key = VK_F4) and (Shift = [ssCtrl]) then begin
       Btn_CloseClick(Sender);
  end
  else if (Key = VK_F5) then begin
       Btn_RunClick(Sender);
  end;//end if
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  __MemoModified;
end;

procedure TMainForm.frReportEnterRect(Memo: TStringList; View: TfrView);
begin
  if __getGPrint = True then begin
     //Print Grid Data
     if (View is TfrMemoView) then begin
        if (View as TfrMemoView).Name = 'ActiveMemo' then
           (View as TfrMemoView).Memo.Text := _GStrList.Text;  //insert value of memo into pdf file
     end;//end if
  end
  else begin
      //Print Memo Text
      if (View is TfrMemoView) then begin
         if (View as TfrMemoView).Name = 'ActiveMemo' then
            (View as TfrMemoView).Memo.Text := _Memo[__ActivePageIdx].Text;
      end;//end if
  end;//end if
end;

procedure TMainForm.frReportExportFilterSetup(Sender: TfrExportFilter);
begin
  // parameters that all export filters can change
  Sender.UseProgressbar:=false;
  //Sender.BandTypes := [btMasterData]; // by default all bandtypes are processed

  if sender is TfrHtmExportFilter then begin
    //TfrTextExportFilter(sender).UseBOM := true; // false by default
    //TfrTextExportFilter(Sender).UsedFont:=0; // force to show used font dialog
    TfrHtmExportFilter(Sender).UseCSS:=false;  // true by default
  end else
  if sender is TfrCSVExportFilter then begin
    TfrCSVExportFilter(sender).UseBOM := True;    // default settings + BOM = excel compatible
    //TfrCSVExportFilter(sender).QuoteChar := '''';
    //TfrCSVExportFilter(sender).QuoteType := qtNone;
    TfrCSVExportFilter(sender).Separator := '|';
  end else
  if Sender is TfrTextExportFilter then begin
    TfrTextExportFilter(sender).UseBOM := false;
    //TfrTextExportFilter(Sender).UsedFont:=0; // force to show used font dialog
  end;//end if
end;

procedure TMainForm.Inczoom1Click(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.IncZoomStep;
end;

procedure TMainForm.Memoryinfo1Click(Sender: TObject);
const
  BYTES_PER_MEGABYTE = 1024 * 1024;
var
  TempMessage : string;
begin
  TempMessage := 'Total memory used by this application : ' + inttostr(GlobalCEFApp.UsedMemory div BYTES_PER_MEGABYTE) + ' Mb' + CRLF +
                 'Total system memory : ' +  inttostr(GlobalCEFApp.TotalSystemMemory div BYTES_PER_MEGABYTE) + ' Mb' + CRLF +
                 'Available physical memory : ' + inttostr(GlobalCEFApp.AvailableSystemMemory div BYTES_PER_MEGABYTE) + ' Mb' + CRLF +
                 'Memory load : ' + inttostr(GlobalCEFApp.SystemMemoryLoad) + ' %';

  MessageDlg(TempMessage, mtInformation, [mbOK], 0);
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
var
  TempURL : string;
  TempChromium : TChromium;
begin
  TempURL := InputBox('Download Image', 'URL:', 'https://www.briskbard.com/images/logo.png');

  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     if (length(TempURL) > 0) then
         TempChromium.DownloadImage(TempURL, False, 0, False);
  end;//end if
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
var
  R: TRect;
//Bitmap: TBitmap;
  JPEG: TJPEGImage;
begin
//==============================================================================
//  SaveDialog1.DefaultExt := '.bmp';
//  SaveDialog1.Filter := 'Bitmap files (*.bmp)|*.bmp';
//
//  try
//    Bitmap := TBitmap.Create;
//    try
//      R := Rect(0, 0, Pnl_RightClient.Width, Pnl_RightClient.Height);
//      Bitmap.SetSize(Pnl_RightClient.Width, Pnl_RightClient.Height);
//      Bitmap.Canvas.CopyRect(R, Pnl_RightClient.Canvas, R);
//
//      if SaveDialog1.Execute then begin
//         Bitmap.SaveToFile(SaveDialog1.FileName);
//      end;//end if
//    finally
//      Bitmap.Free;
//    end;
//  except
//    on E: Exception do MessageDlg('Error','Error : ' + E.Message,mtError,[mbOk],0);
//  end;
//==============================================================================
  SaveDialog1.DefaultExt := '.jpg';
  SaveDialog1.Filter := 'Bitmap files (*.jpg)|*.jpg';

  try
    JPEG:=TJPEGImage.Create;
    try
      R := Rect(0, 0, Pnl_RightClient.Width, Pnl_RightClient.Height);
      JPEG.SetSize(Pnl_RightClient.Width, Pnl_RightClient.Height);
      JPEG.Canvas.CopyRect(R, Pnl_RightClient.Canvas, R);

      if SaveDialog1.Execute then begin
         JPEG.SaveToFile(SaveDialog1.FileName);
      end;//end if
    finally
      JPEG.Free;
    end;
  except
    on E: Exception do MessageDlg('Error','Error : ' + E.Message,mtError,[mbOk],0);
  end;
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     if not(TempChromium.FlushCookieStore(False)) then
       Showmessage('There was a problem flushing the cookies.');
  end;//end if
end;

procedure TMainForm.MenuItem4Click(Sender: TObject);
var
  TempLanguageList : ustring;
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
    TempLanguageList := TempChromium.AcceptLanguageList;
    if (length(TempLanguageList) = 0) then TempLanguageList := TempChromium.Options.AcceptLanguageList;
    if (length(TempLanguageList) = 0) then TempLanguageList := GlobalCEFApp.AcceptLanguageList;

    TempChromium.AcceptLanguageList := InputBox('Language', 'Accept language list', TempLanguageList);
  end;//end if
end;

procedure TMainForm.Openfile1Click(Sender: TObject);
var
  TempChromium : TChromium;
begin
  OpenDialog1.Filter := 'Any file (*.*)|*.*';

  if OpenDialog1.Execute then
    begin
      if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
         TempChromium.LoadURL('file:///' + OpenDialog1.FileName);
      end;//end if
    end;
end;

procedure TMainForm.OpenfilewithaDAT1Click(Sender: TObject);
var
  TempFile : TMemoryStream;
  TempChromium : TChromium;
begin
  TempFile := nil;

  try
    try
      OpenDialog1.Filter := 'HTML files (*.html)|*.HTML;*.HTM|PDF files (*.pdf)|*.PDF';

      if OpenDialog1.Execute then begin
          TempFile := TMemoryStream.Create;
          TempFile.LoadFromFile(OpenDialog1.FileName);

          if (OpenDialog1.FilterIndex = 1) then begin
            if SearchChromium(PageControl1.TabIndex, TempChromium) then
                TempChromium.LoadResource(TempFile, 'text/html', 'utf-8');
          end
          else begin
               if SearchChromium(PageControl1.TabIndex, TempChromium) then
                   TempChromium.LoadResource(TempFile, 'application/pdf', 'utf-8');
          end;//end if
      end;//end if
    except
      on e : exception do
        if CustomExceptionHandler('TMainForm.OpenfilewithaDAT1Click', e) then raise;
    end;
  finally
    if (TempFile <> nil) then FreeAndNil(TempFile);
  end;
end;

procedure TMainForm.Pnl_LeftTopPaint(Sender: TObject);
var
  ActivePageIdx: Integer;
begin
  ActivePageIdx := __ActivePageIdx;
  if SQLPageControl.PageCount < 1 then exit;

  if Copy(SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption,1,2) <> _HeadSign then
     _Memo[ActivePageIdx].Font.Color := clBlack
  else _Memo[ActivePageIdx].Font.Color := clRed;

  Caption := SQLPageControl.ActivePage.Caption;
end;

procedure TMainForm.Print1Click(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.Print;
end;

procedure TMainForm.PrintinPDF1Click(Sender: TObject);
var
  TempChromium : TChromium;
begin
  SaveDialog1.DefaultExt := 'pdf';
  SaveDialog1.Filter     := 'PDF files (*.pdf)|*.PDF';

  if SaveDialog1.Execute and (length(SaveDialog1.FileName) > 0) then begin
    if SearchChromium(PageControl1.TabIndex, TempChromium) then
       TempChromium.PrintToPDF(SaveDialog1.FileName, TempChromium.DocumentURL, TempChromium.DocumentURL);
  end;//end if
end;

procedure TMainForm.__ExportMEMO(ExportFileType: Integer);
begin
  case ExportFileType of
  0 : begin
      SD.DefaultExt := 'pdf';
      SD.Filter := 'PDF files (*.pdf)|*.PDF|Any files (*.*)|*.*';
      end;
  1 : begin
      SD.DefaultExt := 'txt';
      SD.Filter := 'TXT files (*.txt)|*.TXT|Any files (*.*)|*.*';
      end;
  2 : begin
      SD.DefaultExt := 'html';
      SD.Filter := 'HTML files (*.html)|*.HTML;*.HTM|Any files (*.*)|*.*';
      end;
  end;//end case

  __setGPrint(False);
  {
  if (frReport.PrepareReport) then begin
     SD.InitialDir := ExtractFilePath(Application.ExeName);
     if SD.Execute then begin

        case ExportFileType of
        0 : begin
                 if frReport.ExportTo(TFrTNPDFExportFilter, SD.FileName) then
                    ShowMessage('Report successfully exported to PDF!')
                 else ShowMessage(SysErrorMessage(GetLastOSError));
            end;
        1 : begin
                 if frReport.ExportTo(TfrTextExportFilter, SD.FileName) then
                    ShowMessage('Report successfully exported to TXT!')
                 else ShowMessage(SysErrorMessage(GetLastOSError));
            end;
        2 : begin
                 if frReport.ExportTo(TfrHtmExportFilter, SD.FileName) then
                    ShowMessage('Report successfully exported to HTML!')
                 else ShowMessage(SysErrorMessage(GetLastOSError));
            end;
        end;//end case
     end;//end if
  end;//end if
  }

end;

procedure TMainForm.Print_htm_MemoClick(Sender: TObject);
begin
  __ExportMEMO(2); //HTML
end;

procedure TMainForm.Print_htm_SQLClick(Sender: TObject);
var
  _SQL: String;
  _ReportLoadFile: String;
  _ExportFileType: Integer;
const
  _FieldSize = 20;
begin
  _ReportLoadFile := Application.Location + _lrfRepoert;
  _ExportFileType := 2; //0:pdf, 1:txt, 2:html, 3:csv
  _SQL := _Memo[__ActivePageIdx].Text;
  __setGPrint(True); //Grid Data Print
  __ExportSQL(_SQL, _ExportFileType, _ReportLoadFile, _FieldSize);
end;

procedure TMainForm.Print_pdf_MemoClick(Sender: TObject);
begin
  __ExportMEMO(0); //PDF
end;

procedure TMainForm.Print_pdf_SQLClick(Sender: TObject);
var
  _SQL: String;
  _ReportLoadFile: String;
  _ExportFileType: Integer;
const
  _FieldSize = 20;
begin
  _ReportLoadFile := Application.Location + _lrfRepoert;
  _ExportFileType := 0; //0:pdf, 1:txt, 2:html, 3:csv
  _SQL := _Memo[__ActivePageIdx].Text;
  __setGPrint(True); //Grid Data Print
  __ExportSQL(_SQL, _ExportFileType, _ReportLoadFile, _FieldSize);
end;

procedure TMainForm.Print_Preview_MemoClick(Sender: TObject);
begin
  __setGPrint(False);
//  frReport.LoadFromFile(Application.Location + _lrfRepoert);
//  frReport.ShowReport; //Preview
end;

procedure TMainForm.Print_Preview_SQLClick(Sender: TObject);
var
  _SQL: String;
  _ReportLoadFile: String;
const
  _FieldSize = 20;
begin
  _ReportLoadFile := Application.Location + _lrfRepoert;
  _SQL := _Memo[__ActivePageIdx].Text;
  __setGPrint(True); //Grid Data Print
  __PreviewSQL(_SQL, _ReportLoadFile, _FieldSize);
end;

procedure TMainForm.Print_txt_MemoClick(Sender: TObject);
begin
  __ExportMEMO(1); //TXT
end;

procedure TMainForm.Print_txt_SQLClick(Sender: TObject);
var
  _SQL: String;
  _ReportLoadFile: String;
  _ExportFileType: Integer;
const
  _FieldSize = 20;
begin
  _ReportLoadFile := Application.Location + _lrfRepoert;
  _ExportFileType := 1; //0:pdf, 1:txt, 2:html, 3:csv
  _SQL := _Memo[__ActivePageIdx].Text;
  __setGPrint(True); //Grid Data Print
  __ExportSQL(_SQL, _ExportFileType, _ReportLoadFile, _FieldSize);
end;

procedure TMainForm.__RemoveTab;
var
  TempChromium : TChromium;
  _oldTabIdx       : Integer;
begin
  _oldTabIdx := getBeforePageControlIndex;

  if DevTools.Visible then begin
     HideDevTools(_oldTabIdx);
  end;//end if

  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     FClosingTab          := True;
     ButtonPnl.Enabled    := False;
     PageControl1.Enabled := False;
     TempChromium.CloseBrowser(True);
  end;//end if

  Application.ProcessMessages;
end;

procedure TMainForm.RemoveTabBtnClick(Sender: TObject);
begin
  PageControl1.PaintWindow(Handle);
  __RemoveTab;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FClosingTab then CanClose := False
  else if (PageControl1.PageCount = 0) then CanClose := True
  else begin
       CanClose := FCanClose;
       if not(FClosing) then begin
          FClosing := True;
          Visible  := False;
          CloseAllBrowsers;
       end;//end if
  end;//end if
end;

procedure TMainForm.CloseAllBrowsers;
var
  i, j, k : integer;
  TempComponent : TComponent;
  TempSheet : TTabSheet;
  TempCtnue : boolean;
begin
  k := pred(PageControl1.PageCount);

  while (k >= 0) do begin
      TempSheet := PageControl1.Pages[k];
      TempCtnue := True;
      i := 0;
      j := TempSheet.ComponentCount;

      while (i < j) and TempCtnue do begin
          TempComponent := TempSheet.Components[i];

          if (TempComponent <> nil) and (TempComponent is TChromium) then begin
              TChromium(TempComponent).CloseBrowser(True);
              TempCtnue := False;
          end
          else inc(i);
      end;//end while
      dec(k);
  end;//end while
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  TempChromium : TChromium;
begin
  _GStrList := TStringList.Create;
  __setGPrint(False);
  _TSheetCount := 0;
  Btn_Commit.Enabled := False;
  Btn_Rollback.Enabled := False;
  __AddSQLTab;

  PageControl1        := TODPageControl.Create(Pnl_RightClient);
  PageControl1.Align  := alClient;
  PageControl1.Parent := Pnl_RightClient;

  FClosingTab := False;
  FCanClose   := False;
  FClosing    := False;
  setExeDevTool(False);

  URLCbx.Text := _BLANK;

  if DevTools.Visible then begin
     HideDevTools(PageControl1.TabIndex);
  end;//end if

  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     TempChromium.MultiBrowserMode := True;
     TempChromium.DefaultURL       := _BLANK;
  end;//end if

//  Pnl_LeftClient.Width := 1;
end;

procedure TMainForm.URLCbxChange(Sender: TObject);
begin
  GoBtnClick(Sender);
end;

procedure TMainForm.URLCbxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN  : GoBtnClick(Sender);
  end;//end case
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     TempChromium.WebRTCIPHandlingPolicy := hpDisableNonProxiedUDP;
     TempChromium.WebRTCMultipleRoutes   := STATE_DISABLED;
     TempChromium.WebRTCNonproxiedUDP    := STATE_DISABLED;
  end;//end if

  if (GlobalCEFApp <> nil) and
     GlobalCEFApp.GlobalContextInitialized and
     not(ButtonPnl.Enabled) then
    begin
      ButtonPnl.Enabled := True;
      Caption           := 'Tab Browser';
      cursor            := crDefault;
      if (PageControl1.PageCount = 0) then AddTabBtn.Click;
    end;
end;

procedure TMainForm.ForwardBtnClick(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.GoForward;
end;

procedure TMainForm.GoBtnClick(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     TempChromium.LoadURL(URLCbx.Text);
  end;//end if
end;

procedure TMainForm.ReloadBtnClick(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.Reload;
end;

procedure TMainForm.Resetzoom1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.ResetZoomLevel;
end;

procedure TMainForm.Resolvehost1Click(Sender: TObject);
var
  TempURL : string;
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then begin
     TempURL := inputbox('Resolve host', 'URL :', 'http://google.com');
     if (length(TempURL) > 0) then TempChromium.ResolveHost(TempURL);
  end;//end if
end;

procedure TMainForm.Btn_NewClick(Sender: TObject);
begin
  __AddSQLTab;
end;

procedure TMainForm.Btn_OpenClick(Sender: TObject);
var
  ActivePageIdx: Integer;
begin
  OpenDialog1.Filter := 'Load TXT file|*.txt';

  if OpenDialog1.Execute then begin
     __AddSQLTab;
     ActivePageIdx := __ActivePageIdx;
     _Memo[ActivePageIdx].Lines.LoadFromFile(OpenDialog1.FileName);
     _Memo[ActivePageIdx].Hint := OpenDialog1.FileName;
     _Memo[ActivePageIdx].Modified := False;
     Caption := ExtractFileName(OpenDialog1.FileName);
     SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption := ExtractFileName(OpenDialog1.FileName);
     __MemoModified;
  end;//end if
end;

procedure TMainForm.Btn_SaveClick(Sender: TObject);
var
  ActivePageIdx: Integer;
begin
  if SQLPageControl.PageCount < 1 then exit;

  SaveDialog1.Filter := 'Load TXT file|*.txt';

  ActivePageIdx := __ActivePageIdx;
  if FileExists(_Memo[ActivePageIdx].Hint) then begin
     _Memo[ActivePageIdx].Lines.SaveToFile(_Memo[ActivePageIdx].Hint);
     _Memo[ActivePageIdx].Modified := False;
     SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption := ExtractFileName(_Memo[ActivePageIdx].Hint);
  end
  else begin
       if SaveDialog1.Execute then begin
          if FileExists(SaveDialog1.Filename) then begin
             if MessageDlg('Warning', 'The file already exists. Do you want to overwrite it?', mtConfirmation,
                [mbYes, mbNo],0) = mrYes then begin
                _Memo[ActivePageIdx].Lines.SaveToFile(SaveDialog1.Filename);
                _Memo[ActivePageIdx].Hint := SaveDialog1.FileName;
                _Memo[ActivePageIdx].Modified := False;
                SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption := ExtractFileName(SaveDialog1.FileName);
             end;//end if
          end
          else begin
               _Memo[ActivePageIdx].Lines.SaveToFile(SaveDialog1.Filename);
               _Memo[ActivePageIdx].Hint := SaveDialog1.FileName;
               _Memo[ActivePageIdx].Modified := False;
               SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption := ExtractFileName(SaveDialog1.FileName);
          end;//end if
       end;//end if
  end;//end if
  __MemoModified;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin

end;

procedure TMainForm.SQLPageControlChange(Sender: TObject);
begin
  if SQLPageControl.PageCount < 1 then exit;

  Caption := SQLPageControl.ActivePage.Caption;
end;

procedure TMainForm.SQLPageControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r: TRect;
  i: integer;
begin
  if Button = mbLeft then begin
    i := SQLPageControl.IndexOfTabAt(Point(X,Y));
    r := SQLPageControl.TabRect(i);

    r.TopLeft.X := r.TopLeft.X + 8;
    r.TopLeft.Y := r.TopLeft.Y + 0;
    r.BottomRight.X := r.TopLeft.X + 10;
    r.BottomRight.Y := r.BottomRight.Y - 4;

    if (((r.TopLeft.X) <= X) and (X <= (r.BottomRight.X))
          and
        ((r.TopLeft.Y) <= Y) and (Y <= (r.BottomRight.Y))) then begin
          __RemoveSQLTab(Sender);
    end;//end if
  end;//end if
end;

procedure TMainForm.Btn_CloseClick(Sender: TObject);
begin
  __RemoveSQLTab(Sender);
end;

procedure TMainForm.Btn_PrintTxtClick(Sender: TObject);
begin
  with Btn_PrintTxt.ClientToScreen(point(0, 0)) do
       PopupMenu2.Popup(X, Y);
end;

procedure TMainForm.Btn_SCaptureClick(Sender: TObject);
begin
  MenuItem2Click(Sender);  //Screen Capture
end;

procedure TMainForm.Btn_CloseAllClick(Sender: TObject);
begin
  __RemoveAllSQLTab(Sender);
end;

procedure TMainForm.BackBtnClick(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.GoBack;
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
var
  TempChromium : TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then TempChromium.StopLoad;
end;

procedure TMainForm.BrowserCreatedMsg(var aMessage : TMessage);
var
  TempWindowParent : TCEFWindowParent;
  TempChromium     : TChromium;
begin
  ButtonPnl.Enabled    := True;
  PageControl1.Enabled := True;

  if SearchWindowParent(aMessage.lParam, TempWindowParent) then
    TempWindowParent.UpdateSize;

  if SearchChromium(aMessage.lParam, TempChromium) then begin
    TempChromium.LoadURL(URLCbx.Text);
  end;//end if
end;

procedure TMainForm.BrowserDestroyWindowParentMsg(var aMessage : TMessage);
var
  TempWindowParent : TCEFWindowParent;
begin
  if SearchWindowParent(aMessage.lParam, TempWindowParent) then TempWindowParent.Free;
end;

procedure TMainForm.BrowserDestroyTabMsg(var aMessage : TMessage);
begin
  if (aMessage.lParam >= 0) and (aMessage.lParam < PageControl1.PageCount) then
      PageControl1.Pages[aMessage.lParam].Free;

  FClosingTab := False;
  ButtonPnl.Enabled := True;
  PageControl1.Enabled := True;
end;

procedure TMainForm.BrowserCheckTaggedTabsMsg(var aMessage : TMessage);
begin
  if (aMessage.lParam >= 0) and (aMessage.lParam < PageControl1.PageCount) then begin
      PageControl1.Pages[aMessage.lParam].Tag := 1;

      if AllTabSheetsAreTagged then begin
         FCanClose := True;
         PostMessage(Handle, WM_CLOSE, 0, 0);
      end;//end if
  end;//end if
end;

function TMainForm.AllTabSheetsAreTagged : boolean;
var
  i : integer;
begin
  Result := True;
  i := pred(PageControl1.PageCount);

  while (i >= 0) and Result do begin
    if (PageControl1.Pages[i].Tag <> 1) then Result := False
    else dec(i);
  end;//end while
end;

procedure TMainForm.Chromium_OnAfterCreated(Sender: TObject; const browser: ICefBrowser);
var
  TempPageIndex : integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then begin
     if DevTools.Visible then begin
        HideDevTools(TempPageIndex);
     end;//end if

     PostMessage(Handle, CEF_AFTERCREATED, 0, TempPageIndex);
  end;//end if
end;

procedure TMainForm.Chromium_OnAddressChange(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);
var
  TempPageIndex : integer;
begin
  if not(FClosing) and
     (PageControl1.TabIndex >= 0) and
     GetPageIndex(Sender, TempPageIndex) and
     (PageControl1.TabIndex = TempPageIndex) then begin
      URLCbx.Text := url;
  end;//end if
end;

function TMainForm.GetPageIndex(const aSender : TObject; var aPageIndex : integer) : boolean;
begin
  Result     := False;
  aPageIndex := -1;

  if (aSender <> nil) and
     (aSender is TComponent) and
     (TComponent(aSender).Owner <> nil) and
     (TComponent(aSender).Owner is TTabSheet) then begin
      aPageIndex := TTabSheet(TComponent(aSender).Owner).PageIndex;
      Result     := True;
  end;//end if
end;

procedure TMainForm.Chromium_OnTitleChange(Sender: TObject; const browser: ICefBrowser; const title: ustring);
var
  TempPageIndex : integer;
begin
  if not(FClosing) and GetPageIndex(Sender, TempPageIndex) then begin
     if title = _BLANK then PageControl1.Pages[TempPageIndex].Caption := 'New tab'
     else PageControl1.Pages[TempPageIndex].Caption := title;
  end
  else begin
       PageControl1.Pages[TempPageIndex].Caption := 'New tab';
  end;//end if
end;

procedure TMainForm.Chromium_OnClose(Sender: TObject; const browser: ICefBrowser; var aAction : TCefCloseBrowserAction);
var
  TempPageIndex : integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then
     PostMessage(Handle, CEFBROWSER_DESTROYWNDPARENT, 0, TempPageIndex);
end;

procedure TMainForm.Chromium_OnBeforeClose(Sender: TObject; const browser: ICefBrowser);
var
  TempPageIndex : integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then begin
     if DevTools.Visible then begin
        HideDevTools(TempPageIndex);
     end;//end if

     if FClosing then PostMessage(Handle, CEFBROWSER_CHECKTAGGEDTABS, 0, TempPageIndex)
     else PostMessage(Handle, CEFBROWSER_DESTROYTAB, 0, TempPageIndex);
  end;//end if
end;

procedure TMainForm.Chromium_OnBeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; const popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings;
  var extra_info: ICefDictionaryValue;
  var noJavascriptAccess: Boolean;
  var Result: Boolean);
begin
  Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

function TMainForm.SearchChromium(aPageIndex : integer; var aChromium : TChromium) : boolean;
var
  i, j : integer;
  TempComponent : TComponent;
  TempSheet : TTabSheet;
begin
  Result := False;
  aChromium := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then begin
      TempSheet := PageControl1.Pages[aPageIndex];
      i := 0;
      j := TempSheet.ComponentCount;

      while (i < j) and not(Result) do begin
          TempComponent := TempSheet.Components[i];
          if (TempComponent <> nil) and (TempComponent is TChromium) then begin
              aChromium := TChromium(TempComponent);
              Result    := True;
          end
          else inc(i);
      end;//end while
  end;//end if
end;

function TMainForm.SearchWindowParent(aPageIndex : integer; var aWindowParent : TCEFWindowParent) : boolean;
var
  i, j : integer;
  TempControl : TControl;
  TempSheet : TTabSheet;
begin
  Result        := False;
  aWindowParent := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then begin
      TempSheet := PageControl1.Pages[aPageIndex];
      i := 0;
      j := TempSheet.ControlCount;

      while (i < j) and not(Result) do begin
          TempControl := TempSheet.Controls[i];
          if (TempControl <> nil) and (TempControl is TCEFWindowParent) then begin
              aWindowParent := TCEFWindowParent(TempControl);
              Result        := True;
          end
          else inc(i);
      end;//end while
  end;//end if
end;

procedure TMainForm.NotifyMoveOrResizeStarted;
var
  i, j : integer;
  TempChromium : TChromium;
begin
  if not(showing) or (PageControl1 = nil) or FClosing then exit;

  i := 0;
  j := PageControl1.PageCount;

  while (i < j) do begin
      if SearchChromium(i, TempChromium) then TempChromium.NotifyMoveOrResizeStarted;
      inc(i);
  end;//end while
end;

procedure TMainForm.WMMove(var aMessage : TWMMove);
begin
  inherited;
  NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMMoving(var aMessage : TMessage);
begin
  inherited;
  NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if not(FClosing) and (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := True;
end;

procedure TMainForm.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if not(FClosing) and (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := False;
end;

procedure TMainForm.CEFInitializedMsg(var aMessage : TMessage);
begin
  if not(ButtonPnl.Enabled) then begin
      ButtonPnl.Enabled := True;
      Caption           := 'Tab Browser';
      cursor            := crDefault;
      if (PageControl1.PageCount = 0) then AddTabBtn.Click;
  end;//end if
end;

procedure TMainForm.__RemoveALLSQLTab(Sender: TObject);
var
  i, j: Integer;
begin
  if SQLPageControl.PageCount < 1 then exit;

  for i := SQLPageControl.PageCount - 1 downto 0 do begin
      if Btn_Commit.Enabled = True then begin
         __ExtDML;
         for j := 0 to _ExtDML.Count - 1 do begin
             if _ExtDML[j] = __FirstToken(_Memo[__ActivePageIdx].Lines.Text) then begin
                if MessageDlg('Warning', 'Not end transaction. Do you want to close it?', mtConfirmation,
                  [mbYes, mbNo],0) = mrNo then exit;
             end;//end if
         end;//end for
      end;//end if

      if Copy(SQLPageControl.Pages[i].Caption,1,2) = _HeadSign then begin
         if MessageDlg('Warning', 'The file not saved. Do you want to save it?', mtConfirmation,
           [mbYes, mbNo],0) = mrYes then begin
            Btn_SaveClick(Sender);
           end;//end if
      end;//end if

      SQLPageControl.Pages[i].Free;
  end;//end if
  _TSheetCount := 0;
end;

procedure TMainForm.__RemoveSQLTab(Sender: TObject);
var
  i: Integer;
begin
  if SQLPageControl.PageCount < 1 then exit;

  if Btn_Commit.Enabled = True then begin
     __ExtDML;
     for i := 0 to _ExtDML.Count - 1 do begin
         if _ExtDML[i] = __FirstToken(_Memo[__ActivePageIdx].Lines.Text) then begin
            if MessageDlg('Warning', 'Not end transaction. Do you want to close it?', mtConfirmation,
              [mbYes, mbNo],0) = mrNo then exit;
         end;//end if
     end;//end for
  end;//end if

  if Copy(SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption,1,2) = _HeadSign then begin
     if MessageDlg('Warning', 'The file not saved. Do you want to save it?', mtConfirmation,
       [mbYes, mbNo],0) = mrYes then begin
        Btn_SaveClick(Sender);
     end;//end if
  end;//end if

  if SQLPageControl.PageCount = 1 then _TSheetCount := 0;
  if SQLPageControl.PageCount > 0 then SQLPageControl.ActivePage.Free;
end;

procedure TMainForm.__AddSQLTab;
var
  TempSheet: TTabSheet;
begin
  SQLPageControl.Images := ImageList1;
  TempSheet := TTabSheet.Create(SQLPageControl);
  _TSheetCount := _TSheetCount + 1;
  TempSheet.Name := 'New' + IntToStr(_TSheetCount);
  TempSheet.Parent := SQLPageControl;
  TempSheet.Caption := 'New' + IntToStr(_TSheetCount);
  TempSheet.ImageIndex := 0;
  Caption := TempSheet.Caption;

  _Splitter[_TSheetCount] := TSplitter.Create(TempSheet);
  _Splitter[_TSheetCount].Name := 'Splitter' + IntToStr(_TSheetCount);
  _Splitter[_TSheetCount].Parent := TempSheet;
  _Splitter[_TSheetCount].Cursor := crHSplit;
  _Splitter[_TSheetCount].Align := alTop;

  _Memo[_TSheetCount] := TMemo.Create(TempSheet);
  _Memo[_TSheetCount].Name := 'Memo' + IntToStr(_TSheetCount);
  _Memo[_TSheetCount].Parent := TempSheet;
  _Memo[_TSheetCount].Align := alTop;
  _Memo[_TSheetCount].Modified := False;
  _Memo[_TSheetCount].Height := 200;
  _Memo[_TSheetCount].Clear;

  _DBGrid[_TSheetCount] := TDBGrid.Create(TempSheet);
  _DBGrid[_TSheetCount].Name := 'DBGrid' + IntToStr(_TSheetCount);
  _DBGrid[_TSheetCount].Parent := TempSheet;
  _DBGrid[_TSheetCount].Align := alClient;
  _DBGrid[_TSheetCount].Clear;

  _StatusBar[_TSheetCount] := TStatusBar.Create(TempSheet);
  _StatusBar[_TSheetCount].Name := 'StatusBar' + IntToStr(_TSheetCount);
  _StatusBar[_TSheetCount].Parent := TempSheet;
  _StatusBar[_TSheetCount].Align := alBottom;
  _StatusBar[_TSheetCount].Height := 10;
  _StatusBar[_TSheetCount].SimplePanel := True;

  SQLPageControl.ActivePage := TempSheet;
end;

function  TMainForm.__ActivePageIdx: Integer;
begin
  result := StrToInt(Copy(SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Name, 4,
                     Length(SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Name) - 3));
end;

procedure TMainForm.__MemoModified;
var
  ActivePageIdx: Integer;
begin
  ActivePageIdx := __ActivePageIdx;

  if _Memo[ActivePageIdx].Modified then begin
     if Copy(SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption,1,2) <> _HeadSign then begin
        SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption := _HeadSign + SQLPageControl.Pages[SQLPageControl.ActivePage.TabIndex].Caption;
        _Memo[ActivePageIdx].Font.Color := clRed;
     end;//end if
  end
  else begin
       _Memo[ActivePageIdx].Font.Color := clBlack;
  end;//end if
end;

initialization
_ExtDML := TStringList.Create;

finalization
_ExtDML.Free;

end.
