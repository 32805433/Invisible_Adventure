unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Menus, jpeg;

type
    TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    OpenDialog1: TOpenDialog;
    Label10: TLabel;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Button11: TButton;
    GroupBox4: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button12: TButton;
    Label16: TLabel;
    Label17: TLabel;
    Button13: TButton;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Button14: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N2: TMenuItem;
    N01: TMenuItem;
    N03: TMenuItem;
    N02: TMenuItem;
    N04: TMenuItem;
    N05: TMenuItem;
    N06: TMenuItem;
    N07: TMenuItem;
    GroupBox6: TGroupBox;
    Button10: TButton;
    Button15: TButton;
    Button16: TButton;
    Button6: TButton;
    Button9: TButton;
    Button17: TButton;
    N10: TMenuItem;
    N11: TMenuItem;
    Image1: TImage;
    N12: TMenuItem;
    Label4: TLabel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N03Click(Sender: TObject);
    procedure N04Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N05Click(Sender: TObject);
    procedure N06Click(Sender: TObject);
    procedure N07Click(Sender: TObject);
    procedure N02Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure swift;
    procedure drink;
    procedure fight_;   
    procedure get;
    procedure die(f:boolean);
    procedure light(a:integer);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure sbclick(Sender: TObject);
  public
    { Public declarations }
  end;


const n=22;
      m=24;

var
  Form1: TForm1;
  rocks,guns,dz,winem,curem,minem,lightm,lt,
  i1,i2,at,bt,x,y,xyuan,yyuan,p,k,win,hitpoints,life,ropes,keys,
  maxhitpoints,gold,getgold,size,torch,bulb,
  minattack,maxattack,monsterlife,minmonsterattack,maxmonsterattack,
  pat,pbt,pct,pdt:integer;
  a,wineinfer,showsb:array[1..n,1..n] of integer;
  b:array[1..m] of boolean;
  hints:array[1..n,1..n] of string;
  cansay:array[1..n,1..n] of boolean;
  find,fish,start,lh,fight,pon,pa,pb,pc,pd,fj:boolean;
  goldnumber:set of 2..4;
  sb:array[1..n,1..n] of Tspeedbutton;
  wall,space,key,door,wine,monster,won,guidepost:TBitmap;
  s:string;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.die(f:boolean);
begin
 if f then
  begin
   Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'���Ѿ�û�����ˣ���Ϸ������';
   button11.Enabled:=false;button14.Enabled:=false;
   Label7.Caption:='����ֵ��0';
   Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
   n2.Enabled:=false;Image1.Picture.Bitmap:=nil;
   for i1:=1 to size do
    for i2:=1 to size do
     sb[i1,i2].Enabled:=false;
  end
  else
   begin
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'���ź�������ʧ��һ�������㻹��'+inttostr(life)+'������'+chr(13)+chr(10)+'���ڻص������㡣��ȷ��������...';
    x:=1;y:=1;p:=3;hitpoints:=maxhitpoints;
    Label7.Caption:='����ֵ��'+inttostr(maxhitpoints);
    Label8.Caption:='���λ�ã���1,1��';
    sb[1,1].Down:=true;Image1.Picture.Bitmap:=space;
    Button5.Visible:=true;button5.SetFocus;
   end;
end;

procedure TForm1.fight_;
begin
  label2.Caption:='';
  if pon then monsterlife:=monsterlife-4;
  monsterlife:=monsterlife-at;
  if monsterlife<=0 then
    begin
      fight:=false;
      if pon then Label2.Caption:='�����ж��ˣ��ܵ�4���˺���'+chr(13)+chr(10)+'��Թ��������'+inttostr(at)+'���˺�'+chr(13)+chr(10)+'ս��ʤ����';
      if not pon then Label2.Caption:='��Թ��������'+inttostr(at)+'���˺�'+chr(13)+chr(10)+'ս��ʤ����';
      Image1.Picture.Bitmap:=space;
      pon:=false;
      groupbox5.Visible:=false;
      if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
      if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
      if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
      if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
      a[x,y]:=0;
    end;
  if monsterlife>0 then
    begin
      if pon then Label2.Caption:='�����ж��ˣ��ܵ�4���˺���'+chr(13)+chr(10)+'��Թ��������'+inttostr(at)+'���˺�';
      if not pon then Label2.Caption:='��Թ��������'+inttostr(at)+'���˺�';
      Label16.Caption:='����ֵ��'+inttostr(monsterlife);
      randomize;bt:=minmonsterattack+random(maxmonsterattack-minmonsterattack+1);
      hitpoints:=hitpoints-bt;Label7.Caption:='����ֵ��'+inttostr(hitpoints);
      Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'������������'+inttostr(bt)+'���˺�';
      if hitpoints<=0 then
        begin
          pon:=false;
          fight:=false;
          life:=life-1;
          Label6.Caption:='����'+inttostr(life);
          groupbox5.Visible:=false;
          if life=0 then
           die(true);
          if life>0 then
           die(false);
        end;
     end;
end;

procedure TForm1.drink;
begin
  Label2.Caption:='��ʹ����һƿ��!';
  if wineinfer[x,y]=1 then
    begin
      hitpoints:=hitpoints+10;
      Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'��ϲ�㣬����һƿ�þƣ�'+chr(13)+chr(10)+'���10������ֵ��';
      Label7.Caption:='����ֵ��'+inttostr(hitpoints);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      p:=2;a[x,y]:=0;
    end
    else
      begin
        hitpoints:=hitpoints-10;
        Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'�ޣ�����һƿ���ƣ�'+chr(13)+chr(10)+'ʧȥ10������ֵ��';
        if hitpoints<=0 then
          begin
            life:=life-1;
            Label6.Caption:='����'+inttostr(life);
            if life=0 then
             die(true);
            if life>0 then
             begin
              a[x,y]:=0;
              die(false);
             end;
          end;
        if hitpoints>0 then
          begin
            p:=2;
            Label7.Caption:='����ֵ��'+inttostr(hitpoints);
            Button5.Enabled:=true;
          end;
        Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
        p:=2;a[x,y]:=0;
      end;
end;

procedure TForm1.light(a:integer);
begin
 if a=0 then
  begin
   button11.Enabled:=false;
   button14.Enabled:=false;
  end
  else
   begin
    if torch>0 then
     button11.Enabled:=true;
    if bulb>0 then
     button14.Enabled:=true;
   end;
end;

procedure TForm1.swift;
begin
  if gold>=7 then Button10.Enabled:=true;
  if gold>=7 then Button15.Enabled:=true;
  if gold>=2 then Button16.Enabled:=true;
  if gold>=7 then Button6.Enabled:=true;
  if gold>=9 then Button9.Enabled:=true;
  if gold>=9 then Button17.Enabled:=true;
  if gold<7 then Button10.Enabled:=false;
  if gold<7 then Button15.Enabled:=false;
  if gold<2 then Button16.Enabled:=false;
  if gold<7 then Button6.Enabled:=false;
  if gold<9 then Button9.Enabled:=false;
  if gold<9 then Button17.Enabled:=false;
  if torch<1 then Button16.Enabled:=false;
  if bulb<1 then Button16.Enabled:=false;
end;

function thing(xpoint,ypoint:integer):string;
begin
  case a[xpoint,ypoint] of
    0:thing:='�յ�';1:thing:='ǽ';2:thing:='�յ�';3:thing:='����';4:thing:='����';
    5:thing:='Կ��';6:thing:='��';7:thing:='��';9:thing:='������';10:thing:='����';
    11:thing:='·��';12:thing:='����';13:thing:='С��';14:thing:='�ֵ�Ͳ';15:thing:='����';
    16:thing:='����';17:thing:='���';18:thing:='ɮ��';19:thing:='ʯͷ';20:thing:='��ǹ';
    21:thing:='����';22:thing:='����';23:thing:='���׹���';24:thing:='BOSS��';
  else
    begin
      if wineinfer[xpoint,ypoint]=1 then thing:='�þ�'
      else thing:='����';
    end;
  end;
end;

procedure TForm1.N05Click(Sender: TObject);
begin
  drink;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;y:=y+1;
  Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;x:=x-1;
  Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;y:=y-1;
  Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;x:=x+1;
  Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
   begin
     button5.SetFocus;
     a[x,y]:=0;fish:=false;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  change,i1,i2:integer;
begin
  Image1.Picture.Bitmap:=space;
  light(1);
  GroupBox6.Visible:=false;
  if p=1 then
    begin
      change:=2;
      sb[x,y].Flat:=false;
      sb[x,y].Tag:=1;
      sb[x,y].Down:=true;
      if a[x,y]>0 then light(0);
      case a[x,y] of
        2:begin
            change:=0;win:=1;         
            Image1.Picture.Bitmap:=won;
            Label2.Caption:='ף���㣡���ߵ����յ㣡';
            Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
            Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
            n2.Enabled:=false;
            for i1:=1 to size do
             for i2:=1 to size do
              sb[i1,i2].Enabled:=false;
          end;
        3:begin
            Label2.Caption:='��ѽ��'+chr(13)+chr(10)+'��С�Ĳȵ������ˣ�'+chr(13)+chr(10)+'Ҫʹ��������';
            Button7.Visible:=true;Button8.Visible:=true;Button8.Enabled:=true;button8.SetFocus;
            if ropes>0 then
              begin
                Button7.Enabled:=true;Button7.SetFocus;
              end;
            Button5.Visible:=false;
            k:=1;
          end;
        4:begin
            Label2.Caption:='��...�����������һ������';
            ropes:=ropes+1;
            Label5.Caption:='���ӣ�'+inttostr(ropes);
            Button5.Visible:=true;
            Button5.SetFocus;
          end;
        5:begin
            Label2.Caption:='�ܺã������һ��Կ�ף�'+chr(13)+chr(10)+'Կ�׿��Ǻ�ϡ�е�Ŷ��';
            keys:=keys+1;
            Label9.Caption:='Կ�ף�'+inttostr(keys);
            Button5.Visible:=true;
            Button5.SetFocus;
            Image1.Picture.Bitmap:=key;
          end;
        6:begin
            Label2.Caption:='��������һ���ţ�'+chr(13)+chr(10)+'��Ҫʹ��Կ����';
            Button7.Visible:=true;Button8.Visible:=true;Button8.Enabled:=true;button8.SetFocus;
            if keys>0 then
              begin
                Button7.Enabled:=true;button7.SetFocus;
              end;
            Button5.Visible:=false; 
            Image1.Picture.Bitmap:=door;
            k:=2;
          end;
        7:begin
            Label2.Caption:='��ϲ�㣡�����һ������';
            life:=life+1;Label6.Caption:='����'+inttostr(life);
            Button5.Visible:=true;
            Button5.SetFocus;
          end;
        8:begin
            Image1.Picture.Bitmap:=wine;
            if pa=true then
             begin
              Label2.Caption:='�����һƿ�ƣ�';
              winem:=winem+1;
              Button5.Visible:=true;
              Button5.SetFocus;
             end;
            if pa=false then
             begin
              Label2.Caption:='�����һƿ�ƣ�'+chr(13)+chr(10)+'��Ҫʹ������';
              Button7.Visible:=true;Button8.Visible:=true;Button7.Enabled:=true;Button8.Enabled:=true;
              Button7.SetFocus;
              Button5.Visible:=false;
              randomize;
              k:=3;
             end;
          end;
        9:begin
            if pa=true then
             begin
              Label2.Caption:='�����һ�������䣡';
              curem:=curem+1;
              Button5.Visible:=true;
              Button5.SetFocus;
             end;
            if pa=false then
             begin
              Label2.Caption:='�����һ�������䣡'+chr(13)+chr(10)+'���15������ֵ��';
              hitpoints:=hitpoints+15;
              Label7.Caption:='����ֵ��'+inttostr(hitpoints);
              Button5.Visible:=true;
              Button5.SetFocus;
             end;
          end;
        10:begin
             if pb=true then
              begin
               Label2.Caption:='�����һ�����ף��Ӳ����㣬��...';
               Button5.Visible:=true;
               minem:=minem+1;
              end;
             if pb=false then
              begin
               Label2.Caption:='bomb����ϲ�㣡�����һ�����ף�'+chr(13)+chr(10)+'�۳�һ�������ֵ��';
               hitpoints:=(hitpoints+1) div 2;Label7.Caption:='����ֵ��'+inttostr(hitpoints);
               Button5.Visible:=true;
               Button5.SetFocus;
              end;
           end;
        11:if cansay[x,y] then
            begin              
              Image1.Picture.Bitmap:=guidepost;
              Label2.Caption:='��������һ��·��';
              memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):·��:'+hints[x,y]+chr(13)+chr(10));
              cansay[x,y]:=false;
              button5.Visible:=true;
              button5.SetFocus;
            end
            else
              begin
                p:=2;
                button5.Click;
              end;
        12,13:if cansay[x,y] then
               begin
                 Label2.Caption:='��������һ����';
                 memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):��:'+hints[x,y]+chr(13)+chr(10));
                 cansay[x,y]:=false;
                 button5.Visible:=true;
                 button5.SetFocus;
               end
               else
                begin
                 p:=2;
                 button5.Click;
                end;
        14:begin
             Label2.Caption:='�����һ���ֵ�Ͳ';
             inc(torch);label11.Caption:='�ֵ�Ͳ��'+inttostr(torch)+'  ';
             button11.Enabled:=true;button5.Visible:=true;
           end;
        15:begin
             Label2.Caption:='�����һ������';
             inc(bulb);label3.Caption:='���ݣ�'+inttostr(bulb)+'  ';
             button14.Enabled:=true;button5.Visible:=true;
           end;
        16:begin
             Image1.Picture.Bitmap:=monster;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='��ײ����һ������'+chr(13)+chr(10)+'��ʼս��!';
             monsterlife:=random(5)+18;randomize;
             minmonsterattack:=random(2)+1;randomize;
             maxmonsterattack:=random(2)+2;randomize;
             Label16.Caption:='����ֵ��'+inttostr(monsterlife);
             Label17.Caption:='��������'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        17:begin
            repeat
             getgold:=random(3)+2;
            until getgold in goldnumber;
            goldnumber:=goldnumber-[getgold];
            gold:=gold+getgold;
            Label2.Caption:='�����'+inttostr(getgold)+'�����';
            label10.Caption:='��ң�'+inttostr(gold);
            if goldnumber=[] then goldnumber:=[2,3,4];
            button5.Visible:=true;
            Button5.SetFocus;
           end;
        18:begin
             Label2.Caption:='��������һ��ɮ�ˣ�';
             change:=4;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        19:begin
             Label2.Caption:='�������������һ��ʯͷ��';
             rocks:=rocks+1;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        20:begin
             Label2.Caption:='���һ����ǹ��'+chr(13)+chr(10)+'��ǹ��������������ʹ�ã�';
             guns:=guns+1;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        21:begin
             Label2.Caption:='���һ�����룡'+chr(13)+chr(10)+'�����о綾��ҪС�ģ�';
             dz:=dz+1;
             Button5.Visible:=true;
           end;
        22:begin
             Label2.Caption:='��������һ�����ˣ�';
             GroupBox6.Visible:=true;
             Button5.Visible:=true;
             Button5.SetFocus;
             swift;
           end;
        23:begin                       
             Image1.Picture.Bitmap:=monster;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='��������һ�����׹���'+chr(13)+chr(10)+'��ʼս��!';
             monsterlife:=random(6)+27;randomize;
             minmonsterattack:=random(2)+2;randomize;
             maxmonsterattack:=random(2)+3;randomize;
             Label16.Caption:='����ֵ��'+inttostr(monsterlife);
             Label17.Caption:='��������'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        24:begin
             Image1.Picture.Bitmap:=monster;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='��������BOSS!';
             monsterlife:=45;
             minmonsterattack:=5;
             maxmonsterattack:=8;
             Label16.Caption:='����ֵ��'+inttostr(monsterlife);
             Label17.Caption:='��������'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        end;
    end;
  if p=2 then
    begin
      change:=0;
      Label2.Caption:='����һ��յ�...'+chr(13)+chr(10)+'����...�������ĸ������ߣ�';
      if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
      if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
      if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
      if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
      Button5.Visible:=false;
    end;
  if p=3 then
    begin
      Label2.Caption:='�ص�������...�������ĸ������ߣ�';
      Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;
      if (a[2,1]<>1) then Button4.Enabled:=true;
      if (a[1,2]<>1) then Button1.Enabled:=true;
      Button5.Visible:=false;
    end;
  if p=4 then
    begin
      Label2.Caption:='ɮ��˵��"ʩ����ô��Ե������һ���书�ɣ�"'+chr(13)+chr(10)+'��ѧ�����޺�ȭ������2����ͨ�����˺�...'+chr(13)+chr(10)+'ɮ����ʧ��...';
      lh:=true;change:=2;
      Button5.Visible:=true;Button5.SetFocus;
      a[x,y]:=0;
    end;
  p:=change;
end;

procedure TForm1.FormCreate(Sender: TObject);
var s:string;
begin
  Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
  Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
  Label2.Caption:='����Ϸ��Ȩ���У�'+chr(13)+chr(10)+'δ�������������÷�¼��           ';
  fillchar(b,sizeof(b),0);
  b[4]:=true;b[5]:=true;b[7]:=true;b[9]:=true;b[10]:=true;b[14]:=true;
  b[15]:=true;b[17]:=true;b[19]:=true;b[20]:=true;b[21]:=true;
  fillchar(cansay,sizeof(cansay),true);
  s:=extractfilepath(application.ExeName);
  wall:=Tbitmap.Create;
  space:=Tbitmap.Create;
  key:=Tbitmap.Create;
  door:=Tbitmap.Create;
  wine:=Tbitmap.Create;
  monster:=Tbitmap.Create;
  won:=Tbitmap.Create;
  guidepost:=Tbitmap.Create;
  wall.LoadFromFile(s+'icon/wall.bmp');
  space.LoadFromFile(s+'icon/s0.bmp');
  key.LoadFromFile(s+'icon/s5.bmp');
  door.LoadFromFile(s+'icon/s6.bmp');
  wine.LoadFromFile(s+'icon/s8.bmp');
  monster.LoadFromFile(s+'icon/s16.bmp');
  won.LoadFromFile(s+'icon/s2.bmp');
  guidepost.LoadFromFile(s+'icon/s11.bmp');
  fj:=false;start:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i1,i2:integer;
begin
  if k=1 then
    begin
      ropes:=ropes-1;Label5.Caption:='���ӣ�'+inttostr(ropes);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='��ʹ����һ�����ӣ������������˳���'+chr(13)+chr(10)+'�´�С��һ���...';
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if k=2 then
    begin
      keys:=keys-1;Label9.Caption:='Կ�ף�'+inttostr(keys);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='����Կ�׿��������ţ�';
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if k=3 then
    begin
      button5.Visible:=true;
      drink;
    end;
  if (button5.Enabled)and(button5.Visible) then button5.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i1,i2:integer;
begin
  if k=1 then
    begin
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      life:=life-1;Label6.Caption:='����'+inttostr(life);
      if life=0 then
       die(true);
      if life>0 then
       die(false);
    end;
  if k=2 then
    begin
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='��δ�ܳɹ��������ţ�'+chr(13)+chr(10)+'�˻�ԭ��һ�񣡰�ȷ��������...';
      x:=xyuan;y:=yyuan;
      sb[xyuan,yyuan].Down:=true;
      Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��';
      Button5.Visible:=true;
      p:=2;
    end;
  if k=3 then
    begin
      Label2.Caption:='��ˤ���˾�ƿ...'+chr(13)+chr(10)+'��Ϊ�ͷ��۳�2��ң�';
      gold:=gold-2;if gold<0 then gold:=0;
      Label10.Caption:='��ң�'+inttostr(gold);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if (button5.Enabled)and(button5.Visible) then button5.SetFocus;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_up)and(button1.Enabled) then button1.Click;
 if (key=vk_down)and(button2.Enabled) then button2.Click;
 if (key=vk_left)and(button3.Enabled) then button3.Click;
 if (key=vk_right)and(button4.Enabled) then button4.Click;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 groupbox4.Visible:=true;
 dec(torch);label11.Caption:='�ֵ�Ͳ��'+inttostr(torch)+'  ';
 button1.Enabled:=false;button2.Enabled:=false;button3.Enabled:=false;button4.Enabled:=false;
 light(0);
 label2.Caption:='��ѡ���ֵ�Ͳ���䷽��';
end;

procedure TForm1.Button12Click(Sender: TObject);
var i:integer;
begin
 if radiobutton3.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if y+i<=size then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x,y+i));
   radiobutton3.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton4.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if y-i>=1 then memo1.Lines.Add('�ϱߵ�'+inttostr(i)+'����'+thing(x,y-i));
   radiobutton4.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton5.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if x-i>=1 then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x-i,y));
   radiobutton5.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton6.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if x+i<=size then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x+i,y));
   radiobutton6.Checked:=false;groupbox4.Visible:=false;
  end;
 memo1.Lines.Add(chr(13)+chr(10));
 if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
 if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
 if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
 if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
 light(1);
 Label2.Caption:='����һ��յ�...'+chr(13)+chr(10)+'����...�������ĸ������ߣ�';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if not lh then
    begin
      randomize;at:=random(2)+1;
    end;
  if lh then
    begin
      randomize;at:=random(2)+3;
    end;
  if pd then inc(at);
  fight_;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 dec(bulb);label3.Caption:='���ݣ�'+inttostr(bulb)+'  ';
 if bulb=0 then button14.Enabled:=false;
 memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
 if y<=size-1 then memo1.Lines.Add('���ߵ�1����'+thing(x,y+1));
 if y>=2 then memo1.Lines.Add('�ϱߵ�1����'+thing(x,y-1));
 if x>=2 then memo1.Lines.Add('���ߵ�1����'+thing(x-1,y));
 if x<=size-1 then memo1.Lines.Add('���ߵ�1����'+thing(x+1,y));
 memo1.Lines.Add(chr(13)+chr(10));
end;

procedure TForm1.sbclick(Sender: TObject);
var i1,i2:integer;
    f:boolean;
begin
 if button5.Visible or button7.Visible or groupbox4.Visible or groupbox5.Visible or groupbox6.Visible then
  begin
   sb[x,y].Down:=true;
   exit;
  end;
 f:=false;
 for i1:=1 to size do
  begin
   for i2:=1 to size do
    if sender=sb[i1,i2] then begin f:=true; break; end;
   if f then break;
  end;
 i1:=(Tspeedbutton(sender).Left-255) div 25;
 i2:=(size*25+8-Tspeedbutton(sender).Top) div 25;
 if sb[i1,i2].Tag=0 then begin sb[x,y].Down:=true;exit; end;
 Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
 xyuan:=x;yyuan:=y;x:=i1;y:=i2;
 Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��  ';
 p:=1;
 button5.Click;
 if a[x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[x,y]] then
  begin
   button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if messagebox(form1.Handle,'��ȷ��Ҫ�رձ���Ϸ��','ѯ��',mb_yesno+mb_iconquestion)=7 then
  canclose:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
var f:textfile;
    i,j,xp,yp:integer;
    ok:boolean;
begin
 ok:=fj;
 if not fj then ok:=opendialog1.Execute;
 if ok then
  begin
   try
    if fj then
     begin
      opendialog1.FileName:=extractfilepath(application.ExeName)+'��ͼ\�̳�.txt';
      fj:=false;
     end;
    assignfile(f,opendialog1.FileName);reset(f);
    readln(f,size);
    for i:=size downto 1 do
     begin
      for j:=1 to size do
       begin
        read(f,a[j,i]);
        randomize;
        if a[j,i]=8 then wineinfer[j,i]:=random(2);
       end;
       readln(f);
     end;
    for i:=1 to size do
     for j:=1 to size do
      showsb[i,j]:=0;
    while not eof(f) do
     begin
      read(f,xp,yp,hints[xp,yp]);
      cansay[xp,yp]:=true;
     end;
    pon:=false;fight:=false;lh:=false;life:=2;maxhitpoints:=60;hitpoints:=60;ropes:=0;keys:=0;gold:=0;torch:=0;bulb:=0;x:=1;y:=1;win:=0;
    pa:=false;pb:=false;pc:=false;pd:=false;rocks:=0;guns:=0;dz:=0;winem:=0;curem:=0;minem:=0;lightm:=0;
    closefile(f);
   except
    showmessage('��ȡʧ��!');
    exit;
   end;
   N9.Enabled:=true;
   showmessage('��ȡ�ɹ�!');
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
var f:textfile;
    isend:boolean;
    i,j,xp,yp:integer;
    str:string;
    fcansay:byte;
begin
 if opendialog1.Execute() then
  begin
   try
    assignfile(f,opendialog1.FileName);reset(f);
    readln(f,size);
    for i:=size downto 1 do
     begin
      for j:=1 to size do
       begin
        read(f,a[j,i]);
        randomize;
        if a[j,i]=8 then wineinfer[j,i]:=random(2);
       end;
      readln(f);
     end;
    for i:=size downto 1 do
     for j:=1 to size do
      read(f,showsb[j,i]);
    isend:=true;
    while isend do
     begin
      readln(f,str);
      if str<>'-1' then memo1.Lines.Add(str)
       else isend:=false;
     end;
    readln(f,life,hitpoints,maxhitpoints,ropes,keys,gold,torch,bulb,rocks,guns,dz,winem,curem,minem,lightm,lt,win,pat,pbt,pct,pdt);
    if lt=1 then lh:=true else lh:=false;
    if pat=1 then pa:=true else pa:=false;
    if pbt=1 then pb:=true else pb:=false;
    if pct=1 then pc:=true else pc:=false;
    if pdt=1 then pd:=true else pd:=false;
    readln(f,x,y);
    while not eof(f) do
     begin
      read(f,xp,yp,fcansay,hints[xp,yp]);
      if fcansay=0 then cansay[xp,yp]:=false else cansay[xp,yp]:=true;
     end;
    closefile(f);
   except
    showmessage('��ȡʧ��!');
    exit;
   end;
   showmessage('��ȡ�ɹ�!');
   N9.Enabled:=true;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
var f:textfile;
    i,j:integer;
begin
 try
  savedialog1.Execute;
  assignfile(f,savedialog1.FileName);rewrite(f);
  writeln(f,size);
  for i:=size downto 1 do
   begin
    for j:=1 to size do write(f,a[j,i],' ');
    writeln(f);
   end;
  for i:=size downto 1 do
   begin
    for j:=1 to size do if not(sb[j,i].Flat) then write(f,1,' ') else if sb[j,i].Glyph.Empty then write(f,0,' ') else write(f,2,' ');
    writeln(f);
   end;
  i:=0;
  while memo1.Lines[i]<>'' do
   begin
    writeln(f,memo1.lines[i]);
    inc(i);
   end;
  writeln(f,-1);
  if lh=true then lt:=1 else lt:=0;
  if pa=true then pat:=1 else pat:=0;
  if pb=true then pbt:=1 else pbt:=0;
  if pc=true then pct:=1 else pct:=0;
  if pd=true then pdt:=1 else pdt:=0;
  writeln(f,life,' ',hitpoints,' ',maxhitpoints,' ',ropes,' ',keys,' ',gold,' ',torch,' ',bulb,' ',rocks,' ',guns,' ',dz,' ',winem,' ',curem,' ',minem,' ',lightm,' ',lt,' ',win,' ',pat,' ',pbt,' ',pct,' ',pdt);
  writeln(f,x,' ',y);
  for i:=1 to size do
   for j:=1 to size do
    if hints[i,j]<>'' then
     writeln(f,i,' ',j,' ',byte(cansay[i,j]),hints[i,j]);
  closefile(f);
  showmessage('����ɹ�!');
 except
  showmessage('����ʧ��!');
 end;
end;

procedure TForm1.N9Click(Sender: TObject);
var i1,i2:integer;
begin
 if start then
  begin
   image1.Picture:=nil;
   if messagebox(form1.Handle,'ȷ��Ҫ����������Ϸ��?','ѯ��',mb_yesno+mb_iconquestion)=7 then exit;
   Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
   N9.Caption:='��ʼ��Ϸ';N9.Enabled:=false;
   Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
   N3.Enabled:=true;N4.Enabled:=true;n11.Enabled:=true;groupbox2.Visible:=false;
   groupbox3.Visible:=false;groupbox4.Visible:=false;groupbox5.Visible:=false;
   label8.Visible:=false;N5.Enabled:=false;
   button11.Enabled:=false;button14.Enabled:=false;
   Label2.Caption:='����Ϸ��Ȩ���У�'+chr(13)+chr(10)+'δ�������������÷�¼��           ';
   memo1.Clear;
   for i1:=1 to size do
    for i2:=1 to size do
     sb[i1,i2].Destroy;
   image2.Canvas.FillRect(image2.Canvas.ClipRect);
   image2.Picture:=nil;
   start:=false;exit;
  end;
 Label5.Caption:='���ӣ�'+inttostr(ropes);Label6.Caption:='����'+inttostr(life);
 Label7.Caption:='����ֵ��'+inttostr(hitpoints);Label8.Caption:='���λ�ã���'+inttostr(x)+','+inttostr(y)+'��';
 Label9.Caption:='Կ�ף�'+inttostr(keys);Label10.Caption:='��ң�'+inttostr(gold);
 label11.Caption:='�ֵ�Ͳ��'+inttostr(torch)+'  ';if torch>0 then button11.Enabled:=true;
 label3.Caption:='���ݣ�'+inttostr(bulb)+'  ';if bulb>0 then button14.Enabled:=true;
 label8.Visible:=true;groupbox2.Visible:=true;groupbox3.Visible:=true;
 Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
 N9.Caption:='������Ϸ';
 fish:=true;find:=false;goldnumber:=[2,3,4];
 N9.Enabled:=true;N5.Enabled:=true;N3.Enabled:=false;N4.Enabled:=false;n11.Enabled:=false;
 for i1:=1 to size do
  for i2:=1 to size do
   begin
    sb[i1,i2]:=Tspeedbutton.create(form1);
    with sb[i1,i2] do
     begin
      parent:=form1;name:='sb'+inttostr(i1*size+i2-size);
      left:=271+25*i1;top:=size*25-i2*25+8;width:=25;height:=25;
      onclick:=sbclick;groupindex:=1;
     end;
    if showsb[i1,i2]=1 then begin sb[i1,i2].Flat:=false; sb[i1,i2].tag:=1; end
     else
      begin
       sb[i1,i2].Flat:=true;sb[i1,i2].Tag:=0;
       if showsb[i1,i2]=2 then sb[i1,i2].Glyph:=wall;
      end;
   end;
 image2.Height:=size*25+10;
 image2.Width:=size*25+10;
 with image2.Canvas do
  begin
   pen.Width:=5;
   moveto(3,3);
   lineto(size*25+7,3);
   lineto(size*25+7,size*25+7);
   lineto(3,size*25+7);
   lineto(3,3);
  end;
 if win=0 then
  begin
   sb[x,y].Flat:=false;sb[x,y].Down:=true;sb[x,y].Tag:=1;
   if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
   if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
   if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
   if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
   n2.Enabled:=true;                     
   Image1.Picture.Bitmap:=space;
   label2.Caption:='��ʼ��Ϸ��ף����ˣ�';
  end
  else
   begin
    Label2.Caption:='ף���㣡���ߵ����յ㣡';
    Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;
    button11.Enabled:=false;button14.Enabled:=false;   
    n2.Enabled:=false;
    for i1:=1 to size do
     for i2:=1 to size do
      sb[i1,i2].Enabled:=false;
   end;
 button5.Visible:=true;button5.SetFocus;button5.Visible:=false;start:=true;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 form2.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if fight=false then
    begin
      N01.Enabled:=false;
      N02.Enabled:=false;
      N03.Enabled:=false;
      N04.Enabled:=false;
      N07.Enabled:=false;
    end;
  if fight=true then
    begin
      N01.Enabled:=true;
      N02.Enabled:=true;
      N03.Enabled:=true;
      N04.Enabled:=true;
      N07.Enabled:=true;
    end;
  if rocks=0 then N01.Enabled:=false;
  if guns=0 then N03.Enabled:=false;
  if dz=0 then N04.Enabled:=false;
  if winem=0 then N05.Enabled:=false;
  if curem=0 then N06.Enabled:=false;
  if minem=0 then N07.Enabled:=false;
  if lightm=0 then N02.Enabled:=false;
  if winem>0 then N05.Enabled:=true;
  if curem>0 then N06.Enabled:=true;
  if minem>0 then N07.Enabled:=true;
  if lightm>0 then N02.Enabled:=true;
  if pa=true then begin N05.Visible:=true;N06.Visible:=true;end;
  if pb=true then begin N07.Visible:=true;end;
  if pc=true then begin N02.Visible:=true;end;
  if pa=false then begin N05.Visible:=false;N06.Visible:=false;end;
  if pb=false then begin N07.Visible:=false;end;
  if pc=false then begin N02.Visible:=false;end;
  N01.Caption:='ʯͷ��'+inttostr(rocks)+'��';
  N02.Caption:='����ƣ�'+inttostr(lightm)+'��';
  N03.Caption:='��ǹ��'+inttostr(guns)+'��';
  N04.Caption:='���루'+inttostr(dz)+'��';
  N05.Caption:='�ƣ�'+inttostr(winem)+'��';
  N06.Caption:='�����䣨'+inttostr(curem)+'��';
  N07.Caption:='���ף�'+inttostr(minem)+'��';
end;

procedure TForm1.N01Click(Sender: TObject);
begin
  rocks:=rocks-1;
  randomize;
  at:=random(3)+4;
  fight_;
end;

procedure TForm1.N03Click(Sender: TObject);
begin
  guns:=guns-1;
  randomize;
  at:=random(10);
  fight_;
end;

procedure TForm1.N04Click(Sender: TObject);
begin
  dz:=dz-1;
  at:=1;
  pon:=true;
  fight_;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 if start and ((a[x,y]=0) or (a[x,y]=2) or (11<=a[x,y])and(a[x,y]<=13)) then n5.Enabled:=true else n5.Enabled:=false;
end;

procedure TForm1.N06Click(Sender: TObject);
begin
  curem:=curem-1;
  Label2.Caption:='��ʹ����һ�������䣡';
  hitpoints:=hitpoints+15;
  Label7.Caption:='����ֵ��'+inttostr(hitpoints);
end;

procedure TForm1.N07Click(Sender: TObject);
begin
  minem:=minem-1;
  N2.Click;
  Label2.Caption:='��...����ʧȥ��һ�������ֵ��';
  monsterlife:=(monsterlife+1) div 2;
  Label16.Caption:='����ֵ��'+inttostr(monsterlife);
end;

procedure TForm1.N02Click(Sender: TObject);
var i:integer;
begin
  lightm:=lightm-1;
  memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
  for i:=1 to 3 do
  if y+i<=size then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x,y+i));
  radiobutton3.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if y-i>=1 then memo1.Lines.Add('�ϱߵ�'+inttostr(i)+'����'+thing(x,y-i));
  radiobutton4.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if x-i>=1 then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x-i,y));
  radiobutton5.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if x+i<=size then memo1.Lines.Add('���ߵ�'+inttostr(i)+'����'+thing(x+i,y));
  radiobutton6.Checked:=false;groupbox4.Visible:=false;
  if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
  if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
  if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
  if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  pa:=true;
  Button10.Visible:=false;
  gold:=gold-7;
  Label10.Caption:='��ң�'+inttostr(gold);
  swift;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  pb:=true;
  Button15.Visible:=false;
  gold:=gold-7;
  Label10.Caption:='��ң�'+inttostr(gold);
  swift;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  pc:=true;
  gold:=gold-2;
  torch:=torch-1;
  bulb:=bulb-1;
  lightm:=lightm+1;
  Label10.Caption:='��ң�'+inttostr(gold);
  label11.Caption:='�ֵ�Ͳ��'+inttostr(torch)+'  ';if torch>0 then button11.Enabled:=true;
  label3.Caption:='���ݣ�'+inttostr(bulb)+'  ';if bulb>0 then button14.Enabled:=true;
  swift;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  gold:=gold-7;
  pd:=true;
  Button6.Visible:=false;
  Label10.Caption:='��ң�'+inttostr(gold);
  swift;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 form3.Show;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
 fj:=true;
 n3.Click;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 form4.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
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

procedure TForm1.get;
var tf:textfile;
begin
 if (form1.Tag=1)or(form1.Tag=3) then
  begin
   assignfile(tf,'C:\WINDOWS\teach.txt');
   rewrite(tf);
   write(tf,0);
   closefile(tf);
  end;
 if form1.Tag>=2 then
  N11.Click;
end;

end.