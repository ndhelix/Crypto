object frmTable2: TfrmTable2
  Left = 436
  Top = 2
  Width = 271
  Height = 287
  Caption = 'Таблица перестановки №2'
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
    Width = 263
    Height = 260
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
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyUp = SG1KeyUp
  end
end
