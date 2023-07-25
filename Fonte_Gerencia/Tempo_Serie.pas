unit Tempo_Serie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, Grids, DBGrids,
  JvEdit, JvLookOut, JvComponent, JvxCtrls, ExtCtrls, JvShape, ComCtrls, Rotinas,
  ToolWin, DBCtrls, JvGradient, JvTransBtn, IBTable;

type
  TForm_Tempo_Serie = class(TForm)
    Panel_Treeviw: TPanel;
    DBGrid_Tempo_Serie: TDBGrid;
    IBQuery_Tempo_Serie: TIBQuery;
    DSQ_Tempo_Serie: TDataSource;
    IBQuery_Tempo_SerieIDCURSO: TSmallintField;
    IBQuery_Tempo_SerieIDTURMA: TIntegerField;
    IBQuery_Tempo_SerieSERIE: TIBStringField;
    IBQuery_Tempo_SerieTEMPO: TIntegerField;
    IBQuery_Tempo_SerieESPECIALIDADE: TIBStringField;
    IBTable_Tempo_Serie: TIBTable;
    DST_Tempo_serie: TDataSource;
    Panel_Botoes_Cadastro: TPanel;
    JvShape19: TJvShape;
    JvTransparentButton_Inserir: TJvTransparentButton;
    JvShape20: TJvShape;
    JvTransparentButton_Alterar: TJvTransparentButton;
    JvShape21: TJvShape;
    JvTransparentButton_Exclui: TJvTransparentButton;
    JvShape2: TJvShape;
    JvShape3: TJvShape;
    JvTransparentButton_Fechar: TJvTransparentButton;
    JvShape4: TJvShape;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvShape5: TJvShape;
    JvTransparentButton_Atualizar: TJvTransparentButton;
    DBNavigator1: TDBNavigator;
    Panel_cadastro: TPanel;
    JvGradient_Tela01: TJvGradient;
    JvShape_AdicionarItem: TJvShape;
    JvTransparentButton_Grava: TJvTransparentButton;
    JvShape_Cancelar: TJvShape;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    DBComboBox_especialidade: TDBComboBox;
    Label4: TLabel;
    Label_Tempo: TLabel;
    IBTable_Tempo_SerieIDCURSO: TSmallintField;
    IBTable_Tempo_SerieIDTURMA: TIntegerField;
    IBTable_Tempo_SerieSERIE: TIBStringField;
    IBTable_Tempo_SerieESPECIALIDADE: TIBStringField;
    IBTable_Tempo_SerieTEMPO: TIntegerField;
    Panel_Informacoes: TPanel;
    JvShape1: TJvShape;
    Label_Curso: TLabel;
    Label_Turma: TLabel;
    Label_Serie: TLabel;
    DBText_Tempo: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_FecharClick(Sender: TObject);
    procedure JvTransparentButton_AtualizarClick(Sender: TObject);
    procedure JvTransparentButton_InserirClick(Sender: TObject);
    procedure JvTransparentButton_AlterarClick(Sender: TObject);
    procedure JvTransparentButton_ExcluiClick(Sender: TObject);
    procedure JvTransparentButton_GravaClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(
      Sender: TObject);
  private    { Private declarations }
     VS_opcao: String;
  public
    { Public declarations }
  end;

var
  Form_Tempo_Serie: TForm_Tempo_Serie;

implementation

uses Data_Module, MenuPrincipal;

{$R *.dfm}

procedure TForm_Tempo_Serie.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   Panel_cadastro.Enabled:= False;
   DBGrid_Tempo_Serie.Enabled:= True;
   Panel_Botoes_Cadastro.Enabled:= True;

   Label_Curso.Caption:= 'Código do Curso: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString;
   Label_Turma.Caption:= 'Código da Turma: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Turma').AsString;
   Label_Serie.Caption:= 'Série: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsString;


   //---- Carga da lista de especialidade

   VS_Comando:= 'Select distinct especialidade From pessoa ';
   Funcoes.OpenQuery(VS_Comando);

   DBComboBox_especialidade.Text:= '';
   DBComboBox_Especialidade.Items.Clear;
   DM.Query_Executa.First;
   While not DM.Query_Executa.eof do
   begin
      DBComboBox_Especialidade.Items.add(DM.Query_Executa.FieldByName('especialidade').AsString);
      DM.Query_Executa.Next;
   end;

   IBQuery_Tempo_Serie.Open;
   IBTable_Tempo_Serie.Open;

   if IBQuery_Tempo_Serie.FieldByName('especialidade').AsString = '' then
   begin
      VS_Comando:= 'select distinct p.especialidade '+
                   ' From alunoturma a, pessoa p '+
                   ' where a.idcurso = '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+
                   ' and   a.idturma = '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('idturma').AsString+
                   ' and   a.serie = '+#39+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('serie').AsString+#39+
                   ' and   a.identidade = p.identidade '+
                   ' order by p.especialidade ';
      Funcoes.OpenQuery(VS_Comando);

      DM.Query_Executa.First;
      While not DM.Query_Executa.eof do
      begin
         VS_Comando:= ' INSERT INTO Tempo_especialidade (idcurso, idturma, serie, especialidade, tempo ) '+
                      ' VALUES ( '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString+', '+
                                   Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('idturma').AsString+', '+
                                   #39+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('serie').AsString+#39+', '+
                                   #39+DM.Query_Executa.FieldByNAme('especialidade').AsString+#39+', '+
                                   ' 1 '+
                               ')';
         Funcoes.ExecusaoQuery(VS_Comando);

         DM.Query_Executa.Next;
      end;
      Funcoes.AtualizaQuery(IBQuery_Tempo_Serie);
   end;
end;

procedure TForm_Tempo_Serie.JvTransparentButton_AtualizarClick( Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_Tempo_Serie);
end;


procedure TForm_Tempo_Serie.JvTransparentButton_FecharClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Tempo_Serie.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Tempo_Serie.JvTransparentButton_InserirClick(Sender: TObject);
begin
   VS_opcao:= 'Inserir';

   Panel_cadastro.Enabled:= True;
   DBGrid_Tempo_Serie.Enabled:= False;
   Panel_Botoes_Cadastro.Enabled:= False;

   IBTable_Tempo_Serie.Append;

   IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 659;
   DBText_Tempo.Text:= '659';

   if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString = 'CFS' then
   begin
     if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsInteger = 1 then
     begin
        IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 643;
        DBText_Tempo.Text:= '643';
     end
     else
     begin
        if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsInteger = 2 then
        begin
           IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 665;
           DBText_Tempo.Text:= '665';
        end
        else
        begin
           if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsInteger = 3 then
           begin
              IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 624;
              DBText_Tempo.Text:= '624';
           end
           else
           begin
              if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsInteger = 4 then
              begin
                 IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 603;
                 DBText_Tempo.Text:= '603';
              end;
           end;
        end;
     end;
   end
   else
   begin
      if Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString = 'EAGS' then
      begin
         IBTable_Tempo_Serie.FieldByName('Tempo').AsInteger:= 659;
         DBText_Tempo.Text:= '659';
      end;
   end;

   DBComboBox_especialidade.SetFocus

end;

procedure TForm_Tempo_Serie.JvTransparentButton_AlterarClick(Sender: TObject);
begin
   if IBQuery_Tempo_Serie.FieldByName('IdCurso').AsString = '' then
   begin
       ShowMessage('Não foi selecionado especialidade....');
       DBGrid_Tempo_Serie.SetFocus;
   end
   else
   begin
      VS_opcao:= 'Alterar';
      Panel_cadastro.Enabled:= True;
      DBGrid_Tempo_Serie.Enabled:= False;
      Panel_Botoes_Cadastro.Enabled:= False;

      IBTable_Tempo_Serie.Edit;
      DBText_Tempo.SetFocus
   end;
end;

procedure TForm_Tempo_Serie.JvTransparentButton_ExcluiClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   if IBQuery_Tempo_Serie.FieldByName('IdCurso').AsString = '' then
   begin
       ShowMessage('Não foi selecionado especialidade....');
       DBGrid_Tempo_Serie.SetFocus;
   end
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a especialidade selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         IBTable_Tempo_Serie.Delete;
         Funcoes.ExecutaTransacao;

         Funcoes.AtualizaQuery(IBQuery_Tempo_Serie);
      end;
   end;
end;

procedure TForm_Tempo_Serie.JvTransparentButton_GravaClick( Sender: TObject);
begin
   if DBComboBox_especialidade.Text = '' then
   begin
      ShowMessage( 'A Especialidade não pode ser branco...');
      DBComboBox_especialidade.SetFocus
   end
   else
   begin
      if DBText_Tempo.Text = '' then
      begin
         ShowMessage( 'O tempo não pode ser branco...');
         DBText_Tempo.SetFocus;
      end
      else
      begin
         Panel_cadastro.Enabled:= False;
         DBGrid_Tempo_Serie.Enabled:= True;
         Panel_Botoes_Cadastro.Enabled:= True;

         IBTable_Tempo_Serie.FieldByNAme('IdCurso').AsString:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('IdCurso').AsString;
         IBTable_Tempo_Serie.FieldByNAme('IdTurma').AsString:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('IdTurma').AsString;
         IBTable_Tempo_Serie.FieldByNAme('Serie').AsString:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsString;

         IBTable_Tempo_Serie.Post;
         Funcoes.ExecutaTransacao;
         Funcoes.AtualizaQuery(IBQuery_Tempo_Serie);

         if VS_opcao = 'Alterar' then
         begin
            Panel_cadastro.Enabled:= False;
            DBGrid_Tempo_Serie.Enabled:= True;
            Panel_Botoes_Cadastro.Enabled:= True;

            DBGrid_Tempo_Serie.SetFocus;
         end
         else
         begin
            JvTransparentButton_InserirClick(Sender);
         end;
      end;
   end;

end;

procedure TForm_Tempo_Serie.JvTransparentButton_CancelarClick(
  Sender: TObject);
begin
   Panel_cadastro.Enabled:= False;
   DBGrid_Tempo_Serie.Enabled:= True;
   Panel_Botoes_Cadastro.Enabled:= True;

   IBTable_Tempo_Serie.Cancel;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(IBQuery_Tempo_Serie);
   DBGrid_Tempo_Serie.SetFocus;

end;

end.
