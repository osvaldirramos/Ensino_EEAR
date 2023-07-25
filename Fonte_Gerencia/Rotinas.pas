//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/05/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, PsyRichEdit,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Data_Module, IBQuery, ToolWin, ShellApi, Variants;

const
   ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
   SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   HABILITA_LOG_RECEPCAO= False;
   Ultima_Atualizacao= '17-Julho-2023';
   Versao= '04,68';

   type
   Funcao = Class
      Private
         VS_Usuario, VS_Privilegio, VS_CodCurso, VS_Unidade, VS_SelTurma: String;
         VS_Desligamento, VS_Cargo, VS_Identidade, VS_IdUnidade, VS_IdSubUnidade : String;
         VS_IdQuadro, VS_IdPaises, VS_PostoGraduacao: String;
         VS_RelDesempenho: String;

         VB_RetDesligamento, VB_RetUnidade, VB_RetCargo, VB_RetIdentidade : Boolean;
         VB_RetQuadro, VB_RetPaises, VB_RetPostoGraduacao: Boolean;

      Public
         Function TratarConsultaComAcento(Campo, Compara, Str: String): String;
         Function VerificaAcento(Str: String): String;
         Function GetSetTurma: String;

         Procedure UltimaSerie(PS_IdCurso, PS_IdTurma: String; ComboBox: TComboBox);
         Function VerificaTurma(VS_Msg: String): Boolean;

         Function SemanaAno ( Dataatual: String): integer;
         Function GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
         Function TestaParaPar(TestaInteiro : Integer) : boolean;
         Function ValidaCampo(PS_Campo, Msg: String): Boolean;

         Function MontaCurso(PS_Curso: String): Boolean;
         Function TratarData(VS_Data: String) : string;
         Function AjustarMinuscula(VS_Entrada : String) : string;
         Function AjustarMaiscula(VS_Entrada : String) : string;
         Function CentraStr(VS_Variavel: string; Len: integer): string;
         Function LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
         Function TratarNota(VR_Valor: Real) : String;
         Function DiasNoMes(AYear, AMonth: Integer): Integer;
         Function Extenso(VS_Valor: String; VC_Tipo: Char):String;
         Function Converte(VS_Valor: String; VI_Grandeza: integer; VF_Numero: Double;
                           VI_Numero: Integer; VC_Tipo: Char):String;

         Function ValidarData(VS_Data: String): Boolean;
         Function criptografar (Armazena: String): string;
         Function descriptografar (Armazena: String): string;
         Function Extrai_Numeros(VS_PS: String): string;
         Function Extrai_Caracter(VS_PS: String): string;
         Function ValidaHora(VS_Hora: String): string;
         Function Mes_Extenso(VS_Mes: STRING; VI_Tipo: Integer) : String;
         Function HoraAtual: String;
         Function AnoAtual: String;
         Function NFicha(VS_NFicha: String) : String;
//         Function NIdentidade(VS_Identidade: String ) : String;
         Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
         Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
         Function MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
         Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
         Function QtdRegistro(VS_Comando: String): Integer;
         Function ContRegistro(VS_Comando: String): Integer;
         Function ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
         Function Randomico(VI_Limite: integer): String;
         Function FormatSecsToHMS(Secs: LongInt): string;
         Function FormatarData(Data, FormatoAno:String): string;
         Function RetornaCidade(Data: String): String;
         Function DiadaSemana(Data : String) : string;
         Function GerarSenha(PI_Tamanho: Integer): String;

         Procedure SetSelTurma(PS_SelTurma: String);
         Procedure SetIdTurma(PS_IdTurma: String);

         procedure CadastrarAcessoFichaAvaliacao(P_IdCurso, P_IdTurma, P_Identidade, P_senha: String);
         Procedure AtualizaQuery(Query_Atualiza: TIBQuery);

         Procedure Botoes_Inciais(Status: Boolean; Retornar, Windows: TToolButton);
         Procedure Botoes_Principais(Status: Boolean; ToolButton_Localizar: TToolButton;
                           ToolButton_Relatorio: TToolButton; ToolButton_Retornar: TToolButton;
                           ToolButton_Windows: TToolButton;ToolButton_Sobre: TToolButton);

         Procedure CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );
         Procedure CabecalhoForm(Form: TForm; PS_Cabecalho: String);
         procedure Windows;
         Procedure ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
         Procedure ExecusaoQuery(VS_Comando: String);
         Procedure ExecutaTransacao;
         Procedure abortaTransacao;

         Function GetDesligamento: String;
         Function GetUnidade: String;
         Function GetSubUnidade: String;
         Function GetUsuario: String;
         Function GetPrivilegio: String;
         Function GetPostoGraduacao: String;
         Function GetIdPaises: String;
         Function GetIdUnidade: String;
         Function GetIdQuadro: String;
         Function GetPessoa: String;
         Function GetCargo: String;
         Function GetSenha: String;
         Function GetAuxilio: String;

         Function GetCodCurso: String;
         Procedure SetCodCurso(PS_CodCurso: String);

         Function GetIdCurso: String;
         Procedure SetIdCurso(PS_IdCurso: String);

         Function GetRetornaDesligamento: Boolean;
         Function GetRetornaPessoa: Boolean;
         Function GetRetornaIdPaises: Boolean;
         Function GetRetornaIdQuadro: Boolean;
         Function GetRetornaCargo: Boolean;
         Function GetRetornaUnidade: Boolean;
         Function GetCodUsuario: String;
         Function GetIdUsuario: String;
         Function GetFoto: String;
         Function GetEditor: Integer;
         Function GetCadCurso: String;
         Function GetAbertura: Boolean;
         Function GetRespAssinatura: Integer;

         Procedure SetGravaAndamentoTurma(PB_Grava: Boolean);
         Procedure SetRespAssinatura(PI_RespAssinatura: Integer);
         Procedure SetAbertura(PB_Abertura: Boolean);
         Procedure SetCadCurso(PI_CadCurso: String);
         Procedure SetEditor(PI_Editor: Integer);
         Procedure SetSenha(PS_Senha: String);
         Procedure SetCodUsuario (PS_CodUsuario: String);
         Procedure SetDesligamento(PS_Desligamento: String);
         Procedure SetUnidade(PS_Unidade: String);
         Procedure SetSubUnidade (PS_IdSubUnidade: String);
         Procedure SetUsuario (VS_SetUsuario: String);
         Procedure SetPrivilegio (VS_Set_Privelegio: String);
         Procedure SetPostoGraduacao (PS_PostoGraduacao: String);
         Procedure SetIdPaises (PS_IdPaises: String);
         Procedure SetIdUnidade (PS_IdUnidade: String);
         Procedure SetIdQuadro (PS_IdQuadro: String);
         Procedure SetIdUsuario (PS_IdUsuario: String);
         Procedure SetPessoa (PS_Identidade: String);
         Procedure SetCargo (PS_Cargo: String);

         Procedure SetRetornaDesligamento (PB_RetDesligamento: Boolean);
         Procedure SetRetornaPostoGraduacao (PB_RetPostoGraduacao: Boolean);
         Procedure SetRetornaIdPaises(PB_RetIdPaises: Boolean);
         Procedure SetRetornaUnidade (PB_RetUnidade: Boolean);
         Procedure SetRetornaIdQuadro (PB_RetIdQuadro: Boolean);
         Procedure SetRetornaPessoa (PB_RetIdentidade: Boolean);
         Procedure SetRetornaCargo (PB_RetCargo: Boolean);
         Procedure SetAuxilio(PS_Auxilio: String);

         Procedure GravaAcesso(PS_Modulo: String; PS_Atividade: String);
         Procedure OpenQuery(VS_Comando: String);
         procedure SetCapsLock(State: boolean);
         Procedure Controle(VS_IdCurso, VS_IdTurma, VS_IdControle, VS_Descricao: String);
         Function RetornaControle(VS_IdCurso, VS_IdTurma, VS_IdControle: String): String;
         procedure Trata_MontaCombo(VS_Comando: String; ComboBox: TComboBox);
   end;

var
   Funcoes: Funcao;
   VS_NumItem, VS_Preview, VS_Auxilio, VS_Foto, VS_Senha, VS_Acesso, VS_CodUsuario, VS_ManualAjuda, VS_CadCurso: String;
  VS_GabaritoProva, VS_GravaAPC, VS_IdCurso, VS_IdTurma, VS_IdUsuario, VS_ChamaCadInstrutor: String;
   VI_RespAssinatura, VI_Editor: integer;
   VB_Grava, VB_Abertura: Boolean;

   VS_nu : array[1..9] of String;
   VS_nd : array[1..9] of String;
   VS_ndb : array[1..10] of String;
   VS_nc : array[1..9] of String;

implementation


//------------------------------------------------------------------------------
//
// Tratamento de setagens
//
//------------------------------------------------------------------------------

Function Funcao.GetSetTurma: String;
begin
   GetSetTurma:= VS_SelTurma;
end;

//------------------------------------------------------------------------------
// Seta se sera apresentado Preview inicialmente pelo Editor
//------------------------------------------------------------------------------

Procedure Funcao.SetSelTurma(PS_SelTurma: String);
begin
   VS_SelTurma:= PS_SelTurma;
end;

//------------------------------------------------------------------------------
// Recebe o Codigo do Curso
//------------------------------------------------------------------------------

Procedure Funcao.SetCodCurso(PS_CodCurso: String);
begin
  VS_CodCurso:= PS_CodCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Codigo do Curso
//------------------------------------------------------------------------------

Function Funcao.GetCodCurso: String;
begin
  GetCodCurso:= VS_CodCurso;
end;

//------------------------------------------------------------------------------
// Recebe o Id do Curso
//------------------------------------------------------------------------------

Procedure Funcao.SetIdCurso(PS_IdCurso: String);
begin
  VS_IdCurso:= PS_IdCurso;
end;

//------------------------------------------------------------------------------
// Retorna o Id do Curso
//------------------------------------------------------------------------------

Function Funcao.GetIdCurso: String;
begin
  GetIdCurso:= VS_IdCurso;
end;

//------------------------------------------------------------------------------
// Recebe qual Auxilio sera apresentado
//------------------------------------------------------------------------------

Procedure Funcao.SetIdUsuario(PS_IdUsuario: String);
begin
  VS_IdUsuario:= PS_IdUsuario;
end;

//------------------------------------------------------------------------------
// Retorna o Id do Usuario
//------------------------------------------------------------------------------

Function Funcao.GetIdUsuario: String;
begin
  GetIdUsuario:= VS_IdUsuario;
end;

//------------------------------------------------------------------------------
// Recebe qual Auxilio sera apresentado
//------------------------------------------------------------------------------

Procedure Funcao.SetAuxilio(PS_Auxilio: String);
begin
  VS_Auxilio:= PS_Auxilio;
end;

//------------------------------------------------------------------------------
// Retorna Qual Auxilio foi selecionado
//------------------------------------------------------------------------------

Function Funcao.GetAuxilio: String;
begin
  GetAuxilio:= VS_Auxilio;
end;

//------------------------------------------------------------------------------
// Recebe o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetGravaAndamentoTurma(PB_Grava: Boolean);
begin
  VB_Grava:= PB_Grava;
end;

//------------------------------------------------------------------------------
// Retorna o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Function Funcao.GetRespAssinatura: Integer;
begin
  GetRespAssinatura:= VI_RespAssinatura;
end;

//------------------------------------------------------------------------------
// Recebe o tipo do Relatorio de Desempenho
//------------------------------------------------------------------------------

Procedure Funcao.SetRespAssinatura(PI_RespAssinatura: Integer);
begin
  VI_RespAssinatura:= PI_RespAssinatura;
end;

//------------------------------------------------------------------------------
// Retorna da abertura da tela inicial
//------------------------------------------------------------------------------

Function Funcao.GetAbertura: Boolean;
begin
   GetAbertura:= VB_Abertura;
end;

//------------------------------------------------------------------------------
// Seta abertura da tela inicial
//------------------------------------------------------------------------------

Procedure Funcao.SetAbertura(PB_Abertura: Boolean);
begin
   VB_Abertura:= PB_Abertura;
End;

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetCadCurso: String;
begin
   GetCadCurso:= VS_CadCurso;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetCadCurso(PI_CadCurso: String);
begin
   VS_CadCurso:= PI_CadCurso;
End;

//------------------------------------------------------------------------------
// Retorna o Editor Selecionado
//------------------------------------------------------------------------------

Function Funcao.GetEditor: Integer;
begin
   GetEditor:= VI_Editor;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetEditor(PI_Editor: Integer);
begin
   VI_Editor:= PI_Editor;
End;

//------------------------------------------------------------------------------
// Retorna a Foto selecionada
//------------------------------------------------------------------------------

Function Funcao.GetFoto: String;
begin
   GetFoto:= VS_Foto;
end;

//------------------------------------------------------------------------------
// Recebe a senha
//------------------------------------------------------------------------------

Procedure Funcao.SetSenha(PS_Senha: String);
begin
   VS_Senha:= PS_Senha;
End;

//------------------------------------------------------------------------------
// Retorna a senha
//------------------------------------------------------------------------------

Function Funcao.GetSenha: String;
begin
   GetSenha:= VS_Senha;
End;


//------------------------------------------------------------------------------
// Retorna o Codigo do Usuario
//------------------------------------------------------------------------------

Function Funcao.GetCodUsuario: String;
begin
   GetCodUsuario:= VS_CodUsuario;
end;

//------------------------------------------------------------------------------
// Recebe o Codigo do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetCodUsuario (PS_CodUsuario: String);
begin
   VS_CodUsuario:= PS_CodUsuario;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de desligamento
//------------------------------------------------------------------------------

Procedure Funcao.SetDesligamento (PS_Desligamento: String);
begin
   VS_Desligamento:= PS_Desligamento;
End;

//------------------------------------------------------------------------------
// Recebe o identificador da Unidade
//------------------------------------------------------------------------------

Procedure Funcao.SetIdUnidade (PS_IdUnidade: String);
begin
   VS_IdUnidade:= PS_IdUnidade;
End;

//------------------------------------------------------------------------------
// Recebe o identificador da Sub-Unidade
//------------------------------------------------------------------------------

Procedure Funcao.SetSubUnidade (PS_IdSubUnidade: String);
begin
   VS_IdSubUnidade:= PS_IdSubUnidade;
End;

//------------------------------------------------------------------------------
// Recebe a o cargo
//------------------------------------------------------------------------------

Procedure Funcao.SetUnidade (PS_Unidade: String);
begin
   VS_Unidade:= PS_Unidade;
End;

//------------------------------------------------------------------------------
// Recebe a o cargo
//------------------------------------------------------------------------------

Procedure Funcao.SetCargo (PS_Cargo: String);
begin
   VS_Cargo:= PS_Cargo;
End;

//------------------------------------------------------------------------------
// Recebe a identidade da pessoa
//------------------------------------------------------------------------------

Procedure Funcao.SetPessoa (PS_Identidade: String);
begin
   VS_Identidade:= PS_Identidade;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de Paises
//------------------------------------------------------------------------------

Procedure Funcao.SetIdPaises (PS_IdPaises: String);
begin
   VS_IdPaises:= PS_IdPaises;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de Quadro
//------------------------------------------------------------------------------

Procedure Funcao.SetIdQuadro (PS_IdQuadro: String);
begin
   VS_IdQuadro:= PS_IdQuadro;
End;

//------------------------------------------------------------------------------
// Recebe o identificador de PostoGraduacao
//------------------------------------------------------------------------------

Procedure Funcao.SetPostoGraduacao (PS_PostoGraduacao: String);
begin
   VS_PostoGraduacao:= PS_PostoGraduacao;
End;

//------------------------------------------------------------------------------
// Recebe o nome do Usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetUsuario(VS_SetUsuario: String);
begin
   VS_Usuario:= VS_SetUsuario;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetPrivilegio (VS_Set_Privelegio: String);
begin
   VS_Privilegio:= VS_Set_Privelegio
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o Identificador de desligamento
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaDesligamento (PB_RetDesligamento: Boolean);
begin
   VB_RetDesligamento:= PB_RetDesligamento;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o Identificador da unidade
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaUnidade (PB_RetUnidade: Boolean);
begin
   VB_RetUnidade:= PB_RetUnidade;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o cargo
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaCargo (PB_RetCargo: Boolean);
begin
   VB_RetCargo:= PB_RetCargo;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com a identidade da pessoa
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaPessoa (PB_RetIdentidade: Boolean);
begin
   VB_RetIdentidade:= PB_RetIdentidade;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o Identificador de Quadro
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaIdQuadro (PB_RetIdQuadro: Boolean);
begin
   VB_RetQuadro:= PB_RetIdQuadro;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o Identificador de Paises
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaIdPaises (PB_RetIdPaises: Boolean);
begin
   VB_RetPaises:= PB_RetIdPaises;
End;

//------------------------------------------------------------------------------
// Recebe se retorna com o Identificador de PostoGraduacao
//------------------------------------------------------------------------------

Procedure Funcao.SetRetornaPostoGraduacao (PB_RetPostoGraduacao: Boolean);
begin
   VB_RetPostoGraduacao:= PB_RetPostoGraduacao;
End;

//-----------------------------------------------------------------------------
//
// Tratamento de retornos
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Retorna Desligamento
//------------------------------------------------------------------------------

Function Funcao.GetDesligamento: String;
begin
   GetDesligamento:= VS_Desligamento;
end;

//------------------------------------------------------------------------------
// Retorna Cargo
//------------------------------------------------------------------------------

Function Funcao.GetCargo: String;
begin
   GetCargo:= VS_Cargo;
end;

//------------------------------------------------------------------------------
// Retorna IdUnidade
//------------------------------------------------------------------------------

Function Funcao.GetIdUnidade: String;
begin
   GetIdUnidade:= VS_IdUnidade;
end;

//------------------------------------------------------------------------------
// Retorna IdSubUnidade
//------------------------------------------------------------------------------

Function Funcao.GetSubUnidade: String;
begin
   GetSubUnidade:= VS_IdSubUnidade;
end;

//------------------------------------------------------------------------------
// Retorna Identificador de Quadro
//------------------------------------------------------------------------------

Function Funcao.GetIdQuadro: String;
begin
   GetIdQuadro:= VS_IdQuadro;
end;

//------------------------------------------------------------------------------
// Retorna Identidade da pessoa
//------------------------------------------------------------------------------

Function Funcao.GetPessoa: String;
begin
   GetPessoa:= VS_Identidade;
end;

//------------------------------------------------------------------------------
// Retorna Identificador de PostoGraduacao
//------------------------------------------------------------------------------

Function Funcao.GetPostoGraduacao: String;
begin
   GetPostoGraduacao:= VS_PostoGraduacao;
end;

//------------------------------------------------------------------------------
// Retorna Identificador de Paises
//------------------------------------------------------------------------------

Function Funcao.GetIdPaises: String;
begin
   GetIdPaises:= VS_IdPaises;
end;

//------------------------------------------------------------------------------
// Retorna Usuario
//------------------------------------------------------------------------------

Function Funcao.GetUsuario: String;
begin
   GetUsuario:= VS_Usuario;
end;

//------------------------------------------------------------------------------
// Retorna Privilegio
//------------------------------------------------------------------------------

Function Funcao.GetPrivilegio: String;
begin
   GetPrivilegio:= VS_Privilegio;
end;

//------------------------------------------------------------------------------
// Retorna a unidade
//------------------------------------------------------------------------------

Function Funcao.GetUnidade: String;
begin
   GetUnidade:= VS_Unidade;
end;

//------------------------------------------------------------------------------
// Retorna se o Identificador de desligamento devera ser retornado
//------------------------------------------------------------------------------

Function Funcao.GetRetornaDesligamento: Boolean;
begin
   GetRetornaDesligamento:= VB_RetDesligamento;
end;

//------------------------------------------------------------------------------
// Retorna se o Identificador de Paises devera ser retornado
//------------------------------------------------------------------------------

Function Funcao.GetRetornaIdPaises: Boolean;
begin
   GetRetornaIdPaises:= VB_RetPaises;
end;

//------------------------------------------------------------------------------
// Retorna se a unidade devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaUnidade: Boolean;
begin
   GetRetornaUnidade:= VB_RetUnidade;
end;

//------------------------------------------------------------------------------
// Retorna se o cargo devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaCargo: Boolean;
begin
   GetRetornaCargo:= VB_RetCargo
end;

//------------------------------------------------------------------------------
// Retorna se o Identificador de quadro devera ser retornado
//------------------------------------------------------------------------------

Function Funcao.GetRetornaIdQuadro: Boolean;
begin
   GetRetornaIdQuadro:= VB_RetQuadro;
end;

//------------------------------------------------------------------------------
// Retorna se o Identidade devera ser retornada
//------------------------------------------------------------------------------

Function Funcao.GetRetornaPessoa: Boolean;
begin
   GetRetornaPessoa:= VB_Retidentidade;
end;


//------------------------------------------------------------------------------
//
// Funcoes basicas
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Faz a criptografar de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.criptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Succ(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   criptografar:= Resultado;
End;

//------------------------------------------------------------------------------
// Descricao: Descriptografa uma variavel fornecida
//
// Data     :
//
// Atualizado em: 15/08/2005
//------------------------------------------------------------------------------

Function Funcao.descriptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      if ((copy(Armazena, Cont, 1) = 'V') or (copy(Armazena, Cont, 1) = 'W')  or
          (copy(Armazena, Cont, 1) = 'X') or (copy(Armazena, Cont, 1) = 'Y')  or
          (copy(Armazena, Cont, 1) = 'Z')) then
      begin
         Resultado:= Resultado + copy(Armazena, Cont, 1);
      end
      else
      begin
         for CodIndex := 1 to 2 do
         begin
            Temp:= Pred(Armazena[cont]);
            Armazena[cont]:= Temp;
         end;
         Resultado:= Resultado + Temp;
      end;
   end;
   descriptografar:= Resultado;
End;

//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apanas os Numeros
//------------------------------------------------------------------------------

Function Funcao.Extrai_Numeros(VS_PS: String): string;
var
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= NULL;
   VI_Tam:= 1;

   While VI_Tam <= Length(VS_PS) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) = '0') or (Copy(VS_PS,VI_Tam,1) = '1') or
          (Copy(VS_PS,VI_Tam,1) = '2') or (Copy(VS_PS,VI_Tam,1) = '3') or
          (Copy(VS_PS,VI_Tam,1) = '4') or (Copy(VS_PS,VI_Tam,1) = '5') or
          (Copy(VS_PS,VI_Tam,1) = '6') or (Copy(VS_PS,VI_Tam,1) = '7') or
          (Copy(VS_PS,VI_Tam,1) = '8') or (Copy(VS_PS,VI_Tam,1) = '9')) Then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Numeros:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apenas os caracteres
//------------------------------------------------------------------------------

Function Funcao.Extrai_Caracter(VS_PS: String): string;
var
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= '';
   VI_Tam:= 1;

   While (VI_Tam <= Length(VS_PS)) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) <> '0') and (Copy(VS_PS,VI_Tam,1) <> '1') and
          (Copy(VS_PS,VI_Tam,1) <> '2') and (Copy(VS_PS,VI_Tam,1) <> '3') and
          (Copy(VS_PS,VI_Tam,1) <> '4') and (Copy(VS_PS,VI_Tam,1) <> '5') and
          (Copy(VS_PS,VI_Tam,1) <> '6') and (Copy(VS_PS,VI_Tam,1) <> '7') and
          (Copy(VS_PS,VI_Tam,1) <> '8') and (Copy(VS_PS,VI_Tam,1) <> '9')) then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Caracter:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função tem a finalidade de Validar a Hora fornecida
//------------------------------------------------------------------------------

Function Funcao.ValidaHora(VS_Hora: String): String;
var
   VS_Retorno: string;
begin
   if Trim(VS_Hora) = '' then
   begin
      MessageDlg('A hora não pode ser branco...',mtError, [mbOk],0);
      VS_Retorno:= 'IIII';
   end
   else
   begin
      if ((Length(VS_Hora) = 1) or (Length(VS_Hora) = 2)) then
         VS_Hora:= VS_Hora+'00'
      else
         if Length(VS_Hora) = 3 then
            VS_Hora:= '0'+VS_Hora;

      VS_Retorno:= VS_Hora;

      if ((StrToInt(Copy(VS_Hora,1,2)) < 1) or (StrToInt(Copy(VS_Hora,1,2)) > 24)) then
      begin
         MessageDlg('A hora deve estar entre 1 e 24...',mtError, [mbOk],0);
         VS_Retorno:= 'IIII';
      end
      else
      begin
         if ((StrToInt(Copy(VS_Hora,3,2)) < 0) or (StrToInt(Copy(VS_Hora,3,2)) > 59)) then
         begin
            MessageDlg('O minuto deve estar entre 0 e 59...',mtError, [mbOk],0);
            VS_Retorno:= 'IIII';
         end;
      end;
   end;
   ValidaHora:= VS_Retorno;
end;

//-----------------------------------------------------------------------
// Modulo que transforma o Mes de Numero para Extenso.
//-----------------------------------------------------------------------

Function Funcao.Mes_Extenso(VS_Mes: String; VI_Tipo: Integer) : String;
var
   VS_Mes_Extenso: String;
Begin
   VS_Mes_Extenso:= '';
   if (VI_Tipo = 1 ) then
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Janeiro';
        2: VS_Mes_Extenso:= 'Fevereiro';
        3: VS_Mes_Extenso:= 'Março';
        4: VS_Mes_Extenso:= 'Abril';
        5: VS_Mes_Extenso:= 'Maio';
        6: VS_Mes_Extenso:= 'Junho';
        7: VS_Mes_Extenso:= 'Julho';
        8: VS_Mes_Extenso:= 'Agosto';
        9: VS_Mes_Extenso:= 'Setembro';
        10: VS_Mes_Extenso:= 'Outubro';
        11: VS_Mes_Extenso:= 'Novembro';
        12: VS_Mes_Extenso:= 'Dezembro';
     end
   else
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Jan';
        2: VS_Mes_Extenso:= 'Fev';
        3: VS_Mes_Extenso:= 'Mar';
        4: VS_Mes_Extenso:= 'Abr';
        5: VS_Mes_Extenso:= 'Mai';
        6: VS_Mes_Extenso:= 'Jun';
        7: VS_Mes_Extenso:= 'Jul';
        8: VS_Mes_Extenso:= 'Ago';
        9: VS_Mes_Extenso:= 'Set';
        10: VS_Mes_Extenso:= 'Out';
        11: VS_Mes_Extenso:= 'Nov';
        12: VS_Mes_Extenso:= 'Dez';
     end;
   Mes_Extenso:= VS_Mes_Extenso;
End;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure Funcao.Windows;
var
   VI_Retorno: integer;
begin
   VI_Retorno:= Application.MessageBox('Deseja sair do sistema ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
      Application.Terminate;
end;

//------------------------------------------------------------------------------
// Esta função tem a fornecer a hora atual tratada
//------------------------------------------------------------------------------

Function Funcao.HoraAtual: String;
var
   VS_Time, VS_Retorno: string;

   VI_Cont,VI_Tam: integer;
begin
   VS_Time:= TimeToStr(Time);

   VI_Cont:= 0;
   for VI_Tam:= 1 to length(VS_Time) do
   begin
      if copy(VS_Time,VI_Tam,1) = ':' then
          VI_Cont:= VI_Cont + 1
      else
         if VI_Cont < 2 then
            VS_Retorno:= VS_Retorno+copy(VS_Time,VI_Tam,1);
   end;
   if length(VS_Retorno) = 3 then
      VS_Retorno:= '0'+VS_Retorno;

   HoraAtual:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o ano atual
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.AnoAtual: String;
var
   Ano, Mes, Dia : word;
begin
  DecodeDate (Date, Ano, Mes, Dia);
  Result:= IntToStr(Ano);
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o numero da ficha eh valida e faz tratamento colocando
//            zeros.
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Alterado mensagen.
//------------------------------------------------------------------------------

Function Funcao.NFicha(VS_NFicha: String ) : String;
var
   VS_Ret: String;
   i: integer;
begin
  if length(VS_NFicha) = 6 then
  begin
     VS_Ret:= VS_NFicha;
  end
  else
  begin
     VS_Ret:= '';

     if trim(VS_NFicha) <> '' then
     begin
        for i := 1 to length(VS_NFicha) do
        begin
           if Copy(VS_NFicha,i,1) <> ' ' then
              VS_Ret:= VS_Ret+Copy(VS_NFicha,i,1);
        end;
        VS_Ret:= FormatFloat('000000',StrToInt(VS_Ret));
     end
     else
     begin
        MessageDlg('O número da ficha não pode ser branco...',mtError, [mbOk],0);
     end;
  end;
  NFicha:= VS_Ret;
end;

//------------------------------------------------------------------------------
// Descricao: Verifica se o usuario consta na lista de usuarios
// Data     :
//
// Atualizado em: 12/04/2005
// Descricao    : Auterado as mensagens.
//------------------------------------------------------------------------------

Function Funcao.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   VS_Comando: String;
   Status: Boolean;
begin
   Status:= False;
   if Trim(VS_Usuario) = '' then
      MessageDlg('Para logar o sistema o nome do usuário não pode ser branco...',mtError, [mbOk],0)
   else
   begin
      if Trim(VS_Senha) = '' then
         MessageDlg('Para logar o sistema a senha do usuário não pode ser branco...',mtError, [mbOk],0)
      else
      begin
//         if QtdRegistro('Select Count(1) Qtd from Usuario where Nome = '+#39+VS_Usuario+#39+' and senha = '+#39+Criptografar(VS_Senha)+#39) = 0 then
         if QtdRegistro('Select Count(1) Qtd from Usuario where Nome = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39) = 0 then
             MessageDlg('Verifique se o nome ou a senha esta errada '+#13+#13+'O usuário fornecido não encontra-se na lista...',mtError, [mbOk],0)
         else
         begin
            Status:= True;
            VS_Comando:= 'Select * from Usuario where Nome = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39;

            DM.Query_Usuario.Close;
            DM.Query_Usuario.Sql.Clear;
            DM.Query_Usuario.Sql.Add(VS_Comando);
            DM.Query_Usuario.Open;
            Funcoes.SetUsuario(Trim(DM.Query_Usuario.FieldByName('NOME').AsString));
            Funcoes.SetIdUsuario(Trim(DM.Query_Usuario.FieldByName('IdUsuario').AsString));

         end;
      end;
   end;

   Busca_Usuario:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = VS_De then
          VS_Retorno:= VS_Retorno+VS_Para
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   DePara:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de retornar o valor antes da variavel
//            fornecida na variavel VS_DE
// Data     : 26/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ExtraiAntesDe(VS_Valor: String; VS_De: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   VI_Cont:= 1;
   While VI_Cont <= Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) <> VS_De then
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1)
      else
          VI_Cont:= VI_Cont+Length(VS_Valor);
      VI_Cont:= VI_Cont + 1;
   end;
   ExtraiAntesDe:= trim(VS_Retorno);
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de gerar numeros aleatorio
// Data     :
//
// Atualizado em: 19/09/2005
// Descricao    : Criacao da rotina
//------------------------------------------------------------------------------

Function Funcao.Randomico(VI_Limite: integer): String;
var
   Resultado: integer;
begin
   Resultado:= 0;

   While Resultado = 0 do
      Resultado:= Random(999);

   Randomico:= formatfloat('000',Resultado);
end;

//------------------------------------------------------------------------------
// Procedure tratar dos botoes Iniciais
//------------------------------------------------------------------------------

Procedure Funcao.Botoes_Inciais(Status: Boolean; Retornar, Windows: TToolButton);
begin
   Retornar.Enabled:= Status;
   Windows.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: tratar dos botoes principais
// Data     :
//
// Atualizado em: 20/09/2005
//------------------------------------------------------------------------------

Procedure Funcao.Botoes_Principais(Status: Boolean; ToolButton_Localizar: TToolButton;
                   ToolButton_Relatorio: TToolButton; ToolButton_Retornar: TToolButton;
                   ToolButton_Windows: TToolButton;ToolButton_Sobre: TToolButton);
begin
   ToolButton_Localizar.Enabled:= Status;
   ToolButton_Relatorio.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;
   ToolButton_Sobre.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao que recebe segundo e devolve Hora em (hh:mm;ss)
// Data     : 05/04/2006
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.FormatSecsToHMS(Secs: LongInt): string;
var
   Hrs, Min: Word;
begin
   Hrs := Secs div 3600;
   Secs := Secs mod 3600;
   Min := Secs div 60;
   Secs := Secs mod 60;
   Result := FormatFloat('00', Hrs)+':'+FormatFloat('00', Min)+':'+FormatFloat('00', Secs);
end;


//------------------------------------------------------------------------------
// Descricao: Grava o acesso realizado ao sistema
//
// Atualizado em: 17/04/2006
//------------------------------------------------------------------------------

Procedure Funcao.GravaAcesso(PS_Modulo: String; PS_Atividade: String);
begin
{   DM.Table_Acesso.Open;
   if DM.Query_PerfilAcesso.FieldByName('GravaAcesso').AsString = 'S' then
   begin
      DM.Table_Acesso.Append;
      DM.Table_Acesso.FieldByName('IdCodigo').AsString:= GetCodUsuario;
      DM.Table_Acesso.FieldByName('IdModulo').AsString:= PS_Modulo;
      DM.Table_Acesso.FieldByName('Data').AsString:= DateToStr(Date);
      DM.Table_Acesso.FieldByName('HORA').AsString:= HoraAtual;
      DM.Table_Acesso.FieldByName('Atividade').AsString:= PS_Atividade;
      DM.Table_Acesso.Post;
      Funcoes.ExecutaTransacao;
   end;

}
end;

//------------------------------------------------------------------------------
// Descricao: Formatando a data do sistema acrescentando Zeros no dia  no mes e
//            colocando o ano com 4 digitos
//
// Atualizado em: 11/09/06
//------------------------------------------------------------------------------

Function Funcao.FormatarData(Data, FormatoAno:String): string;
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
   DecodeDate (StrToDate(Data), Ano, Mes, Dia);
   Retorno:= FormatFloat('00', Dia)+'/'+FormatFloat('00', Mes)+'/'+FormatDateTime(FormatoAno, StrToDate(Data));
   FormatarData:= Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Valida a data analisando se elea esta OK
// Data     : 30/04/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ValidarData(VS_Data: String): Boolean;
var
   VB_Retorno: Boolean;
   VI_Cont: Integer;
begin
   VB_Retorno:= True;
   For VI_Cont:= 1 to Length(VS_Data) do
   begin
      if ((Copy(VS_Data,VI_Cont,1) = '0') or (Copy(VS_Data,VI_Cont,1) = '1') or
          (Copy(VS_Data,VI_Cont,1) = '2') or (Copy(VS_Data,VI_Cont,1) = '3') or
          (Copy(VS_Data,VI_Cont,1) = '4') or (Copy(VS_Data,VI_Cont,1) = '5') or
          (Copy(VS_Data,VI_Cont,1) = '6') or (Copy(VS_Data,VI_Cont,1) = '7') or
          (Copy(VS_Data,VI_Cont,1) = '8') or (Copy(VS_Data,VI_Cont,1) = '9') or
          (Copy(VS_Data,VI_Cont,1) = '.') or (Copy(VS_Data,VI_Cont,1) = '/')) Then
          // Nao faz nada
      else
          VB_Retorno:= False;
   end;

   if VB_Retorno = True then
   begin
     try
        StrToDate(VS_Data);
     except
     on EConvertError do
     begin
         ShowMessage ('        Data Inválida!       ');
         VB_Retorno:= False;
     end;
     end;
   end;

   ValidarData:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna a Cidade e a Data atual
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.RetornaCidade(Data: String): String;
var
   Ano, Mes, Dia : word;
   Retorno: String;
begin
{   DecodeDate (StrToDate(Data), Ano, Mes, Dia);
   Result:= IntToStr(Ano);

   Retorno:= Trim(dm.IBTable_Configuracao.FieldByName('Cidade').AsString)+', '+IntToStr(Dia)+' de '+Mes_Extenso(IntToStr(Mes),1)+' de '+IntToStr(Ano)+'.';
   RetornaCidade:= Retorno;
   }
end;

//------------------------------------------------------------------------------
// Descricao: Esta Funcao Recebe o Numero e Faz o tratamento inicial
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Extenso(VS_Valor: String; VC_Tipo: Char): String;
var
   VS_Aux, VS_Numero1, VS_Posicao1, VS_Posicao2, VS_Posicao3, VS_Posicao4: String;
   VS_Extenso: string;

   Code, VI_AUX :  INTEGER;
   VI_Virgula, VI_Cont :  INTEGER;

   VF_Numero: Double;
begin
   VS_nu[1]:='UM ';
   VS_nu[2]:='DOIS ';
   VS_nu[3]:='TRÊS ';
   VS_nu[4]:='QUATRO ';
   VS_nu[5]:='CINCO ';
   VS_nu[6]:='SEIS ';
   VS_nu[7]:='SETE ';
   VS_nu[8]:='OITO ';
   VS_nu[9]:='NOVE ';

   VS_nd[1]:='DEZ ';
   VS_nd[2]:='VINTE ';
   VS_nd[3]:='TRINTA ';
   VS_nd[4]:='QUARENTA ';
   VS_nd[5]:='CINQUENTA ';
   VS_nd[6]:='SESSENTA ';
   VS_nd[7]:='SETENTA ';
   VS_nd[8]:='OITENTA ';
   VS_nd[9]:='NOVENTA ';

   VS_ndb[1]:='DEZ ';
   VS_ndb[2]:='ONZE ';
   VS_ndb[3]:='DOZE ';
   VS_ndb[4]:='TREZE ';
   VS_ndb[5]:='QUATORZE ';
   VS_ndb[6]:='QUINZE ';
   VS_ndb[7]:='DEZESSEIS ';
   VS_ndb[8]:='DEZESSETE ';
   VS_ndb[9]:='DEZOITO ';
   VS_ndb[10]:='DEZENOVE ';

   VS_nc[1]:='CENTO ';
   VS_nc[2]:='DUZENTOS ';
   VS_nc[3]:='TREZENTOS ';
   VS_nc[4]:='QUATROCENTOS ';
   VS_nc[5]:='QUINHENTOS ';
   VS_nc[6]:='SEISCENTOS ';
   VS_nc[7]:='SETECENTOS ';
   VS_nc[8]:='OITOCENTOS ';
   VS_nc[9]:='NOVECENTOS ';

   VS_Extenso:= '';

   VS_Valor:= Trim(VS_Valor);
   VF_Numero:= StrToFloat(VS_Valor);
   VS_Numero1 := FormatFloat ('0000000000.000',VF_NUMERO);
   VS_Posicao1:=Copy(VS_Numero1,2,3);
   VS_Posicao2:=Copy(VS_Numero1,5,3);
   VS_Posicao3:=Copy(VS_Numero1,8,3);

   VS_Aux:=FloatToStr(VF_Numero);
   Val(VS_AUX,VI_Aux,Code);
//   VS_Posicao4:=FormatFloat('000',(VF_Numero-VF_Aux)*100);

   VS_Posicao4:= '';
   VI_Virgula:= 0;
   For VI_Cont := 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = ',' then
         VI_Virgula:= 1
      else
         if VI_Virgula = 1 then
            VS_Posicao4:= VS_Posicao4+Copy(VS_Valor,VI_Cont,1);
   end;

   //-------------------- Tratamento para casa do Milhão ---------------------//

   VS_Extenso:= VS_Extenso+Converte(VS_Posicao1,1, VF_NUMERO, VI_Aux, VC_Tipo);

   //---------------------- Tratamento para casa do Mil ----------------------//

   If (StrToInt(VS_Posicao2) <> 0) then
   begin
      VS_Extenso:= VS_Extenso+Converte(VS_Posicao2,2, VF_NUMERO, VI_Aux, VC_Tipo);

      VS_Extenso:= VS_Extenso+' MIL ';

      If ((Copy(VS_Posicao3,2,2) = '00') and (VI_aux <> 100) and (VI_AUX <> 1000) and (VI_AUX <> 10000)) Then
          VS_Extenso:= VS_Extenso+' E ';
   end;

   //--------------------- Tratamento da Casa da Centena ---------------------//

   VS_Extenso:= VS_Extenso+Converte(VS_Posicao3,3, VF_NUMERO, VI_Aux, VC_Tipo);

   If UpCase(VC_Tipo) = 'D' then
      If ((VS_Posicao3 = '000') and ((StrToInt(VS_Posicao1)+StrToInt(VS_Posicao2)) <> 0)
       or (StrToInt(VS_Posicao2) = 1)) Then
         If ((VI_aux = 1000) or (VI_aux = 10000) or (VI_aux = 100000)) Then
             VS_Extenso:= VS_Extenso+' REAIS';

   //---------------------- Tratamento da Casa da Dezena ---------------------//

   if  VS_Posicao4 <> '' then
      VS_Extenso:= VS_Extenso+Converte(VS_Posicao4,4, VF_NUMERO, VI_Aux, VC_Tipo);

   //-------------- Tratamento do Valor quando o valor for = 0 ---------------//

   if VS_Extenso = '' then
      VS_Extenso:= 'ZERO ';

   Result:= VS_Extenso;
end;

//------------------------------------------------------------------------------
// Descricao:  Funcao de transformar numeros em extenso
//
// Data     : 15/12/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.Converte(VS_Valor: String; VI_Grandeza: integer;
                                 VF_Numero: Double; VI_Numero: integer; VC_Tipo: Char): String;
var
   VS_Retorno, vs_x1, vs_x2, vs_x3, vs_x4: String;
   VI_N1, VI_N2,VI_N3,VI_N4: Integer;
   VB_Centena: Boolean;
begin
   VS_Retorno:= '';

   If VS_Valor <> '000' then
   begin
      If UpCase(VC_Tipo) = 'D' then
      VS_Valor:= IntToStr(StrToInt(VS_Valor));

      if Length(VS_Valor) = 3 then
      begin
         VS_X1 := Copy( VS_Valor,1,1);
         VS_X2 := Copy( VS_Valor,2,1);
         VS_X3 := Copy( VS_Valor,3,1);
         VS_X4 := Copy( VS_Valor,2,2);
      end
      else
      begin
         if Length(VS_Valor) = 2 then
         begin
            VS_X1 := '';
            VS_X2 := Copy( VS_Valor,1,1);
            VS_X3 := Copy( VS_Valor,2,1);
            VS_X4 := Copy( VS_Valor,1,2);
         end
         else
         begin
            VS_X1 := '';
            VS_X2 := '';
            VS_X3 := Copy( VS_Valor,1,1);
            VS_X4 := Copy( VS_Valor,1,1);
         end;
      end;

      if VS_X1 = '' then
         VI_N1 := 0
      else
         VI_N1 := StrToInt(VS_X1);

      if VS_X2 = '' then
         VI_N2 := 0
      else
         VI_N2 := StrToInt(VS_X2);

      if VS_X3 = '' then
         VI_N3 := 0
      else
         VI_N3 := StrToInt(VS_X3);

      if VS_X4 = '' then
         VI_N4 := 0
      else
         VI_N4 := StrToInt(VS_X4);

      //--------------- Tratamento quando houver casa decimal ----------------//

      If ((VI_Grandeza = 4)  and (VI_Numero <> 0) ) then
         if UpCase(VC_Tipo) = 'D' then
            VS_Retorno := VS_Retorno + ' E '
         else
            VS_Retorno := VS_Retorno + ' VIRGULA ';

      //------------------------- Tratamento da Centena ----------------------//
      VB_Centena:= False;
      if (Length(VS_Valor) = 3) then
      begin
         If ((VI_Grandeza = 4)  and (VS_X1 = '0')) then                 //Tratamento dos Zeros quando existir
            VS_Retorno:= VS_Retorno + 'ZERO '
         else
         begin
            VB_Centena:= True;
            If VS_X1 <> '0' then                        //CENTENA
               If ((VS_X4 = '00') and (VS_X1='1'))  then
                  VS_Retorno:= VS_Retorno + 'CEM'
               Else
                  VS_Retorno:= VS_Retorno + VS_nc[VI_N1];
         end;
      end;

      //---------- Tratamento quendo o Valor estiver entre 10 e 19 ----------//

      If ((VI_Grandeza = 4)  and (VS_X2 = '0')) then                 //Tratamento dos Zeros quando existir
      begin
          if VB_Centena = False then
             VS_Retorno:= VS_Retorno + 'ZERO ';
      end
      else
         If ((VI_N4 >= 10) and (VI_N4 <= 19)) then     //DEZENA DE DEZENOVE
            If ((VI_Grandeza = 4)  and (VS_X1 <> ''))  then
            begin
               if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
                  VS_Retorno := VS_Retorno + VS_NDB[VI_N4-9]
               else
                  VS_Retorno := VS_Retorno + ' E ' + VS_NDB[VI_N4-9];
            end
            Else
               VS_Retorno := VS_Retorno + VS_NDB[VI_N4-9];

      //----------------- Tratamento de Valor apartir de 20 ------------------//

      If VI_N2 >= 2  then
         If VS_X1 <> '0'  then
        begin
            if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
               VS_Retorno:= VS_Retorno+VS_ND[VI_N2]
            else
               VS_Retorno:= VS_Retorno +' E '+VS_ND[VI_N2];
         end
         Else
            VS_Retorno:= VS_Retorno + VS_ND[VI_N2];

      If (VS_X3 <> '') then
      begin
         If (VI_N4 <= 10) or (VI_N4 > 19) then
         begin
            If ((VS_X1 <> '0') OR (VS_X2 <> '0')) then
            begin
               if Length(VS_Valor) > 2 then
               begin
                  If (VS_X3 <> '0') then
                     VS_Retorno := VS_Retorno + ' E ' + VS_NU[VI_N3];
               end
               else
               begin
                  if VI_N3 <> 0 then
                  begin
                     if ((VS_Retorno = ' VIRGULA ') or (VS_Retorno = ' VIRGULA ZERO ')) then
                         VS_Retorno:= VS_Retorno+VS_NU[VI_N3]
                     else
                         VS_Retorno:= VS_Retorno +' E '+VS_NU[VI_N3]
                  end
                  else
                    if Length(VS_Valor) < 2 then
                       VS_Retorno:= VS_Retorno + 'ZERO ';
               end;
            end
            Else
            begin
               VS_Retorno := VS_Retorno + VS_NU[VI_N3];
            end;
         end;
      end;

      //----------------------- Tratamento da Grandeza -----------------------//

      case VI_Grandeza of
         1: begin         // Milhao
              If StrToInt(VS_Valor) = 1 then
                 VS_Retorno:= VS_Retorno + 'MILHÃO '
              else
                 VS_Retorno:= VS_Retorno + 'MILHÕES ';
            end;

         2: begin         // Mil
              If StrToInt(VS_Valor) = 0 then
                 VS_Retorno:= VS_Retorno+ 'MIL ';
            end;

         3: begin         // Centena
              if UpCase(VC_Tipo) = 'D' then
                 If VI_Numero = 1 then
                    VS_Retorno:= VS_Retorno + 'REAL '
                 else
                    VS_Retorno:= VS_Retorno + 'REAIS ';
            end;

         4: begin           // Decina Moeda
              if UpCase(VC_Tipo) = 'D' then
                 If StrToInt(VS_Valor) = 1 then
                    VS_Retorno := VS_Retorno + 'CENTAVO'
                 else
                    VS_Retorno := VS_Retorno + 'CENTAVOS';
            end;
      end;   // case VI_Grandeza of
   end;
   Converte:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao:  Funcao Tratar da tecla Caps Lock
//
// Data     : 15/02/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.SetCapsLock(State: boolean);
begin
  if (State and ((GetKeyState(VK_CAPITAL) and 1) = 0)) or
     ((not State) and ((GetKeyState(VK_CAPITAL) and 1) = 1)) then
  begin
     keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
     keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para Retorna quantos dias tem um referido mes do ano
// Data     : 10/03/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DiasNoMes(AYear, AMonth: Integer): Integer;
const
   DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
Var
   VI_Retorno: Integer;
begin
   VI_Retorno:= DaysInMonth[AMonth];
   if AMonth = 2 then
   begin
      if Ayear mod 4 = 0 then
      begin
         VI_Retorno:= 29;
      end;
   end;
   Result := VI_Retorno
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para tratar do arredondamento da nota não permitindo arre-
//            dondamento
// Data     : 27/05/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarNota(VR_Valor: Real) : String;
var
   VS_Nota: String;
   VI_Tama: Integer;
begin
   VS_Nota := FloatToStr(VR_Valor);

   if ( VS_Nota = '10' ) then
      VS_Nota:=VS_Nota+',0000'
   else
   begin
      VI_Tama := length(VS_Nota);

      VS_Nota:= Copy(VS_Nota,1,6);
      if (VI_Tama = 1) then
         VS_Nota:= ' '+VS_Nota+',0000'
      else
         VS_Nota:= ' '+ReplStr(VS_Nota,'0',6);
   end;

   TratarNota:= VS_Nota;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string até atingir o tamanho especificado
// Data     : 01/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.ReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Retorno + VS_Repl;
     VI_Tam:= VI_Tam + 1;
  end;
  ReplStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string a esquerda até atingir o tamanho especificado
// Data     : 23/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Repl+VS_Retorno;
     VI_Tam:= VI_Tam + 1;
  end;
  LReplStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Centraliza uma string até atingir o tamanho especificado
// Data     : 02/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.CentraStr(VS_Variavel: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= Trim(VS_Variavel);
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len-1 do
  begin
     VS_Retorno := ' '+VS_Retorno+' ';
     VI_tam:= Length(VS_Retorno);
  end;
  CentraStr:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para retornar data tratada para Firebird
// Data     : 26/04/2010
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarData(VS_Data: String) : string;
var
  d,m,y : word;
begin
   DecodeDate(StrToDate(VS_Data),y,m,d);

   VS_Data:= FormatFloat('00', d)+'.'+FormatFloat('00', m)+'.'+FormatFloat('0000', y);
   TratarData:= VS_Data+' 00:00';
end;


//------------------------------------------------------------------------------
// Descricao: Funcao para retornar o dia da semana
// Data     : 06/08/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sábado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMaiscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'á' then
         VS_letra:= 'Á'
      else
         if VS_letra = 'à' then
            VS_letra:= 'À'
         else
           if VS_letra = 'ã' then
              VS_letra:= 'Ã'
           else
              if VS_letra = 'â' then
                  VS_letra:= 'Â'
              else
      if VS_letra = 'é' then
         VS_letra:= 'É'
      else
         if VS_letra = 'è' then
            VS_letra:= 'È'
         else
            if VS_letra = 'ê' then
               VS_letra:= 'Ê'
            else
      if VS_letra = 'í' then
         VS_letra:= 'Í'
      else
         if VS_letra = 'ì' then
            VS_letra:= 'Ì'
         else
           if VS_letra = 'î' then
              VS_letra:= 'Î'
           else
      if VS_letra = 'ó' then
         VS_letra:= 'Ó'
      else
         if VS_letra = 'ò' then
            VS_letra:= 'Ò'
         else
           if VS_letra = 'õ' then
              VS_letra:= 'Õ'
           else
              if VS_letra = 'ô' then
                  VS_letra:= 'Ô'
              else
      if VS_letra = 'ú' then
         VS_letra:= 'Ú'
      else
         if VS_letra = 'ù' then
            VS_letra:= 'Ù'
         else
           if VS_letra = 'û' then
              VS_letra:= 'Û'
           else
      if VS_letra = 'ç' then
         VS_letra:= 'Ç';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;


//------------------------------------------------------------------------------
// Descricao: Funcao para ajustar os caracteres acentuados para maiscula
// Data     : 16/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.AjustarMinuscula(VS_Entrada : String) : string;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;

begin
   VI_tam:= Length(VS_Entrada);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(VS_Entrada,i,1);
      if VS_letra = 'Á' then
         VS_letra:= 'á'
      else
         if VS_letra =  'À' then
            VS_letra:= 'à'
         else
           if VS_letra = 'Ã' then
              VS_letra:= 'ã'
           else
              if VS_letra = 'Â' then
                  VS_letra:= 'â'
              else
      if VS_letra = 'É' then
         VS_letra:= 'é'
      else
         if VS_letra = 'È' then
            VS_letra:= 'è'
         else
            if VS_letra = 'Ê' then
               VS_letra:= 'ê'
            else
      if VS_letra = 'Í' then
         VS_letra:= 'í'
      else
         if VS_letra = 'Ì' then
            VS_letra:= 'ì'
         else
           if VS_letra = 'Î' then
              VS_letra:= 'î'
           else
      if VS_letra = 'Ó' then
         VS_letra:= 'ó'
      else
         if VS_letra = 'Ò' then
            VS_letra:= 'ò'
         else
           if VS_letra = 'Õ' then
              VS_letra:= 'õ'
           else
              if VS_letra = 'Ô' then
                  VS_letra:= 'ô'
              else
      if VS_letra = 'Ú' then
         VS_letra:= 'ú'
      else
         if VS_letra = 'Ù' then
            VS_letra:= 'ù'
         else
           if VS_letra = 'Û' then
              VS_letra:= 'û'
           else
      if VS_letra = 'Ç' then
         VS_letra:= 'ç';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  Result := VS_Retorno;
end;

//------------------------------------------------------------------------------
//
// Tratamentos com Query
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Descricao: Substituir o comando RecordCount
// Data     :
//
// Atualizado em: 23/05/2005
// Descricao    : Criando
//------------------------------------------------------------------------------

Function Funcao.QtdRegistro(VS_Comando: String): Integer;
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   Result:= DM.Query_Executa.FieldByName('Qtd').AsInteger;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de informar quantos registros esta sendo retornado
// Data     :
//
// Atualizado em: 23/05/2005
// Descricao    : Criando
//------------------------------------------------------------------------------

Function Funcao.ContRegistro(VS_Comando: String): Integer;
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   ContRegistro:= DM.Query_Executa.FieldByName('Retorno').AsInteger;
end;

//------------------------------------------------------------------------------
// Descricao: Atualiza Query
// Data     : 11/12/08
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AtualizaQuery(Query_Atualiza: TIBQuery);
var
   bmLocal : TBookmark;
   VB_Atualiza: Boolean;
begin
   if Query_Atualiza.Recordcount > 0 then
   begin
      bmLocal:= Query_Atualiza.GetBookMark;
      VB_Atualiza:= True;
   end
   else
   begin
      VB_Atualiza:= False;
   end;

   Query_Atualiza.Close;
   Query_Atualiza.open;
   if VB_Atualiza = True then
   begin
      Query_Atualiza.GotoBookMark(bmLocal);
      Query_Atualiza.FreeBookMark(bmLocal);
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna o maior valor
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+VS_Campo+') Maior from '+VS_Tabela;
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   MaiorCodigo:= DM.Query_Executa.FieldByName('Maior').AsInteger+1;
end;

//------------------------------------------------------------------------------
// Descricao: Retorna o maior valor que atende a restricao
// Data     : 18/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigoComRestricao(VS_Campo: String; VS_Restricao: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+VS_Campo+') Maior from '+VS_Tabela+' where '+VS_Restricao;
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   MaiorCodigoComRestricao:= DM.Query_Executa.FieldByName('Maior').AsInteger+1;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaQuery(Query_Executa: TIBQuery; PS_Comando: String);
begin
   try
      Query_Executa.Close;
      Query_Executa.SQL.Clear;
      Query_Executa.SQL.Add(PS_Comando);
      Query_Executa.Open;
   except
    
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Esta funcao tem a finalidade de executar a query
// Data     : 31/08/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.UltimaSerie(PS_IdCurso, PS_IdTurma: String; ComboBox: TComboBox);
var
   i: Integer;
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add('Select max(faseaplicacao) as Serie From Teste Where IdCurso = '+PS_IdCurso+' and idTurma = '+PS_IdTurma);
   DM.Query_Executa.Open;

   ComboBox.Items.Clear;
   if DM.Query_Executa.FieldByName('Serie').AsString = '' then
   begin
      ComboBox.Text:= '1';
   end
   else
   begin
      For i:= 1 to DM.Query_Executa.FieldByName('Serie').AsInteger do
         ComboBox.Items.Add(IntToStr(i));
      ComboBox.Text:= DM.Query_Executa.FieldByName('Serie').AsString;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de Fazer ExecSql na Query
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecusaoQuery(VS_Comando: String);
begin
   DM.IBQuery_ExecSql.Close;
   DM.IBQuery_ExecSql.Sql.Clear;
   DM.IBQuery_ExecSql.Sql.Add(VS_Comando);
   DM.IBQuery_ExecSql.ExecSql;
   Funcoes.ExecutaTransacao;
end;

//------------------------------------------------------------------------------
// Descricao: OpenQuery
//
// Atualizado em: 25/01/2006
//------------------------------------------------------------------------------

Procedure Funcao.OpenQuery(VS_Comando: String);
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.Sql.Clear;
   DM.Query_Executa.Sql.Add(VS_Comando);
   DM.Query_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Cadastrar a senha de acesso a Ficha de
//            Avaliacao de Curso.
// Data     : 13/07/2010
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

procedure Funcao.CadastrarAcessoFichaAvaliacao(P_IdCurso, P_IdTurma, P_Identidade, P_senha: String);
var
   VS_Comando: String;
begin
   p_senha:= formatFloat('000',StrToInt(P_Senha));
   
   VS_Comando:= 'Select count(1) As Qtd from FA_UsuarioTurma '+
                ' where IdCurso = '+P_IdCurso+
                ' and IdTurma = '+P_IdTurma+
                ' and Identidade =  '#39+P_Identidade+#39;

   if QtdRegistro(VS_Comando) = 0 then
   begin
      VS_Comando:= 'Insert into FA_USUARIOTURMA (IdCurso, IdTurma, Identidade, senha)'+
                   ' values ( '+P_IdCurso+', '+P_IdTurma+', '+#39+P_Identidade+#39+', '+#39+P_senha+#39+')';
   end
   else
   begin
      VS_Comando:= 'update FA_USUARIOTURMA set senha = '+#39+P_senha+#39+
                   ' where IdCurso = '+P_IdCurso+
                   ' and IdTurma = '+P_IdTurma+
                   ' and Identidade =  '#39+P_Identidade+#39;
   end;
   Funcoes.ExecusaoQuery(VS_Comando);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.MontaCurso(PS_Curso: String): Boolean;
var
   VS_Comando: string;
   VB_Retorno: Boolean;
begin
   VB_Retorno:= False;
//   if VS_CodCurso <> PS_Curso then
//   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso, Descricao, Grava_APC '+
                      'From Curso '+
                      ' where codcurso = '+#39+PS_Curso+#39;
         Funcoes.ExecutaQuery(DM.Query_Executa, VS_Comando);

         if Trim(DM.Query_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            SetIdCurso(DM.Query_Executa.FieldByName('IdCurso').AsString);
            VB_Retorno:= True;
         end
         else
         begin
            Showmessage('O Curso '+PS_Curso+' não esta Cadastrado...'+#13+#13+' Para cadastrar o Curso '+PS_Curso+', selecione o Botão < Cadastrar Curso >');         end;
       end;
//   end;
   MontaCurso:= VB_retorno;
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

Function Funcao.ValidaCampo(PS_Campo, Msg: String): Boolean;
var
   Retorno: Boolean;
begin
   Retorno:= True;

   if trim(PS_Campo) = '' then
   begin
      ShowMessage('O Campo '+Msg+' não pode ser branco...');
      Retorno:= False;
   end;
   ValidaCampo:= Retorno
end;


//------------------------------------------------------------------------------
// Funcao para Gerar Senha
//------------------------------------------------------------------------------

Function Funcao.GerarSenha(PI_Tamanho: Integer): String;
var
   i:integer;
   VS_retorno: String;
const
   str='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
    VS_retorno:='';
    for i:=1 to PI_Tamanho do
        VS_retorno:=VS_retorno+str[random(length(str))+1];
    GerarSenha:= VS_retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de retornar se o numero e PAR.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TestaParaPar(TestaInteiro : Integer) : boolean;
begin
  if (TestaInteiro div 2) = (TestaInteiro/2) then
     result := True
  else
     result := False;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Gerar Codigo de Acesso ao Instrutor de
//            acordo com a Turma.
// Data     : 29/04/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.GerarCodigoInstrutor(VS_IdCurso: String; S_IdTurma: String): String;
var
   VS_Comando, VS_CodInstrutor: String;
   VI_CodExiste: integer;
begin
   //------------- Chama função para gerar codigo do Instrutor  --------------//
   VI_CodExiste:=0;

   while VI_CodExiste = 0  do
   begin
      VS_CodInstrutor:=Funcoes.Randomico (999);
      VS_Comando:= 'Select count(1) Qtd '+
                   'from InstrutorTurma '+
                   'where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = '+S_IdTurma+
                   ' and CodigoInstrutor = '+VS_CodInstrutor;
      if Funcoes.QtdRegistro(VS_Comando) = 0 then
         VI_CodExiste:= 1;

   end;
   GerarCodigoInstrutor:= VS_CodInstrutor;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Retornar a Descricao do Sistema de Acordo
//            Com a Instalacao do ICEA ou do CIAAR
// Data     : 10/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CabecalhoForm(Form: TForm; PS_Cabecalho: String);
begin
   Form.Caption:= 'Sistema de Gerenciamento do Ensino --> '+PS_Cabecalho;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Cor da DBGrid.
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.CorDBGrid(DBGrid: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn;  State: TGridDrawState );
begin
  DBGrid.Canvas.Font.Color:= clBlack;

  if gdSelected in State then
  begin
     DBGrid.Canvas.Brush.Color := $006A2602;
     DBGrid.Canvas.Font.Color:= clWhite;
  end
  else
     DBGrid.Canvas.Font.Color:= clBlack;


   DBGrid.Canvas.FillRect(Rect);
   DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função Devolver a Semana da data Fornecida.
// Data     : 06/06/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

function Funcao.SemanaAno ( Dataatual: String): integer;
var
   fltDiferenca: extended;
   datData, datDataInicial: TDate;
begin
   datData:= StrToDate(Dataatual);
   datDataInicial := strToDate('01/01/' + formatDateTime('yyyy',datData ));
   fltDiferenca := datData - datDataInicial;

    // se dia da semana = segunda feira é acrescentado + 2 ao resultado, pois o
   // 1º dia útil da semana no brasil começa na segunda-feira e não no domigo
//   if DayOfWeek(datData) = 2 then
//      result := trunc ( fltDiferenca / 7 ) + 2
//   else
     result := trunc ( fltDiferenca / 7 ) + 1;
end;


//------------------------------------------------------------------------------
// Descricao: Esta Rotna tem a Funcao de Verificar se o Curso possui Turma em
//            andamento.
// Data     : 28/11/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.VerificaTurma(VS_Msg: String): Boolean;
var
   VS_Comando: String;
   VB_Retorno: Boolean;
begin
   VB_Retorno:= True;
   VS_Comando:= 'Select CodCurso From Turma_View where IdCurso = '+Funcoes.GetIdCurso;
   Funcoes.OpenQuery(VS_Comando);

   if  DM.Query_Executa.FieldByName('CodCurso').AsString = '' then
   begin
      ShowMessage('O Curso '+DM.Query_Executa.FieldByName('CodCurso').AsString+' não possuí Turma em Andamento'+#13+VS_Msg);
      VB_Retorno:= False;
   end;
   VerificaTurma:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da Execucao da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.ExecutaTransacao;
begin
   if not DM.IBTransaction_Chamada.Active then
       DM.IBTransaction_Chamada.Active := True;

   DM.IBTransaction_Chamada.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Tratar da parada da Transacao
// Data     : 26/05/2011
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.abortaTransacao;
begin
   if not DM.IBTransaction_Chamada.Active then
       DM.IBTransaction_Chamada.Active := True;
   DM.IBTransaction_Chamada.RollbackRetaining
end;

//------------------------------------------------------------------------------
// Seta inicializacao do IdTurma
//------------------------------------------------------------------------------

Procedure Funcao.SetIdTurma(PS_IdTurma: String);
begin
   VS_IdTurma:= PS_IdTurma;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Trocar o acento pelo caracter sem acento
// Data     : 28/08/2012
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.TratarConsultaComAcento(Campo, Compara, Str: String): String;
var
   VS_Retorno: String;
begin;
  VS_Retorno:= VerificaAcento(Str);

  if VS_Retorno <> Str then
     VS_Retorno:= ' or '+Campo+' '+Compara+' '+#39+VS_Retorno+#39+' '
  else
     VS_Retorno:= '';
  Result := VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Esta Rotina tem a função de Trocar o acento pelo caracter sem acento
// Data     : 28/08/2012
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.VerificaAcento(Str: String): String;
var
  i, VI_Tam: Integer;
  VS_Retorno, VS_letra: String;
begin
   VI_tam:= Length(Str);
   VS_retorno:= '';

   for i := 1 to VI_Tam do
   begin
      VS_Letra:= Copy(Str,i,1);

      if ((VS_letra = 'A') or (VS_letra = 'E') or (VS_letra = 'I') or (VS_letra = 'O') or (VS_letra = 'U') or (VS_letra = 'C')) then
         VS_letra:= '_';

      VS_Retorno:= VS_Retorno+VS_Letra;
   end;

  VerificaAcento:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Grava o Controle de Atualizacoes
// Data     : 28/08/2012
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.Controle(VS_IdCurso, VS_IdTurma, VS_IdControle, VS_Descricao: String);
var
  VS_Comando: String;
begin
   VS_Comando:= 'Delete From Controle_Processos '+
                ' where IdCurso = '+VS_IdCurso+
                ' and   IdTurma ='+VS_IdTurma+
                ' and   IdControle = '+VS_IdControle;

   ExecusaoQuery(VS_Comando);

   VS_Comando:= 'insert into Controle_Processos ( IDCURSO, IDTURMA, IDCONTROLE, DESCRICAO, DATA, HORA) '+
                ' values ('+VS_IdCurso+', '+VS_IdTurma+', '+VS_IdControle+', '+#39+VS_Descricao+#39+', '+#39+Funcoes.DePara(DateToStr(Date), '/', '.')+' 00:00'+#39+', '+#39+Copy(HoraAtual,1,2)+':'+Copy(HoraAtual,3,2)+#39+')';

   ExecusaoQuery(VS_Comando);
end;

//------------------------------------------------------------------------------
// Descricao: Grava o Controle de Atualizacoes
// Data     : 28/08/2012
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.RetornaControle(VS_IdCurso, VS_IdTurma, VS_IdControle: String): String;
var
  VS_Comando: String;
begin
   VS_Comando:= 'Select Data, Hora From Controle_Processos '+
                ' where IdCurso = '+VS_IdCurso+
                ' and   IdTurma ='+VS_IdTurma+
                ' and   IdControle = '+VS_IdControle;

   OpenQuery(VS_Comando);
   RetornaControle:= '[ '+DM.Query_Executa.FieldByName('Data').AsString+' '+DM.Query_Executa.FieldByName('Hora').AsString+' ]';
end;

procedure Funcao.Trata_MontaCombo(VS_Comando: String; ComboBox: TComboBox);
begin
   Funcoes.OpenQuery(VS_Comando);
   ComboBox.Items.Clear;
   ComboBox.Items.Add('');

   DM.Query_Executa.First;
   While not DM.Query_Executa.Eof do
   begin
      ComboBox.Items.Add(DM.Query_Executa.FieldByName('Campo').AsString);
      DM.Query_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Principal
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

