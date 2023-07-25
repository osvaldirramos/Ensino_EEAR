unit Data_Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBDatabase, IBCustomDataSet, IBTable, ImgList, Menus;

type
  TDM = class(TDataModule)
    IBDatabase_Chamada: TIBDatabase;
    IBTransaction_Chamada: TIBTransaction;
    Query_Usuario: TIBQuery;
    Query_Executa: TIBQuery;
    IBQuery_ExecSql: TIBQuery;
    ImageList_Ensino: TImageList;
    Query_UsuarioIDUSUARIO: TIntegerField;
    Query_UsuarioNOME: TIBStringField;
    Query_UsuarioSENHA: TIBStringField;
    Query_UsuarioACESSO: TIBStringField;

    procedure SetaServidor(P_Endereco: String);

    procedure DataModuleCreate(Sender: TObject);
  private
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   if FileExists('C:\DataBase_EEAR\Ensino\chamada.cnf') = True then
   begin
      SetaServidor('C:\DataBase_EEAR\Ensino\chamada.cnf');
   end
   else
   begin
      if FileExists('chamada.cnf') = True then
      begin
         SetaServidor('chamada.cnf');
      end
      else
      begin
         MessageDlg('O arquivo "chamada.cnf" não foi encontrado na pasta "C:\DataBase_EEAR\Ensino" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBC: String;
begin
   VS_ServidorBC:= 'BD_Chamada.gdb';

   AssignFile ( arq, P_Endereco );
   Reset ( arq );
   ReadLn ( arq, VS_Linha );
   ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

//   VS_EndServidor:= descriptografar (VS_Linha);
   VS_EndServidor:= VS_Linha;

   IBDatabase_Chamada.Connected:= False;
   IBDatabase_Chamada.DatabaseName:= VS_EndServidor+VS_ServidorBC;
   Try
      IBDatabase_Chamada.Connected:= True;
      IBTransaction_Chamada.Active:= True;

   except
      MessageDlg('Servidor ('+VS_EndServidor+VS_ServidorBC+') fora do ar, tente novamente ou entre em contato com o Responsável',mtError, [mbOk],0);
      Application.terminate;
   end;

end;


end.
