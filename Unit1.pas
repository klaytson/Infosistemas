unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, JSON, Data.DB,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdMessage, idtext, IdAttachmentFile, system.UITypes;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1Identidade: TStringField;
    ClientDataSet1CPF: TStringField;
    ClientDataSet1Telefone: TStringField;
    ClientDataSet1Email: TStringField;
    ClientDataSet1CEP: TStringField;
    ClientDataSet1Logradouro: TStringField;
    ClientDataSet1Numero: TStringField;
    ClientDataSet1Complemento: TStringField;
    ClientDataSet1Bairro: TStringField;
    ClientDataSet1Cidade: TStringField;
    ClientDataSet1Estado: TStringField;
    ClientDataSet1Pais: TStringField;
    DataSource1: TDataSource;
    DbNome: TDBEdit;
    DbIdentidade: TDBEdit;
    DBGrid1: TDBGrid;
    DbCPF: TDBEdit;
    DbTelefone: TDBEdit;
    DbEmail: TDBEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DbCEP: TDBEdit;
    DbLogradouro: TDBEdit;
    DbNumero: TDBEdit;
    DbComplemento: TDBEdit;
    DbBairro: TDBEdit;
    DbCidade: TDBEdit;
    DbEstado: TDBEdit;
    DbPais: TDBEdit;
    NMSMTP1: TIdSMTP;
    BtnInserir: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnExcluir: TBitBtn;
    Label6: TLabel;
    procedure DbCEPExit(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure obterDados(pCEP: String);
    function enviarEmail(const pAssunto, pDestino, pDocAnexo: String; pCorpo: String): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnInserirClick(Sender: TObject);
begin
  With ClientDataSet1 Do
    begin
      If(Active = False)Then
        begin
          ClientDataSet1.Active := True;
          Append;
        end
      Else
        Append;
    end;
end;

procedure TForm1.BtnSalvarClick(Sender: TObject);
var
  corpo: String;
  caminhoXML: String;
begin
  corpo := 'REGISTRO CADASTRADO: ' + #10#10 +
  'NOME: ' + ClientDataSet1Nome.AsString + #10 +
  'Identidade: ' + ClientDataSet1Identidade.asString + #10 +
  'CPF: ' + ClientDataSet1CPF.AsString + #10 +
  'Telefone: ' + ClientDataSet1Telefone.AsString + #10 +
  'Email: ' + ClientDataSet1Email.Asstring + #10 +
  'CEP: ' + ClientDataSet1CEP.AsString + #10 +
  'Logradouro: ' + ClientDataSet1Logradouro.AsString + #10 +
  'N?mero: ' + ClientDataSet1Numero.AsString + #10 +
  'Complemento: ' + ClientDataSet1Complemento.AsString + #10 +
  'Bairro: ' + ClientDataSet1Bairro.AsString + #10 +
  'Cidade: ' + ClientDataSet1Cidade.AsString + #10 +
  'Estado: ' + ClientDataSet1Estado.AsString + #10 +
  'Pa?s: ' + ClientDataSet1Pais.AsString;

  With ClientDataSet1 Do
    begin
      If(state in [DsInsert, DsEdit])Then
        begin
          Post;

          caminhoXML := 'C:\temp\clientes.xml';
          SaveToFile(caminhoXML, dfXML);

          enviarEmail('Teste para Empresa Info Sistemas', 'klaytson@gmail.com', caminhoXML, corpo);
        end
    end;
end;

procedure TForm1.BtnAlterarClick(Sender: TObject);
begin
  With ClientDataSet1 Do
    begin
      If(Active = False)Then
        begin
          ClientDataSet1.Active := True;
          Edit;
        end
      Else
        Edit;
    end;
end;

procedure TForm1.BtnCancelarClick(Sender: TObject);
begin
  With ClientDataSet1 Do
    begin
      If(state in [DsInsert, DsEdit])Then
        begin
          Cancel;
        end
    end;
end;

procedure TForm1.BtnExcluirClick(Sender: TObject);
begin
  With ClientDataSet1 Do
    begin
      If(state in [DsBrowse])Then
        begin
          If(MessageDlg('Tem certeza que deseja excluir o registro?', MtConfirmation, [MbYes, mbNo], 0)) = IdYes Then
            Delete;
        end;

    If(ClientDataSet1.RecordCount = 0)Then
      BtnExcluir.Enabled := False;
    end;
end;

procedure TForm1.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  DbNome.SetFocus;
end;

procedure TForm1.DataSource1StateChange(Sender: TObject);
begin
  If(ClientDataSet1.State In [DsInsert, DsEdit])Then
    begin
      BtnInserir.Enabled := False;
      BtnAlterar.Enabled := False;
      BtnExcluir.Enabled := False;

      DbCEP.Enabled := True;
      BtnSalvar.Enabled := True;
      BtnCancelar.Enabled := True;
    end
  Else If(ClientDataSet1.State In [DsBrowse])Then
    begin

      BtnInserir.Enabled := True;
      BtnAlterar.Enabled := True;

      DbCEP.Enabled := False;
      BtnSalvar.Enabled := False;
      BtnCancelar.Enabled := False;

      If(ClientDataSet1.RecordCount = 0)Then
        BtnExcluir.Enabled := False
      else
        BtnExcluir.Enabled := True;
    end;
end;

procedure TForm1.DbCEPExit(Sender: TObject);
begin
  If(DbCEP.Text = '')Then
    begin
      MessageDlg('O campo CEP ? de preenchimento obrigat?rio', MtWarning, [MbOk], 0);
      DbCep.SetFocus;
    end
  else
    obterDados(DbCEP.Text);
end;

function TForm1.EnviarEmail(const pAssunto, pDestino, pDocAnexo: String; pCorpo: String): Boolean;
var
  de: String;
  host: String;
  porta: Integer;
  usuario: String;
  senha: String;

  idMsg: TIdMessage;
  idSMTP: TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Par?metros do ssl
      IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_1;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

      de := 'klaytson@gmail.com';
      host := 'smtp.gmail.com';
      porta := 465;
      usuario := 'klaytson@gmail.com';
      senha := '';

      //Par?metros MSG
      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'Para teste na INFO Sistemas';
      idMsg.From.Address               := de;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := pAssunto;

      //Destinat?rio
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := pDestino;
      idMsg.CCList.EMailAddresses      := 'klaytson@gmail.com';

      //Prepara??o do Servidor
      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := host;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Port                      := porta;
      IdSMTP.Username                  := usuario;
      IdSMTP.Password                  := senha;

      // Conex?o com o servidor de email e autentica??o
      IdSMTP.Connect;
      try
        IdSMTP.Authenticate;
      except on E:Exception do

      end;

      if(pDocAnexo = EmptyStr) then
        if FileExists(pDocAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, pDocAnexo);

      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Envio falhou: ' + E.Message);
          end;
        end;
      end;

      // Finaliza??o da conex?o com o servidor
      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    finally
      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;

  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;


procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Key := #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TForm1.obterDados(pCEP: String);
var
  objJson: TJsonObject;
  resultado: string;
  url: string;
  lHTTP: TIdHTTP;
begin
  url := 'http://viacep.com.br/ws/' + pCEP + '/json/';

  lHTTP := TIdHTTP.Create(nil);

  lHTTP.IOHandler:= IdSSLIOHandlerSocketOpenSSL1;
  lHTTP.ProtocolVersion:= pv1_0;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method:= sslvTLSv1;

  lHTTP.Request.ContentType:= 'application/json';
  lHTTP.HandleRedirects:= True;

  resultado := lHTTP.Get(url);

  objJson := TJsonObject.ParseJSONValue(resultado) as TJsonObject;

  ClientDataSet1Bairro.AsString := ObjJson.GetValue('bairro').Value;
  ClientDataSet1Cidade.AsString := ObjJson.GetValue('localidade').Value;
  ClientDataSet1Logradouro.AsString := ObjJson.getvalue('logradouro').value;
  ClientDataSet1Complemento.AsString := ObjJson.getvalue('complemento').value;
  ClientDataSet1Estado.AsString := ObjJson.getvalue('uf').value;
end;

end.
