unit u_bin_dec_hex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math, StrUtils, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ComCtrls, ExtCtrls, ColorBox;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure Edit3KeyPress(Sender: TObject; var Key: char);
    procedure Edit4KeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

const
  po2: array[0..7] of byte = (1, 2, 4, 8, 16, 32, 64, 128); {powers of 2}
  bin: array[False..True] of char = '01';
  oct: array[0..7] of char = '01234567';

implementation

{$R *.lfm}

{ TForm1 }

function Dec(s: string; base: integer): int64;
var
  cnt: integer;
  rslt: int64;
begin
  rslt := 0;
  for cnt := 1 to length(s) do
  begin
    if StrToInt(s[cnt]) >= base then
    begin
      Result := 0;
      exit;
    end;
    rslt := rslt + round(power(base, (length(s) - cnt)) * StrToInt(s[cnt]));
  end;
  Result := rslt;
end;

function binary(s: string): string;
var
  rslt: string;
  t: integer;

begin

  rslt := '';

  for t := 1 to length(s) do
  begin
    case s[t] of
      '0': rslt := rslt+'0000' ;
      '1': rslt := rslt+'0001' ;
      '2': rslt := rslt+'0010' ;
      '3': rslt := rslt+'0011' ;
      '4': rslt := rslt+'0100' ;
      '5': rslt := rslt+'0101' ;
      '6': rslt := rslt+'0110' ;
      '7': rslt := rslt+'0111' ;
      '8': rslt := rslt+'1000' ;
      '9': rslt := rslt+'1001' ;
      'A': rslt := rslt+'1010' ;
      'B': rslt := rslt+'1011' ;
      'C': rslt := rslt+'1100' ;
      'D': rslt := rslt+'1101' ;
      'E': rslt := rslt+'1110' ;
      'F': rslt := rslt+'1111' ;
    end;

  end;
  Result := rslt;
end;



function hex(s: string): string;
var
  cnt: integer;
  rslt: string;
  t: integer;
  dc: integer;
  snd: string;

begin
  if length(s) mod 4 <> 0 then
    for t := 1 to 4 - (length(s) mod 4) do
      s :='0' +  s;
  rslt := '';
  snd := '';

  for t := 0 to (length(s) div 4) - 1 do
  begin
    snd := s[(t * 4) + 1] + s[(t * 4) + 2] + s[(t * 4) + 3] + s[(t * 4) + 4];
    dc := round(Dec(snd, 2));
    case dc of
      0: rslt := rslt +'0' ;
      1: rslt := rslt + '1'  ;
      2: rslt := rslt + '2'  ;
      3: rslt := rslt + '3'  ;
      4: rslt := rslt + '4'  ;
      5: rslt := rslt + '5'  ;
      6: rslt := rslt + '6'  ;
      7: rslt := rslt + '7'  ;
      8: rslt := rslt + '8'  ;
      9: rslt := rslt + '9'  ;
      10: rslt := rslt + 'A'  ;
      11: rslt := rslt + 'B'  ;
      12: rslt := rslt + 'C'  ;
      13: rslt := rslt + 'D'  ;
      14: rslt := rslt + 'E'  ;
      15: rslt := rslt + 'F'  ;
    end;

  end;

  Result := rslt;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin

  if key = #13 then
  begin
    edit2.Text := floattostr(Dec(trim(edit1.Text), 2));
    edit3.Text := hex(edit1.Text);// IntToHex(strtoint(edit2.text),10);

  end;
  if not (key in ['0'..'1']) then
    key := #0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
  c: char;
begin
  edit1.Text := '';
  for i := 0 to StrToInt(TButton(Sender).Caption) - 1 do
    edit1.Text := edit1.Text + '1';
  c := char(#13);
  Edit1KeyPress(edit1, c);

end;
function sifir_temizle(sayi:string):string;

begin
  while sayi[1] = '0' do  delete(sayi,1,1);

   result:=sayi;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin

end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    edit3.Text :=sifir_temizle( IntToHex(StrToInt(edit2.Text), 10));
    edit1.Text :=sifir_temizle( binary(edit3.Text));

  end;
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    edit2.Text := sifir_temizle(IntToStr(Hex2Dec(edit3.Text)));
    edit1.Text := sifir_temizle( binary(edit3.Text));

  end;
 // else if not (key in ['0'..'9','A','B','C','D','E','F']) then key :=#0;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: char);
var
  i: integer;
  c: char;
begin
  if key = #13 then
  begin
    edit1.Text := '';
    for i := 0 to StrToInt(tedit(Sender).Text) - 1 do
      edit1.Text := edit1.Text + '1';
    c := char(#13);
    Edit1KeyPress(edit1, c);
  end;

end;



end.
