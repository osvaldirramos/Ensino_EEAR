program Chamada;

uses
  Forms,
  Data_Module in 'Data_Module.pas' {DM: TDataModule},
  Rotinas in 'Rotinas.pas',
  Rotinas_SUE in 'Rotinas_SUE.pas',
  Abertura in 'Abertura.pas' {Form_Abertura},
  MenuPrincipal in 'MenuPrincipal.pas' {Form_MenuPrincipal},
  Sel_Turma in 'Sel_Turma.pas' {Form_SelTurma},
  Carga_Turma in 'Carga_Turma.pas' {Form_Carga_Turma},
  Cad_Disciplinas in 'Cad_Disciplinas.pas' {Form_Sel_Disciplinas},
  Tempo_Serie in 'Tempo_Serie.pas' {Form_Tempo_Serie},
  cad_chamada in 'cad_chamada.pas' {Form_Cad_Chamada},
  Cadastro_Disciplina in 'Cadastro_Disciplina.pas' {Form_Cad_Disciplina},
  Rel_FaltasAluno in 'Rel_FaltasAluno.pas' {Form_Rel_Aprovados};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TForm_Cad_Chamada, Form_Cad_Chamada);
  Application.CreateForm(TForm_Cad_Disciplina, Form_Cad_Disciplina);
  Application.CreateForm(TForm_Rel_Aprovados, Form_Rel_Aprovados);
  //  Application.CreateForm(TForm_Tempo_Serie, Form_Tempo_Serie);
  //  Application.CreateForm(TForm_Cad_Disciplinas, Form_Cad_Disciplinas);
  //  Application.CreateForm(TForm_SelTurma, Form_SelTurma);
//  Application.CreateForm(TForm_Carga_Turma, Form_Carga_Turma);
  //  Application.CreateForm(TForm_SelTurma, Form_SelTurma);
//  Application.CreateForm(TForm_MenuPrincipal, Form_MenuPrincipal);
  Application.Run;
end.
