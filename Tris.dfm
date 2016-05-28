object frmTris: TfrmTris
  Left = 270
  Top = 174
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Таблица Трисемуса'
  ClientHeight = 151
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object SG1: TStringGrid
    Left = 0
    Top = 0
    Width = 349
    Height = 129
    Hint = 
      'Каждая буква сообщения (шифр-текста) заменяется буквой, располож' +
      'енной ниже (выше)'
    Align = alClient
    ColCount = 8
    DefaultColWidth = 42
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssNone
    ShowHint = True
    TabOrder = 0
    OnKeyUp = FormKeyUp
  end
  object SB1: TStatusBar
    Left = 0
    Top = 129
    Width = 349
    Height = 22
    Panels = <
      item
        Text = 'При шифровании происходит сдвиг вниз и наоборот'
        Width = 500
      end>
    SimplePanel = False
  end
end
