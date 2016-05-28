object frmVizh: TfrmVizh
  Left = 77
  Top = 0
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Таблица Вижинера'
  ClientHeight = 539
  ClientWidth = 677
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
    Width = 677
    Height = 517
    Align = alClient
    ColCount = 32
    DefaultColWidth = 20
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 32
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
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
    Top = 517
    Width = 677
    Height = 22
    Panels = <
      item
        Text = 
          'Строчные буквы заменяются аналогично прописным. Некириллические ' +
          'символы игнорируются.'
        Width = 500
      end>
    SimplePanel = False
  end
end
