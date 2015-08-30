unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
var tmp:pchar;

begin

  if key = #13 then       begin
  BinToHex(PChar(Edit1.text),tmp,SizeOf(PChar(edit1.text)));
;
  ShowMessage(tmp^);
   freemem(tmp)
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
end;



end.

