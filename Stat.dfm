object frmStat: TfrmStat
  Left = 90
  Top = 10
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Статистика символов'
  ClientHeight = 520
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object SG1: TStringGrid
    Left = 0
    Top = 0
    Width = 675
    Height = 501
    Align = alClient
    ColCount = 19
    DefaultColWidth = 32
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 64
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goThumbTracking]
    ParentFont = False
    TabOrder = 0
    OnKeyUp = FormKeyUp
    OnSelectCell = SG1SelectCell
    ColWidths = (
      32
      20
      40
      42
      32
      32
      21
      40
      42
      32
      32
      21
      40
      42
      32
      32
      21
      39
      42)
  end
  object SB1: TStatusBar
    Left = 0
    Top = 501
    Width = 675
    Height = 19
    Panels = <
      item
        Text = 'Выделите ячейку для получения подсказки'
        Width = 500
      end
      item
        Bevel = pbRaised
        Text = 'Шрифт...'
        Width = 50
      end>
    SimplePanel = False
    OnMouseUp = SB1MouseUp
  end
end
