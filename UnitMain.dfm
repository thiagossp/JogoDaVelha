object FormMain: TFormMain
  Left = 0
  Top = 0
  ActiveControl = Button_1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tic-Tac-Toe'
  ClientHeight = 616
  ClientWidth = 616
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 600
    Height = 600
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Button_1: TButton
      Left = 10
      Top = 7
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button_1Click
    end
    object Panel2: TPanel
      Left = 196
      Top = -1
      Width = 10
      Height = 601
      Caption = 'Panel2'
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 398
      Top = -1
      Width = 9
      Height = 601
      Caption = 'Panel2'
      Color = clBlack
      ParentBackground = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 0
      Top = 192
      Width = 601
      Height = 10
      Caption = 'Panel2'
      Color = clBlack
      ParentBackground = False
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 0
      Top = 394
      Width = 601
      Height = 10
      Caption = 'Panel2'
      Color = clBlack
      ParentBackground = False
      TabOrder = 4
    end
    object Button_2: TButton
      Left = 212
      Top = 7
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button_2Click
    end
    object Button_3: TButton
      Left = 413
      Top = 7
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button_3Click
    end
    object Button_5: TButton
      Left = 212
      Top = 208
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button_5Click
    end
    object Button_8: TButton
      Left = 212
      Top = 410
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button_8Click
    end
    object Button_4: TButton
      Left = 10
      Top = 208
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = Button_4Click
    end
    object Button_7: TButton
      Left = 10
      Top = 410
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = Button_7Click
    end
    object Button_6: TButton
      Left = 413
      Top = 211
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = Button_6Click
    end
    object Button_9: TButton
      Left = 413
      Top = 410
      Width = 180
      Height = 180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -107
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = Button_9Click
    end
  end
end
