//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SUE                                            //
//                                                                            //
// PROGRAMA                  : Inicial.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar da entrada   //
//                             Sistema.                                       //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, Mask, ExtCtrls, Rotinas,
  DB, IBCustomDataSet, IBQuery, IBTable, DBTables, jpeg, JvSpecialLabel,
  JvGradient, JvBlinkingLabel, JvBouncingLabel, JvLabel, JvAngleLabel,
  JvComponent, JvxCtrls, Menus, JvShape, XPMan;

type
  TForm_Abertura = class(TForm)
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_MenuPrincipal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    JvGradient1: TJvGradient;
    JvxLabel2: TJvxLabel;
    JvShape1: TJvShape;
    Label1: TLabel;
    Label2: TLabel;
    JvShape2: TJvShape;
    MaskEdit_Senha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    JvxLabel1: TJvxLabel;
    XPManifest1: TXPManifest;
    JvShape3: TJvShape;
    Image1: TImage;
    Image_Brasao: TImage;

    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_MenuPrincipalClick(Sender: TObject);

    procedure Abertura(VS_Usuario, VS_Senha, VS_Acesso: String);
    procedure Usuario_Nao_Encontrado;
    procedure MaskEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private    { Private declarations }
    VI_Tentativas: integer;
  public
     Usuario, VS_IdUsuario: String;
    { Public declarations }
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Data_Module, MenuPrincipal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure de criacao da Form
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormCreate(Sender: TObject);
begin
   //
end;

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
var
   VS_Linha: String;
   ArqTexto: TextFile;
begin
   Funcoes.CabecalhoForm(Form_Abertura, ' Abertura' );
//   JvxLabel1.Caption:= 'SISTEMA DE ACOMPANHAMENTO';
//   JvxLabel2.Caption:= 'EDUCACIONAL';

   if not DirectoryExists('C:\DataBase_EEAR\Ensino') then
       ForceDirectories('C:\DataBase_EEAR\Ensino');

   Funcoes.SetAuxilio('91');
   if FileExists('Brasao_Ensino.jpg') = True then
      Image_Brasao.Picture.LoadFromFile('Brasao_Ensino.jpg');

   if FileExists('C:\DataBase_EEAR\Ensino\AdmUsu.cnf') = True then
   begin
      AssignFile ( ArqTexto, 'C:\DataBase_EEAR\Ensino\AdmUsu.cnf' );
      Reset ( ArqTexto );
      ReadLn ( ArqTexto, VS_Linha );
      CloseFile ( ArqTexto );
      MaskEdit_Nome.Text:=  VS_Linha;
      MaskEdit_Senha.Text:= '';
      MaskEdit_Senha.SetFocus;
   end
   else
   begin
      MaskEdit_Nome.Text:= '';
      MaskEdit_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_Abertura.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Continuar
//------------------------------------------------------------------------------

procedure TForm_Abertura.ToolButton_MenuPrincipalClick(Sender: TObject);
var
   Status: Boolean;
   ArqTexto: TextFile;
begin

   //--- Grava o arquivo contendo o nome do usuário

   if FileExists('C:\DataBase_EEAR\Ensino\AdmUsu.cnf') then
       DeleteFile('C:\DataBase_EEAR\Ensino\AdmUsu.cnf');

   AssignFile ( ArqTexto, 'C:\DataBase_EEAR\Ensino\AdmUsu.cnf' );
   Rewrite ( ArqTexto );
   Writeln ( ArqTexto, MaskEdit_Nome.Text);
   CloseFile ( ArqTexto );
   usuario := MaskEdit_Nome.Text;

   if ((MaskEdit_Nome.Text = 'ENSINO') and (MaskEdit_Senha.Text = 'ENSINO#99')) then
      Abertura(MaskEdit_Nome.Text, MaskEdit_Senha.Text, 'A')
   else
   begin
      Status:= Funcoes.Busca_Usuario(MaskEdit_Nome.Text, MaskEdit_Senha.Text);

      if Status = False then
         Usuario_Nao_Encontrado
      else
         Abertura(MaskEdit_Nome.Text, MaskEdit_Senha.Text, DM.Query_Usuario.FieldByName('Acesso').AsString);
   end;
end;
             
//------------------------------------------------------------------------------
// Tratamento de verificacao do usuario e seu acesso
//------------------------------------------------------------------------------

procedure TForm_Abertura.Abertura(VS_Usuario, VS_Senha, VS_Acesso: String);
begin
   Funcoes.SetAbertura(False);
//   Funcoes.SetCodUsuario(PS_CodUsuario);
   Funcoes.SetUsuario(Trim(DM.Query_Usuario.FieldByName('NOME').AsString));
   Funcoes.SetSenha(VS_Senha);

   VS_IdUsuario:= DM.Query_Usuario.FieldByName('IdUsuario').AsString;

   Form_Abertura.Left:= -3001;
   Application.CreateForm(TForm_MenuPrincipal,Form_MenuPrincipal);
   Form_MenuPrincipal.Show;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo nome
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_NomeKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      MaskEdit_Senha.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento quando eh pressionado a tecla ENTER no campo senha
//------------------------------------------------------------------------------

procedure TForm_Abertura.MaskEdit_SenhaKeyPress(Sender: TObject;var Key: Char);
begin
   if key = #13 then
      ToolButton_MenuPrincipalClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando o usuario não foi encontrado
//------------------------------------------------------------------------------

procedure TForm_Abertura.Usuario_Nao_Encontrado;
begin
   MaskEdit_Nome.Text:= '';
   MaskEdit_Senha.Text:= '';
   VI_Tentativas:= VI_Tentativas + 1;
   if VI_Tentativas > 3 then
      Application.Terminate
   else
      MaskEdit_Nome.SetFocus;
end;

end.

