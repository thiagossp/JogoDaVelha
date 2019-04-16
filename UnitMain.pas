unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    Button_1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button_2: TButton;
    Button_3: TButton;
    Button_5: TButton;
    Button_8: TButton;
    Button_4: TButton;
    Button_7: TButton;
    Button_6: TButton;
    Button_9: TButton;
    procedure Button_1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
    procedure Button_3Click(Sender: TObject);
    procedure Button_4Click(Sender: TObject);
    procedure Button_5Click(Sender: TObject);
    procedure Button_6Click(Sender: TObject);
    procedure Button_7Click(Sender: TObject);
    procedure Button_8Click(Sender: TObject);
    procedure Button_9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormMain: TFormMain;
  Player: Char;
  Board: array[1..9] of char;
  WinningSequences: array[1..8] of array[1..3] of integer;
  Movements: SmallInt;

procedure StartGame();
procedure MachinePlay();
function CheckMove(Button: TObject; i: Integer): Bool;
procedure CheckWinner();

implementation

{$R *.dfm}

procedure StartGame();
var
  I : Integer;
begin
  FormMain.Button_1.Caption := '';
  FormMain.Button_2.Caption := '';
  FormMain.Button_3.Caption := '';

  FormMain.Button_4.Caption := '';
  FormMain.Button_5.Caption := '';
  FormMain.Button_6.Caption := '';

  FormMain.Button_7.Caption := '';
  FormMain.Button_8.Caption := '';
  FormMain.Button_9.Caption := '';

  WinningSequences[1][1] := 1;
  WinningSequences[1][2] := 2;
  WinningSequences[1][3] := 3;

  WinningSequences[2][1] := 4;
  WinningSequences[2][2] := 5;
  WinningSequences[2][3] := 6;

  WinningSequences[3][1] := 7;
  WinningSequences[3][2] := 8;
  WinningSequences[3][3] := 9;

  WinningSequences[4][1] := 1;
  WinningSequences[4][2] := 4;
  WinningSequences[4][3] := 7;

  WinningSequences[5][1] := 2;
  WinningSequences[5][2] := 5;
  WinningSequences[5][3] := 8;

  WinningSequences[6][1] := 3;
  WinningSequences[6][2] := 6;
  WinningSequences[6][3] := 9;

  WinningSequences[7][1] := 1;
  WinningSequences[7][2] := 5;
  WinningSequences[7][3] := 9;

  WinningSequences[8][1] := 3;
  WinningSequences[8][2] := 5;
  WinningSequences[8][3] := 7;

  if Random(100) mod 2 = 0 then Player := 'X' else Player := 'O';

  for I := 1 to 9 do
    Board[I] := ' ';

end;

function CheckMove(Button: TObject; I: Integer): Bool;
begin
  if Board[I] = ' ' then
  begin
    TButton(Button).Caption := Player;
    Board[I] := Player;
    CheckWinner();
    if Player = 'X' then Player := 'O' else Player := 'X'
  end;
end;

procedure CheckWinner();
var
  I: integer;
begin
  for I := 1 to 8 do
  begin
    if (Board[WinningSequences[I][1]] = Player) and
       (Board[WinningSequences[I][2]] = Player) and
       (Board[WinningSequences[I][3]] = Player) then
       begin
           ShowMessage('O "' + Player + '" ganhou!');
           StartGame();
           break;
       end;
  end;

  for I := 1 to 9 do
  begin
    if Board[I] = ' ' then
      break
    else
    if I = 9 then
    begin
      ShowMessage('A velha venceu!');
      StartGame();
    end;
  end;

end;

procedure MachinePlay();
begin

end;

procedure TFormMain.Button_1Click(Sender: TObject);
begin
  CheckMove(Button_1, 1)
end;

procedure TFormMain.Button_2Click(Sender: TObject);
begin
  CheckMove(Button_2, 2)
end;

procedure TFormMain.Button_3Click(Sender: TObject);
begin
  CheckMove(Button_3, 3)
end;

procedure TFormMain.Button_4Click(Sender: TObject);
begin
  CheckMove(Button_4, 4)
end;

procedure TFormMain.Button_5Click(Sender: TObject);
begin
  CheckMove(Button_5, 5)
end;

procedure TFormMain.Button_6Click(Sender: TObject);
begin
  CheckMove(Button_6, 6)
end;

procedure TFormMain.Button_7Click(Sender: TObject);
begin
  CheckMove(Button_7, 7)
end;

procedure TFormMain.Button_8Click(Sender: TObject);
begin
  CheckMove(Button_8, 8)
end;

procedure TFormMain.Button_9Click(Sender: TObject);
begin
  CheckMove(Button_9, 9)
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  StartGame;
end;

end.
