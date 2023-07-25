unit Rel_FaltasAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_Rel_Aprovados = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRImage_Log01: TQRImage;
    PageFooterBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRLabel_Serie: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRLabel1: TQRLabel;
    Query_RelacaoAlunos: TIBQuery;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel_Descricao: TQRLabel;
    DSQ_TurmaAndamento: TDataSource;
    QRShape4: TQRShape;
    Query_RelacaoAlunosIDCURSO: TSmallintField;
    Query_RelacaoAlunosIDTURMA: TIntegerField;
    Query_RelacaoAlunosSERIE: TIBStringField;
    Query_RelacaoAlunosIDALUNO: TIntegerField;
    Query_RelacaoAlunosDATACHAMADA: TDateTimeField;
    Query_RelacaoAlunosCODMATERIA: TIBStringField;
    Query_RelacaoAlunosQTD_FALTAS: TIntegerField;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_Aprovados: TForm_Rel_Aprovados;

implementation

uses Data_Module, cad_chamada, MenuPrincipal;

{$R *.dfm}

procedure TForm_Rel_Aprovados.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   Query_RelacaoAlunos.Open;
   QRLabel_Descricao.Caption:= 'RELATÓRIO DE FALTAS DO : '+Trim(Form_MenuPrincipal.IBQuery_ListaFaltasPorAlunos.FieldByName('identidade').AsString)+' - '+
                                     Trim(Form_MenuPrincipal.IBQuery_ListaFaltasPorAlunos.FieldByName('nomecompleto').AsString);

   if FileExists('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg') = True then
      QRImage_Log01.Picture.LoadFromFile('C:\DataBase_ICEA\Ensino\Imagem\Logo_Rel.jpg');
end;

procedure TForm_Rel_Aprovados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
