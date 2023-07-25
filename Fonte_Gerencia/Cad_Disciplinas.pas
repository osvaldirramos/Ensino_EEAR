unit Cad_Disciplinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvLookOut, Mask, DB, IBCustomDataSet, IBTable, IBQuery, Grids,
  DBGrids, StdCtrls, JvEdit, JvComponent, JvxCtrls, ExtCtrls, JvShape, Rotinas,
  ComCtrls, ToolWin, DBCtrls, JvTransBtn;

type
  TForm_Sel_Disciplinas = class(TForm)
    Panel_Treeviw: TPanel;
    ToolBar_SelecaoAluno: TToolBar;
    DBGrid_Disciplina: TDBGrid;
    IBQuery_Disciplina: TIBQuery;
    DSQ_Disciplina: TDataSource;
    IBQuery_DisciplinaIDCURSO: TSmallintField;
    IBQuery_DisciplinaIDTURMA: TIntegerField;
    IBQuery_DisciplinaIDDISCIPLINA: TIntegerField;
    IBQuery_DisciplinaCODMATERIA: TIBStringField;
    IBQuery_DisciplinaNOMEMATERIA: TIBStringField;
    IBQuery_DisciplinaSERIE: TIBStringField;
    IBQuery_DisciplinaTEMPO: TIntegerField;
    IBQuery_DisciplinaESPECIALIDADE: TIBStringField;
    MaskEdit_Disciplina: TMaskEdit;
    MaskEdit_Descricao: TMaskEdit;
    Panel_Botoes_Instrutor: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape2: TJvShape;
    DBNavigator1: TDBNavigator;
    JvShape3: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure FormActivate(Sender: TObject);
    procedure JvEdit_DisciplinaChange(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
  private
    { Private declarations }
  public       { Public declarations }
     VS_Opcao: String;
  end;

var
  Form_Sel_Disciplinas: TForm_Sel_Disciplinas;

implementation

uses Data_Module, Cadastro_Disciplina, MenuPrincipal;

{$R *.dfm}

procedure TForm_Sel_Disciplinas.FormActivate(Sender: TObject);
begin
   IBQuery_Disciplina.Open;
   DBGrid_Disciplina.SetFocus;
end;

procedure TForm_Sel_Disciplinas.JvEdit_DisciplinaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select idcurso, idturma, iddisciplina, codmateria, nomemateria, serie, tempo, especialidade '+
                ' From Disciplina '+
                ' Where IdCurso = :IdCurso  ';

   if trim(MaskEdit_Disciplina.Text) <> '' then
       VS_Comando:= VS_Comando+' and    CodMateria = '+#39+trim(MaskEdit_Disciplina.Text)+#39;

   if trim(MaskEdit_Descricao.Text) <> '' then
       VS_Comando:= VS_Comando+' and    NomeMateria like '+#39+MaskEdit_Descricao.Text+'%'+#39;

   VS_Comando:= VS_Comando+' Order by CodMateria ';


   IBQuery_Disciplina.Close;
   IBQuery_Disciplina.Sql.Clear;
   IBQuery_Disciplina.Sql.Add(VS_Comando);
   IBQuery_Disciplina.Open;
end;

//------------------------------------------------------------------------------
// Botao para tratar a chamada do insercao da disciplina
//------------------------------------------------------------------------------

procedure TForm_Sel_Disciplinas.JvTransparentButton_AtualizarClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Disciplina);
end;

procedure TForm_Sel_Disciplinas.JvTransparentButton_FecharClick(Sender: TObject);
begin
   IBQuery_Disciplina.Close;
   Close;
end;

procedure TForm_Sel_Disciplinas.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Sel_Disciplinas.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção';
   Form_Cad_Disciplina.ShowModal;
end;

procedure TForm_Sel_Disciplinas.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   VS_Opcao:= 'Alteracao';
   Form_Cad_Disciplina.ShowModal;
end;

procedure TForm_Sel_Disciplinas.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: Integer;
begin
   VI_Retorno:= Application.MessageBox('Confirma a Exclusão da Disciplina Selecionada ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);

   if VI_Retorno = IDYes then
   begin
      Funcoes.ExecusaoQuery( 'Delete from Disciplina '+
                             ' where IdCurso = '+IBQuery_Disciplina.FieldByName('IdCurso').AsString+
                             ' and IdTurma = '+IBQuery_Disciplina.FieldByName('IdTurma').AsString+
                             ' and IdDisciplina = '+IBQuery_Disciplina.FieldByName('IdDisciplina').AsString
                            );

      JvTransparentButton_AtualizarClick(Sender);
   end;
end;


end.
