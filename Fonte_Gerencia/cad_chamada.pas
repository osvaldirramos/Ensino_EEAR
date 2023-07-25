unit cad_chamada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Rotinas,
  JvComponent, JvxCtrls, JvShape, ComCtrls, ToolWin, JvTransBtn, JvToolEdit,
  DB, IBCustomDataSet, IBTable, IBQuery, ImgList, JvCaptionPanel, ComObj;

type
  TForm_Cad_Chamada = class(TForm)
    ToolBar_Menu: TToolBar;
    Windows: TToolButton;
    ToolButton3: TToolButton;
    Panel_Curso: TPanel;
    JvShape1: TJvShape;
    Label_Curso: TLabel;
    Panel_Inserir_Chamada: TPanel;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    ComboBox_Disciplina: TComboBox;
    GroupBox3: TGroupBox;
    ComboBox_Tempo: TComboBox;
    GroupBox5: TGroupBox;
    JvDateEdit_Aplicacao: TJvDateEdit;
    JvShape2: TJvShape;
    JvTransparentButton_CancelaChamada: TJvTransparentButton;
    GroupBox_Especialidade: TGroupBox;
    ComboBox_Especialidade: TComboBox;
    IBTable_Chamada: TIBTable;
    DST_InstrutorTurma: TDataSource;
    IBTable_ChamadaIDCHAMADA: TIntegerField;
    IBTable_ChamadaIDALUNO: TIntegerField;
    IBTable_ChamadaIDINSTRUTOR: TIntegerField;
    IBTable_ChamadaIDDISCIPLINA: TIntegerField;
    IBTable_ChamadaDATACHAMADA: TDateTimeField;
    IBTable_ChamadaPRESENCA: TIBStringField;
    IBTable_ChamadaTEMPO: TIBStringField;
    IBTable_ChamadaOBSERVACAO: TIBStringField;
    Query_Chamada: TIBQuery;
    DSQ_Chamada: TDataSource;
    ImageList_SituacaoItem: TImageList;
    IBTable_TratarChamada: TIBTable;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    DateTimeField1: TDateTimeField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    DST_TratarChamada: TDataSource;
    IBQuery_ChamadaRealizada: TIBQuery;
    DST_ChamadaRealizada: TDataSource;
    IBQuery_ChamadaRealizadaCODMATERIA: TIBStringField;
    IBQuery_ChamadaRealizadaTEMPO: TIBStringField;
    IBQuery_ChamadaRealizadaDATACHAMADA: TDateTimeField;
    Panel_Chamadas: TPanel;
    Panel_Opcoes_Chamada: TPanel;
    Panel_Relacao_Chamadas: TPanel;
    DBGrid_Relacao_Chamada: TDBGrid;
    Label_Turma: TLabel;
    ToolButton_Fechar: TToolButton;
    SpeedButton_Excluir: TSpeedButton;
    Label1: TLabel;
    IBQuery_ChamadaRealizadaIDCURSO: TSmallintField;
    IBQuery_ChamadaRealizadaIDTURMA: TIntegerField;
    Label_Serie: TLabel;
    Query_ChamadaIDCHAMADA: TIntegerField;
    Query_ChamadaIDALUNO: TIntegerField;
    Query_ChamadaIDINSTRUTOR: TIntegerField;
    Query_ChamadaIDDISCIPLINA: TIntegerField;
    Query_ChamadaTEMPO: TIBStringField;
    Query_ChamadaDATACHAMADA: TDateTimeField;
    Query_ChamadaPRESENCA: TIBStringField;
    Query_ChamadaOBSERVACAO: TIBStringField;
    Query_ChamadaCODIGOALUNO: TIntegerField;
    Query_ChamadaNOMEGUERRA: TIBStringField;
    Query_ChamadaNOMECOMPLETO: TIBStringField;
    IBQuery_ChamadaRealizadaIDCHAMADA: TIntegerField;
    ComboBox_Sel_Disciplina: TComboBox;
    ComboBox_Sel_Tempo: TComboBox;
    JvDateEdit_Sel_Data: TJvDateEdit;
    SpeedButton_InserirChamada: TSpeedButton;
    SpeedButton_AlterarChamada: TSpeedButton;
    JvShape3: TJvShape;
    JvTransparentButton_GeraListaChamada: TJvTransparentButton;
    SpeedButton_Relacao_Em_Excel: TSpeedButton;
    SpeedButton_RelacaoFaltasBROffice: TSpeedButton;
    IBQuery_ChamadaRealizadaSERIE: TIBStringField;
    Panel_ListaAlunosChamada: TPanel;
    Panel7: TPanel;
    MaskEdit_Nome_Guerra: TMaskEdit;
    DBNavigator1: TDBNavigator;
    DBGrid_Chamada: TDBGrid;
    MaskEdit_Nome_Completo: TMaskEdit;
    MaskEdit_Milhao: TMaskEdit;
    Panel_Tratar_Chamada: TPanel;
    SpeedButton_RegistrarFalta: TSpeedButton;
    SpeedButton_FinalizarChamada: TSpeedButton;
    SpeedButton_RegistrarPresenca: TSpeedButton;
    Label_Obs: TLabel;
    ComboBox_Observacao: TComboBox;
    SpeedButton_Reposicao: TSpeedButton;

    procedure Carga_ComboBox_Sel_Disciplina;

    procedure WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton_SolPDFClick(Sender: TObject);
    procedure DBGrid_SelecionaAlunoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ChamadaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton_RegistrarFaltaClick(Sender: TObject);
    procedure SpeedButton_FinalizarChamadaClick(Sender: TObject);
    procedure Especialidade;
    procedure ToolButton_FecharClick(Sender: TObject);
    procedure ComboBox_DisciplinaChange(Sender: TObject);
    procedure Query_ChamadaAfterScroll(DataSet: TDataSet);
    procedure SpeedButton_ExcluirClick(Sender: TObject);
    procedure SpeedButton_InserirChamadaClick(Sender: TObject);
    procedure JvTransparentButton_CancelaChamadaClick(Sender: TObject);
    procedure SpeedButton_AlterarChamadaClick(Sender: TObject);
    procedure ComboBox_Sel_DisciplinaChange(Sender: TObject);
    procedure SpeedButton_Relacao_Em_ExcelClick(Sender: TObject);
    procedure SpeedButton_RelacaoFaltasBROfficeClick(Sender: TObject);
    procedure MaskEdit_MilhaoChange(Sender: TObject);
    procedure DBGrid_ChamadaDblClick(Sender: TObject);
    procedure SpeedButton_ReposicaoClick(Sender: TObject);
    procedure IBQuery_ChamadaRealizadaAfterScroll(DataSet: TDataSet);

  private    { Private declarations }
     VS_Opcao, VS_IdCurso, VS_IdTurma, VS_Serie, VS_IdDisciplina, VS_IdChamada, VS_Data: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_Chamada: TForm_Cad_Chamada;

implementation

uses Data_Module, Abertura, MenuPrincipal;

{$R *.dfm}

procedure TForm_Cad_Chamada.FormActivate(Sender: TObject);
var
    VS_Comando: String;
begin
   DM.Query_Usuario.Open;
   IBQuery_ChamadaRealizada.Open;

   ToolBar_Menu.Enabled:= True;
   Panel_ListaAlunosChamada.Visible:= True;
   Panel_Chamadas.Visible:= True;
   Panel_Tratar_Chamada.Visible:= False;
   Panel_Inserir_Chamada.Visible:= False;
   Panel_Chamadas.Visible:= True;

   //   DBGrid_Chamada.Visible:= False;

   Label_Curso.Caption:= 'Código do Curso: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString;
   Label_Turma.Caption:= 'Código da Turma: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Turma').AsString;
   Label_Serie.Caption:= 'Série: '+Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Serie').AsString;

   VS_idcurso:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByName('IdCurso').AsString;
   VS_IdTurma:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByName('idturma').AsString;
   VS_Serie:= Form_MenuPrincipal.IBQuery_MontaTurma.FieldByName('Serie').AsString;

    //---
   //--- Tratamento para montar o combobox de Disciplina

   VS_Comando:= 'select codmateria|| '+#39+' - '+#39+' ||nomemateria as disciplina '+
                ' From disciplina where idcurso = '+vs_idcurso+
                ' and idturma = '+vs_idturma+
                ' order by codmateria';

   Funcoes.OpenQuery(VS_Comando);
   ComboBox_Disciplina.Items.Clear;

   DM.Query_Executa.First;
   ComboBox_Disciplina.Text:= '';
   While not DM.Query_Executa.Eof do
   begin
      ComboBox_Disciplina.Items.Add(DM.Query_Executa.FieldByName('disciplina').AsString);
      DM.Query_Executa.next;
   end;

   Query_Chamada.Open;
   IBTable_TratarChamada.Open;

    //---
   //--- Tratamento para montar o combobox de Especialidade para o filtro de chamadas

   Especialidade;

    //---
   //--- Tratamento para montar o combobox de Disciplina para o filtro de chamadas

   Carga_ComboBox_Sel_Disciplina;
end;



procedure TForm_Cad_Chamada.WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Cad_Chamada.JvTransparentButton_SolPDFClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if ComboBox_Disciplina.Text = '' then
   begin
      ShowMessage('Informe a disciplina da chamada...');
      ComboBox_Disciplina.SetFocus;
   end
   else
   begin
     if ComboBox_Tempo.Text = '' then
     begin
        ShowMessage('Informe a tempo da chamada...');
        ComboBox_Tempo.SetFocus;
     end
     else
     begin
        if JvDateEdit_Aplicacao.Text = '  /  /    ' then
        begin
           ShowMessage('Informe a data da chamada...');
           JvDateEdit_Aplicacao.SetFocus;
        end
        else
        begin
           Panel_ListaAlunosChamada.Visible:= True;
           SpeedButton_RegistrarPresenca.Visible:= False;
           SpeedButton_RegistrarFalta.Visible:= True;

             //---
            //--- Determinar o mair idchamada

            VS_Comando:= 'select max(idchamada) +1 as IdChamada from chamada';
            Funcoes.OpenQuery(VS_Comando);

            if DM.Query_Executa.FieldByName('IdChamada').AsString  = '' then
               VS_IdChamada:= '1'
            else
               VS_IdChamada:= DM.Query_Executa.FieldByName('IdChamada').AsString;

             //---
            //--- Determinar Data da chamada

            if Funcoes.ValidarData(JvDateEdit_Aplicacao.Text) = True then
            begin
               VS_Data:= Funcoes.DePara(JvDateEdit_Aplicacao.Text, '/', '.');
               VS_Data:= VS_Data+' 00:00:00';
            end;

             //----
            //--- Acha o codigo da disciplina

            VS_Comando:= 'select IdDisciplina '+
                         ' From disciplina '+
                         ' where idcurso = '+vs_idcurso+
                         ' and idturma = '+vs_idturma+
                         ' and codmateria = '+#39+trim(copy(ComboBox_Disciplina.Text, 1, 5))+#39;
            Funcoes.OpenQuery(VS_Comando);
            VS_IdDisciplina:= DM.Query_Executa.FieldByName('IdDisciplina').AsString;

             //---
            //--- Monta a relação de aluno

            if VS_IdDisciplina = '' then
            begin
               ShowMEssage('Verifica se a informações da relação de disciplinas esta correta estão corretas....');
            end
            else
            begin
                //----
               //--- Verifica se a chamada ja foi cadastrada

               VS_Comando:= ' select count(1) as Qtd From chamada c '+
                            ' where c.iddisciplina = '+VS_IdDisciplina+
                            ' and   tempo = '+#39+ComboBox_Tempo.Text+#39+
                            ' and   DataChamada = '#39+VS_Data+#39;

               Funcoes.OpenQuery(VS_Comando);

               if DM.Query_Executa.FieldByName('Qtd').AsInteger > 0 then
               begin
                  ShowMessage('Existe chamada cadastrada com estas informações '+#13+
                              'Disciplina: '+trim(copy(ComboBox_Disciplina.Text, 1, 5))+' '+#13+
                              'Tempo: '+ComboBox_Tempo.Text+' '+#13+
                              'Data: '+JvDateEdit_Aplicacao.Text+#13+
                              '...');
                  ComboBox_Disciplina.SetFocus;
               end
               else
               begin
                  if  ComboBox_Especialidade.text = '' then
                  begin
                     VS_Comando:= 'select a.idaluno From alunoturma a, pessoa p where a.identidade = p.identidade and idcurso = '+vs_idcurso+' and idturma = '+vs_idturma+' order by nomecompleto';
                  end
                  else
                  begin
                     VS_Comando:= 'select a.idaluno From alunoturma a, pessoa p where a.identidade = p.identidade and a.idcurso = '+vs_idcurso+' and a.idturma = '+vs_idturma+' and p.Especialidade = '+#39+ComboBox_Especialidade.text+#39+' order by nomecompleto';
                  end;

                  Funcoes.OpenQuery(VS_Comando);
                  DM.Query_Executa.First;
                  While not DM.Query_Executa.Eof do
                  begin
                    // VS_Comando:= 'Insert into chamada (IdChamada, IdAluno, IdInstrutor, IdDisciplina, tempo, DataChamada, Presenca, observacao) '+
                    //              ' values ('+
                    //                   VS_IdChamada+', '+
                    //                   DM.Query_Executa.FieldByName('idaluno').AsString+', '+
                    //                   Funcoes.GetIdUsuario+', '+
                    //                   VS_IdDisciplina+', '+
                    //                   #39+ComboBox_Tempo.Text+#39+', '+
                    //                   #39+VS_Data+#39+', '+
                    //                   #39+'P'+#39+', '+
                    //                   #39+''+#39+
                     //             ')';

                     VS_Comando:= 'Insert into chamada (IdChamada, IdAluno, IdInstrutor, IdDisciplina, tempo, DataChamada, Presenca, observacao) '+
                                  ' values ('+
                                       VS_IdChamada+', '+
                                       DM.Query_Executa.FieldByName('idaluno').AsString+', '+
                                       '1 , '+
                                       VS_IdDisciplina+', '+
                                       #39+ComboBox_Tempo.Text+#39+', '+
                                       #39+VS_Data+#39+', '+
                                       #39+'P'+#39+', '+
                                       #39+''+#39+
                                  ')';

                     Funcoes.ExecusaoQuery(VS_Comando);
                     DM.Query_Executa.Next;
                  end;

                  //----
                  //---- Tratamento para mostrar a relacao de alunos

                  VS_Comando:= ' select c.idchamada, c.idaluno, c.idinstrutor, c.iddisciplina, c.tempo, c.datachamada, c.presenca, c.observacao, '+
                               '       a.codigoaluno, p.nomeguerra, p.nomecompleto '+
                               ' from chamada c, alunoturma a, pessoa p '+
                               ' where c.idaluno = a.idaluno '+
                               ' and   a.identidade = p.identidade '+
                               ' and   c.idchamada = '+VS_IdChamada;

                  ToolBar_Menu.Enabled:= False;
                  Panel_Inserir_Chamada.Enabled:= False;

//                  Panel_Chamadas.Visible:= False;
                  Panel_Tratar_Chamada.Visible:= True;
//                  DBGrid_Chamada.Visible:= True;

                  Funcoes.ExecutaQuery(Query_Chamada, VS_Comando);
                  IBTable_TratarChamada.Open;

             end;
          end;
       end;
    end;
  end;

end;

procedure TForm_Cad_Chamada.JvTransparentButton_CancelaChamadaClick(Sender: TObject);
begin
   Funcoes.AtualizaQuery(IBQuery_ChamadaRealizada);
   Panel_Opcoes_Chamada.Visible:= True;
   Panel_Relacao_Chamadas.Enabled:= True;


   ToolBar_Menu.Enabled:= True;
   Panel_ListaAlunosChamada.Visible:= True;
   Panel_Chamadas.Visible:= True;
   Panel_Inserir_Chamada.Visible:= False;
   DBGrid_Relacao_Chamada.SetFocus;
end;



procedure TForm_Cad_Chamada.DBGrid_SelecionaAlunoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
  Icon := TBitmap.Create;
  if (Column.FieldName = 'PRESENCA') then
  begin
    with DBGrid_Chamada.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(Rect);
      if ((Query_Chamada.FieldByName('Presenca').AsString = '' )) then
         ImageList_SituacaoItem.GetBitmap(0, Icon)
      else
         if trim(Query_Chamada.FieldByName('Presenca').AsString) = 'P' then
            ImageList_SituacaoItem.GetBitmap(3, Icon)
         else
            ImageList_SituacaoItem.GetBitmap(1, Icon);
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;
end;

procedure TForm_Cad_Chamada.DBGrid_ChamadaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  Icon: TBitmap;
begin
  Icon := TBitmap.Create;

  if (Column.FieldName = 'PRESENCA') then
  begin
    with DBGrid_Chamada.Canvas do
    begin
      FillRect(Rect);
      if ((Query_Chamada.FieldByName('Presenca').AsString = '' )) then
      begin
         Brush.Color := $0097CBFF;
         ImageList_SituacaoItem.GetBitmap(2, Icon)
      end
      else
      begin
         if trim(Query_Chamada.FieldByName('Presenca').AsString) = 'P' then
         begin
            Brush.Color := $0097CBFF;
            ImageList_SituacaoItem.GetBitmap(0, Icon)
         end
         else
         begin
            Brush.Color := $008A8AFF;
            ImageList_SituacaoItem.GetBitmap(1, Icon);
         end;
      end;
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;

end;


procedure TForm_Cad_Chamada.SpeedButton_RegistrarFaltaClick(Sender: TObject);
begin
   IBTable_TratarChamada.Edit;
   if Query_Chamada.FieldByName('Presenca').AsString = 'P' then
   begin
      IBTable_TratarChamada.FieldByName('Presenca').AsString:= 'F';
      IBTable_TratarChamada.FieldByName('Observacao').AsString:= ComboBox_Observacao.Text;
   end
   else
   begin
      IBTable_TratarChamada.FieldByName('Presenca').AsString:= 'P';
      IBTable_TratarChamada.FieldByName('Observacao').AsString:= '';
   end;
   IBTable_TratarChamada.Post;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(Query_Chamada);
end;


procedure TForm_Cad_Chamada.SpeedButton_FinalizarChamadaClick(Sender: TObject);
begin

   Funcoes.AtualizaQuery(IBQuery_ChamadaRealizada);

   if VS_Opcao = 'Inserir' then
   begin
      Panel_ListaAlunosChamada.Visible:= False;

      Panel_Inserir_Chamada.Visible:= True;
      Panel_Inserir_Chamada.Enabled:= True;

      ComboBox_Disciplina.SetFocus;
   end
   else
   begin
      Panel_Tratar_Chamada.Visible:= False;
      Panel_Chamadas.Enabled:= True;
      ToolBar_Menu.Enabled:= True;
      Panel_ListaAlunosChamada.Visible:= True;
      Panel_Chamadas.Visible:= True;
      Panel_Inserir_Chamada.Visible:= False;
      DBGrid_Relacao_Chamada.SetFocus;
   end;

end;


procedure TForm_Cad_Chamada.Especialidade;
var
   VS_Comando: String;
begin
    //---
   //--- Tratamento para montar o combobox de Disciplina

   ComboBox_Especialidade.Items.Clear;

   VS_Comando:= 'select distinct especialidade '+
                ' From disciplina '+
                ' where idcurso = '+vs_idcurso+
                ' and   idturma = '+vs_idturma+
                ' and   serie = '+#39+VS_Serie+#39;

   Funcoes.OpenQuery(VS_Comando);

   DM.Query_Executa.First;
   ComboBox_Especialidade.Text:= '';
   ComboBox_Especialidade.Items.Add('');
   While not DM.Query_Executa.Eof do
   begin
      ComboBox_Especialidade.Items.Add(DM.Query_Executa.FieldByName('especialidade').AsString);
      DM.Query_Executa.next;
   end;


end;

procedure TForm_Cad_Chamada.ToolButton_FecharClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_Cad_Chamada.ComboBox_DisciplinaChange(Sender: TObject);
begin
   Especialidade;
end;

procedure TForm_Cad_Chamada.Query_ChamadaAfterScroll(DataSet: TDataSet);
begin
//   ComboBox_Observacao.Visible:= False;
//   Label_Obs.Visible:= False;
   SpeedButton_Reposicao.Visible:= False;
   if ((Query_Chamada.FieldByName('Presenca').AsString = '' )) then
   begin
      SpeedButton_RegistrarPresenca.Visible:= False;
      SpeedButton_RegistrarFalta.Visible:= True;
   end
   else
   begin
      if trim(Query_Chamada.FieldByName('Presenca').AsString) = 'P' then
      begin
         SpeedButton_RegistrarPresenca.Visible:= False;
         SpeedButton_RegistrarFalta.Visible:= True;
      end
      else
      begin
         SpeedButton_Reposicao.Visible:= True;
         SpeedButton_RegistrarPresenca.Visible:= True;
         SpeedButton_RegistrarFalta.Visible:= False;
      end;
   end;
   ComboBox_Observacao.Text:= Query_Chamada.FieldByName('Observacao').AsString
end;

procedure TForm_Cad_Chamada.SpeedButton_ExcluirClick(Sender: TObject);
var
   VI_Retorno: integer;
   VS_Comando: String;
begin
   if IBQuery_ChamadaRealizada.FieldByName('idchamada').AsString = '' then
   begin
       ShowMessage('Não foi selecionado chamada....');
       DBGrid_Relacao_Chamada.SetFocus;
   end
   else
   begin
      VI_Retorno:= Application.MessageBox('Essa exclusão eliminará a turma selecionada '+#13+
                                       'Confirma a exclusão do registro ?', 'Atenção', MB_YesNo+mb_DefButton2+mb_IconQuestion);
      if VI_Retorno = IDYes then
      begin
         VS_Comando:= ' Delete from chamada '+
                      ' where idchamada = '+IBQuery_ChamadaRealizada.FieldByName('idchamada').AsString;

         Funcoes.ExecusaoQuery(VS_Comando);
         Funcoes.AtualizaQuery(IBQuery_ChamadaRealizada);
      end;
   end;
end;

procedure TForm_Cad_Chamada.SpeedButton_InserirChamadaClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserir';
   ComboBox_Observacao.Text:= '';

   ToolBar_Menu.Enabled:= False;
   Panel_Opcoes_Chamada.Visible:= False;
   Panel_Relacao_Chamadas.Enabled:= False;

   Panel_ListaAlunosChamada.Visible:= False;
//   Panel_Chamadas.Visible:= False;
   Panel_Inserir_Chamada.Visible:= True;
end;

procedure TForm_Cad_Chamada.SpeedButton_AlterarChamadaClick(Sender: TObject);
begin
   if IBQuery_ChamadaRealizada.FieldByName('idchamada').AsString = '' then
   begin
       ShowMessage('Não foi selecionado chamada....');
       DBGrid_Relacao_Chamada.SetFocus;
   end
   else
   begin
      VS_Opcao:= 'Alterar';
      VS_IdChamada:= IBQuery_ChamadaRealizada.FieldByName('idchamada').AsString;

      ToolBar_Menu.Enabled:= False;
      Panel_ListaAlunosChamada.Visible:= True;
      Panel_Chamadas.enabled:= False;
      Panel_Tratar_Chamada.Visible:= true;
   end;
end;

procedure TForm_Cad_Chamada.ComboBox_Sel_DisciplinaChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= ' Select distinct a.idcurso, a.idturma, t.serie, d.codmateria, c.idchamada, c.tempo, c.datachamada '+
                ' From chamada c, disciplina d, alunoturma a, turma t '+
                ' where c.iddisciplina = d.iddisciplina '+
                ' and c.idaluno  = a.idaluno '+
                ' and  a.idcurso = t.idCurso '+
                ' and  a.idturma = t.idturma '+
                ' and  t.idcurso = :idCurso '+
                ' and  t.idturma = :idturma '+
                ' and  t.serie = :serie ';

   if ComboBox_Sel_Disciplina.Text <> '' then
      VS_Comando:= VS_Comando + ' and  d.codmateria = '+#39+ComboBox_Sel_Disciplina.Text+#39;

   if ComboBox_Sel_Tempo.Text <> '' then
      VS_Comando:= VS_Comando + ' and   c.tempo = '+#39+ComboBox_Sel_Tempo.Text+#39;

   if JvDateEdit_Sel_Data.Text <> '  /  /    ' then
   begin
      if Funcoes.ValidarData(JvDateEdit_Sel_Data.Text) = True then
      begin
         VS_Data:= Funcoes.DePara(JvDateEdit_Sel_Data.Text, '/', '.');
         VS_Data:= VS_Data+' 00:00';
         VS_Comando:= VS_Comando+' and c.datachamada = '+#39+VS_Data+#39;
      end;
   end;

   VS_Comando:= VS_Comando + ' order by c.datachamada desc, d.codmateria, c.tempo ';

   Funcoes.ExecutaQuery(IBQuery_ChamadaRealizada, VS_Comando);
end;



procedure TForm_Cad_Chamada.Carga_ComboBox_Sel_Disciplina;
var
   VS_Comando: String;
begin
   if IBQuery_ChamadaRealizada.FieldByName('IdCurso').AsString <> '' then
   begin
      VS_Comando:= ' Select distinct d.codmateria '+
                   ' From chamada c, disciplina d, alunoturma a, turma t '+
                   ' where c.iddisciplina = d.iddisciplina '+
                   ' and c.idaluno  = a.idaluno '+
                   ' and  a.idcurso = t.idCurso '+
                   ' and  a.idturma = t.idturma '+
                   ' and  t.idcurso = '+IBQuery_ChamadaRealizada.FieldByName('IdCurso').AsString+
                   ' and  t.idturma = '+IBQuery_ChamadaRealizada.FieldByName('idturma').AsString+
                   ' and  t.serie = '+#39+IBQuery_ChamadaRealizada.FieldByName('serie').AsString+#39;

      Funcoes.OpenQuery(VS_Comando);

      ComboBox_Sel_Disciplina.Items.clear;
      DM.Query_Executa.First;
      ComboBox_Sel_Disciplina.Text:= '';
      ComboBox_Sel_Disciplina.Items.Add('');
      While not DM.Query_Executa.Eof do
      begin
         ComboBox_Sel_Disciplina.Items.Add(DM.Query_Executa.FieldByName('codmateria').AsString);
         DM.Query_Executa.next;
      end;
   end;

end;

procedure TForm_Cad_Chamada.SpeedButton_RelacaoFaltasBROfficeClick(Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet: Variant;
   Connect, OpenOffice : Variant;

   i: Integer;
begin
   if IBQuery_ChamadaRealizada.RecordCount = 0 then
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

      Sheet.getCellByPosition(0,0).setString('CURSO');
      Sheet.getCellByPosition(0,1).setString('TURMA');
      Sheet.getCellByPosition(0,2).setString('SÉRIE');
      Sheet.getCellByPosition(0,3).setString('DISCIPLINA');
      Sheet.getCellByPosition(0,4).setString('TEMPO');
      Sheet.getCellByPosition(0,5).setString('CHAMADA');


      // Preenchendo as Colunas a informação da chamada

      Sheet.getCellByPosition(1,0).setString( Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString);
      Sheet.getCellByPosition(1,1).setString( Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Turma').AsString);
      Sheet.getCellByPosition(1,2).setString( Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString);
      Sheet.getCellByPosition(1,3).setString( IBQuery_ChamadaRealizada.FieldByNAme('CodMateria').AsString);
      Sheet.getCellByPosition(1,4).setString( IBQuery_ChamadaRealizada.FieldByNAme('Tempo').AsString);
      Sheet.getCellByPosition(1,5).setString( IBQuery_ChamadaRealizada.FieldByNAme('DataChamada').AsString );


      i:= 7;

      Sheet.getCellByPosition(1,i).setString('MILHÃO' );
      Sheet.getCellByPosition(2,i).setString('NOME GUERRA' );
      Sheet.getCellByPosition(3,i).setString('NOME COMPLETO' );
      Sheet.getCellByPosition(4,i).setString('OBSERVAÇÃO' );

      i:= i+1;

      Query_Chamada.First;
      while not Query_Chamada.eof do
      begin
         if Query_Chamada.FieldByName('Presenca').AsString = 'F' then
         begin
            Sheet.getCellByPosition(1,i).setString( Query_Chamada.FieldByName('CodigoAluno').AsString );
            Sheet.getCellByPosition(2,i).setString( Query_Chamada.FieldByName('NomeGuerra').AsString );
            Sheet.getCellByPosition(3,i).setString( Query_Chamada.FieldByName('NomeCompleto').AsString );
            Sheet.getCellByPosition(4,i).setString( Query_Chamada.FieldByName('Observacao').AsString );

            i:= i+1;
         end
         else
         begin
            Break;
         end;
         Query_Chamada.Next;
      end;
   end;
   Screen.Cursor:= crDefault;

end;

procedure TForm_Cad_Chamada.SpeedButton_Relacao_Em_ExcelClick(Sender: TObject);
var
   objExcel,Sheet: Variant;
   cTitulo : string;
   i: Integer;
begin

   if IBQuery_ChamadaRealizada.RecordCount = 0 then
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
      objExcel.Workbooks[1].WorkSheets[1].Name := 'Relação de Faltas';
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'CURSO';
      Sheet.Range['A2'] := 'TURMA';
      Sheet.Range['A3'] := 'SÉRIE';
      Sheet.Range['A4'] := 'DISCIPLINA';
      Sheet.Range['A5'] := 'TEMPO';
      Sheet.Range['A6'] := 'CHAMADA';


      // Preenchendo as Colunas a informaçãão da chamada

      Sheet.Range['A1'] := Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString;
      Sheet.Range['A2'] := Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('Turma').AsString;
      Sheet.Range['A3'] := Form_MenuPrincipal.IBQuery_MontaTurma.FieldByNAme('CodCurso').AsString;
      Sheet.Range['A4'] := IBQuery_ChamadaRealizada.FieldByNAme('CodMateria').AsString;
      Sheet.Range['A5'] := IBQuery_ChamadaRealizada.FieldByNAme('Tempo').AsString;
      Sheet.Range['A6'] := IBQuery_ChamadaRealizada.FieldByNAme('DataChamada').AsString;

      i:= 9;

      Sheet.Cells[2,i] := 'MILHÃO';
      Sheet.Cells[3,i] := 'NOME GUERRA';
      Sheet.Cells[4,i] := 'NOME COMPLETO';
      Sheet.Cells[4,i] := 'OBSERVAÇÃO';

      i:= i+1;

      Query_Chamada.First;
      while not Query_Chamada.eof do
      begin
         if Query_Chamada.FieldByName('Presenca').AsString = 'F' then
         begin
            Sheet.Cells[1,i] := Query_Chamada.FieldByName('Presenca').AsString;
            Sheet.Cells[2,i] := Query_Chamada.FieldByName('CodigoAluno').AsString;
            Sheet.Cells[3,i] := Query_Chamada.FieldByName('NomeGuerra').AsString;
            Sheet.Cells[4,i] := Query_Chamada.FieldByName('NomeCompleto').AsString;
            Sheet.Cells[5,i] := Query_Chamada.FieldByName('Observacao').AsString;

            i:= i+1;
         end
         else
         begin
            Break;
         end;
         Query_Chamada.Next;

      end;
   end;
   Screen.Cursor:= crDefault;
end;

procedure TForm_Cad_Chamada.MaskEdit_MilhaoChange(Sender: TObject);
var
   VS_Comando, VS_Milhao: String;
begin
   VS_Comando:= 'select c.idchamada, c.idaluno, c.idinstrutor, c.iddisciplina, c.tempo, c.datachamada, c.presenca, c.observacao, '+
                '       a.codigoaluno, p.nomeguerra, p.nomecompleto '+
                ' From chamada c, alunoturma a, pessoa p '+
                ' Where c.idaluno = a.idaluno '+
                ' and   a.identidade = p.identidade '+
                ' and   c.idchamada = '+VS_IdChamada;

    VS_Milhao:= trim(MaskEdit_Milhao.Text);
//    VS_Milhao:= rtrim(VS_Milhao.Text);

   if VS_Milhao <> '-' then
   begin
      VS_Comando:= VS_Comando+' and p.identidade like '+#39+'%'+VS_Milhao+'%'+#39;
   end;

   if MaskEdit_Nome_Guerra.Text <> '' then
   begin
      VS_Comando:= VS_Comando+' and p.nomeguerra like '+#39+'%'+MaskEdit_Nome_Guerra.Text+'%'+#39;
   end;

   if MaskEdit_Nome_Completo.Text <> '' then
   begin
      VS_Comando:= VS_Comando+' and p.nomecompleto like '+#39+'%'+MaskEdit_Nome_Completo.Text+'%'+#39;
   end;

   VS_Comando:= VS_Comando+' order by c.presenca,  p.nomeguerra ';

   Funcoes.ExecutaQuery(Query_Chamada, VS_Comando);
end;

procedure TForm_Cad_Chamada.DBGrid_ChamadaDblClick(Sender: TObject);
begin
   SpeedButton_RegistrarFaltaClick(Sender);
end;

procedure TForm_Cad_Chamada.SpeedButton_ReposicaoClick(Sender: TObject);
begin
   IBTable_TratarChamada.Edit;
   IBTable_TratarChamada.FieldByName('Presenca').AsString:= 'P';
   IBTable_TratarChamada.FieldByName('Observacao').AsString:= 'REPOSIÇÃO';
   IBTable_TratarChamada.Post;
   Funcoes.ExecutaTransacao;

   Funcoes.AtualizaQuery(Query_Chamada);

end;

procedure TForm_Cad_Chamada.IBQuery_ChamadaRealizadaAfterScroll(DataSet: TDataSet);
begin
   VS_IdChamada:= IBQuery_ChamadaRealizada.FieldByName('IdChamada').AsString;
end;

end.
