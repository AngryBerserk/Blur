unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    BackBuffer:TBitmap;
    Bitmap:Array[1..2000] of PByteArray;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
 var y:Word;
begin
BackBuffer:=TBitmap.Create;
BackBuffer.Width:=ClientWidth;
BackBuffer.Height:=ClientHeight;
BackBuffer.PixelFormat:=pf24bit;
BackBuffer.Canvas.Brush.Color:=ClBlack;
FillChar(Bitmap,SizeOf(Bitmap),0);
For y:=1 to BackBuffer.Height-1 Do
  Begin
    Bitmap[y]:=BackBuffer.ScanLine[y];
  End;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
 var R,G,B,x,y:Word;Dy:Integer;P:PByteArray;
begin
backbuffer.Canvas.Ellipse(200,200,400,400);
  For y:=2 to BackBuffer.Height-2 Do
  Begin
  For x:=1 to (BackBuffer.Width-2) Do
   Begin
   r:=0;
   g:=0;
   b:=0;
   For Dy:=-1 to 1 Do
    Begin
      P:=Bitmap[y+Dy];

      R:=R+P[(x)*3];
      R:=R+P[(x+1)*3];
      R:=R+P[(x-1)*3];

      G:=G+P[(x)*3+1];
      G:=G+P[(x+1)*3+1];
      G:=G+P[(x-1)*3+1];

      B:=B+P[(x)*3+2];
      B:=B+P[(x+1)*3+2];
      B:=B+P[(x-1)*3+2];
    End;

    P:=Bitmap[y];
    R:=r-P[(x)*3];
    G:=G-P[(x)*3+1];
    b:=b-P[(x)*3+2];
   r:=r div 8;
   g:=g div 8;
   b:=b div 8;
   p[x*3]:=r;
   p[x*3+1]:=g;
   p[x*3+2]:=b;
   End;
   End;
  Canvas.Draw(0,0,backbuffer);
  end;
end.
