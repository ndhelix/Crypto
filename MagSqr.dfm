object frmMagSqr: TfrmMagSqr
  Left = 154
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Метод магического квадрата'
  ClientHeight = 235
  ClientWidth = 522
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
    Width = 233
    Height = 235
    Align = alLeft
    BorderStyle = bsNone
    Color = clGray
    ColCount = 255
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedColor = clBtnShadow
    FixedCols = 0
    RowCount = 255
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goTabs, goThumbTracking]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyUp = FormKeyUp
  end
  object SG2: TStringGrid
    Left = 288
    Top = 0
    Width = 234
    Height = 235
    Align = alRight
    BorderStyle = bsNone
    Color = clSilver
    ColCount = 255
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedColor = clBtnShadow
    FixedCols = 0
    RowCount = 255
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs, goThumbTracking]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 1
    OnKeyUp = FormKeyUp
  end
end
