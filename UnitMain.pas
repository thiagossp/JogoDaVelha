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
procedure BotPlayer();
function CheckMove(Button: TObject; i: Integer): Bool;
function CheckWinner(): Bool;

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

  for I := 1 to 9 do Board[I] := ' ';

  if Random(100) mod 2 = 0 then Player := 'X' else Player := 'O';
  if Player = 'O' then BotPlayer();

end;

function CheckMove(Button: TObject; I: Integer): Bool;
begin
  if Board[I] = ' ' then
  begin
    TButton(Button).Caption := Player;
    Board[I] := Player;
    if CheckWinner = True then
    begin
      StartGame();
    end
    else
    begin
      if Player = 'X' then Player := 'O' else Player := 'X';
      if Player = 'O' then BotPlayer();
    end;

    Result := True;
  end
  else
    Result := False;

end;

function CheckWinner(): Bool;
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
           Result := True;
           exit;
       end;
  end;

  for I := 1 to 9 do
  begin
    if Board[I] = ' ' then
    begin
      Result := False;
      exit;
    end
    else
    if I = 9 then
    begin
      ShowMessage('A velha venceu!');
      Result := True;
    end;
  end;

end;

procedure BotPlayer();
var
  I, J, Score, RandomPlay: integer;
  ButtonName : String;
  ButtonObjetct : TObject;
  Played : Bool;
begin
  sleep(300);

  //check if is possible win
  for I := 1 to 8 do
  begin
    Score := 0;
    if (Board[WinningSequences[I][1]] = Player) then Score := Score + 1;
    if (Board[WinningSequences[I][2]] = Player) then Score := Score + 1;
    if (Board[WinningSequences[I][3]] = Player) then Score := Score + 1;
    if Score = 2 then
      for J := 1 to 3 do
        if (Board[WinningSequences[I][J]] = ' ') then
        begin
          ButtonName := 'Button_' + IntToStr(WinningSequences[I][J]);
          ButtonObjetct := FormMain.FindComponent(ButtonName);
          CheckMove(ButtonObjetct, WinningSequences[I][J]);
          Exit;
        end;
  end;

  //check if is possible loss
  for I := 1 to 8 do
  begin
    Score := 0;
    if (Board[WinningSequences[I][1]] = 'X') then Score := Score + 1;
    if (Board[WinningSequences[I][2]] = 'X') then Score := Score + 1;
    if (Board[WinningSequences[I][3]] = 'X') then Score := Score + 1;
    if Score = 2 then
      for J := 1 to 3 do
        if (Board[WinningSequences[I][J]] = ' ') then
        begin
          ButtonName := 'Button_' + IntToStr(WinningSequences[I][J]);
          ButtonObjetct := FormMain.FindComponent(ButtonName);
          CheckMove(ButtonObjetct, WinningSequences[I][J]);
          Exit;
        end;
  end;

  //random play
  while 1 = 1 do
  begin
    RandomPlay := Random(8) + 1;
    if (Board[RandomPlay] = ' ') then
    begin
      ButtonName := 'Button_' + IntToStr(RandomPlay);
      ButtonObjetct := FormMain.FindComponent(ButtonName);
      CheckMove(ButtonObjetct, RandomPlay);
      Exit;
    end;
  end;
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
