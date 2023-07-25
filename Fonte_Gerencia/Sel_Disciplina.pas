//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : Ensino                                         //
//                                                                            //
// PROGRAMA                  : Sel_Disciplina.pas                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar da Selecao  //
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

unit Sel_Disciplina;

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
  JvxClock, JvLookOut;

type
  TForm_Sel_Disciplina = class(TForm)
    Panel_Treeviw: TPanel;
    ToolBar_SelecaoAluno: TToolBar;
    JvEdit_Descricao: TJvEdit;
    DBGrid_Disciplina: TDBGrid;
    IBQuery_Materia: TIBQuery;
    DSQ_Materia: TDataSource;
    IBQuery_MateriaIDCURSO: TSmallintField;
    IBQuery_MateriaCODMATERIA: TIBStringField;
    JvEdit_CodMateria: TJvEdit;
    IBQuery_MateriaNOMEMATERIA: TIBStringField;
    ToolBar_TrataCurso: TToolBar;
    ToolButton_Novo: TToolButton;
    ToolButton_Editar: TToolButton;
    ToolButton_Exclui: TToolButton;
    ToolBar1: TToolBar;
    ToolButton_AtualiazarCurso: TToolButton;
    ToolButton_Fechar: TToolButton;
    ToolButton_Windows: TToolButton;
    IBQuery_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBQuery_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBQuery_MateriaFASE: TIBStringField;
    Label_Marcar: TLabel;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel_Turma: TPanel;
    JvShape2: TJvShape;
    Label2: TLabel;
    ComboBox_Turma: TComboBox;
    IBQuery_MateriaIDTURMA: TIntegerField;
    IBQuery_MateriaESPECIALIDADE: TIBStringField;
    JvEdit_Especialidade: TJvEdit;
    Panel_Curso: TPanel;
    JvShape1: TJvShape;
    Label1: TLabel;
    ComboBox_Curso: TComboBox;
    ToolButton2: TToolButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label_DescricaoCurso: TJvxLabel;
    IBQuery_MateriaREF_MATERIA: TSmallintField;
    JvEdit_Referencia: TJvEdit;
    JvExpressButton_DisciplinaBase: TJvExpressButton;
    DBEdit8: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    IBTable_Materia: TIBTable;
    DST_Materia: TDataSource;
    IBTable_MateriaIDCURSO: TSmallintField;
    IBTable_MateriaIDTURMA: TIntegerField;
    IBTable_MateriaCODMATERIA: TIBStringField;
    IBTable_MateriaNOMEMATERIA: TIBStringField;
    IBTable_MateriaNUMEROAULASTEORICAS: TSmallintField;
    IBTable_MateriaNUMEROAULASPRATICAS: TSmallintField;
    IBTable_MateriaFASE: TIBStringField;
    IBTable_MateriaPERGUNTAALUNO: TIBStringField;
    IBTable_MateriaPERGUNTACHEFE: TIBStringField;
    IBTable_MateriaESPECIALIDADE: TIBStringField;
    IBTable_MateriaREF_MATERIA: TSmallintField;
    Table_Esp_Disciplina: TIBTable;
    Table_Esp_DisciplinaIDCURSO: TSmallintField;
    Table_Esp_DisciplinaIDTURMA: TIntegerField;
    Table_Esp_DisciplinaCODMATERIA: TIBStringField;
    Table_Esp_DisciplinaQUADROESP: TIBStringField;
    DST_Esp_Disciplina: TDataSource;
    JvEdit_Serie: TJvEdit;
    IBQuery_MateriaFASEAPLICACAO: TIBStringField;
    IBTable_MateriaFASEAPLICACAO: TIBStringField;
    IBQuery_MateriaTIPO: TIBStringField;

    procedure MontaCurso(PS_Curso: String; Sender: TObject);
    procedure Monta_ComboTurma;
    procedure MontaDisciplina(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure SpeedButton_AtualizaTurmaClick(Sender: TObject);
    procedure ToolButton_FecharClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_AtualiazarCursoClick(Sender: TObject);
    procedure ToolButton_NovoClick(Sender: TObject);
    procedure ToolButton_EditarClick(Sender: TObject);
    procedure ToolButton_ExcluiClick(Sender: TObject);
    procedure Label_MarcarClick(Sender: TObject);
    procedure ComboBox_TurmaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_CursoSelect(Sender: TObject);
    procedure JvExpressButton_DisciplinaBaseClick(Sender: TObject);
    procedure DBGrid_DisciplinaDblClick(Sender: TObject);

  private    { Private declarations }
     VS_DescCurso, VS_IdCurso, VS_CodCurso: String;
     MS_Turma: Array[1..800] of String;
  public    { Public declarations }
     VS_Opcao: String;
  end;
var
  Form_Sel_Disciplina: TForm_Sel_Disciplina;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento quando Abre a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetCadCurso = 'MenuPrincipal') or (Funcoes.GetCadCurso = 'CertidaoCurricular')) then
   begin
      Funcoes.CabecalhoForm( Form_Sel_Disciplina, ' Seleção de Disciplinas');

      VS_CodCurso:= '';
      Funcoes.PerfilAcesso(Funcoes.GetCodUsuario, 'Curso - Cadastro Disciplina');    // Abre o perfil do usuario em relacao a agenda

      //--- Tratamento da Selecao dos Cursos

      Funcoes_Sue.AlimentaComboBox(ComboBox_Curso, 'CodCurso', 'Curso', '', 'CodCurso');
      ComboBox_Curso.Text:= Funcoes.GetCodCurso;
      MontaCurso(Funcoes.GetCodCurso, Sender);
      Funcoes.SetCadCurso('CadCurso');
   end;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_Materia.Close;
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Tratamento do Combox de Selecao de Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ComboBox_CursoSelect(Sender: TObject);
begin
   MontaCurso(ComboBox_Curso.Text, Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao da Query
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_AtualiazarCursoClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
   Funcoes.TrataBotoes(IBQuery_Materia, ToolButton_Novo, ToolButton_Editar, ToolButton_Exclui);
end;

//------------------------------------------------------------------------------
// Monta a Arvore de Curso
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.MontaCurso(PS_Curso: String; Sender: TObject);
var
   VS_Comando: string;
begin
   if VS_CodCurso <> PS_Curso then
   begin
      if trim(PS_Curso) <> '' then
      begin
         //--- Monta query de selecao de curso

         VS_Comando:= 'Select IdCurso, CodCurso, NomeCurso '+
                      'From Curso '+
                      ' where codcurso = '+#39+PS_Curso+#39;
         Funcoes.ExecutaQuery(DM.Query_Executa, VS_Comando);

         if Trim(DM.Query_Executa.FieldByName('CodCurso').AsString) <> '' then
         begin
            //--- Inicia Montagem da arvore

            ComboBox_Curso.Text:= DM.Query_Executa.FieldByName('CodCurso').AsString;
            Label_DescricaoCurso.Caption:= DM.Query_Executa.FieldByNAme('NomeCurso').AsString;

            VS_DescCurso:= Label_DescricaoCurso.Caption;
            VS_IdCurso:= DM.Query_Executa.FieldByNAme('IdCurso').AsString;
            VS_CodCurso:= ComboBox_Curso.Text;

            Monta_ComboTurma;
            ComboBox_TurmaChange(Sender);
          end
          else
          begin
             Showmessage('Curso não Cadastrado.');
          end;
       end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Combo de Selecao da Turma
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ComboBox_TurmaChange(Sender: TObject);
var
   VS_Turma: String;
   VI_IdTurma: Integer;
begin
   VS_Turma:= Trim(Funcoes.ExtraiAntesDe(ComboBox_Turma.Text, '-'));
   JvExpressButton_DisciplinaBase.Visible:= False;

   if VS_Turma <> '' then
   begin
      if VS_Turma <> 'TURMA' then
      begin
         JvExpressButton_DisciplinaBase.Visible:= True;
         DBGrid_Disciplina.Color:= $00F2F2F2
      end
      else
      begin
         JvExpressButton_DisciplinaBase.Visible:= False;
         DBGrid_Disciplina.Color:= $0080FFFF
      end;

      VI_IdTurma:= ComboBox_Turma.ItemIndex+2;
      if MS_Turma[VI_IdTurma] <> '-2' then
         Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[VI_IdTurma])
      else
         Form_MenuPrincipal.MontaTurma(VS_IdCurso, MS_Turma[1]);

      if DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString = '' then
         Label_DescricaoCurso.Caption:= VS_DescCurso
      else
         Label_DescricaoCurso.Caption:= DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;

      MontaDisciplina(Sender);

      Funcoes.TrataBotoes(IBQuery_Materia, ToolButton_Novo, ToolButton_Editar, ToolButton_Exclui);
   end;
end;

//------------------------------------------------------------------------------
//--- Monta a Relação das Turmas Referentes ao Curso Selecionado
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.Monta_ComboTurma;
var
   VS_Comando :String;
   VI_Indice: Integer;
begin
   //--- Tratamento para selecao da turma para o comboBox quando a selecao for feita na Form Selecao Turma

   if Funcoes.GetCadCurso <> 'MenuPrincipal' then
   begin
      VS_Comando:= 'Select idTurma, turma, Ano, Descricao From Turma where IdCurso = '+VS_IdCurso+' and Status <> '+#39+'E'+#39;
      Funcoes.OpenQuery(VS_Comando);

      if  DM.Query_Executa.FieldByName('IdTurma').AsString = '' then
          Form_MenuPrincipal.MontaTurma(VS_IdCurso, '-1')
       else
          Form_MenuPrincipal.MontaTurma(VS_IdCurso, DM.Query_Executa.FieldByName('IdTurma').AsString);
   end;

   //--- Tratamento da Alimentacao do Combo de selecao da Turma

   VS_Comando:= 'Select idTurma, turma, Ano, Descricao From Turma where IdCurso = '+VS_IdCurso+' and Status <> '+#39+'E'+#39+' order by IdTurma Desc ';
   Funcoes.OpenQuery(VS_Comando);

   VI_Indice:= 1;

   ComboBox_Turma.Items.Clear;
   if Trim(DM.IBQuery_MontaTurma.FieldByName('Turma').AsString) = '' then
   begin
      ComboBox_Turma.Text:= '';
      MS_Turma[VI_Indice]:= '-2';
   end
   else
   begin
      ComboBox_Turma.Text:= DM.IBQuery_MontaTurma.FieldByName('Turma').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Ano').AsString+' - '+DM.IBQuery_MontaTurma.FieldByName('Descricao').AsString;
      MS_Turma[VI_Indice]:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   end;

   DM.Query_Executa.First;
   While not DM.Query_Executa.Eof do
   begin
      ComboBox_Turma.Items.Add( DM.Query_Executa.FieldByName('Turma').AsString+' - '+DM.Query_Executa.FieldByName('Ano').AsString+' - '+DM.Query_Executa.FieldByName('Descricao').AsString);
      VI_Indice:= VI_Indice + 1;
      MS_Turma[VI_Indice]:= DM.Query_Executa.FieldByName('IdTurma').AsString;
      DM.Query_Executa.Next;
   end;
end;

//------------------------------------------------------------------------------
// Atualiza Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.SpeedButton_AtualizaTurmaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Materia);
end;

//------------------------------------------------------------------------------
// Tratamento da selecao da Metria pelo Codigo
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.MontaDisciplina;
var
   VS_Comando: String;

begin
   VS_Comando:= ' Select IdCurso, IdTurma, CodMateria, Ref_Materia, NomeMateria, NumeroAulasTeoricas, NumeroAulasPraticas, Fase, Especialidade, FaseAplicacao, Tipo'+
                ' From MateriaCurso '+
                ' Where IdCurso = '+VS_IdCurso+
                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;

   if  trim(JvEdit_Referencia.Text) <> '' then
      VS_Comando:= VS_Comando + ' and Ref_Materia = '+JvEdit_Referencia.Text;

   if  trim(JvEdit_Serie.Text) <> '' then
      VS_Comando:= VS_Comando + ' and FaseAplicacao like '+#39+JvEdit_Serie.Text+'%'+#39;

   if  trim(JvEdit_CodMateria.Text) <> '' then
      VS_Comando:= VS_Comando + ' and CodMateria like '+#39+JvEdit_CodMateria.Text+'%'+#39;

   if  trim(JvEdit_Descricao.Text) <> '' then
      VS_Comando:= VS_Comando + ' and NomeMateria like '+#39+JvEdit_Descricao.Text+'%'+#39;

   if  trim(JvEdit_Especialidade.Text) <> '' then
      VS_Comando:= VS_Comando + ' and Especialidade like '+#39+JvEdit_Especialidade.Text+'%'+#39;

   VS_Comando:= VS_Comando + ' Order by Ref_Materia ';

   if DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString = '0' then
      JvExpressButton_DisciplinaBase.Visible:= false
   else
      JvExpressButton_DisciplinaBase.Visible:= True;

   Funcoes.ExecutaQuery( IBQuery_Materia, VS_Comando);
   Funcoes.TrataBotoes(IBQuery_Materia, ToolButton_Novo, ToolButton_Editar, ToolButton_Exclui);
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro da Disciplina
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do botao Inserir Disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_NovoClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   Application.CreateForm(TForm_Cad_Disciplina, Form_Cad_Disciplina);
   Form_Cad_Disciplina.ShowModal;
   ToolButton_AtualiazarCursoClick( Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Alterar Disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_EditarClick(Sender: TObject);
begin
   VS_Opcao:= 'Alterar';
   Application.CreateForm(TForm_Cad_Disciplina, Form_Cad_Disciplina);
   Form_Cad_Disciplina.ShowModal;
   ToolButton_AtualiazarCursoClick( Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do botao exclui Materia
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.ToolButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: Integer;
   VS_Comando, VS_Msg: String;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão da(s) Disciplina(s) Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
            VI_retorno:= Funcoes.QtdRegistro('Select count(1) as Qtd from Item_Prova where  idcurso = '+IBQuery_Materia.FieldByName('IdCurso').AsString+
                                             ' and IdTurma = '+IBQuery_Materia.FieldByName('IdTurma').AsString+
                                             ' and codmateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39);

            if VI_retorno > 0 then
            begin
               VS_Msg:= 'A disciplina '+IBQuery_Materia.FieldByName('CodMateria').AsString+' - '+IBQuery_Materia.FieldByName('NomeMateria').AsString+#13+
                        ' Referente a Turma '+ComboBox_Turma.Text+
                        #13+' possuí ('+IntToStr(VI_retorno)+') "ITEM" que compoe prova...'+#13+#13+#13+'ENTRAR EM CONTATO COM A AVALIAÇÃO PARA APAGAR OS ITENS CADASTRADOS...';
               ShowMessage(VS_Msg);
            end
            else
            begin
               Funcoes.GravaAcesso('Curso - Cadastro Disciplina', 'Excluir Disciplina '+IBQuery_Materia.FieldByName('CodMateria').AsString+'do Curso '+ComboBox_Curso.Text);
               VS_Comando:= 'Delete from MateriaCurso where IdCurso = '+VS_IdCurso+' and IdTurma = '+IBQuery_Materia.FieldByName('IdTurma').AsString+' and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39;
               Funcoes.ExecusaoQuery(VS_Comando);

               VS_Comando:= 'Delete from Item_Prova where IdCurso = '+VS_IdCurso+' and IdTurma = '+IBQuery_Materia.FieldByName('IdTurma').AsString+' and CodMateria = '+#39+IBQuery_Materia.FieldByName('CodMateria').AsString+#39;
               Funcoes.ExecusaoQuery(VS_Comando);
            end;
         end;
         ToolButton_AtualiazarCursoClick( Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para selecionar todas Disciplinas
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplina.Label_MarcarClick(Sender: TObject);
var
   vlLinha: Integer;
   VB_Marcar: Boolean;
begin
   if Label_Marcar.Caption = 'Selecionar Todos' then
   begin
      Label_Marcar.Caption:= 'Desmarcar Todos';
      VB_Marcar:= True;
   end
   else
   begin
      Label_Marcar.Caption:= 'Selecionar Todos';
      VB_Marcar:= False;
   end;

   with DBGrid_Disciplina.DataSource.DataSet do
   begin
      First;
      for vlLinha := 0 to RecordCount - 1 do
      begin
         DBGrid_Disciplina.SelectedRows.CurrentRowSelected := VB_Marcar;
         Next;
      end;
   end;
   DBGrid_Disciplina.SelectedRows.Refresh;
end;

procedure TForm_Sel_Disciplina.JvExpressButton_DisciplinaBaseClick(Sender: TObject);
var
   VI_Retorno, Atualizar: Integer;
   VS_Comando: String;
begin
   Atualizar:= 1;
   VS_Comando:= 'Select count(1) Qtd '+
                ' From MateriaCurso '+
                '  Where IdCurso = '+VS_IdCurso+
                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
   Funcoes.OpenQuery(VS_Comando);

   if DM.Query_Executa.FieldByName('Qtd').AsInteger > 0 then
   begin
      VI_Retorno:= Application.MessageBox('Já existe Disciplina(s) inseridas na turma selecionada'+#13+
                                          'Deseja realmente atualizá-la com a Turma Base ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

      if VI_Retorno = IDYes then
      begin
         VS_Comando:= 'Delete From MateriaCurso '+
                '  Where IdCurso = '+VS_IdCurso+
                ' and IdTurma = '+DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         Funcoes.ExecusaoQuery(VS_Comando);
      end
      else
      begin
         Atualizar:= 0;
      end;
   end;

   if Atualizar = 1 then
   begin
      VS_Comando:= 'Select IdCurso, IdTurma, CodMateria, NomeMateria, NumeroAulasTeoricas, NumeroAulasPraticas, Fase, PerguntaAluno, PerguntaChefe, Especialidade, Ref_Materia, FaseAplicacao '+
                   ' From MateriaCurso '+
                   '  Where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = 0';
      Funcoes.OpenQuery(VS_Comando);
      IBTable_Materia.Open;
      DM.Query_Executa.First;
      While not DM.Query_Executa.eof do
      begin
         IBTable_Materia.Append;

         IBTable_Materia.FieldByName('IDCURSO').AsString:= VS_IdCurso;
         IBTable_Materia.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         IBTable_Materia.FieldByName('CODMATERIA').AsString:= DM.Query_Executa.FieldByName('CODMATERIA').AsString;
         IBTable_Materia.FieldByName('NOMEMATERIA').AsString:= DM.Query_Executa.FieldByName('NOMEMATERIA').AsString;
         IBTable_Materia.FieldByName('NUMEROAULASTEORICAS').AsString:= DM.Query_Executa.FieldByName('NUMEROAULASTEORICAS').AsString;
         IBTable_Materia.FieldByName('NUMEROAULASPRATICAS').AsString:= DM.Query_Executa.FieldByName('NUMEROAULASPRATICAS').AsString;
         IBTable_Materia.FieldByName('FASE').AsString:= DM.Query_Executa.FieldByName('FASE').AsString;
         IBTable_Materia.FieldByName('PERGUNTACHEFE').AsString:= DM.Query_Executa.FieldByName('PERGUNTACHEFE').AsString;
         IBTable_Materia.FieldByName('PERGUNTAALUNO').AsString:= DM.Query_Executa.FieldByName('PERGUNTAALUNO').AsString;
         IBTable_Materia.FieldByName('ESPECIALIDADE').AsString:= DM.Query_Executa.FieldByName('ESPECIALIDADE').AsString;
         IBTable_Materia.FieldByName('REF_MATERIA').AsString:= DM.Query_Executa.FieldByName('REF_MATERIA').AsString;
         IBTable_Materia.FieldByName('FASEAPLICACAO').AsString:= DM.Query_Executa.FieldByName('FASEAPLICACAO').AsString;
         IBTable_Materia.Post;
         DM.Query_Executa.Next;
      end;
      Funcoes.ExecutaTransacao;

      VS_Comando:= 'Select IdCurso, IdTurma, CodMateria, QUADROESP '+
                   ' From ESP_DISCIPLINA '+
                   '  Where IdCurso = '+VS_IdCurso+
                   ' and IdTurma = 0';
      Funcoes.OpenQuery(VS_Comando);
      Table_Esp_Disciplina.Open;
      DM.Query_Executa.First;
      While not DM.Query_Executa.eof do
      begin
         Table_Esp_Disciplina.Append;

         Table_Esp_Disciplina.FieldByName('IDCURSO').AsString:= VS_IdCurso;
         Table_Esp_Disciplina.FieldByName('IDTURMA').AsString:= DM.IBQuery_MontaTurma.FieldByName('IdTurma').AsString;
         Table_Esp_Disciplina.FieldByName('CODMATERIA').AsString:= DM.Query_Executa.FieldByName('CODMATERIA').AsString;
         Table_Esp_Disciplina.FieldByName('QUADROESP').AsString:= DM.Query_Executa.FieldByName('QUADROESP').AsString;
         Table_Esp_Disciplina.Post;
         DM.Query_Executa.Next;
      end;
      Funcoes.ExecutaTransacao;

      IBTable_Materia.Close;
      Table_Esp_Disciplina.Close;
      Funcoes.AtualizaQuery(IBQuery_Materia);
   end;
end;

procedure TForm_Sel_Disciplina.DBGrid_DisciplinaDblClick(Sender: TObject);
begin
   ToolButton_EditarClick(Sender);
end;

end.

