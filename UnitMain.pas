unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    Button00: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button01: TButton;
    Button02: TButton;
    Button11: TButton;
    Button21: TButton;
    Button10: TButton;
    Button20: TButton;
    Button12: TButton;
    Button22: TButton;
    procedure Button00Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button01Click(Sender: TObject);
    procedure Button02Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormMain: TFormMain;
  Player: Char;
  Score: array of array of Integer;
  Movements: SmallInt;

procedure StartGame();
procedure MachinePlay();
function CheckMove(Button: TObject; X: Integer; Y: Integer): Bool;
function CheckWinner(X: Integer): Bool;

implementation

{$R *.dfm}

procedure StartGame();
var
  X, Y: Integer;
begin
   FormMain.Button00.Caption := '';
   FormMain.Button01.Caption := '';
   FormMain.Button02.Caption := '';

   FormMain.Button10.Caption := '';
   FormMain.Button11.Caption := '';
   FormMain.Button12.Caption := '';

   FormMain.Button20.Caption := '';
   FormMain.Button21.Caption := '';
   FormMain.Button22.Caption := '';

   Player := 'X';

   Movements := 0;

   SetLength(Score, 3, 3);
   for X := 0 to 2 do
      for Y := 0 to 2 do
        begin
          Score[X,Y] := 0;
        end;
end;

function CheckMove(Button: TObject; X: Integer; Y: Integer): Bool;
begin

  if Score[X,Y] = 0 then
  begin
    if Player = 'X' then
    begin
      Player := 'O';
      TButton(Button).Caption := 'X';
      Score[X,Y] := 3;
      if CheckWinner(9) then
      begin
        ShowMessage('O "X" ganhou');
        StartGame();
      end;
      MachinePlay();
    end
    else
    begin
      Player := 'X';
      TButton(Button).Caption := 'O';
      Score[X,Y] := 5;
      if CheckWinner(15) then
      begin
        ShowMessage('O "O" ganhou');
        StartGame();
      end;
    end;
    Movements := Movements + 1;
    if Movements = 9 then
    begin
      ShowMessage('A Véia ganhou');
      StartGame();
    end;
    Result:= True;
  end
  else
    Result:= False;

end;

function CheckWinner(X: Integer): Bool;
begin
  if (Score[0,0] + Score[0,1] + Score[0,2] = X) or
  (Score[1,0] + Score[1,1] + Score[1,2] = X) or
  (Score[2,0] + Score[2,1] + Score[2,2] = X) or
  (Score[0,0] + Score[1,0] + Score[2,0] = X) or
  (Score[0,1] + Score[1,1] + Score[2,1] = X) or
  (Score[0,2] + Score[1,2] + Score[2,2] = X) or
  (Score[0,0] + Score[1,1] + Score[2,2] = X) or
  (Score[0,2] + Score[1,1] + Score[2,0] = X) then
    Result := True
  else
    Result := False;
end;

procedure MachinePlay();
var
X: Integer;
begin
  X:= 6;
  if (Score[0,0] + Score[0,1] + Score[0,2] = X) then
  begin
    if CheckMove(FormMain.Button00, 0, 0) then
      Exit
    else
    if CheckMove(FormMain.Button01, 0, 1) then
      Exit
    else
    if CheckMove(FormMain.Button02, 0, 2) then
      Exit;
  end
  else
  if (Score[1,0] + Score[1,1] + Score[1,2] = X) then
  begin
    if CheckMove(FormMain.Button10, 1, 0) then
      Exit
    else
    if CheckMove(FormMain.Button11, 1, 1) then
      Exit
    else
    if CheckMove(FormMain.Button12, 1, 2) then
      Exit;
  end
  else
  if (Score[2,0] + Score[2,1] + Score[2,2] = X) then
  begin
    if CheckMove(FormMain.Button20, 2, 0) then
      Exit
    else
    if CheckMove(FormMain.Button21, 2, 1) then
      Exit
    else
    if CheckMove(FormMain.Button22, 2, 2) then
      Exit;
  end
  else
  if (Score[0,0] + Score[1,0] + Score[2,0] = X) then
  begin
    if CheckMove(FormMain.Button00, 0, 0) then
      Exit
    else
    if CheckMove(FormMain.Button10, 1, 0) then
      Exit
    else
    if CheckMove(FormMain.Button20, 2, 0) then
      Exit;
  end
  else
  if (Score[0,1] + Score[1,1] + Score[2,1] = X) then
  begin
    if CheckMove(FormMain.Button01, 0, 1) then
      Exit
    else
    if CheckMove(FormMain.Button11, 1, 1) then
      Exit
    else
    if CheckMove(FormMain.Button21, 2, 1) then
      Exit;
  end
  else
  if (Score[0,2] + Score[1,2] + Score[2,2] = X) then
  begin
    if CheckMove(FormMain.Button02, 0, 2) then
      Exit
    else
    if CheckMove(FormMain.Button12, 1, 2) then
      Exit
    else
    if CheckMove(FormMain.Button22, 2, 2) then
      Exit;
  end
    else
  if (Score[0,0] + Score[1,1] + Score[2,2] = X) then
  begin
    if CheckMove(FormMain.Button00, 0, 0) then
      Exit
    else
    if CheckMove(FormMain.Button11, 1, 1) then
      Exit
    else
    if CheckMove(FormMain.Button22, 2, 2) then
      Exit;
  end
    else
  if (Score[0,2] + Score[1,1] + Score[2,0] = X) then
  begin
    if CheckMove(FormMain.Button02, 0, 2) then
      Exit
    else
    if CheckMove(FormMain.Button11, 1, 1) then
      Exit
    else
    if CheckMove(FormMain.Button20, 2, 0) then
      Exit;
  end;
end;

procedure TFormMain.Button00Click(Sender: TObject);
begin
  CheckMove(Button00, 0, 0)
end;

procedure TFormMain.Button01Click(Sender: TObject);
begin
  CheckMove(Button01, 0, 1)
end;

procedure TFormMain.Button02Click(Sender: TObject);
begin
  CheckMove(Button02, 0, 2)
end;

procedure TFormMain.Button10Click(Sender: TObject);
begin
  CheckMove(Button10, 1, 0)
end;

procedure TFormMain.Button11Click(Sender: TObject);
begin
  CheckMove(Button11, 1, 1)
end;

procedure TFormMain.Button12Click(Sender: TObject);
begin
  CheckMove(Button12, 1, 2)
end;

procedure TFormMain.Button20Click(Sender: TObject);
begin
  CheckMove(Button20, 2, 0)
end;

procedure TFormMain.Button21Click(Sender: TObject);
begin
  CheckMove(Button21, 2, 1)
end;

procedure TFormMain.Button22Click(Sender: TObject);
begin
  CheckMove(Button22, 2, 2)
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  StartGame;
end;

end.
