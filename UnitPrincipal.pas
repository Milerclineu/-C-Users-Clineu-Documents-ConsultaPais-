unit UnitPrincipal;

interface

uses System.SysUtils,System.Net.HttpClient,System.Net.URLClient,
  System.JSON ,System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Dialogs, UnitServicoPais, System.Net.HttpClientComponent;

type
  TForm1 = class(TForm)
    grpConsulta: TGroupBox;
    edtPais: TEdit;
    btnConsultar: TButton;
    grpResultado: TGroupBox;
    edtNomeOficial: TEdit;
    edtCapital: TEdit;
    edtRegiao: TEdit;
    edtPopulacao: TEdit;
    edtMoeda: TEdit;
    lblNomeOficial: TLabel;
    lblCapital: TLabel;
    lblRegiao: TLabel;
    lblPopulacao: TLabel;
    lblMoeda: TLabel;
    procedure btnConsultarClick(Sender: TObject);
  private
    procedure LimparCampos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LimparCampos;
begin
  edtNomeOficial.Clear;
  edtCapital.Clear;
  edtRegiao.Clear;
  edtPopulacao.Clear;
  edtMoeda.Clear;
end;

procedure TForm1.btnConsultarClick(Sender: TObject);
var
  PaisInfo: TPaisInfo;
begin
  if Trim(edtPais.Text) = '' then
  begin
    ShowMessage('Informe o nome do país.');
    Exit;
  end;

  LimparCampos;

  try
    PaisInfo := TPaisService.ConsultarPais(edtPais.Text);

    edtNomeOficial.Text := PaisInfo.NomeOficial;
    edtCapital.Text := PaisInfo.Capital;
    edtRegiao.Text := PaisInfo.Regiao;
    edtPopulacao.Text := PaisInfo.Populacao;
    edtMoeda.Text := PaisInfo.Moeda;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.
