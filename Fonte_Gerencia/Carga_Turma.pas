unit Carga_Turma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBTable, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvShape, ComCtrls, ToolWin, Grids, DBGrids, JvRadioButton,
  JvComponent, JvxCtrls, Buttons, JvColorCombo, JvRichEd, JvDBRichEd, Rotinas_SUE, Rotinas,
  JvCheckBox, JvToolEdit, JvCombobox, ComObj,
  XPMan, Menus, JvArrowBtn;

type
  TForm_Carga_Turma = class(TForm)
    Panel1: TPanel;
    SpeedButton_CargaCSV: TSpeedButton;
    IniciaCarga_Button: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    StaticText1: TStaticText;
    Memo_Carga: TMemo;
    SpeedButton_Windows: TSpeedButton;
    SpeedButton_Fechar: TSpeedButton;
    procedure SpeedButton_CargaCSVClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IniciaCarga_ButtonClick(Sender: TObject);
    procedure SpeedButton_FecharClick(Sender: TObject);
    procedure SpeedButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
     F    : TEXTFILE;
     ArquivoAberto    :  string;


  public
    { Public declarations }
  end;

var
  Form_Carga_Turma: TForm_Carga_Turma;

implementation

uses Data_Module, MenuPrincipal;

{$R *.dfm}

procedure TForm_Carga_Turma.SpeedButton_CargaCSVClick(Sender: TObject);
begin
   IF OPENDIALOG1.EXECUTE THEN
   BEGIN
      ArquivoAberto:= OPENDIALOG1.FILENAME;
      ASSIGNFILE(F,OPENDIALOG1.FILENAME);
      IniciaCarga_Button.Enabled:= True;
   END;
end;

procedure TForm_Carga_Turma.FormActivate(Sender: TObject);
begin
   IniciaCarga_Button.Enabled:= False;

end;

procedure TForm_Carga_Turma.IniciaCarga_ButtonClick(Sender: TObject);
var
   VI_Erro: integer;
   VS_Comando: String;
begin
   Reset(F);
   VI_Erro:= 0;

   StaticText1.Caption:='Limpando Arquivo de Respostas...';
   update;

   ProgressBar1.Max:= 100;
   show;
   update;
   ProgressBar1.Position:= 0;

   Memo_Carga.Lines.Clear;


   while ((not Eof(F)) and (VI_Erro = 0)) do
   begin
      ProgressBar1.StepBy(1);

      readln(f,VS_Comando);

      Memo_Carga.Lines.Add(VS_Comando);

      Funcoes.ExecusaoQuery(VS_Comando);
   end;

   Funcoes.AtualizaQuery(Form_MenuPrincipal.IBQuery_MontaTurma);

   ProgressBar1.Position:= 0;
   StaticText1.Caption:='Operação Finalizada...';
   update;

   ShowMessage('Após a carga é necessário cadastrar o tempo por especialidade na opção "Tempo Série"...');
   
   IniciaCarga_Button.Enabled:= False;
end;


procedure TForm_Carga_Turma.SpeedButton_FecharClick(Sender: TObject);
begin
//   Action:= caFree;

   Close;
end;

procedure TForm_Carga_Turma.SpeedButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
