//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas_SUE.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns do Ensino.                              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//           Estagiário      :                                                //
//                                                                            //
// INICIO DA ELABORACAO      : 20/10/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas_SUE;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Data_Module, IBQuery;

const
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   Aspas= '''';

   type
   Funcao = Class
      Private
//         VS_Usuario, VS_Privilegio, VS_CodCurso, VS_Quadro, VS_Unidade, VS_Versao: String;

      Public
         Procedure AlimentaComboBox(ComboBox: TComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
         Procedure AlimentaDBComboBox(ComboBox: TDBComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);

         Function EncontraId( VS_Campo: String; VS_Tabela: String; VS_Condicao: String): String;
   end;

var
   Funcoes_SUE: Funcao;

implementation

//------------------------------------------------------------------------------
// Descricao: Carrega o combobox fornecido
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaDBComboBox(ComboBox: TDBComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select distinct '+VS_Campo+
                ' from '+VS_Tabela;
   if VS_Condicao <> '' then
       VS_Comando:= VS_Comando + ' Where '+VS_Condicao;
   VS_Comando:= VS_Comando + ' order By '+VS_OrderBy;

   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;
   DM.Query_Executa.First;

   ComboBox.Items.Clear;
   ComboBox.Text:= DM.Query_Executa.FieldByName(VS_Campo).AsString;
   While not DM.Query_Executa.Eof do
   begin
      ComboBox.Items.Add(DM.Query_Executa.FieldByName(VS_Campo).AsString);
      DM.Query_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Carrega o DBcombobox fornecido
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboBox(ComboBox: TComboBox; VS_Campo: String; VS_Tabela: String; VS_Condicao: String; VS_OrderBy: String);
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select '+VS_Campo+
                ' from '+VS_Tabela;
   if VS_Condicao <> '' then
       VS_Comando:= VS_Comando + ' Where '+VS_Condicao;
   VS_Comando:= VS_Comando + ' order By '+VS_OrderBy;

   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;
   DM.Query_Executa.First;

   ComboBox.Items.Clear;
   ComboBox.Text:= DM.Query_Executa.FieldByName(VS_Campo).AsString;
   While not DM.Query_Executa.Eof do
   begin
      ComboBox.Items.Add(DM.Query_Executa.FieldByName(VS_Campo).AsString);
      DM.Query_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Encontra Id do campo selecionado
// Data     : 27/10/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.EncontraId( VS_Campo: String; VS_Tabela: String; VS_Condicao: String): String;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select '+VS_Campo+' NumId '+
                ' from '+VS_Tabela+
                ' Where '+VS_Condicao;

   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;
   DM.Query_Executa.First;

   EncontraId:= DM.Query_Executa.FieldByName('NumId').AsString;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes_SUE:= Funcao.Create;
end.

