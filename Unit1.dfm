object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'INFO Sistemas - Cadastro de Clientes'
  ClientHeight = 624
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 47
    Width = 65
    Height = 13
    Caption = 'Identidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 170
    Top = 49
    Width = 23
    Height = 13
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 88
    Width = 52
    Height = 13
    Caption = 'Telefone:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 131
    Width = 37
    Height = 13
    Caption = 'E-Mail:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 236
    Top = 607
    Width = 147
    Height = 11
    Caption = 'Desenvolvido por: Klaytson Pereira'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DbNome: TDBEdit
    Left = 9
    Top = 22
    Width = 374
    Height = 21
    DataField = 'Nome'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DbIdentidade: TDBEdit
    Left = 9
    Top = 62
    Width = 153
    Height = 21
    DataField = 'Identidade'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 441
    Width = 375
    Height = 160
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DbCPF: TDBEdit
    Left = 170
    Top = 62
    Width = 213
    Height = 21
    DataField = 'CPF'
    DataSource = DataSource1
    MaxLength = 14
    TabOrder = 2
  end
  object DbTelefone: TDBEdit
    Left = 8
    Top = 105
    Width = 154
    Height = 21
    DataField = 'Telefone'
    DataSource = DataSource1
    MaxLength = 14
    TabOrder = 3
  end
  object DbEmail: TDBEdit
    Left = 8
    Top = 148
    Width = 375
    Height = 21
    DataField = 'Email'
    DataSource = DataSource1
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 179
    Width = 375
    Height = 230
    Caption = ' Endere'#231'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object Label7: TLabel
      Left = 12
      Top = 19
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object Label8: TLabel
      Left = 12
      Top = 58
      Width = 68
      Height = 13
      Caption = 'Logradouro:'
    end
    object Label9: TLabel
      Left = 12
      Top = 99
      Width = 47
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object Label10: TLabel
      Left = 159
      Top = 99
      Width = 82
      Height = 13
      Caption = 'Complemento:'
    end
    object Label11: TLabel
      Left = 12
      Top = 142
      Width = 37
      Height = 13
      Caption = 'Bairro:'
    end
    object Label12: TLabel
      Left = 159
      Top = 141
      Width = 41
      Height = 13
      Caption = 'Cidade:'
    end
    object Label13: TLabel
      Left = 13
      Top = 179
      Width = 41
      Height = 13
      Caption = 'Estado:'
    end
    object Label14: TLabel
      Left = 159
      Top = 179
      Width = 26
      Height = 13
      Caption = 'Pa'#237's:'
    end
    object DbCEP: TDBEdit
      Left = 12
      Top = 34
      Width = 141
      Height = 21
      DataField = 'CEP'
      DataSource = DataSource1
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = DbCEPExit
    end
    object DbLogradouro: TDBEdit
      Left = 11
      Top = 73
      Width = 330
      Height = 21
      DataField = 'Logradouro'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DbNumero: TDBEdit
      Left = 12
      Top = 115
      Width = 141
      Height = 21
      DataField = 'Numero'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DbComplemento: TDBEdit
      Left = 159
      Top = 114
      Width = 202
      Height = 21
      DataField = 'Complemento'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DbBairro: TDBEdit
      Left = 12
      Top = 155
      Width = 141
      Height = 21
      DataField = 'Bairro'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DbCidade: TDBEdit
      Left = 159
      Top = 155
      Width = 204
      Height = 21
      DataField = 'Cidade'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DbEstado: TDBEdit
      Left = 12
      Top = 195
      Width = 141
      Height = 21
      DataField = 'Estado'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DbPais: TDBEdit
      Left = 159
      Top = 195
      Width = 121
      Height = 21
      DataField = 'Pais'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object BtnInserir: TBitBtn
    Left = 8
    Top = 412
    Width = 75
    Height = 25
    Hint = 'Habilita o sistema para Inserir registros'
    Caption = '&Inserir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BtnInserirClick
  end
  object BtnSalvar: TBitBtn
    Left = 233
    Top = 412
    Width = 75
    Height = 25
    Hint = 'Habilita o sistema para Salvar o registro'
    Caption = '&Salvar'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BtnSalvarClick
  end
  object BtnAlterar: TBitBtn
    Left = 83
    Top = 412
    Width = 75
    Height = 25
    Hint = 'Habilita o sistema para Alterar registros'
    Caption = '&Alterar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = BtnAlterarClick
  end
  object BtnCancelar: TBitBtn
    Left = 158
    Top = 412
    Width = 75
    Height = 25
    Hint = 
      'Habilita o sistema para Cancelar a inser'#231#227'o/altera'#231#227'o de Registr' +
      'os'
    Caption = 'Ca&ncelar'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = BtnCancelarClick
  end
  object BtnExcluir: TBitBtn
    Left = 308
    Top = 412
    Width = 75
    Height = 25
    Hint = 'Habilita o sistema para Excluir registros'
    Caption = '&Excluir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = BtnExcluirClick
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 160
    Top = 556
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_1
    SSLOptions.SSLVersions = [sslvTLSv1_1]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 184
    Top = 492
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      9A0100009619E0BD01000000180000000E0000000000030000009A01044E6F6D
      65010049000000010005574944544802000200C8000A4964656E746964616465
      0100490000000100055749445448020002000A00034350460100490000000100
      055749445448020002000F000854656C65666F6E650100490000000100055749
      445448020002000F0005456D61696C0200490000000100055749445448020002
      00FF00034345500100490000000100055749445448020002000A0008456E6465
      7265636F020049000000010005574944544802000200FF000A4C6F677261646F
      75726F010049000000010005574944544802000200C800064E756D65726F0100
      490000000100055749445448020002000A000B436F6D706C656D656E746F0100
      4900000001000557494454480200020064000642616972726F01004900000001
      0005574944544802000200500006436964616465010049000000010005574944
      54480200020064000645737461646F0100490000000100055749445448020002
      00320004506169730100490000000100055749445448020002001E000000}
    Active = True
    Aggregates = <>
    Params = <>
    AfterInsert = ClientDataSet1AfterInsert
    Left = 60
    Top = 556
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
    object ClientDataSet1Identidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object ClientDataSet1CPF: TStringField
      FieldName = 'CPF'
      EditMask = '000.000.000-00;0;_'
      Size = 15
    end
    object ClientDataSet1Telefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 15
    end
    object ClientDataSet1Email: TStringField
      FieldName = 'Email'
      Size = 255
    end
    object ClientDataSet1CEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ClientDataSet1Logradouro: TStringField
      FieldName = 'Logradouro'
      Size = 200
    end
    object ClientDataSet1Numero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object ClientDataSet1Complemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object ClientDataSet1Bairro: TStringField
      FieldName = 'Bairro'
      Size = 80
    end
    object ClientDataSet1Cidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object ClientDataSet1Estado: TStringField
      FieldName = 'Estado'
      Size = 50
    end
    object ClientDataSet1Pais: TStringField
      FieldName = 'Pais'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet1
    OnStateChange = DataSource1StateChange
    Left = 72
    Top = 504
  end
  object NMSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 296
    Top = 500
  end
end
