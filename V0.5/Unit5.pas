unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if checkbox1.checked then
  form1.tag:=form1.tag+1;
 form1.Enabled:=true;
 form1.get;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
 form1.Tag:=2;
 close;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
 form1.Tag:=0;
 close;
end;

procedure TForm5.FormCreate(Sender: TObject);  
var tf:textfile;
    teach:integer;
begin
 assignfile(tf,'C:\WINDOWS\teach.txt');
 if not FileExists('C:\WINDOWS\teach.txt') then
  begin
   rewrite(tf);
   write(tf,1);
  end;
 reset(tf);
 read(tf,teach);
 form1.Tag:=0;
 if teach=1 then
  begin
   form5.Show;
   form1.Enabled:=false;
  end;
 closefile(tf);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
 button1.SetFocus;
end;

end.
