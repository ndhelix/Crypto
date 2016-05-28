object frmTable3: TfrmTable3
  Left = 436
  Top = 287
  Width = 272
  Height = 288
  Caption = 'Таблица перестановки №3'
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
    Width = 264
    Height = 261
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
