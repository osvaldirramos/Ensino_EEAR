//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : SGE                                            //
//                                                                            //
// PROGRAMA                  : Menu_Principal.PAS                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do menu     //
//                             principal.                                     //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/07/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit MenuPrincipal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd, Rotinas_SUE, Rotinas,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj,
  XPMan, Menus, JvArrowBtn, DBClient, jpeg, JvGradientCaption,
  JvCaptionPanel, JvGradient, math;

type
  TForm_MenuPrincipal = class(TForm)
    DSQ_TurmaAndamento: TDataSource;
    Panel_Principal: TPanel;
    IBQuery_ListaFaltasPorAlunos: TIBQuery;
    DSQ_ListaFaltasPorAlunos: TDataSource;
    IBTable_ListaChamadaAlunos: TIBTable;
    DST_ListaChamadaAluno: TDataSource;
    IBTable_ListaChamadaAlunosIDCHAMADA: TIntegerField;
    IBTable_ListaChamadaAlunosIDALUNO: TIntegerField;
    IBTable_ListaChamadaAlunosIDINSTRUTOR: TIntegerField;
    IBTable_ListaChamadaAlunosIDDISCIPLINA: TIntegerField;
    IBTable_ListaChamadaAlunosTEMPO: TIBStringField;
    IBTable_ListaChamadaAlunosDATACHAMADA: TDateTimeField;
    IBTable_ListaChamadaAlunosPRESENCA: TIBStringField;
    IBTable_ListaChamadaAlunosOBSERVACAO: TIBStringField;
    Panel4: TPanel;
    JvCaptionPanel_AgendaPosCurso: TJvCaptionPanel;
    BitBtn_AtualizaCursoAndamento: TBitBtn;
    DBNavigator_CursosAndamento: TDBNavigator;
    DBGrid_Turma: TDBGrid;
    IBQuery_Faltas_Aluno: TIBQuery;
    DSQ_Faltas_Alunos: TDataSource;
    IBQuery_Faltas_AlunoCODMATERIA: TIBStringField;
    IBQuery_Faltas_AlunoQTD_FALTAS: TIntegerField;
    IBQuery_Faltas_AlunoPOR_DIS: TFloatField;
    IBQuery_Faltas_AlunoPOR_GERAL: TFloatField;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    JvShape2: TJvShape;
    JvShape_Brasao: TJvShape;
    Image_Brasao_ICEA: TImage;
    Image_Brasao: TImage;
    Panel3: TPanel;
    Label_Atualizacao: TLabel;
    Label_Versao: TLabel;
    ToolBar1: TToolBar;
    ToolButton_Turma: TToolButton;
    ToolButton_Cad_Disciplinas: TToolButton;
    ToolButton_Cad_Tempo_Serie: TToolButton;
    ToolButton_CargaTurma: TToolButton;
    Panel6: TPanel;
    JvCaptionPanel2: TJvCaptionPanel;
    JvCaptionPanel_Relacao_Faltas: TJvCaptionPanel;
    DBGrid_LIstaChamadaAlunos: TDBGrid;
    Panel7: TPanel;
    MaskEdit_Milhao: TMaskEdit;
    MaskEdit_NomeGuerra: TMaskEdit;
    DBNavigator1: TDBNavigator;
    Panel8: TPanel;
    MaskEdit_Curso: TMaskEdit;
    DBNavigator2: TDBNavigator;
    JvGradientCaption1: TJvGradientCaption;
    MaskEdit_Turma: TMaskEdit;
    MaskEdit_Serie: TMaskEdit;
    JvCaptionPanel1: TJvCaptionPanel;
    DBGrid2: TDBGrid;
    DBGrid_DetalhesChamada: TDBGrid;
    IBQuery_Faltas_AlunoIDALUNO: TIntegerField;
    IBQuery_Faltas_AlunoIDDISCIPLINA: TIntegerField;
    BitBtn_ListaChamadas: TBitBtn;
    IBQuery_MontaTurma: TIBQuery;
    IBQuery_MontaTurmaIDCURSO: TSmallintField;
    IBQuery_MontaTurmaIDTURMA: TIntegerField;
    IBQuery_MontaTurmaTURMA: TIBStringField;
    IBQuery_MontaTurmaANO: TIBStringField;
    IBQuery_MontaTurmaDATAINICIO: TDateTimeField;
    IBQuery_MontaTurmaDATATERMINO: TDateTimeField;
    IBQuery_MontaTurmaCHEFETURMA: TIBStringField;
    IBQuery_MontaTurmaESQUADRAO: TIBStringField;
    IBQuery_MontaTurmaCODCURSO: TIBStringField;
    IBQuery_MontaTurmaNOMECURSO: TIBStringField;
    IBQuery_MontaTurmaSERIE: TIBStringField;
    IBQuery_ListaFaltasPorAlunosIDCURSO: TSmallintField;
    IBQuery_ListaFaltasPorAlunosIDTURMA: TIntegerField;
    IBQuery_ListaFaltasPorAlunosIDALUNO: TIntegerField;
    IBQuery_ListaFaltasPorAlunosSERIE: TIBStringField;
    IBQuery_ListaFaltasPorAlunosNOMECOMPLETO: TIBStringField;
    IBQuery_ListaFaltasPorAlunosNOMEGUERRA: TIBStringField;
    IBQuery_ListaFaltasPorAlunosIDENTIDADE: TIBStringField;
    MaskEdit_NomeCompleto: TMaskEdit;
    IBQuery_Faltas_AlunoIDCURSO: TSmallintField;
    IBQuery_Faltas_AlunoIDTURMA: TIntegerField;
    IBQuery_Faltas_AlunoSERIE: TIBStringField;
    IBQuery_Faltas_AlunoESPECIALIDADE: TIBStringField;
    BitBtn1: TBitBtn;
    IBQuery_ListaFaltasPorAlunosQTD_FALTAS: TIntegerField;
    IBQuery_ListaFaltasPorAlunosTEMPO_ESPEC: TIntegerField;
    IBQuery_ListaFaltasPorAlunosFALTA_POR: TFloatField;
    Query_RelacaoAlunos: TIBQuery;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosSERIE: TIBStringField;
    Query_RelacaoAlunosIDALUNO: TIntegerField;
    Query_RelacaoAlunosDATACHAMADA: TDateTimeField;
    Query_RelacaoAlunosCODMATERIA: TIBStringField;
    Query_RelacaoAlunosQTD_FALTAS: TIntegerField;
    DSQ_RelacaoAlunos: TDataSource;
    IBQuery_Faltas_Turma: TIBQuery;
    IBStringField1: TIBStringField;
    DSQ_Faltas_Turma: TDataSource;
    IBQuery_Faltas_AlunoTEMPO_DISCIPLINA: TIntegerField;
    IBTable_Faltas: TIBTable;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IBStringField3: TIBStringField;
    DateTimeField2: TDateTimeField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    DST_Faltas: TDataSource;
    Query_RelacaoAlunosIDDISCIPLINA: TIntegerField;
    IBQuery_Faltas_TurmaCODCURSO: TIBStringField;
    IBQuery_Faltas_TurmaIDENTIDADE: TIBStringField;
    IBQuery_Faltas_TurmaESPECIALIDADE: TIBStringField;
    IBQuery_Faltas_TurmaNOMEGUERRA: TIBStringField;
    IBQuery_Faltas_TurmaPOR_FALTA: TFloatField;
    IBQuery_Faltas_TurmaQTD_FALTAS: TIntegerField;
    Panel2: TPanel;
    Panel5: TPanel;
    DBGrid_Faltas_Turma: TDBGrid;
    BitBtn_Relatorio_Faltas: TBitBtn;
    DBNavigator3: TDBNavigator;
    BitBtn2: TBitBtn;
    ToolButton_AtivarTurmaEncerrada: TToolButton;


    procedure ChamaTurma;

    procedure TrataBotoes;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn_AtualizaCursoAndamentoClick(Sender: TObject);
    procedure DBGrid_TurmaTitleClick(Column: TColumn);
    procedure DBGrid_TurmaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ServidorClick(Sender: TObject);
    procedure kkkClick(Sender: TObject);
    procedure ffClick(Sender: TObject);
    procedure ToolButton_Cad_Disciplinas00Click(Sender: TObject);
    procedure fdfdClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure MaskEdit_CodDisciplinaChange(Sender: TObject);
    procedure MaskEdit_MilhaoEnter(Sender: TObject);
    procedure MaskEdit_NomeGuerraEnter(Sender: TObject);
    procedure BitBtn_ListaChamadasClick(Sender: TObject);
    procedure DBGrid_LIstaChamadaAlunosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit_CursoChange(Sender: TObject);
    procedure DBGrid_Faltas_TurmaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn_Relatorio_FaltasClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private   { Private declarations }
     VS_ComandoTurmaPln, OrderByTurmaPln, VS_ComandoTurmaExecutada, OrderByTurmaExecutada, VS_ComandoTurmaAndamento, OrderByTurmaAndamento, VS_IdCurso: String;
     VB_Iniciar: boolean;
     VS_TempoCurso: String;
  public    { Public declarations }
     VS_OpcaoNota: String;
  end;

var
  Form_MenuPrincipal: TForm_MenuPrincipal;

implementation

uses Abertura, Data_Module, Sel_Turma, Carga_Turma, Cad_Disciplinas,
  Tempo_Serie, cad_chamada;



{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Form na Criacao
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormCreate(Sender: TObject);
begin
   VS_OpcaoNota:= 'Menu Principal';
end;

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.FormActivate(Sender: TObject);
begin
   VB_Iniciar:= False;
   if Funcoes.GetAbertura = False then
   begin
      VS_TempoCurso:= '0';
      Form_Abertura.Visible:= False;
      Label_Versao.Caption:= 'Versão '+Versao;
      Label_Atualizacao.Caption:= 'Última Atualização: '+Ultima_Atualizacao;
      Funcoes.SetSelTurma('Default-in');

      //--- Tratamento para Verificacao da OM usuaria

      Funcoes.CabecalhoForm(Form_MenuPrincipal, ' Menu Principal');

      if FileExists('Brasao_Ensino.jpg') = True then
         Image_Brasao.Picture.LoadFromFile('Brasao_Ensino.jpg');

       JvShape_Brasao.Visible:= True;
       Image_Brasao.Visible:= True;

      //--- Tratamento da Ativacao do Menu Principal

      IBQuery_MontaTurma.Open;
      IBQuery_ListaFaltasPorAlunos.Open;
      IBQuery_Faltas_Aluno.Open;
      IBTable_ListaChamadaAlunos.Open;
      IBQuery_Faltas_Turma.Open;

       //---
      //--- Tratamento da habilitacao das opcoes do Menu

      Funcoes.SetRespAssinatura(0);
      Funcoes.SetAbertura( True );

      ToolButton_Turma.Visible:= True;
      VB_Iniciar:= True;

   end;
   DBGrid_Turma.SetFocus;
end;

procedure TForm_MenuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IBQuery_ListaFaltasPorAlunos.Close;

   Action:= caFree;
   Application.Terminate;
end;


//------------------------------------------------------------------------------
// Trata os botoes de seleção que utiliza Curso como Base
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.TrataBotoes;
begin
   if VS_IdCurso = '' then
      ToolButton_Turma.Enabled:= False
   else
      ToolButton_Turma.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Tratamento para destacar os Cursos Finalizados
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   DBGrid_Turma.Canvas.Font.Color:= clBlack;

   if (IBQuery_MontaTurma.FieldByName('DataTermino').AsDateTime < Date) then
     DBGrid_Turma.Canvas.Font.Color:= clRed
   else
   begin
     if (IBQuery_MontaTurma.FieldByName('Esquadrao').AsString = 'AZUL') then
        DBGrid_Turma.Canvas.Brush.Color := $00FF6F6F
     else
        if (IBQuery_MontaTurma.FieldByName('Esquadrao').AsString = 'AMARELO') then
           DBGrid_Turma.Canvas.Brush.Color:= clYellow
        else
           if (IBQuery_MontaTurma.FieldByName('Esquadrao').AsString = 'BRANCO') then
              DBGrid_Turma.Canvas.Brush.Color:= clWhite
           else
              if (IBQuery_MontaTurma.FieldByName('Esquadrao').AsString = 'VERDE') then
                 DBGrid_Turma.Canvas.Brush.Color:= clLime
              else
                 if (IBQuery_MontaTurma.FieldByName('Esquadrao').AsString = 'PRATA') then
                    DBGrid_Turma.Canvas.Brush.Color:= clSilver
   end;

  if gdSelected in State then
    DBGrid_Turma.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Turma.Canvas.FillRect(Rect);
   DBGrid_Turma.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
//
// Tratamento dos Cursos em Andamento e Planejado
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Tratamento da Query da Turma Em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.MaskEdit_CursoChange(Sender: TObject);
begin
   VS_ComandoTurmaAndamento:= ' select c.idcurso, c.codcurso, c.nomecurso, t.idturma, t.turma, t.ano, t.datainicio, t.datatermino, t.chefeturma, t.esquadrao, t.serie '+
                              ' From curso c, turma t '+
                              ' Where c.idcurso = t.idcurso '+
                              ' and t.status = '+#39+'A'+#39 ;

   if trim( MaskEdit_Curso.Text) <> '' then
      VS_ComandoTurmaAndamento:= VS_ComandoTurmaAndamento+' and c.codcurso Like '+MaskEdit_Curso.Text+'%';

   if trim( MaskEdit_Turma.Text) <> '' then
      VS_ComandoTurmaAndamento:= VS_ComandoTurmaAndamento+' and t.turma Like '+MaskEdit_Turma.Text+'%';

   if trim( MaskEdit_Serie.Text) <> '' then
      VS_ComandoTurmaAndamento:= VS_ComandoTurmaAndamento+' and c.serie Like '+MaskEdit_Serie.Text+'%';

   OrderByTurmaAndamento:= ' order by c.codCurso, t.ano desc, t.turma ';
   BitBtn_AtualizaCursoAndamentoClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento da Selecao pelo Cabecalho pela Turma Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.DBGrid_TurmaTitleClick(Column: TColumn);
begin
   OrderByTurmaAndamento:= ' ';

   if (column.Title.Caption = 'Curso' ) then
          OrderByTurmaAndamento:= ' order by c.CodCurso '
   else
     if trim(column.Title.Caption) = 'Turma' then
            OrderByTurmaAndamento:= ' order by t.Turma Desc , t.Ano'
     else
        if trim(column.Title.Caption) = 't.Série' then
               OrderByTurmaAndamento:= ' order by Serie '
        else
           if trim(column.Title.Caption) = 'Término' then
              OrderByTurmaAndamento:= ' order by t.DataTermino '
           else
              if trim(column.Title.Caption) = 'Ínicio' then
                 OrderByTurmaAndamento:= ' order by t.DataInicio ';

   Funcoes.ExecutaQuery(IBQuery_MontaTurma, VS_ComandoTurmaAndamento + OrderByTurmaAndamento);
end;

//------------------------------------------------------------------------------
// Atualiza a query que mostra as turmas em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.BitBtn_AtualizaCursoAndamentoClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_MontaTurma);
   JvCaptionPanel_AgendaPosCurso.Caption:= '                                         Em Andamento ('+IntToStr(IBQuery_MontaTurma.RecordCount)+')';
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do Curso atraves de Relacao de Curso em Andamento
//------------------------------------------------------------------------------

procedure TForm_MenuPrincipal.ChamaTurma;
var
   Sender: TObject;
begin
   Application.CreateForm(TForm_SelTurma, Form_SelTurma);
   Form_SelTurma.ShowModal;
   BitBtn_AtualizaCursoAndamentoClick(Sender);
end;

procedure TForm_MenuPrincipal.Timer1Timer(Sender: TObject);
begin
   Funcoes.AtualizaQuery(DM.Query_Usuario);
end;

procedure TForm_MenuPrincipal.ServidorClick(Sender: TObject);
begin
   ShowMessage(DM.IBDatabase_Chamada.DatabaseName);
end;

procedure TForm_MenuPrincipal.BitBtn1Click(Sender: TObject);
var
   VI_Retorno: integer;
   Action: TCloseAction;
begin
   VI_Retorno:= Application.MessageBox('Deseja sair do sistema ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
   if VI_Retorno = IDYes then
   begin
      Action:= caFree;
      Application.Terminate;//   Funcoes.Windows;
   end;
end;

procedure TForm_MenuPrincipal.kkkClick(Sender: TObject);
begin
   Application.CreateForm(TForm_SelTurma, Form_SelTurma);
   Form_SelTurma.ShowModal;
   Form_SelTurma.Free;
end;

procedure TForm_MenuPrincipal.ffClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Carga_Turma, Form_Carga_Turma);
   Form_Carga_Turma.ShowModal;
   Form_Carga_Turma.Free;
   BitBtn_AtualizaCursoAndamentoClick(Sender);
end;

procedure TForm_MenuPrincipal.ToolButton_Cad_Disciplinas00Click( Sender: TObject);
begin
   Application.CreateForm(TForm_Sel_Disciplinas, Form_Sel_Disciplinas);
   Form_Sel_Disciplinas.ShowModal;
   Form_Sel_Disciplinas.Free;

end;

procedure TForm_MenuPrincipal.fdfdClick( Sender: TObject);
begin
   Application.CreateForm(TForm_Tempo_Serie, Form_Tempo_Serie);
   Form_Tempo_Serie.ShowModal;
   Form_Tempo_Serie.Free;
end;

procedure TForm_MenuPrincipal.MaskEdit_CodDisciplinaChange(Sender: TObject);
var
   VS_Comando: String;
begin
{   VS_Comando:= ' Select a.idcurso, a.idturma, a.serie, a.idaluno, a.especialidade, a.nomecompleto, a.nomeguerra, a.identidade, a.Qtd_Faltas, t.tempo as tempo_espec,(a.Qtd_Faltas*100)/t.tempo as Por_Falta '+
                ' From  QTD_FALTA_TURMA_VIEW a, tempo_especialidade t '+
                ' where a.idcurso = t.idcurso '+
                ' and   a.idturma =  t.idturma '+
                ' and   a.serie = a.serie '+
                ' and   a.especialidade = t.especialidade '+
                ' and   a.idcurso = :idcurso '+
                ' and   a.idturma = :idturma '+
                ' and   a.serie = :serie ';


   if copy(MaskEdit_Milhao.Text,1, 3) <> '  -' then
   begin
      if length(trim(MaskEdit_Milhao.Text)) = 6 then
         VS_Comando:= VS_Comando+' and a.identidade = '+#39+MaskEdit_Milhao.Text+#39;
   end;

   if MaskEdit_NomeGuerra.Text <> '' then
      VS_Comando:= VS_Comando+' and a.nomeguerra like '+#39+'%'+MaskEdit_NomeGuerra.Text+'%'+#39;

   if MaskEdit_NomeCompleto.Text <> '' then
      VS_Comando:= VS_Comando+' and a.nomecompleto like '+#39+'%'+MaskEdit_NomeCompleto.Text+'%'+#39;

   VS_Comando:= VS_Comando+'  Order By Por_Falta desc, nomeguerra ';

   Funcoes.ExecutaQuery(IBQuery_ListaFaltasPorAlunos, VS_Comando);

}
end;

procedure TForm_MenuPrincipal.ToolButton1Click(Sender: TObject);
var
   objExcel,Sheet: Variant;
   cTitulo : string;
   VS_Linha, VS_Tempo: String;

   i: Integer;

begin
{
   if IBQuery_ListaFaltasPorAlunos.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'A Turma selecionada não possuí instrutor Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Instrutores';
      objExcel := CreateOleObject('Excel.Application');
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];
      VS_Linha:= 'RELATÓRIO DE FALTAS DO AL '+
                  Trim(IBQuery_MontaTurma.FieldByName('CodCurso').AsString)+' '+
                  Trim(IBQuery_Aluno.FieldByName('identidade').AsString)+' '+
                  Trim(IBQuery_Aluno.FieldByName('NomeCompleto').AsString)+' '+
                  '('+Trim(IBQuery_Aluno.FieldByName('NomeGuerra').AsString)+') ';

      Sheet.Range['A1'] := VS_Linha;

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'DATA';
      Sheet.Range['B1'] := 'FALTAS';
      Sheet.Range['C1'] := 'DISCIPLINA';
      Sheet.Range['D1'] := 'TEMPO';


      IBTable_ListaChamadaAlunos.Open;

      i:= 3;
      IBQuery_ListaFaltasPorAlunos.First;
      while not IBQuery_ListaFaltasPorAlunos.eof do
      begin
         VS_Tempo:= '';

         IBTable_ListaChamadaAlunos.First;
         While not IBTable_ListaChamadaAlunos.Eof do
         begin
            VS_Tempo:= VS_Tempo + trim(IBTable_ListaChamadaAlunos.FieldByName('Tempo').AsString)+' ';
            IBTable_ListaChamadaAlunos.Next;
         end;

         Sheet.Cells[1,i] := IBTable_ListaChamadaAlunos.FieldByName('DataChamada').AsString;
         Sheet.Cells[2,i] := IBQuery_ListaFaltasPorAlunos.FieldByName('Qtd').AsString;
         Sheet.Cells[3,i] := IBQuery_ListaFaltasPorAlunos.FieldByName('CodMateria').AsString;
         Sheet.Cells[4,i] := VS_Tempo;

         i:= i+1;
         IBQuery_ListaFaltasPorAlunos.Next;
      end;
      i:= i+3;

      VS_Linha:= 'TOTAL DE FALTAS: '+
                  trim(IBQuery_Total_Faltas_Alunos.FieldByName('QTD_FALTAS_ALUNO').AsString)+
                  ' TEMPOS TOTAIS : '+
                  Trim(IBTable_Tempo_Serie.FieldByName('Tempo').AsString)+
                  ' PORCENTAGEM: '+FloatToStr((
                                  IBTable_Tempo_Serie.FieldByName('Tempo').AsFloat*IBTable_Tempo_Serie.FieldByName('QTD_FALTAS_ALUNO').AsFloat)
                                  /100);

      Sheet.getCellByPosition(0,i).setString(VS_Linha);

      i:= i+2;
       Sheet.Cells[1,i] := 'DISCIPLINA';
       Sheet.Cells[2,i] := 'DTDE';
       Sheet.Cells[3,i] := 'DTDE';
       Sheet.Cells[4,i] := '%';
       Sheet.Cells[5,i] := '%';
      i:= i+1;

       Sheet.Cells[1,i] := '';
       Sheet.Cells[2,i] := 'TEMPOS TOTAIS';
       Sheet.Cells[3,i] := 'FALTAS';
       Sheet.Cells[4,i] := 'DISCIPLINA';
       Sheet.Cells[5,i] := 'GERAL';

      i:= i+1;

      IBQuery_Faltas_Aluno.First;
      while not IBQuery_Faltas_Aluno.eof do
      begin
          Sheet.Cells[1,i] := IBQuery_Faltas_Aluno.FieldByName('CodMateria').AsString;
          Sheet.Cells[2,i] := IBQuery_Faltas_Aluno.FieldByName('Tempo').AsString;
          Sheet.Cells[3,i] := IBQuery_Faltas_Aluno.FieldByName('Qtd_Faltas').AsString;
          Sheet.Cells[4,i] := IBQuery_Faltas_Aluno.FieldByName('Por_dis').AsString;
          Sheet.Cells[5,i] := IBQuery_Faltas_Aluno.FieldByName('Por_Geral').AsString;
         i:= i+1;
         IBQuery_Faltas_Aluno.Next;
      end;
      i:= i+3;

   end;
}
end;




procedure TForm_MenuPrincipal.MaskEdit_MilhaoEnter(Sender: TObject);
begin
   MaskEdit_Milhao.SelectAll;
end;

procedure TForm_MenuPrincipal.MaskEdit_NomeGuerraEnter(Sender: TObject);
begin
   MaskEdit_NomeGuerra.SelectAll;
end;

procedure TForm_MenuPrincipal.BitBtn_ListaChamadasClick(Sender: TObject);
begin
    Form_Cad_Chamada.ShowModal;
    Funcoes.AtualizaQuery(IBQuery_ListaFaltasPorAlunos);
end;


procedure TForm_MenuPrincipal.DBGrid_LIstaChamadaAlunosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   VS_Comando: String;
begin
   //---
   //--- Encontrar o tempo referente ao aluno

   VS_TempoCurso:= IBQuery_ListaFaltasPorAlunos.FieldByName('Tempo_espec').AsString;
   JvCaptionPanel_Relacao_Faltas.Caption:= 'Curso: '+IBQuery_MontaTurma.FieldByName('CodCurso').AsString+'   -   '+
                                           'Turma: '+IBQuery_MontaTurma.FieldByName('Turma').AsString+'   -   '+
                                           'Série: '+IBQuery_MontaTurma.FieldByName('Serie').AsString+'   -   '+
                                           'Total de Tempos da Série: '+IBQuery_ListaFaltasPorAlunos.FieldByName('Tempo_espec').AsString;

   //----
   // Tratamento da Grid

   DBGrid_LIstaChamadaAlunos.Canvas.Font.Color:= clBlack;

   if (IBQuery_ListaFaltasPorAlunos.FieldByName('Por_Falta').AsString = '') then
      DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color:= $00FAEBDE
   else
   begin
      if (RoundTo(IBQuery_ListaFaltasPorAlunos.FieldByName('Por_Falta').AsFloat, -2) >= 10) then   //10  - V\ermelho
         DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color:= clRed
      else
      begin
         if (RoundTo(IBQuery_ListaFaltasPorAlunos.FieldByName('Por_Falta').AsFloat, -2) >= 8) then   //8  - Amarelo
            DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color := $002FFFF4
         else
            if (RoundTo(IBQuery_ListaFaltasPorAlunos.FieldByName('Por_Falta').AsFloat, -2) >= 5) then   //5 -Verde
               DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color:= $0040FF00
            else
               DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color:= $00FAEBDE;
      end;
   end;

  if gdSelected in State then
    DBGrid_LIstaChamadaAlunos.Canvas.Brush.Color := clSkyBlue;

   DBGrid_LIstaChamadaAlunos.Canvas.FillRect(Rect);
   DBGrid_LIstaChamadaAlunos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TForm_MenuPrincipal.BitBtn_Relatorio_FaltasClick( Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet: Variant;
   Connect, OpenOffice : Variant;

   VS_Linha, VS_Tempo: String;

   i, VI_Faltas, VI_Tempo: Integer;
   VF_Porcentagem: Real;
begin
   Query_RelacaoAlunos.Open;
   IBTable_Faltas.Open;

   if Query_RelacaoAlunos.RecordCount = 0 then
      ShowMessage('BROffice'+#13+#13+'A Turma selecionada não possuí aluno Cadastrado...')
   else
   begin
      Screen.Cursor:= crSQLWait;

      // Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
         OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      // Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      Calc        := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, VarArrayCreate([0, - 1], varVariant));
      Sheets      := Calc.Sheets;
      Sheet       := Sheets.getByIndex(0);

      // Preenchendo as Colunas


      VS_Linha:= 'RELATÓRIO DE FALTAS DO AL '+Trim(IBQuery_ListaFaltasPorAlunos.FieldByName('identidade').AsString)+' '+
                  Trim(IBQuery_ListaFaltasPorAlunos.FieldByName('NomeCompleto').AsString)+' '+
                  '('+Trim(IBQuery_ListaFaltasPorAlunos.FieldByName('NomeGuerra').AsString)+') ';

      Sheet.getCellByPosition(0,0).setString(VS_Linha);

      Sheet.getCellByPosition(0,2).setString('DATA');
      Sheet.getCellByPosition(1,2).setString('FALTAS');
      Sheet.getCellByPosition(2,2).setString('DISCIPLINA');
      Sheet.getCellByPosition(3,2).setString('TEMPO');

      Query_RelacaoAlunos.Open;

      i:= 3;
      VI_Faltas:= 0;
      Query_RelacaoAlunos.First;
      while not Query_RelacaoAlunos.eof do
      begin
         VS_Tempo:= '';

         IBTable_Faltas.First;
         While not IBTable_Faltas.Eof do
         begin
            VS_Tempo:= VS_Tempo + trim(IBTable_Faltas.FieldByName('Tempo').AsString)+'-';
            IBTable_Faltas.Next;
         end;
         VS_Tempo:= copy(VS_Tempo, 1, length(VS_Tempo)-1);

         VI_Faltas:= VI_Faltas + Query_RelacaoAlunos.FieldByName('Qtd_Faltas').AsInteger;

         Sheet.getCellByPosition(0,i).SetString(Query_RelacaoAlunos.FieldByName('DataChamada').AsString);
         Sheet.getCellByPosition(1,i).SetString(Query_RelacaoAlunos.FieldByName('Qtd_Faltas').AsString);
         Sheet.getCellByPosition(2,i).SetString(Query_RelacaoAlunos.FieldByName('CodMateria').AsString);
         Sheet.getCellByPosition(3,i).SetString(VS_Tempo);

         i:= i+1;
         Query_RelacaoAlunos.Next;
      end;
      i:= i+3;

      VS_Linha:= 'TOTAL DE FALTAS: '+
                  trim(IBQuery_ListaFaltasPorAlunos.FieldByName('QTD_FALTAS').AsString)+
                  ' TEMPOS TOTAIS : '+
                  Trim(IBQuery_ListaFaltasPorAlunos.FieldByName('Tempo_espec').AsString)+
                  ' PORCENTAGEM: '+Formatfloat('##0.00', IBQuery_ListaFaltasPorAlunos.FieldByName('por_falta').AsFloat)+'%';

      Sheet.getCellByPosition(0,i).setString(VS_Linha);

      i:= i+2;
      Sheet.getCellByPosition(0,i).setString('DISCIPLINA');
      Sheet.getCellByPosition(1,i).setString('DTDE');
      Sheet.getCellByPosition(2,i).setString('DTDE');
      Sheet.getCellByPosition(3,i).setString('%');
      Sheet.getCellByPosition(4,i).setString('%');
      i:= i+1;
      Sheet.getCellByPosition(0,i).setString('');
      Sheet.getCellByPosition(1,i).setString('TEMPOS TOTAIS');
      Sheet.getCellByPosition(2,i).setString('FALTAS');
      Sheet.getCellByPosition(3,i).setString('DISCIPLINA');
      Sheet.getCellByPosition(4,i).setString('GERAL');
      i:= i+1;

      VI_Tempo:= 0;
      VF_Porcentagem:= 0.00;

      IBQuery_Faltas_Aluno.First;
      while not IBQuery_Faltas_Aluno.eof do
      begin
         VS_Tempo:= '';

         Sheet.getCellByPosition(0,i).SetString(IBQuery_Faltas_Aluno.FieldByName('CodMateria').AsString);
         Sheet.getCellByPosition(1,i).SetString(IBQuery_Faltas_Aluno.FieldByName('Tempo_disciplina').AsString);
         Sheet.getCellByPosition(2,i).SetString(Formatfloat('##0.00', IBQuery_Faltas_Aluno.FieldByName('Qtd_Faltas').AsInteger));
         Sheet.getCellByPosition(3,i).SetString(Formatfloat('##0.00', IBQuery_Faltas_Aluno.FieldByName('Por_dis').AsInteger));
         Sheet.getCellByPosition(4,i).SetString(Formatfloat('##0.00', IBQuery_Faltas_Aluno.FieldByName('Por_Geral').AsFloat));

         VI_Tempo:= VI_Tempo + IBQuery_Faltas_Aluno.FieldByName('Tempo_disciplina').AsInteger;
         VF_Porcentagem:= VF_Porcentagem + IBQuery_Faltas_Aluno.FieldByName('Por_dis').AsFloat;

         i:= i+1;
         IBQuery_Faltas_Aluno.Next;
      end;

      Sheet.getCellByPosition(0,i).SetString('Total');
      Sheet.getCellByPosition(1,i).SetString(Formatfloat('###0', VI_Tempo));
      Sheet.getCellByPosition(3,i).SetString(Formatfloat('##0.00', VF_Porcentagem));


      Screen.Cursor:= crDefault;
   end;

end;

procedure TForm_MenuPrincipal.DBGrid_Faltas_TurmaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   DBGrid_Faltas_Turma.Canvas.Font.Color:= clBlack;

   if (IBQuery_Faltas_Turma.FieldByName('Por_Falta').AsString = '') then
      DBGrid_Faltas_Turma.Canvas.Brush.Color:= $00FAEBDE
   else
   begin
      if (RoundTo(IBQuery_Faltas_Turma.FieldByName('Por_Falta').AsFloat, -2) >= 10) then   //10  - V\ermelho
         DBGrid_Faltas_Turma.Canvas.Brush.Color:= clRed
      else
      begin
         if (RoundTo(IBQuery_Faltas_Turma.FieldByName('Por_Falta').AsFloat, -2) >= 8) then   //8  - Amarelo
            DBGrid_Faltas_Turma.Canvas.Brush.Color := $002FFFF4
         else
            if (RoundTo(IBQuery_Faltas_Turma.FieldByName('Por_Falta').AsFloat, -2) >= 5) then   //5 -Verde
               DBGrid_Faltas_Turma.Canvas.Brush.Color:= $0040FF00
            else
               DBGrid_Faltas_Turma.Canvas.Brush.Color:= $00FAEBDE;
      end;
   end;

  if gdSelected in State then
    DBGrid_Faltas_Turma.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Faltas_Turma.Canvas.FillRect(Rect);
   DBGrid_Faltas_Turma.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;


procedure TForm_MenuPrincipal.BitBtn2Click(Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet: Variant;
   Connect, OpenOffice : Variant;

   VS_Linha, VS_Tempo: String;

   i, VI_Faltas, VI_Tempo: Integer;
   VF_Porcentagem: Real;
begin
   if IBQuery_Faltas_Turma.RecordCount = 0 then
      ShowMessage('BROffice'+#13+#13+'A Turma selecionada não possuí aluno Cadastrado...')
   else
   begin
      Screen.Cursor:= crSQLWait;

      // Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
         OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      // Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      Calc        := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, VarArrayCreate([0, - 1], varVariant));
      Sheets      := Calc.Sheets;
      Sheet       := Sheets.getByIndex(0);

      // Preenchendo as Colunas

      Sheet.getCellByPosition(0,2).setString('CODCURSO');
      Sheet.getCellByPosition(1,2).setString('SÉRIE');
      Sheet.getCellByPosition(2,2).setString('MILHÃO');
      Sheet.getCellByPosition(3,2).setString('ESPECIALIDADE');
      Sheet.getCellByPosition(4,2).setString('NOME GUERRA');
      Sheet.getCellByPosition(5,2).setString('FALTAS');
      Sheet.getCellByPosition(6,2).setString('%');

      i:= 3;
      VI_Faltas:= 0;
      IBQuery_Faltas_Turma.First;
      while not IBQuery_Faltas_Turma.eof do
      begin
         Sheet.getCellByPosition(0,i).SetString(IBQuery_Faltas_Turma.FieldByName('CodCurso').AsString);
         Sheet.getCellByPosition(1,i).SetString(IBQuery_Faltas_Turma.FieldByName('Serie').AsString);
         Sheet.getCellByPosition(2,i).SetString(IBQuery_Faltas_Turma.FieldByName('identidade').AsString);
         Sheet.getCellByPosition(3,i).SetString(IBQuery_Faltas_Turma.FieldByName('especialidade').AsString);
         Sheet.getCellByPosition(4,i).SetString(IBQuery_Faltas_Turma.FieldByName('nomeguerra').AsString);
         Sheet.getCellByPosition(5,i).SetString(IBQuery_Faltas_Turma.FieldByName('qtd_faltas').AsString);
         Sheet.getCellByPosition(6,i).SetString(Formatfloat('##0.00', IBQuery_Faltas_Turma.FieldByName('por_falta').AsFloat));

         i:= i+1;
         IBQuery_Faltas_Turma.Next;
      end;

      Screen.Cursor:= crDefault;
   end;
end;

end.
