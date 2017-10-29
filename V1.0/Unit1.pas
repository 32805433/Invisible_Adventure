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
    Label12: TLabel;
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
//    procedure N4Click(Sender: TObject);
//    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N03Click(Sender: TObject);
    procedure N04Click(Sender: TObject);
//    procedure N1Click(Sender: TObject);
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
  private
    procedure sbclick(Sender: TObject);
  public
    { Public declarations }
  end;

procedure changelevel(a,b:integer);

type point=record
 x,y,z:integer;
end;

const n=25;
      m=25;

var
  Form1: TForm1;
  rocks,guns,dz,winem,curem,minem,lightm,lt,
  i1,i2,at,bt,x,y,xyuan,yyuan,p,k,win,hitpoints,life,ropes,keys,
  maxhitpoints,gold,getgold,size,torch,bulb,
  minattack,maxattack,monsterlife,minmonsterattack,maxmonsterattack,
  pat,pbt,pct,pdt,dgood,dbad,floor,level:integer;
  a,wineinfer,showsb:array [1..5,1..n,1..n] of integer;
  b:array [1..m] of boolean;
  hints:array [1..5,1..n,1..n] of string;
  cansay:array [1..5,1..n,1..n] of boolean;
  find,fish,start,lh,fight,pon,pa,pb,pc,pd,fj:boolean;
  goldnumber:set of 2..4;
  sb:array [1..5,1..n,1..n] of Tspeedbutton;
  stairsgroup:array [1..10,1..2] of point;
  wall,s0,s1,s101,s201,s202,s204,s205,s301,s302,s303,s304,s305,s306,
  s401,s402,s404,s405,s501,s502,s503,s504,s601a,s601b:Tjpegimage;
  s:string;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.die(f:boolean);
begin
 if f then
  begin
   Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'你已经没有命了，游戏结束！';
   button11.Enabled:=false;
   button14.Enabled:=false;
   Label7.Caption:='生命值：0';
   light(0);
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   Button3.Enabled:=false;
   Button4.Enabled:=false;
   Button5.Visible:=false;
   n2.Enabled:=false;
   Image1.Picture.Bitmap:=nil;
   for i1:=1 to size do
    for i2:=1 to size do
     sb[floor,i1,i2].Enabled:=false;
  end
  else
   begin
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'很遗憾，你损失了一条命。你还有'+inttostr(life)+'条命。'+chr(13)+chr(10)+'现在回到出发点。按确定键继续...';
    x:=1;
    y:=1;
    p:=3;
    hitpoints:=maxhitpoints;
    changelevel(floor,1);
    floor:=1;
    Label7.Caption:='生命值：'+inttostr(maxhitpoints);
    Label8.Caption:='你的位置：（1,1,1）';
    sb[1,1,1].Down:=true;
    Image1.Picture.Assign(s0);
    Button5.Visible:=true;
    button5.SetFocus;
   end;
end;

procedure TForm1.fight_;
begin
 label2.Caption:='';
 if pon then
  monsterlife:=monsterlife-3;
 monsterlife:=monsterlife-at;
 if monsterlife<=0 then
  begin
   fight:=false;
   if pon then
    Label2.Caption:='怪物中毒了！受到3点伤害！'+chr(13)+chr(10)+'你对怪物造成了'+inttostr(at)+'点伤害'+chr(13)+chr(10)+'战斗胜利！';
   if not pon then
    Label2.Caption:='你对怪物造成了'+inttostr(at)+'点伤害'+chr(13)+chr(10)+'战斗胜利！';
   Image1.Picture.Assign(s0);
   pon:=false;
   light(1);
   groupbox5.Visible:=false;
   if x+1<=size then
    if a[floor,x+1,y]<>2 then
     Button4.Enabled:=true
     else
      sb[floor,x+1,y].Glyph.Assign(wall);
   if x-1>0 then
    if a[floor,x-1,y]<>2 then
     Button3.Enabled:=true
     else
      sb[floor,x-1,y].Glyph.Assign(wall);
   if y+1<=size then
    if a[floor,x,y+1]<>2 then
     Button1.Enabled:=true
     else
      sb[floor,x,y+1].glyph.Assign(wall);
   if y-1>0 then
    if a[floor,x,y-1]<>2 then
     Button2.Enabled:=true
     else
      sb[floor,x,y-1].glyph.Assign(wall);
   a[floor,x,y]:=0;
  end;
 if monsterlife>0 then
  begin
   if pon then
    Label2.Caption:='怪物中毒了！受到3点伤害！'+chr(13)+chr(10)+'你对怪物造成了'+inttostr(at)+'点伤害';
   if not pon then
    Label2.Caption:='你对怪物造成了'+inttostr(at)+'点伤害';
    Label16.Caption:='生命值：'+inttostr(monsterlife);
    randomize;
    bt:=minmonsterattack+random(maxmonsterattack-minmonsterattack+1);
    hitpoints:=hitpoints-bt;
    Label7.Caption:='生命值：'+inttostr(hitpoints);
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'怪物对你造成了'+inttostr(bt)+'点伤害';
    if hitpoints<=0 then
     begin
      pon:=false;
      fight:=false;
      life:=life-1;
      Label6.Caption:='※：'+inttostr(life);
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
 Label2.Caption:='你使用了一瓶酒!';
 if wineinfer[floor,x,y]=1 then
  begin
   hitpoints:=hitpoints+10;
   Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'恭喜你，这是一瓶好酒！'+chr(13)+chr(10)+'获得10点生命值！';
   Label7.Caption:='生命值：'+inttostr(hitpoints);
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   p:=2;
   a[floor,x,y]:=0;
  end
  else
   begin
    hitpoints:=hitpoints-10;
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'噢，这是一瓶毒酒！'+chr(13)+chr(10)+'失去10点生命值！';
    if hitpoints<=0 then
     begin
      dec(life);
      Label6.Caption:='※：'+inttostr(life);
      if life=0 then
       die(true)
       else
       begin
        a[floor,x,y]:=0;
        die(false);
       end;
     end;
    if hitpoints>0 then
     begin
      p:=2;
      Label7.Caption:='生命值：'+inttostr(hitpoints);
      Button5.Enabled:=true;
     end;
    Button7.Enabled:=false;
    Button8.Enabled:=false;
    Button7.Visible:=false;
    Button8.Visible:=false;
    p:=2;
    a[floor,x,y]:=0;
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
 if gold>=5 then
  Button10.Enabled:=true;
 if gold>=7 then
  Button15.Enabled:=true;
 if gold>=2 then
  Button16.Enabled:=true;
 if gold>=7 then
  Button6.Enabled:=true;
 if gold>=9 then
  Button9.Enabled:=true;
 if gold>=9 then
  Button17.Enabled:=true;
 if gold<5 then
  Button10.Enabled:=false;
 if gold<7 then
  Button15.Enabled:=false;
 if gold<2 then
  Button16.Enabled:=false;
 if gold<7 then
  Button6.Enabled:=false;
 if gold<9 then
  Button9.Enabled:=false;
 if gold<9 then
  Button17.Enabled:=false;
 if torch<1 then
  Button16.Enabled:=false;
 if bulb<1 then
  Button16.Enabled:=false;
end;

function thing(floor,xpoint,ypoint:integer):string;
begin
 case a[floor,xpoint,ypoint] of
  0:thing:='空地';
  1:thing:='终点';
  2:thing:='墙';
  101:thing:='怪物';
//  102:thing:='medium monster';
  103:thing:='进阶怪物';
//  104:thing:='guard';
//  105:thing:='special';
  106:thing:='BOSS!';
  201:thing:='地雷';
//  202:thing:='wine';
//  203:thing:='HP bottle';
  204:thing:='急救箱';
  205:thing:='命';
  301:thing:='手电筒';
  302:thing:='灯泡';
  303:thing:='金币';
  304:thing:='石头';
  305:thing:='手枪';
  306:thing:='毒针';
  401:thing:='路牌';
  402:thing:='君子';
  403:thing:='小人';
  404:thing:='商人';
  405:thing:='僧人';
  501:thing:='门';
  502:thing:='钥匙';
  503:thing:='陷阱';
  504:thing:='绳子';
  601:thing:='楼梯';
 else
  if wineinfer[floor,xpoint,ypoint]=1 then
   thing:='好酒'
   else
    thing:='毒酒';
 end;
end;

procedure TForm1.N05Click(Sender: TObject);
begin          
 dec(winem);
 Label2.Caption:='你使用了一瓶酒!';
 if random(winem)+1>dbad then
  begin
   hitpoints:=hitpoints+10;
   Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'恭喜你，这是一瓶好酒！'+chr(13)+chr(10)+'获得10点生命值！';
   Label7.Caption:='生命值：'+inttostr(hitpoints);
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   dec(dgood);
   p:=2;
  end
  else
   begin
    hitpoints:=hitpoints-10;
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'噢，这是一瓶毒酒！'+chr(13)+chr(10)+'失去10点生命值！';
    if hitpoints<=0 then
     begin         
      if hitpoints<=0 then
       begin
        pon:=false;
        fight:=false;
        life:=life-1;
        Label6.Caption:='※：'+inttostr(life);
        groupbox5.Visible:=false;
        if life=0 then
         die(true);
        if life>0 then
         die(false);
        exit;
       end;
      dec(life);
      Label6.Caption:='※：'+inttostr(life);
      if life=0 then
       die(true)
       else
        begin
         a[floor,x,y]:=0;
         die(false);
        end;
     end;
    if hitpoints>0 then
     begin
      p:=2;
      Label7.Caption:='生命值：'+inttostr(hitpoints);
      Button5.Enabled:=true;
     end;
    Button7.Enabled:=false;
    Button8.Enabled:=false;
    Button7.Visible:=false;
    Button8.Visible:=false;
    dec(dbad);
    p:=2;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 xyuan:=x;
 yyuan:=y;
 inc(y);
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[floor,x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[floor,x,y]] then
  begin
   if a[floor,x,y]<>202 then
    button5.SetFocus;
   a[floor,x,y]:=0;
   fish:=false;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 xyuan:=x;
 yyuan:=y;
 dec(x);
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[floor,x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[floor,x,y]] then
  begin
   if a[floor,x,y]<>202 then
    button5.SetFocus;
   a[floor,x,y]:=0;
   fish:=false;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 xyuan:=x;
 yyuan:=y;
 dec(y);
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[floor,x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[floor,x,y]] then
  begin
   if a[floor,x,y]<>202 then
    button5.SetFocus;
   a[floor,x,y]:=0;
   fish:=false;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 xyuan:=x;
 yyuan:=y;
 inc(x);
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[floor,x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[floor,x,y]] then
  begin
   if a[floor,x,y]<>202 then
    button5.SetFocus;
   a[floor,x,y]:=0;
   fish:=false;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var change,i1,i2,kk:integer;
    turn:point;
begin
 Image1.Picture.Assign(s0);
 light(1);
 GroupBox6.Visible:=false;
 if p=1 then
  begin
   change:=2;
   sb[floor,x,y].Flat:=false;
   sb[floor,x,y].Tag:=1;
   sb[floor,x,y].Down:=true;
   if a[floor,x,y]>0 then
    light(0);
   case a[floor,x,y] of
    1:begin
       change:=0;
       win:=1;
       Image1.Picture.Assign(s1);
       Label2.Caption:='祝贺你！你走到了终点！';
       Button1.Enabled:=false;
       Button2.Enabled:=false;
       Button3.Enabled:=false;
       Button4.Enabled:=false;
       Button5.Visible:=false;
       Button7.Enabled:=false;
       Button8.Enabled:=false;
       Button7.Visible:=false;
       Button8.Visible:=false;
       n2.Enabled:=false;
       for i1:=1 to size do
        for i2:=1 to size do
         sb[floor,i1,i2].Enabled:=false;
      end;
    101:begin
         Image1.Picture.Assign(s101);
         groupbox5.Visible:=true;
         Button13.SetFocus;
         Label2.Caption:='你撞上了一个怪物'+chr(13)+chr(10)+'开始战斗!';
         monsterlife:=random(5)+18;
         randomize;
         minmonsterattack:=random(2)+1;
         randomize;
         maxmonsterattack:=random(2)+2;
         randomize;
         Label16.Caption:='生命值：'+inttostr(monsterlife);
         Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
         fight:=true;
        end;
    103:begin
         Image1.Picture.Assign(s101);
         groupbox5.Visible:=true;
         Button13.SetFocus;
         Label2.Caption:='你遇到了一个进阶怪物'+chr(13)+chr(10)+'开始战斗!';
         monsterlife:=random(6)+27;
         randomize;
         minmonsterattack:=random(2)+2;
         randomize;
         maxmonsterattack:=random(2)+3;
         randomize;
         Label16.Caption:='生命值：'+inttostr(monsterlife);
         Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
         fight:=true;
        end;
    106:begin
         Image1.Picture.Assign(s101);
         groupbox5.Visible:=true;
         Button13.SetFocus;
         Label2.Caption:='你遇到了BOSS!';
         monsterlife:=45;
         minmonsterattack:=5;
         maxmonsterattack:=8;
         Label16.Caption:='生命值：'+inttostr(monsterlife);
         Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
         fight:=true;
        end;
    201:begin
         image1.Picture.Assign(s201);
         if pb=true then
          begin
           Label2.Caption:='你捡到了一个地雷！坑不到你，唉...';
           Button5.Visible:=true;
           Button5.SetFocus;
           minem:=minem+1;
          end;
         if pb=false then
          begin
           Label2.Caption:='bomb！恭喜你！你捡到了一个地雷！'+chr(13)+chr(10)+'扣除一半的生命值！';
           hitpoints:=(hitpoints+1) div 2;
           Label7.Caption:='生命值：'+inttostr(hitpoints);
           Button5.Visible:=true;
           Button5.SetFocus;
          end;
        end;
    202:begin
         Image1.Picture.Assign(s202);
         if pa then
          begin
           Label2.Caption:='你捡到了一瓶酒！';
           winem:=winem+1;
           if wineinfer[floor,x,y]=1 then
            inc(dgood)
            else
             inc(dbad);
           Button5.Visible:=true;
           Button5.SetFocus;
          end
          else
           begin
            Label2.Caption:='你捡到了一瓶酒！'+chr(13)+chr(10)+'你要使用它吗？';
            Button7.Visible:=true;
            Button8.Visible:=true;
            Button7.Enabled:=true;
            Button8.Enabled:=true;
            Button7.SetFocus;
            Button5.Visible:=false;
            randomize;
            k:=3;
           end;
        end;
    204:begin
         image1.Picture.Assign(s204);
         if pa=true then
          begin
           Label2.Caption:='你捡到了一个急救箱！';
           curem:=curem+1;
           Button5.Visible:=true;
           Button5.SetFocus;
          end;
         if pa=false then
          begin
           Label2.Caption:='你捡到了一个急救箱！'+chr(13)+chr(10)+'获得15点生命值！';
           hitpoints:=hitpoints+15;
           Label7.Caption:='生命值：'+inttostr(hitpoints);
           Button5.Visible:=true;
           Button5.SetFocus;
          end;
        end;
    205:begin
         Image1.Picture.Assign(s205);
         Label2.Caption:='恭喜你！你捡到了一条命！';
         life:=life+1;
         Label6.Caption:='※：'+inttostr(life);
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    301:begin
         Image1.Picture.Assign(s301);
         Label2.Caption:='你捡到了一个手电筒';
         inc(torch);
         label11.Caption:='手电筒：'+inttostr(torch)+'  ';
         button11.Enabled:=true;
         button5.Visible:=true;
         button5.SetFocus;
        end;
    302:begin
         Image1.Picture.Assign(s302);
         Label2.Caption:='你捡到了一个灯泡';
         inc(bulb);
         label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
         button14.Enabled:=true;
         button5.Visible:=true;
         button5.SetFocus;
        end;
    303:begin
         Image1.Picture.Assign(s303);
         repeat
          getgold:=random(3)+2;
         until getgold in goldnumber;
         goldnumber:=goldnumber-[getgold];
         gold:=gold+getgold;
         Label2.Caption:='你捡到了'+inttostr(getgold)+'个金币';
         label10.Caption:='金币：'+inttostr(gold);
         if goldnumber=[] then
          goldnumber:=[2,3,4];
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    304:begin
         Image1.Picture.Assign(s304);
         Label2.Caption:='你捡到一块石头！'+chr(13)+chr(10)+'石头威力较大，请注意！';
         rocks:=rocks+1;
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    305:begin
         Image1.Picture.Assign(s305);
         Label2.Caption:='你捡到一把手枪！'+chr(13)+chr(10)+'手枪威力不稳定，请慎重使用！';
         guns:=guns+1;
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    306:begin
         Image1.Picture.Assign(s306);
         Label2.Caption:='你捡到一根毒针！'+chr(13)+chr(10)+'针上有剧毒！要小心！';
         dz:=dz+1;
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    401:if cansay[floor,x,y] then
         begin
          Image1.Picture.Assign(s401);
          Label2.Caption:='你遇到了一个路牌';
          memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):路牌:'+hints[floor,x,y]+chr(13)+chr(10));
          cansay[floor,x,y]:=false;
          button5.Visible:=true;
          button5.SetFocus;
         end
         else
          begin
           p:=2;
           button5.Click;
          end;
    402,403:if cansay[floor,x,y] then
             begin
              Image1.Picture.Assign(s402);
              Label2.Caption:='你遇到了一个人';
              memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):人:'+hints[floor,x,y]+chr(13)+chr(10));
              cansay[floor,x,y]:=false;
              button5.Visible:=true;
              button5.SetFocus;
             end
             else
              begin
               p:=2;
               button5.Click;
              end;
    404:begin
         Image1.Picture.Assign(s404);
         Label2.Caption:='你遇到了一个商人！';
         GroupBox6.Visible:=true;
         Button5.Visible:=true;
         Button5.SetFocus;
         swift;
        end;
    405:begin
         Image1.Picture.Assign(s405);
         Label2.Caption:='你遇到了一个僧人！';
         change:=4;
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    501:begin
         Image1.Picture.Assign(s501);
         Label2.Caption:='你遇到了一扇门！'+chr(13)+chr(10)+'你要使用钥匙吗？';
         Button7.Visible:=true;
         Button8.Visible:=true;
         Button8.Enabled:=true;
         Button8.SetFocus;
         if keys>0 then
          begin
           Button7.Enabled:=true;
           Button7.SetFocus;
          end;
         Button5.Visible:=false;
         k:=2;
        end;
    502:begin
         Image1.Picture.Assign(s502);
         Label2.Caption:='很好！你捡到了一把钥匙！'+chr(13)+chr(10)+'钥匙可是很稀有的哦！';
         keys:=keys+1;
         Label9.Caption:='钥匙：'+inttostr(keys);
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    503:begin
         image1.Picture.Assign(s503);
         Label2.Caption:='哎呀！'+chr(13)+chr(10)+'不小心踩到陷阱了！'+chr(13)+chr(10)+'要使用绳子吗？';
         Button7.Visible:=true;
         Button8.Visible:=true;
         Button8.Enabled:=true;
         Button8.SetFocus;
         if ropes>0 then
          begin
           Button7.Enabled:=true;
           Button7.SetFocus;
          end;
         Button5.Visible:=false;
         k:=1;
        end;
    504:begin
         image1.Picture.Assign(s504);
         Label2.Caption:='嗯...不错！你捡到了一条绳子';
         ropes:=ropes+1;
         Label5.Caption:='绳子：'+inttostr(ropes);
         Button5.Visible:=true;
         Button5.SetFocus;
        end;
    601:begin
         image1.Picture.Assign(s601a);
         label2.Caption:='你来到了一个楼梯';
         button5.Visible:=true;
         button5.SetFocus;
         change:=5;
        end;
   end;
  end;
 if p=2 then
  begin
   change:=0;
   if (a[floor,x,y]<>404)and(a[floor,x,y]<>601) then
    a[floor,x,y]:=0;
   Label2.Caption:='这是一块空地...'+chr(13)+chr(10)+'继续...你想往哪个方向走？';
   if x+1<=size then
    if a[floor,x+1,y]<>2 then
     Button4.Enabled:=true
     else
      sb[floor,x+1,y].Glyph.Assign(wall);
   if x-1>0 then
    if a[floor,x-1,y]<>2 then
     Button3.Enabled:=true
     else
      sb[floor,x-1,y].Glyph.Assign(wall);
   if y+1<=size then
    if a[floor,x,y+1]<>2 then
     Button1.Enabled:=true
     else
      sb[floor,x,y+1].glyph.Assign(wall);
   if y-1>0 then
    if a[floor,x,y-1]<>2 then
     Button2.Enabled:=true
     else
      sb[floor,x,y-1].Glyph.Assign(wall);
   Button5.Visible:=false;
  end;
 if p=3 then
  begin
   Label2.Caption:='回到出发点...你想往哪个方向走？';
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   Button3.Enabled:=false;
   Button4.Enabled:=false;
   if a[1,2,1]<>1 then
    Button4.Enabled:=true;
   if a[1,1,2]<>1 then
    Button1.Enabled:=true;
   Button5.Visible:=false;
  end;
 if p=4 then
  begin
   Label2.Caption:='僧人说："施主这么有缘，教你一种武功吧！"'+chr(13)+chr(10)+'你学会了罗汉拳！提升2点普通攻击伤害...'+chr(13)+chr(10)+'僧人消失了...';
   lh:=true;
   change:=2;
   Button5.Visible:=true;
   Button5.SetFocus;
   a[floor,x,y]:=0;
  end;
 if p=5 then
  begin
   kk:=strtoint(hints[floor,x,y]);
   if (stairsgroup[kk,1].x=floor)and(stairsgroup[kk,1].y=x)and(stairsgroup[kk,1].z=y) then
    turn:=stairsgroup[kk,2]
    else
     turn:=stairsgroup[kk,1];
   changelevel(floor,turn.x);
   floor:=turn.x;
   x:=turn.y;
   y:=turn.z;
   sb[turn.x,turn.y,turn.z].Flat:=false;
   sb[turn.x,turn.y,turn.z].Tag:=1;
   sb[turn.x,turn.y,turn.z].Down:=true;
   label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
   label2.Caption:='你来到了楼梯的另一端';     
   image1.Picture.Assign(s601b);
   change:=2;
  end;
 p:=change;
end;

procedure TForm1.FormCreate(Sender: TObject);
var s:string;   
    r:Tresourcestream;
begin
 Button1.Enabled:=false;
 Button2.Enabled:=false;
 Button3.Enabled:=false;
 Button4.Enabled:=false;
 Button5.Visible:=false;
 Button7.Enabled:=false;
 Button8.Enabled:=false;
 Button7.Visible:=false;
 Button8.Visible:=false;
 Label2.Caption:='本游戏版权所有！'+chr(13)+chr(10)+'未经作者允许不得翻录！';
 fillchar(b,sizeof(b),0);
 b[4]:=true;
 b[5]:=true;
 b[7]:=true;
 b[8]:=true;
 b[9]:=true;
 b[10]:=true;
 b[14]:=true;
 b[15]:=true;
 b[17]:=true;
 b[19]:=true;
 b[20]:=true;
 b[21]:=true;
 fillchar(cansay,sizeof(cansay),true);
 s:=extractfilepath(application.ExeName);
 wall:=Tjpegimage.Create;
 s0:=Tjpegimage.Create;
 s1:=Tjpegimage.Create;
 s101:=Tjpegimage.Create;
 s201:=Tjpegimage.Create;
 s202:=Tjpegimage.Create;
 s204:=Tjpegimage.Create;
 s205:=Tjpegimage.Create;
 s301:=Tjpegimage.Create;
 s302:=Tjpegimage.Create;
 s303:=Tjpegimage.Create;
 s304:=Tjpegimage.Create;
 s305:=Tjpegimage.Create;
 s306:=Tjpegimage.Create;
 s401:=Tjpegimage.Create;
 s402:=Tjpegimage.Create;
 s404:=Tjpegimage.Create;
 s405:=Tjpegimage.Create;
 s501:=Tjpegimage.Create;
 s502:=Tjpegimage.Create;
 s503:=Tjpegimage.Create;
 s504:=Tjpegimage.Create;
 s601a:=Tjpegimage.Create;
 s601b:=Tjpegimage.Create;
 r:=Tresourcestream.Create(hinstance,'s0',RT_RCDATA);
 s0.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s1',RT_RCDATA);
 s1.LoadFromStream(r);  
 r:=Tresourcestream.Create(hinstance,'s101',RT_RCDATA);
 s101.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s201',RT_RCDATA);
 s201.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s202',RT_RCDATA);
 s202.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s204',RT_RCDATA);
 s204.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s205',RT_RCDATA);
 s205.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s301',RT_RCDATA);
 s301.LoadFromStream(r);                  
 r:=Tresourcestream.Create(hinstance,'s302',RT_RCDATA);
 s302.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s303',RT_RCDATA);
 s303.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s304',RT_RCDATA);
 s304.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s305',RT_RCDATA);
 s305.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s306',RT_RCDATA);
 s306.LoadFromStream(r);     
 r:=Tresourcestream.Create(hinstance,'s401',RT_RCDATA);
 s401.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s402',RT_RCDATA);
 s402.LoadFromStream(r);   
 r:=Tresourcestream.Create(hinstance,'s404',RT_RCDATA);
 s404.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s405',RT_RCDATA);
 s405.LoadFromStream(r);                
 r:=Tresourcestream.Create(hinstance,'s501',RT_RCDATA);
 s501.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s502',RT_RCDATA);
 s502.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s503',RT_RCDATA);
 s503.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s504',RT_RCDATA);
 s504.LoadFromStream(r);  
 r:=Tresourcestream.Create(hinstance,'s601a',RT_RCDATA);
 s601a.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'s601b',RT_RCDATA);
 s601b.LoadFromStream(r);
 r:=Tresourcestream.Create(hinstance,'wall',RT_RCDATA);
 wall.LoadFromStream(r);
{ wall.LoadFromFile(s+'icon/wall.bmp');
 s0.LoadFromFile(s+'icon/s0.bmp');
 s2.LoadFromFile(s+'icon/s2.bmp');
 s3.LoadFromFile(s+'icon/s3.bmp');
 s4.LoadFromFile(s+'icon/s4.bmp');
 s5.LoadFromFile(s+'icon/s5.bmp');
 s6.LoadFromFile(s+'icon/s6.bmp');
 s7.LoadFromFile(s+'icon/s7.bmp');
 s8.LoadFromFile(s+'icon/s8.bmp');
 s9.LoadFromFile(s+'icon/s9.bmp');
 s10.LoadFromFile(s+'icon/s10.bmp');
 s11.LoadFromFile(s+'icon/s11.bmp');
 s12.LoadFromFile(s+'icon/s12.bmp');
 s14.LoadFromFile(s+'icon/s14.bmp');
 s15.LoadFromFile(s+'icon/s15.bmp');
 s16.LoadFromFile(s+'icon/s16.bmp');
 s17.LoadFromFile(s+'icon/s17.bmp');
 s18.LoadFromFile(s+'icon/s18.bmp');
 s19.LoadFromFile(s+'icon/s19.bmp');
 s20.LoadFromFile(s+'icon/s20.bmp');
 s21.LoadFromFile(s+'icon/s21.bmp');
 s22.LoadFromFile(s+'icon/s22.bmp');    }
 opendialog1.InitialDir:=s+'Map';
// savedialog1.InitialDir:=s+'进度';
 fj:=false;
 start:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
//var i1,i2:integer;
begin
 if k=1 then
  begin
   dec(ropes);
   Label5.Caption:='绳子：'+inttostr(ropes);
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   Label2.Caption:='你使用了一条绳子，从陷阱里爬了出来'+chr(13)+chr(10)+'下次小心一点吧...';
   Button5.Visible:=true;
   p:=2;
   a[floor,x,y]:=0;
  end;
 if k=2 then
  begin
   dec(keys);
   Label9.Caption:='钥匙：'+inttostr(keys);
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   Label2.Caption:='你用钥匙开了这扇门！';
   Button5.Visible:=true;
   p:=2;
   a[floor,x,y]:=0;
  end;
 if k=3 then
  begin
   button5.Visible:=true;
   drink;
  end;
 if (button5.Enabled)and(button5.Visible) then
  button5.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i1,i2:integer;
begin
 if k=1 then
  begin
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   dec(life);
   Label6.Caption:='※：'+inttostr(life);
   if life=0 then
    die(true)
    else
     die(false);
  end;
 if k=2 then
  begin
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   Label2.Caption:='你未能成功打开这扇门！'+chr(13)+chr(10)+'退回原来一格！按确定键继续...';
   x:=xyuan;
   y:=yyuan;
   sb[floor,xyuan,yyuan].Down:=true;
   Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）';
   Button5.Visible:=true;
   p:=2;
  end;
 if k=3 then
  begin
   Label2.Caption:='你摔碎了酒瓶...'+chr(13)+chr(10)+'作为惩罚扣除2金币！';
   gold:=gold-2;
   if gold<0 then
    gold:=0;
   Label10.Caption:='金币：'+inttostr(gold);
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   Button5.Visible:=true;
   p:=2;
   a[floor,x,y]:=0;
  end;
 if (button5.Enabled)and(button5.Visible) then
  button5.SetFocus;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_up)and(button1.Enabled) then
  button1.Click;
 if (key=vk_down)and(button2.Enabled) then
  button2.Click;
 if (key=vk_left)and(button3.Enabled) then
  button3.Click;
 if (key=vk_right)and(button4.Enabled) then
  button4.Click;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 groupbox4.Visible:=true;
 dec(torch);
 label11.Caption:='手电筒：'+inttostr(torch)+'  ';
 button1.Enabled:=false;
 button2.Enabled:=false;
 button3.Enabled:=false;
 button4.Enabled:=false;
 light(0);
 label2.Caption:='请选择手电筒照射方向';
end;

procedure TForm1.Button12Click(Sender: TObject);
var i:integer;
begin
 if radiobutton3.Checked then
  begin
   memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    begin
     if y+i<=size then
      memo1.Lines.Add('北边第'+inttostr(i)+'格是'+thing(floor,x,y+i));
     if a[floor,x,y+i]=1 then
      break;
    end;
   radiobutton3.Checked:=false;
   groupbox4.Visible:=false;
  end;
 if radiobutton4.Checked then
  begin
   memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    begin
     if y-i>=1 then
      memo1.Lines.Add('南边第'+inttostr(i)+'格是'+thing(floor,x,y-i));
     if a[floor,x,y-i]=1 then
      break;
    end;
   radiobutton4.Checked:=false;
   groupbox4.Visible:=false;
  end;
 if radiobutton5.Checked then
  begin
   memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    begin
     if x-i>=1 then
      memo1.Lines.Add('西边第'+inttostr(i)+'格是'+thing(floor,x-i,y));
     if a[floor,x-i,y]=1 then
      break;
    end;
   radiobutton5.Checked:=false;
   groupbox4.Visible:=false;
  end;
 if radiobutton6.Checked then
  begin
   memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    begin
     if x+i<=size then
      memo1.Lines.Add('东边第'+inttostr(i)+'格是'+thing(floor,x+i,y));
     if a[floor,x+i,y]=1 then
      break;
    end;
   radiobutton6.Checked:=false;
   groupbox4.Visible:=false;
  end;
 memo1.Lines.Add(chr(13)+chr(10));
 if x+1<=size then
  if a[floor,x+1,y]<>2 then
   Button4.Enabled:=true
   else
    sb[floor,x+1,y].Glyph.Assign(wall);
 if x-1>0 then
  if a[floor,x-1,y]<>2 then
   Button3.Enabled:=true
   else
    sb[floor,x-1,y].Glyph.Assign(wall);
 if y+1<=size then
  if a[floor,x,y+1]<>2 then
   Button1.Enabled:=true
   else
    sb[floor,x,y+1].Glyph.Assign(wall);
 if y-1>0 then
  if a[floor,x,y-1]<>2 then
   Button2.Enabled:=true
   else
    sb[floor,x,y-1].Glyph.assign(wall);
 light(1);
 Label2.Caption:='这是一块空地...'+chr(13)+chr(10)+'继续...你想往哪个方向走？';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if not lh then
    begin
      randomize;
      at:=random(2)+1;
    end;
  if lh then
    begin
      randomize;
      at:=random(2)+3;
    end;
  if pd then
   inc(at);
  fight_;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 dec(bulb);
 label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
 button14.Enabled:=false;
 memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
 if y<=size-1 then
  memo1.Lines.Add('北边第1格是'+thing(floor,x,y+1));
 if y>=2 then
  memo1.Lines.Add('南边第1格是'+thing(floor,x,y-1));
 if x>=2 then
  memo1.Lines.Add('西边第1格是'+thing(floor,x-1,y));
 if x<=size-1 then
  memo1.Lines.Add('东边第1格是'+thing(floor,x+1,y));
 memo1.Lines.Add(chr(13)+chr(10));
 if bulb>0 then
  button14.Enabled:=true;
end;

procedure TForm1.sbclick(Sender: TObject);
var f:boolean;
    s:string;
    tt:integer;
begin
 if button5.Visible or button7.Visible or groupbox4.Visible or groupbox5.Visible or groupbox6.Visible then
  begin
   sb[floor,x,y].Down:=true;
   exit;
  end;
 f:=false;
 s:=Tspeedbutton(sender).Name;
 delete(s,1,2);
 tt:=strtoint(s);
 i1:=(tt mod 10000) div 100;
 i2:=tt mod 100;
{ for i1:=1 to size do
  begin
   for i2:=1 to size do
    if sender=sb[floor,i1,i2] then
     begin
      f:=true;
      break;
     end;
   if f then
    break;
  end;
 i1:=(Tspeedbutton(sender).Left-257) div 20;
 i2:=(size*20+9-Tspeedbutton(sender).Top) div 20;      }
 if sb[floor,i1,i2].Tag=0 then
  begin
   sb[floor,x,y].Down:=true;
   exit;
  end;
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 xyuan:=x;
 yyuan:=y;
 x:=i1;
 y:=i2;
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[floor,x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[floor,x,y]] then
  begin
   button5.SetFocus;
   a[floor,x,y]:=0;
   fish:=false;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if start then
  if messagebox(form1.Handle,'你确定要放弃本局游戏吗？','询问',mb_yesno+mb_iconquestion)=7 then
   canclose:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
var f:textfile;
    i,xp,yp,kk:integer;
    ok:boolean;
    p:point;
begin
 ok:=fj;
 if not fj then
  ok:=opendialog1.Execute;
 if ok then
  begin
   try
    if fj then
     begin
      opendialog1.FileName:=extractfilepath(application.ExeName)+'Map\教程.map';
      fj:=false;
     end;
    for i:=1 to 10 do
     for i1:=1 to 2 do
      begin
       stairsgroup[i,i1].x:=0;
       stairsgroup[i,i1].y:=0;
       stairsgroup[i,i1].z:=0;
      end;
    assignfile(f,opendialog1.FileName);
    reset(f);
    readln(f,size,level);
    for i:=1 to level do
     for i1:=size downto 1 do
      begin
       for i2:=1 to size do
        begin
         read(f,a[i,i2,i1]);
         randomize;
         if a[i,i2,i1]=202 then
          wineinfer[i,i2,i1]:=random(2);
        end;
        readln(f);
      end;
    for i:=1 to level do
     for i1:=1 to size do
      for i2:=1 to size do
       showsb[i,i1,i2]:=0;
    while not eof(f) do
     begin
      readln(f,i,xp,yp,hints[i,xp,yp]);
      if (401<=a[i,xp,yp])and(a[i,xp,yp]<=403) then
       cansay[i,xp,yp]:=true
       else
        begin
         kk:=strtoint(hints[i,xp,yp]);
         if stairsgroup[kk,1].x=0 then
          begin
           stairsgroup[kk,1].x:=i;
           stairsgroup[kk,1].y:=xp;
           stairsgroup[kk,1].z:=yp;
          end
          else
           begin
            stairsgroup[kk,2].x:=i;
            stairsgroup[kk,2].y:=xp;
            stairsgroup[kk,2].z:=yp;
           end;
        end;
     end;
    pon:=false;
    fight:=false;
    lh:=false;
    life:=3;
    maxhitpoints:=60;
    hitpoints:=60;
    ropes:=0;
    keys:=0;
    gold:=0;
    torch:=0;
    bulb:=0;
    x:=1;
    y:=1;
    floor:=1;
    win:=0;
    pa:=false;
    pb:=false;
    pc:=false;
    pd:=false;
    dgood:=0;
    dbad:=0;
    rocks:=0;
    guns:=0;
    dz:=0;
    winem:=0;
    curem:=0;
    minem:=0;
    lightm:=0;
    closefile(f);
   except
    closefile(f);
    showmessage('读取失败!');
    exit;
   end;
   N9.Enabled:=true;
   showmessage('读取成功!');
  end;
end;

{procedure TForm1.N4Click(Sender: TObject);
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
        if a[j,i]=8 then
         wineinfer[j,i]:=random(2);
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
      if str<>'-1' then
       memo1.Lines.Add(str)
       else
        isend:=false;
     end;
    readln(f,life,hitpoints,maxhitpoints,ropes,keys,gold,torch,bulb,rocks,guns,dz,winem,dgood,dbad,curem,minem,lightm,lt,win,pat,pbt,pct,pdt);
    if lt=1 then
     lh:=true
     else
      lh:=false;
    if pat=1 then
     pa:=true
     else
      pa:=false;
    if pbt=1 then
     pb:=true
     else
      pb:=false;
    if pct=1 then
     pc:=true
     else
      pc:=false;
    if pdt=1 then
     pd:=true
     else
      pd:=false;
    readln(f,x,y);
    while not eof(f) do
     begin
      read(f,xp,yp,fcansay,hints[xp,yp]);
      if fcansay=0 then
       cansay[xp,yp]:=false
       else
        cansay[xp,yp]:=true;
     end;
    closefile(f);
   except
    showmessage('读取失败!');
    exit;
   end;
   showmessage('读取成功!');
   N9.Enabled:=true;
  end;
end;                       }

{procedure TForm1.N5Click(Sender: TObject);
var f:textfile;
    i,j:integer;
begin
 if savedialog1.Execute then
  try
   assignfile(f,savedialog1.FileName);rewrite(f);
   writeln(f,size);
   for i:=size downto 1 do
    begin
     for j:=1 to size do write(f,a[j,i],' ');
     writeln(f);
    end;
   for i:=size downto 1 do
    begin
     for j:=1 to size do
      if not(sb[j,i].Flat) then
       write(f,1,' ')
       else
        if sb[j,i].Glyph.Empty then
         write(f,0,' ')
         else
          write(f,2,' ');
     writeln(f);
    end;
   i:=0;
   while memo1.Lines[i]<>'' do
    begin
     writeln(f,memo1.lines[i]);
     inc(i);
    end;
   writeln(f,-1);
   if lh=true then
    lt:=1
    else
     lt:=0;
   if pa=true then
    pat:=1
    else
     pat:=0;
   if pb=true then
    pbt:=1
    else
     pbt:=0;
   if pc=true then
    pct:=1
    else
     pct:=0;
   if pd=true then
    pdt:=1
    else
     pdt:=0;
   writeln(f,life,' ',hitpoints,' ',maxhitpoints,' ',ropes,' ',keys,' ',gold,' ',torch,' ',bulb,' ',rocks,' ',guns,' ',dz,' ',winem,' ',dgood,' ',dbad,' ',curem,' ',minem,' ',lightm,' ',lt,' ',win,' ',pat,' ',pbt,' ',pct,' ',pdt);
   writeln(f,x,' ',y);
   for i:=1 to size do
    for j:=1 to size do
     if hints[i,j]<>'' then
      writeln(f,i,' ',j,' ',byte(cansay[i,j]),hints[i,j]);
   closefile(f);
   showmessage('保存成功!');
  except
   showmessage('保存失败!');
  end;
end;                          }

procedure TForm1.N9Click(Sender: TObject);
var i:integer;
begin
 if start then
  begin
   start:=false;
   if messagebox(form1.Handle,'你确定要放弃本局游戏吗？','询问',mb_yesno+mb_iconquestion)=6 then
    begin
     winexec(pchar(extractfilename(application.ExeName)),sw_show);
     close;
    end;
   start:=true;
   exit;
 {  if messagebox(form1.Handle,'确定要放弃本局游戏吗?','询问',mb_yesno+mb_iconquestion)=7 then
    exit;
   image1.Picture:=nil;
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   Button3.Enabled:=false;
   Button4.Enabled:=false;
   Button5.Visible:=false;
   N9.Caption:='开始游戏';
   N9.Enabled:=false;
   Button7.Enabled:=false;
   Button8.Enabled:=false;
   Button7.Visible:=false;
   Button8.Visible:=false;
   N3.Enabled:=true;
   N4.Enabled:=true;
   N5.Enabled:=false;
   N11.Enabled:=true;
   groupbox2.Visible:=false;
   groupbox3.Visible:=false;
   groupbox4.Visible:=false;
   groupbox5.Visible:=false;
   label8.Visible:=false;
   button11.Enabled:=false;
   button14.Enabled:=false;
   Label2.Caption:='本游戏版权所有！'+chr(13)+chr(10)+'未经作者允许不得翻录！';
   memo1.Clear;
   for i:=1 to level do
    for i1:=1 to size do
     for i2:=1 to size do
      sb[i,i1,i2].Destroy;
   image2.Canvas.FillRect(image2.Canvas.ClipRect);
   image2.Picture:=nil;
   start:=false;
   exit;                       }
  end;
 Label5.Caption:='绳子：'+inttostr(ropes);
 Label6.Caption:='※：'+inttostr(life);
 Label7.Caption:='生命值：'+inttostr(hitpoints);
 Label8.Caption:='你的位置：（'+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'）';
 Label9.Caption:='钥匙：'+inttostr(keys);
 Label10.Caption:='金币：'+inttostr(gold);
 label11.Caption:='手电筒：'+inttostr(torch)+'  ';
 if torch>0 then
  button11.Enabled:=true;
 label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
 if bulb>0 then
  button14.Enabled:=true;
 label8.Visible:=true;
 groupbox2.Visible:=true;
 groupbox3.Visible:=true;
 Button7.Enabled:=false;
 Button8.Enabled:=false;
 Button7.Visible:=false;
 Button8.Visible:=false;
 N9.Caption:='放弃游戏';
 fish:=true;
 find:=false;
 goldnumber:=[2,3,4];
 N9.Enabled:=true;
 N5.Enabled:=true;
 N3.Enabled:=false;
 N4.Enabled:=false;
 N11.Enabled:=false;
 for i:=1 to level do
  for i1:=1 to size do
   for i2:=1 to size do
    begin
     sb[i,i1,i2]:=Tspeedbutton.create(form1);
     with sb[i,i1,i2] do
      begin
       parent:=form1;
       name:='sb'+inttostr(i*10000+i1*100+i2);
       left:=269+20*i1;
       top:=size*20-i2*20+9;
       width:=20;
       height:=20;
       onclick:=sbclick;
       groupindex:=1;
      end;
     if i>1 then
      sb[i,i1,i2].Visible:=false;
     if showsb[i,i1,i2]=1 then
      begin
       sb[i,i1,i2].Flat:=false;
       sb[i,i1,i2].tag:=1;
      end
      else
       begin
        sb[i,i1,i2].Flat:=true;
        sb[i,i1,i2].Tag:=0;
        if showsb[i,i1,i2]=2 then
         sb[i,i1,i2].Glyph.Assign(wall);
       end;
    end;
 image2.Height:=size*20+10;
 image2.Width:=size*20+10;
 with image2.Canvas do
  begin
   pen.Width:=5;
   moveto(3,3);
   lineto(size*20+8,3);
   lineto(size*20+8,size*20+8);
   lineto(3,size*20+8);
   lineto(3,3);
  end;
 if win=0 then
  begin
   sb[floor,x,y].Flat:=false;
   sb[floor,x,y].Down:=true;
   sb[floor,x,y].Tag:=1;
   if x+1<=size then
    if a[floor,x+1,y]<>2 then
     Button4.Enabled:=true
     else
      sb[floor,x+1,y].Glyph.Assign(wall);
   if x-1>0 then
    if a[floor,x-1,y]<>2 then
     Button3.Enabled:=true
     else
      sb[floor,x-1,y].Glyph.Assign(wall);
   if y+1<=size then
    if a[floor,x,y+1]<>2 then
     Button1.Enabled:=true
     else
      sb[floor,x,y+1].Glyph.assign(wall);
   if y-1>0 then
    if a[floor,x,y-1]<>2 then
     Button2.Enabled:=true
     else
      sb[floor,x,y-1].Glyph.assign(wall);
   n2.Enabled:=true;
   Image1.Picture.Assign(s0);
   label2.Caption:='开始游戏，祝你好运！';
  end
  else
   begin
    Label2.Caption:='祝贺你！你走到了终点！';
    Button1.Enabled:=false;
    Button2.Enabled:=false;
    Button3.Enabled:=false;
    Button4.Enabled:=false;
    Button11.Enabled:=false;
    Button14.Enabled:=false;
    N2.Enabled:=false;
    for i:=1 to level do
     for i1:=1 to size do
      for i2:=1 to size do
       sb[i,i1,i2].Enabled:=false;
   end;
 button5.Visible:=true;
 button5.SetFocus;
 button5.Visible:=false;
 start:=true;
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
  if rocks=0 then
   N01.Enabled:=false;
  if guns=0 then
   N03.Enabled:=false;
  if dz=0 then
   N04.Enabled:=false;
  if winem=0 then
   N05.Enabled:=false;
  if curem=0 then
   N06.Enabled:=false;
  if minem=0 then
   N07.Enabled:=false;
  if lightm=0 then
   N02.Enabled:=false;
  if winem>0 then
   N05.Enabled:=true;
  if curem>0 then
   N06.Enabled:=true;
//  if minem>0 then
//   N07.Enabled:=true;
  if lightm>0 then
   N02.Enabled:=true;
  if pa=true then
   begin
    N05.Visible:=true;
    N06.Visible:=true;
   end;
  if pb=true then
   begin
    N07.Visible:=true;
   end;
  if pc=true then
   begin
    N02.Visible:=true;
   end;
  if pa=false then
   begin
    N05.Visible:=false;
    N06.Visible:=false;
   end;
  if pb=false then
   begin
    N07.Visible:=false;
   end;
  if pc=false then
   begin
    N02.Visible:=false;
   end;
  N01.Caption:='石头（'+inttostr(rocks)+'）';
  N02.Caption:='闪光灯（'+inttostr(lightm)+'）';
  N03.Caption:='手枪（'+inttostr(guns)+'）';
  N04.Caption:='毒针（'+inttostr(dz)+'）';
  N05.Caption:='酒（'+inttostr(winem)+'）';
  N06.Caption:='急救箱（'+inttostr(curem)+'）';
  N07.Caption:='地雷（'+inttostr(minem)+'）';
end;

procedure TForm1.N01Click(Sender: TObject);
begin
  dec(rocks);
  randomize;
  at:=random(3)+4;
  fight_;
end;

procedure TForm1.N03Click(Sender: TObject);
begin
  dec(guns);
  randomize;
  at:=random(10);
  fight_;
end;

procedure TForm1.N04Click(Sender: TObject);
begin
  dec(dz);
  at:=1;
  pon:=true;
  fight_;
end;

{procedure TForm1.N1Click(Sender: TObject);
begin
 if start and ((a[floor,x,y]=0) or (a[floor,x,y]=1) or (401<=a[floor,x,y])and(a[floor,x,y]<=403)) then
  n5.Enabled:=true
  else
   n5.Enabled:=false;
end;     }

procedure TForm1.N06Click(Sender: TObject);
begin
  dec(curem);
  Label2.Caption:='你使用了一个急救箱！';
  hitpoints:=hitpoints+15;
  Label7.Caption:='生命值：'+inttostr(hitpoints);
end;

procedure TForm1.N07Click(Sender: TObject);
begin
  dec(minem);
  N2.Click;
  Label2.Caption:='轰...怪兽失去了一半的生命值！';
  monsterlife:=(monsterlife+1) div 2;
  Label16.Caption:='生命值：'+inttostr(monsterlife);
end;

procedure TForm1.N02Click(Sender: TObject);
var i:integer;
begin
  dec(lightm);
  memo1.Lines.Add('('+inttostr(floor)+','+inttostr(x)+','+inttostr(y)+'):');
  for i:=1 to 3 do
   if y+i<=size then
    memo1.Lines.Add('北边第'+inttostr(i)+'格是'+thing(floor,x,y+i));
  radiobutton3.Checked:=false;
  groupbox4.Visible:=false;
  for i:=1 to 3 do
   if y-i>=1 then
    memo1.Lines.Add('南边第'+inttostr(i)+'格是'+thing(floor,x,y-i));
  radiobutton4.Checked:=false;
  groupbox4.Visible:=false;
  for i:=1 to 3 do
   if x-i>=1 then
    memo1.Lines.Add('西边第'+inttostr(i)+'格是'+thing(floor,x-i,y));
  radiobutton5.Checked:=false;
  groupbox4.Visible:=false;
  for i:=1 to 3 do
   if x+i<=size then
    memo1.Lines.Add('东边第'+inttostr(i)+'格是'+thing(floor,x+i,y));
  radiobutton6.Checked:=false;
  groupbox4.Visible:=false;
  if x+1<=size then
   if a[floor,x+1,y]<>2 then
    Button4.Enabled:=true
    else
     sb[floor,x+1,y].Glyph.Assign(wall);
  if x-1>0 then
   if a[floor,x-1,y]<>2 then
    Button3.Enabled:=true
    else
     sb[floor,x-1,y].Glyph.Assign(wall);
  if y+1<=size then
   if a[floor,x,y+1]<>2 then
    Button1.Enabled:=true
    else
     sb[floor,x,y+1].Glyph.assign(wall);
  if y-1>0 then
   if a[floor,x,y-1]<>2 then
    Button2.Enabled:=true
    else
     sb[floor,x,y-1].Glyph.assign(wall);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  pa:=true;
  Button10.Visible:=false;
  gold:=gold-5;
  Label10.Caption:='金币：'+inttostr(gold);
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  pb:=true;
  Button15.Visible:=false;
  gold:=gold-7;
  Label10.Caption:='金币：'+inttostr(gold);
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  pc:=true;
  gold:=gold-2;
  dec(torch);
  dec(bulb);
  inc(lightm);
  Label10.Caption:='金币：'+inttostr(gold);
  label11.Caption:='手电筒：'+inttostr(torch)+'  ';
  if torch>0 then
   button11.Enabled:=true;
  label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
  if bulb>0 then
   button14.Enabled:=true;
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  pd:=true;
  gold:=gold-7;
  Button6.Visible:=false;
  Label10.Caption:='金币：'+inttostr(gold);
  button5.SetFocus;
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

procedure changelevel(a,b:integer);
begin
 if a=b then
  exit;
 for i1:=1 to size do
  for i2:=1 to size do
   sb[a,i1,i2].Visible:=false;
 for i1:=1 to size do
  for i2:=1 to size do
   sb[b,i1,i2].Visible:=true;
end;

end.
