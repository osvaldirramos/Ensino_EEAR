//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Cad_Materia.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             das Disciplinas dos Cursos.                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cadastro_Disciplina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls,
  DBCtrls, ToolWin, Menus, Rotinas, Rotinas_SUE, ImgList, ShellApi, Variants,
  IBCustomDataSet, IBTable, IBQuery, JvToolEdit, JvDBCtrl, JvEdit,
  JvGradient, JvComponent, JvArrow, JvCaptionPanel, JvRichEd, JvDBRichEd,
  JvDBTreeView, JvxCtrls, JvShape, JvEnterTab ,
  PsyRichEdit, RichPrint, RichPreview, ExtDlgs,
  JvCombobox, JvColorCombo, JvBaseThumbnail, JvThumbImage,
  JvxClock, JvTransBtn;

type
  TForm_Cad_Disciplina = class(TForm)
    DST_Materia: TDataSource;
    IBTable_Materia: TIBTable;
    JvGradient_Tela01: TJvGradient;
    Label1: TLabel;
    Label6: TLabel;
    Label_Mat_Curso_1: TLabel;
    Label_Mat_Curso_5: TLabel;
    Label_Mat_Curso_4: TLabel;
    DBComboBox_Especialidade: TDBComboBox;
    DBEdit_Tempo: TDBEdit;
    DBEdit_Serie: TDBEdit;
    DBRichEdit_Descricao: TDBRichEdit;
    Edit_CodMateria: TDBEdit;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_ConfigurarImpressora: TJvTransparentButton;
    Memo_Msg02: TMemo;
    Memo1: TMemo;
    Label3: TLabel;
    IBTable_MateriaIDDISCIPLINA: TIntegerField;
    IBTable_MateriaIDCURSO: TSmallintField;
    IBTable_MateriaIDTURMA: TIntegerField;
    IBTable_MateriaCODMATERIA: TIBStringField;
    IBTable_MateriaNOMEMATERIA: TIBStringField;
    IBTable_MateriaSERIE: TIBStringField;
    IBTable_MateriaESPECIALIDADE: TIBStringField;
    IBTable_MateriaTEMPO: TIntegerField;

    procedure FormActivate(Sender: TObject);

    procedure ListaDeEspecialidade;
    procedure Fechar;
    procedure Inserir;
    procedure Alterar;

    procedure IBTable_MateriaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_ConfigurarImpressoraClick( Sender: TObject);

  private    { Private declarations }
      VS_CodMateriaOld: String;
  public    { Public declarations }
  end;
var
  Form_Cad_Disciplina: TForm_Cad_Disciplina;

implementation

uses Data_Module, Cad_Disciplinas;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento modulo principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.FormActivate(Sender: TObject);
var
   Status: Boolean;
begin
   IBTable_Materia.Open;
   ListaDeEspecialidade;

   if Form_Sel_Disciplinas.VS_Opcao = 'Inserção' then
      Inserir
   else
      Alterar;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBTable_Materia.Close;
   Action:= caFree;
end;


//------------------------------------------------------------------------------
//
// Tratamento Materia
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento do botao nova materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.ListaDeEspecialidade;
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select distinct especialidade From Disciplina '+
                ' where  idcurso = '+Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('IdCurso').AsString+
                ' and    idturma = '+Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('IdTurma').AsString+
                ' and    serie   = '+#39+Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('serie').AsString+#39;

   Funcoes.OpenQuery(VS_Comando);

   DBComboBox_Especialidade.Items.Clear;
   DM.Query_Executa.First;
   While not DM.Query_Executa.eof do
   begin
      DBComboBox_Especialidade.Items.add(DM.Query_Executa.FieldByName('especialidade').AsString);
      DM.Query_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao nova materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Inserir;
begin
   IBTable_Materia.Append;
   IBTable_Materia.FieldByName('IdCurso').AsString:= Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('IdCurso').AsString;
   IBTable_Materia.FieldByName('IdTurma').AsString:= Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('IdTurma').AsString;
   IBTable_Materia.FieldByName('Serie').AsString:= Form_Sel_Disciplinas.IBQuery_Disciplina.FieldByName('Serie').AsString;
   IBTable_Materia.FieldByName('CodMateria').AsString:= '';
   IBTable_Materia.FieldByName('NomeMateria').AsString:= '';
   IBTable_Materia.FieldByName('Tempo').AsInteger:= 0;
   IBTable_Materia.FieldByName('Especialidade').AsString:= '';
   Edit_CodMateria.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao altera materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Alterar;
begin
   IBTable_Materia.Edit;
   
   VS_CodMateriaOld:= IBTable_Materia.FieldByName('CodMateria').AsString;
   Edit_CodMateria.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Gravar Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.JvTransparentButton_GravaClick(Sender: TObject);
begin
   if  IBTable_Materia.FieldByName('CodMateria').AsString = '' then
   begin
      Showmessage('O código da disciplina não pode ser branco...');
      Edit_CodMateria.SetFocus;
   end
   else
   begin
      Funcoes.GravaAcesso('Menu Principal - Cadastro Disciplina', Form_Sel_Disciplinas.VS_Opcao+' Disciplina '+IBTable_Materia.FieldByName('CodMateria').AsString+' - Usuario: '+Funcoes.GetUsuario);

      if ((IBTable_Materia.State = DSInsert) or (IBTable_Materia.State = DSEdit )) then
         IBTable_Materia.Post;

      if Form_Sel_Disciplinas.VS_Opcao = 'Inserção' then
      begin
         Funcoes.AtualizaQuery(Form_Sel_Disciplinas.IBQuery_Disciplina);
         Inserir;
      end
      else
         Fechar;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao cancela Materia
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.JvTransparentButton_ConfigurarImpressoraClick(Sender: TObject);
begin
   if ((IBTable_Materia.State = DSInsert) or (IBTable_Materia.State = DSEdit )) then
      IBTable_Materia.Cancel;

   Fechar;
end;

//------------------------------------------------------------------------------
// Fecha a Janela de Tratamento da Disciplina
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.Fechar;
begin
   Funcoes.ExecutaTransacao;
   Funcoes.AtualizaQuery(Form_Sel_Disciplinas.IBQuery_Disciplina);
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro na entrada da materia do Curso
//------------------------------------------------------------------------------

procedure TForm_Cad_Disciplina.IBTable_MateriaPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
     if (E as EDBEngineError).Errors[0].Errorcode = 9729 then
     begin
        MessageDlg('  Disciplina já foi cadastrada...  ',mtError, [mbOk],0);
        Edit_CodMateria.SetFocus;
     end;
end;


end.

