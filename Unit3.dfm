object frmTable: TfrmTable
  Left = 113
  Top = 78
  Width = 328
  Height = 335
  Caption = 'Таблица перестановки'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SG1: TStringGrid
    Left = 0
    Top = 0
    Width = 320
    Height = 292
    Align = alClient
    BorderStyle = bsNone
    Color = clSilver
    ColCount = 255
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedColor = cl3DLight
    RowCount = 255
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs, goThumbTracking]
    ParentFont = False
    TabOrder = 0
    OnKeyUp = SG1KeyUp
  end
  object SB1: TStatusBar
    Left = 0
    Top = 292
    Width = 320
    Height = 16
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
    Visible = False
  end
end
