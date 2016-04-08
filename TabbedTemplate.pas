unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.AnsiStrings, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Edit, FMX.EditBox,
  FMX.SpinBox, FMX.ScrollBox, FMX.Memo, FMX.Maps, FMX.NumberBox, System.Actions,
  FMX.ActnList;


type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    GestureManager1: TGestureManager;
    Lang1: TLang;
    Button2: TButton;
    Button4: TButton;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label1: TLabel;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox19: TCheckBox;
    Memo1: TMemo;
    Timer1: TTimer;
    NumberBox1: TNumberBox;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    GestureManager2: TGestureManager;
    ActionList1: TActionList;
    SafeBngWest: TAction;
    SafeBngSouth: TAction;
    SafeBngNorth: TAction;
    SafeBngEast: TAction;
    TabItem5: TTabItem;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    TabControlStaging: TTabControl;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    CheckBox1: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    Label3: TLabel;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    ToolBar1: TToolBar;
    Label4: TLabel;
    ToolBar2: TToolBar;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure CheckBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SafeBngWestExecute(Sender: TObject);
    procedure SafeBngSouthExecute(Sender: TObject);
    procedure SafeBngNorthExecute(Sender: TObject);
    procedure SafeBngEastExecute(Sender: TObject);
    procedure TabControl1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    procedure GreyOutJobbie(Sender: TCheckBox);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}

procedure TTabbedForm.SafeBngWestExecute(Sender: TObject);
begin
// up left gesture
  NumberBox1.Value := 270;
end;

procedure TTabbedForm.SafeBngSouthExecute(Sender: TObject);
begin
// down right gesture
  NumberBox1.Value := 180;
end;

procedure TTabbedForm.SafeBngNorthExecute(Sender: TObject);
begin
// down left gesture
  Numberbox1.Value := 0;
end;

procedure TTabbedForm.SafeBngEastExecute(Sender: TObject);
begin
// up right gesture
  Numberbox1.Value := 90;
end;

procedure TTabbedForm.Button1Click(Sender: TObject);
begin

  if Lang1.Lang = 'fr' then
    Lang1.Lang := 'en'
  else
    Lang1.Lang := 'fr';

end;

procedure TTabbedForm.GreyOutJobbie(Sender: TCheckBox);
begin
  if Sender.IsChecked then
    Sender.Opacity := 0.3
  else
    Sender.Opacity := 1;
end;

procedure TTabbedForm.SpeedButton1Click(Sender: TObject);
begin
  Label2.Text := 'Last checkin: ' + LeftStr(TimetoStr(Now), 5);
end;

procedure TTabbedForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if (TabControl1.ActiveTab = TabItem6) and (TabControlStaging.ActiveTab = TabItem7) then
    begin
      TabControlStaging.Previous;
      Key := 0;
    end;
  end;
end;





procedure TTabbedForm.Timer1Timer(Sender: TObject);
begin

  // Truth be told, I think the timer (at least with debug) drains your phone battery.

  Timer1.Enabled := False; // turn timer off, otherwise this procedure fires again and again
  // Interval = 60 seconds / minute * 30 minutes / checkin * 1000 itervals per millisecond.
  // 1800000
  // use 3 minutes instead for testing (drop a zero)
  //MessageDlg lets us execute code after the dialog box closes (rather than ShowMessage
// i.e. to reset the 1/2 hour clock
// However this not working  MessageDlg('Time to check in with Command', mtWarning, [mbOK], 0, mbOK);
// ambiguous overloaded call ???
// Stuck with this instead:
  ShowMessage('Time to get in touch with Command!');
  CheckBox8.isChecked := false;  // I think this actually trips on Timer1.
end;

procedure TTabbedForm.CheckBox1Change(Sender: TObject);
begin
  GreyOutJobbie(Sender as TCheckBox);
end;

procedure TTabbedForm.CheckBox8Change(Sender: TObject);
begin
//  Timer1.Enabled := True;
// Timer kills battery in phone?
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

end.
