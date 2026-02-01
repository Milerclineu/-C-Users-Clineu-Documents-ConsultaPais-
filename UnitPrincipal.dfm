object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Consulta de Pa'#237's'
  ClientHeight = 320
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object grpConsulta: TGroupBox
    Left = 16
    Top = 16
    Width = 488
    Height = 73
    Caption = 'Consulta'
    TabOrder = 0
    object edtPais: TEdit
      Left = 16
      Top = 32
      Width = 300
      Height = 21
      TabOrder = 0
    end
    object btnConsultar: TButton
      Left = 336
      Top = 30
      Width = 120
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
  end
  object grpResultado: TGroupBox
    Left = 16
    Top = 104
    Width = 488
    Height = 193
    Caption = 'Informa'#231#245'es do Pa'#237's'
    TabOrder = 1
    object lblNomeOficial: TLabel
      Left = 16
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Nome Oficial:'
    end
    object lblCapital: TLabel
      Left = 16
      Top = 64
      Width = 39
      Height = 13
      Caption = 'Capital:'
    end
    object lblRegiao: TLabel
      Left = 16
      Top = 96
      Width = 39
      Height = 13
      Caption = 'Regi'#227'o:'
    end
    object lblPopulacao: TLabel
      Left = 16
      Top = 128
      Width = 57
      Height = 13
      Caption = 'Popula'#231#227'o:'
    end
    object lblMoeda: TLabel
      Left = 16
      Top = 160
      Width = 39
      Height = 13
      Caption = 'Moeda:'
    end
    object edtNomeOficial: TEdit
      Left = 120
      Top = 29
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtCapital: TEdit
      Left = 120
      Top = 61
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtRegiao: TEdit
      Left = 120
      Top = 93
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtPopulacao: TEdit
      Left = 120
      Top = 125
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtMoeda: TEdit
      Left = 120
      Top = 157
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
  end
end
