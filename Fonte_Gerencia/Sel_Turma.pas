unit Sel_Turma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd, Rotinas_SUE, Rotinas,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj,
  XPMan, Menus, JvArrowBtn;

type
  TForm_SelTurma = class(TForm)
    Panel_Turma: TPanel;
    DST_Turma: TDataSource;
    DSQ_AlunoTurma: TDataSource;
    IBQuery_AlunoTurma: TIBQuery;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton_AtualiazarTurma: TToolButton;
    ToolButton_Fechar: TToolButton;
    Windows: TToolButton;
    ToolButton12: TToolButton;
    Bevel3: TBevel;
    Panel_CadTurma: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit_Inicio: TDBEdit;
    Label5: TLabel;
    DBEdit_termino: TDBEdit;
    Label8: TLabel;
    DBEdit_Coordenador: TDBEdit;
    Label12: TLabel;
    DBEdit_ano: TDBEdit;
    IBTable_Turma: TIBTable;
    SpeedButton_Executada: TSpeedButton;
    IBTable_TurmaIDCURSO: TSmallintField;
    IBTable_TurmaIDTURMA: TIntegerField;
    IBTable_TurmaTURMA: TIBStringField;
    IBTable_TurmaANO: TIBStringField;
    IBTable_TurmaDATAINICIO: TDateTimeField;
    IBTable_TurmaDATATERMINO: TDateTimeField;
    IBTable_TurmaCHEFETURMA: TIBStringField;
    IBTable_TurmaESQUADRAO: TIBStringField;
    Label3: TLabel;
    DBEdit_Esquadrao: TDBEdit;
    IBQuery_AlunoTurmaIDALUNO: TIntegerField;
    IBQuery_AlunoTurmaIDCURSO: TSmallintField;
    IBQuery_AlunoTurmaIDTURMA: TIntegerField;
    IBQuery_AlunoTurmaIDENTIDADE: TIBStringField;
    IBQuery_AlunoTurmaCODIGOALUNO: TIntegerField;
    IBQuery_AlunoTurmaDESLIGADO: TIBStringField;
    IBQuery_AlunoTurmaOBSERVACAO: TBlobField;
    IBQuery_AlunoTurmaNOMECOMPLETO: TIBStringField;
    IBQuery_AlunoTurmaNOMEGUERRA: TIBStringField;
    IBQuery_AlunoTurmaPOSTOGRADUACAO: TIBStringField;
    IBQuery_AlunoTurmaESPECIALIDADE: TIBStringField;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBGrid_SelecionaAluno: TDBGrid;
    ToolButton1: TToolButton;
    ToolButton_DesligarAluno: TToolButton;
    IBTable_TurmaSERIE: TIBStringField;
    IBTable_TurmaSTATUS: TIBStringField;

    Function TratarPergunta(VS_Pergunta: String): String;

    procedure ToolButton_FecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_AtualiazarTurmaClick(Sender: TObject);
    procedure WindowsClick(Sender: TObject);
    procedure DBGrid_SelecionaAlunoTitleClick(Column: TColumn);
    procedure SpeedButton_ExecutadaClick(Sender: TObject);
    procedure DBGrid_SelecionaAlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton_DesligarAlunoClick(Sender: TObject);
    procedure IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
    procedure DBGrid_SelecionaAlunoCellClick(Column: TColumn);
  private    { Private declarations }

  public    { Public declarations }
     VS_DescCurso, VS_CodCurso, VS_ComandoAluno, OrderByAluno, VS_Aluno: String;
  end;

var
  Form_SelTurma: TForm_SelTurma;

  Arq : TEXTFILE;
  ArquivoAberto, S    :  string;

implementation

uses Data_Module, MenuPrincipal;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento quando abrea a Form
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FormActivate(Sender: TObject);
var
   DiaSemana: Integer;
begin
   Funcoes.CabecalhoForm(Form_SelTurma, ' Cadastro de Turma / Aluno / Instrutor');

    //--- Tratamento da Selecao dos Cursos

    Funcoes.SetCadCurso('CadCurso');

    //--- Abre as Tabelas de Trabalho
    IBQuery_AlunoTurma.Open;
    IBTable_Turma.Open;
end;

//------------------------------------------------------------------------------
// Tratamento quando Fecha a Form
//------------------------------------------------------------------------------

procedure TForm_SelTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Funcoes.AtualizaQuery(Form_MenuPrincipal.IBQuery_MontaTurma);

   IBTable_Turma.Close;
   IBQuery_AlunoTurma.Close;
   Action:= caFree;
end;


//------------------------------------------------------------------------------
// Tratamento do Botao Fechar
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_FecharClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento quando fecha a Form
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do Botao que retorna para o Windows
//------------------------------------------------------------------------------

procedure TForm_SelTurma.WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


//------------------------------------------------------------------------------
//
// Tratamento do Cadastro de Alunos
// 14/03/2011
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento do para Classificar Alunos de acordo com cabecalho
//------------------------------------------------------------------------------

procedure TForm_SelTurma.DBGrid_SelecionaAlunoTitleClick(Column: TColumn);
begin
   OrderByAluno:= ' ';

   if (column.Title.Caption = 'Cód. Aluno' ) then
       OrderByAluno:= ' order by CodigoAluno '
   else
     if trim(column.Title.Caption) = 'Nome Guerra' then
         OrderByAluno:= ' order by NomeGuerra'
     else
        if trim(column.Title.Caption) = 'Especialidade' then
            OrderByAluno:= ' order by QuadroEsp'
        else
           if trim(column.Title.Caption) = 'Nome' then
              OrderByAluno:= ' order by nomeCompleto '
           else
              if trim(column.Title.Caption) = 'St' then
                 OrderByAluno:= ' order by MotivoDesligamento '
              else
                 if trim(column.Title.Caption) = 'Sexo' then
                    OrderByAluno:= ' order by Sexo '
                 else
                    if trim(column.Title.Caption) = 'Nota Final' then
                         OrderByAluno:= ' order by NotaFinal';

   Funcoes.ExecutaQuery(IBQuery_AlunoTurma, VS_ComandoAluno +OrderByAluno);
end;

procedure TForm_SelTurma.DBGrid_SelecionaAlunoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if ((Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> 'T') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> ' ') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> '')) then
   begin
      ToolButton_DesligarAluno.Caption:= 'Retornar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 33;
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clRed
   end
   else
   begin
      ToolButton_DesligarAluno.Caption:= 'Desligar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 32;
      DBGrid_SelecionaAluno.Canvas.Font.Color:= clBlack;
   end;

  if gdSelected in State then
    DBGrid_SelecionaAluno.Canvas.Brush.Color := clSkyBlue;

   DBGrid_SelecionaAluno.Canvas.FillRect(Rect);
   DBGrid_SelecionaAluno.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


//------------------------------------------------------------------------------
// Tratamento do Botao de Atualizacao das listas (Querys)
//------------------------------------------------------------------------------

procedure TForm_SelTurma.ToolButton_AtualiazarTurmaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_AlunoTurma);
end;



//------------------------------------------------------------------------------
// Chama a Janela de Tratamento da Turma Executada
//------------------------------------------------------------------------------

procedure TForm_SelTurma.SpeedButton_ExecutadaClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_IdCurso, VS_IdTurma: String;
begin
   VI_Retorno:= Application.MessageBox('  Confirma o Fechamento da turma ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      VS_IdCurso:= IBTable_Turma.FieldByName('IdCurso').AsString;
      VS_IdTurma:= IBTable_Turma.FieldByName('IdTurma').AsString;
      IBTable_Turma.Edit;
      IBTable_Turma.FieldByName('Status').AsString:= 'E';
      IBTable_Turma.Post;
      DM.IBTransaction_Chamada.CommitRetaining;
      Funcoes.SetCadCurso('MenuPrincipal');
      ToolButton_FecharClick(Sender);
   end;
end;

//------------------------------------------------------------------------------
// Trata os <Enter> das perguntas do Aluno e do Chefe
//------------------------------------------------------------------------------

Function TForm_SelTurma.TratarPergunta(VS_Pergunta: String): String;
var
   i: integer;
   VS_Retorno: String;
begin
   VS_Retorno:= '';
   for i:= 1 to length(VS_Pergunta) do
      if Copy(VS_pergunta, i,1) = #13 then
         VS_Retorno:= VS_Retorno+'<br>'
      else
         VS_Retorno:= VS_Retorno+Copy(VS_Pergunta, i,1);

   TratarPergunta:= VS_Retorno;
end;

procedure TForm_SelTurma.ToolButton_DesligarAlunoClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if IBQuery_AlunoTurma.FieldByName('Desligado').AsString = 'T' then
      VS_Comando:= 'update  alunoturma  set desligado = '+#39+'D'+#39+' where identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39
   else
      VS_Comando:= 'update  alunoturma  set desligado = '+#39+'T'+#39+' where identidade = '+#39+IBQuery_AlunoTurma.FieldByName('Identidade').AsString+#39;

   Funcoes.ExecusaoQuery(VS_Comando);
   Funcoes.AtualizaQuery(IBQuery_AlunoTurma);

end;

procedure TForm_SelTurma.IBQuery_AlunoTurmaAfterScroll(DataSet: TDataSet);
begin
   if ((Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> 'T') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> ' ') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> '')) then
   begin
      ToolButton_DesligarAluno.Caption:= 'Retornar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 33;
   end
   else
   begin
      ToolButton_DesligarAluno.Caption:= 'Desligar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 32;
   end;
end;

procedure TForm_SelTurma.DBGrid_SelecionaAlunoCellClick(Column: TColumn);
begin
   if ((Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> 'T') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> ' ') and
       (Trim(IBQuery_AlunoTurma.FieldByName('desligado').AsString) <> '')) then
   begin
      ToolButton_DesligarAluno.Caption:= 'Retornar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 33;
   end
   else
   begin
      ToolButton_DesligarAluno.Caption:= 'Desligar Aluno';
      ToolButton_DesligarAluno.ImageIndex:= 32;
   end;
end;

end.
