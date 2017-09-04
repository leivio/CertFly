unit ExemploCertFly;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses StrUtils, Certfly;

procedure TForm2.Button1Click(Sender: TObject);
var
  Ret: Integer;

function ExtraiURI(const AXML: String): String;
var
  I, J: integer;
begin
  Result := '';
  I := PosEx('Id=', AXML, 6);
  if I = 0 then
    I := PosEx('id=', AXML, 6);
  if I = 0 then       // XML não tem URI
    exit ;

  I := PosEx('"', AXML, I + 2);
  J := PosEx('"', AXML, I + 1);

  Result := copy(AXML, I + 1, J - I - 1);
end;

var
  URI: string;
  Xml: TStringList;
begin
  Xml := TStringList.Create;
  try
    xml.LoadFromFile('C:\xml\R1000_N.xml');
    URI := ExtraiURI(xml.Text)
  finally
    Xml.Free
  end;

  Ret := TCertfly.Assinar('C:\xml\R1000_N.xml',
                          'C:\xml\R1000_ASS.xml',
                          'eSocial','0', '1ce63d4dcefb45e9', '1234');
 if Ret = 0 then
   ShowMessage('Sucesso')
 else
   ShowMessage('False');
end;

end.
