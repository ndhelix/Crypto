object Form1: TForm1
  Left = 161
  Top = 49
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AutoScroll = False
  Caption = 'Form1'
  ClientHeight = 410
  ClientWidth = 586
  Color = clInactiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    FFFF00000FFFFF0000FFFFFFFFF0000FF000F000FF000FF000F0000000F0000F
    F000000FF00000FF00F0000000F0000FF000000FF00000FF00F0000000F0000F
    F000000FF00000FF00F0000000F0000FF0000000FF000FF000F0000000F00FFF
    FFFF00000FFFFF0000F0000000F0000FF00000000000000000F0000000F0000F
    F00000000000000000F0000000F0000FF00000000000000000FFFFFFFFF00000
    000000000000000000000000000000FFFFF0000FFFFF000000FFFFFFFFF00000
    FF000000FF00000000F0000000F000000FF00000FF00000000F0000000F00000
    0FF00000FF0FFF0000F0000000F00000FFFF0000FFF00FF000F0000000F00000
    F0FF0000FF0000FF00F0000000F0000FF00FF000FF0000FF00F0000000F0000F
    F00FF000FF0000FF00F0000000F000FF0000FF00FFF00FF000F0000000F00FFF
    F00FFFFFFF0FFF0000FFFFFFFFF0000000000000000000000000000000000000
    000000000000000000FFFFFFFFF00000000000000000000000F0000000F00000
    000000000000000000F0000000F0000FFFFF000FFFFFFF0000F0000000F000FF
    000FF0000FF0000000F0000000F00FF00000F0000FF0000000F0000000F00FF0
    000000000FF0000000F0000000F00FF00000F0000FF0000000F0000000F000FF
    000FF0000FFF00FF00F0000000F0000FFFF0F00FFFF0FFF000FFFFFFFFF00000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 388
    Width = 586
    Height = 22
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 24
    Width = 295
    Height = 364
    Align = alLeft
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = Memo1Change
    OnEnter = Memo1Enter
    OnKeyUp = Memo1KeyUp
    OnMouseUp = Memo1MouseUp
  end
  object Memo2: TMemo
    Left = 291
    Top = 24
    Width = 295
    Height = 364
    Align = alRight
    Color = clInactiveBorder
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
    OnChange = Memo2Change
    OnEnter = Memo2Enter
    OnKeyUp = Memo2KeyUp
    OnMouseUp = Memo2MouseUp
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 586
    Height = 24
    ButtonWidth = 24
    Caption = '������� ������'
    Images = ImageList1
    TabOrder = 3
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Hint = '�����'
      Caption = 'ToolButton2'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuNewClick
    end
    object ToolButton3: TToolButton
      Left = 24
      Top = 2
      Hint = '�������...'
      Caption = 'ToolButton3'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuOpenClick
    end
    object ToolButton1: TToolButton
      Left = 48
      Top = 2
      Hint = '���������'
      Caption = 'ToolButton1'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuSaveClick
    end
    object ToolButton4: TToolButton
      Left = 72
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 20
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 80
      Top = 2
      Hint = '��������'
      Caption = 'ToolButton5'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuCutClick
    end
    object ToolButton6: TToolButton
      Left = 104
      Top = 2
      Hint = '����������'
      Caption = 'ToolButton6'
      Enabled = False
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuCopyClick
    end
    object ToolButton7: TToolButton
      Left = 128
      Top = 2
      Hint = '��������'
      Caption = 'ToolButton7'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuPasteClick
    end
    object ToolButton8: TToolButton
      Left = 152
      Top = 2
      Hint = '��������'
      Caption = 'ToolButton8'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuUndoClick
    end
    object ToolButton9: TToolButton
      Left = 176
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 21
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 184
      Top = 2
      Hint = '������� �����'
      Caption = 'ToolButton10'
      DropdownMenu = PopupMenu1
      ImageIndex = 7
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      Style = tbsDropDown
    end
    object ToolButton11: TToolButton
      Left = 221
      Top = 2
      Hint = '�����������...'
      Caption = 'ToolButton11'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuEncryptClick
    end
    object ToolButton12: TToolButton
      Left = 245
      Top = 2
      Hint = '������������...'
      Caption = 'ToolButton12'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuDecryptClick
    end
    object ToolButton13: TToolButton
      Left = 269
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 23
      Style = tbsSeparator
    end
    object ToolButton14: TToolButton
      Left = 277
      Top = 2
      Hint = '���������� ��������...'
      Caption = 'ToolButton14'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuSymbStatClick
    end
    object ToolButton15: TToolButton
      Left = 301
      Top = 2
      Hint = '�������� �������'
      Caption = 'ToolButton15'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = mnuSwapPanelsClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 224
    object N1: TMenuItem
      Caption = '����'
      object mnuNew: TMenuItem
        Caption = '�����'
        ShortCut = 16462
        OnClick = mnuNewClick
      end
      object mnuOpen: TMenuItem
        Caption = '�������...'
        ShortCut = 16463
        OnClick = mnuOpenClick
      end
      object mnuSave: TMenuItem
        Caption = '���������'
        ShortCut = 16467
        OnClick = mnuSaveClick
      end
      object mnuSaveAs: TMenuItem
        Caption = '��������� ���...'
        ShortCut = 123
        OnClick = mnuSaveAsClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuEncrypt: TMenuItem
        Caption = '�����������'
        ShortCut = 16453
        OnClick = mnuEncryptClick
      end
      object mnuDecrypt: TMenuItem
        Caption = '������������'
        ShortCut = 16452
        OnClick = mnuDecryptClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuSymbStat: TMenuItem
        Caption = '����������...'
        ShortCut = 16468
        OnClick = mnuSymbStatClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = '�����'
        OnClick = mnuExitClick
      end
    end
    object N5: TMenuItem
      Caption = '������'
      object mnuUndo: TMenuItem
        Caption = '��������'
        ShortCut = 16474
        OnClick = mnuUndoClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuCut: TMenuItem
        Caption = '��������'
        Enabled = False
        ShortCut = 16472
        OnClick = mnuCutClick
      end
      object mnuCopy: TMenuItem
        Caption = '����������'
        Enabled = False
        ShortCut = 16451
        OnClick = mnuCopyClick
      end
      object mnuPaste: TMenuItem
        Caption = '��������'
        ShortCut = 16470
        OnClick = mnuPasteClick
      end
      object mnuDelete: TMenuItem
        Caption = '�������'
        Enabled = False
        OnClick = mnuDeleteClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuSelectAll: TMenuItem
        Caption = '�������� ���'
        ShortCut = 16449
        OnClick = mnuSelectAllClick
      end
      object mnuWordWrap: TMenuItem
        Caption = '������� �� ������'
        Checked = True
        ShortCut = 16471
        OnClick = mnuWordWrapClick
      end
    end
    object mnuMethod: TMenuItem
      Caption = '�����'
      object mnuTables: TMenuItem
        Caption = '��������� �������'
        object NN1: TMenuItem
          Caption = '��� ��������� �����'
          Checked = True
          ShortCut = 16496
          OnClick = NN1Click
        end
        object NN2: TMenuItem
          Caption = '� �������� ������'
          ShortCut = 16497
          OnClick = NN2Click
        end
        object NN3: TMenuItem
          Caption = '� ������� �������������'
          ShortCut = 16498
          OnClick = NN3Click
        end
        object NN4: TMenuItem
          Caption = '���������� �������'
          ShortCut = 16499
          OnClick = NN4Click
        end
      end
      object mnuSimpleReplace: TMenuItem
        Caption = '����� ������� ������'
        object NN5: TMenuItem
          Caption = '����� ��������'
          ShortCut = 16500
          OnClick = NN5Click
        end
        object NN6: TMenuItem
          Caption = '������� ������� �����������'
          ShortCut = 16501
          OnClick = NN6Click
        end
        object NN7: TMenuItem
          Caption = '������� ������ � �������� ������'
          ShortCut = 16502
          OnClick = NN7Click
        end
        object NN8: TMenuItem
          Caption = '������� ���������'
          ShortCut = 16503
          OnClick = NN8Click
        end
      end
      object NN9: TMenuItem
        Caption = '����� ��������'
        ShortCut = 16504
        OnClick = NN9Click
      end
      object NN10: TMenuItem
        Caption = 'DES'
        ShortCut = 16505
        OnClick = NN10Click
      end
    end
    object N2: TMenuItem
      Caption = '���'
      object mnuFont: TMenuItem
        Caption = '�����...'
        OnClick = mnuFontClick
      end
      object mnuLeftBackColor: TMenuItem
        Caption = '���� ���� �����...'
        OnClick = mnuLeftBackColorClick
      end
      object mnuRightBackColor: TMenuItem
        Caption = '���� ���� ������...'
        OnClick = mnuRightBackColorClick
      end
      object mnuSwapPanels: TMenuItem
        Caption = '�������� �������'
        ShortCut = 16469
        OnClick = mnuSwapPanelsClick
      end
    end
    object N11: TMenuItem
      Caption = '�������'
      object mnuHelp: TMenuItem
        Caption = '����� �������'
        ShortCut = 112
        OnClick = mnuHelpClick
      end
      object mnuAbout: TMenuItem
        Caption = '� ���������'
        OnClick = mnuAboutClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '��������� ����� (*.txt)|*.txt|��� ����� (*.*)|*.*'
    Left = 360
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = '��������� ����� (*.txt)|*.txt|��� ����� (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 426
    Top = 225
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 296
    Top = 224
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MinFontSize = 0
    MaxFontSize = 0
    Left = 232
    Top = 224
  end
  object ImageList1: TImageList
    Left = 104
    Top = 224
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000006F773B0D0A656E643B0D0A0D0A0D
      0A70726F6365647572652054466F726D312E466F726D436C6F73655175657279
      2853656E6465723A20544F626A6563743B207661722043616E436C6F73653A20
      426F6F6C65616E293B0D0A626567696E0D0A657869743B0D0A6D6E7545786974
      436C69636B2853656E646572293B0D0A69660A666F726D312E43617074696F6E
      203A3D206170706E616D65202B2027202D2027202B20666E616D653B0D0A0D0A
      656E643B0D0A0D0A0D0A0D0A0D0A70726F6365647572652054466F726D312E6D
      6E7541626F7574436C69636B2853656E6465723A20544F626A656374293B0D0A
      626567696E0D0A61626F7574626F782E73686446726F6D46696C652028464E61
      6D65293B0D0A2020656E643B0D0A2F2F2020202072656164286346696C652C20
      62293B0D0A2F2F636C6F736566696C65286366696C65293B0D0A6E6F66696C65
      203A3D2066616C73653B0D0A4D656D6F314368616E67652853656E646572293B
      0D0A6366616374203A3D2066616C73653B0D696E672C205B6D624F6B5D2C2030
      293B0D0A2020202020436C6F736546696C652866293B202020657869743B2020
      2020202020656E643B0D0A20202020436C6F736546696C652866293B0D0A2020
      202041737369676E46696C6528206346696C652C20464E616D6520293B0D0A20
      2020206D656D6F312E6C696E65732E4C6F617A6528662929202B202720E1E0E9
      F220EDE520ECEEE6E5F220E1FBF2FC20EEF2EAF0FBF22C20F2E0EA20EAE0EA20
      EEEAEDEE20F0E5E4E0EAF2E8F0EEE2E0EDE8FF20544D656D6F20EDE520EFEEE4
      E4E5F0E6E8E2E0E5F220F4E0E9EBFB20F0E0E7ECE5F0EEEC20E1EEEBE5E52035
      3736383620E1E0E9F2272C206D745761726E6F67312E46696C654E616D65293B
      0D0A2020202052657365742866293B0D0A2020202069662046696C6553697A65
      286629203E20353736383620207468656E20626567696E0D0A20202020204D65
      7373616765446C672827C4E0EDEDFBE920F4E0E9EB20F0E0E7ECE5F0EEEC2027
      202B20696E74746F7374722846696C6553692E696E697469616C646972203A3D
      20277461626C6573273B0D0A4966204F70656E4469616C6F67312E4578656375
      74650D0A207468656E0D0A2020626567696E0D0A20202020466E616D65203A3D
      204F70656E4469616C6F67312E46696C654E616D653B0D0A2020202041737369
      676E46696C6528662C204F70656E4469616C6C6C3B202F2F69644E6F0D0A2032
      3A20657869743B202F2F696443616E63656C0D0A656E643B0D0A6C6C3A0D0A0D
      0A466F72636543757272656E744469726563746F7279203A3D20547275653B0D
      0A6F70656E6469616C6F67312E496E697469616C446972203A3D202766696C65
      73273B0D0A2F2F6F70656E6469616C6F6731284346696C65293B0D0A2F2F2020
      2020206D656D6F312E6C696E65732E4C6F616446726F6D46696C6520280D0A20
      2020202069662069657272207468656E20657869743B0D0A2020202020436C6F
      736546696C65284346696C65293B0D0A2020202020676F746F206C6C3B0D0A20
      202020656E643B0D0A20373A20676F746F200A2020626567696E0D0A20202020
      6D6E75736176656173636C69636B2873656E646572293B0D0A20202020696620
      69657272207468656E20657869743B0D0A20202020676F746F206C6C3B0D0A20
      20656E643B0D0A63617365206964206F660D0A20363A20626567696E202F2F69
      645965730D0A20202020205265777269746569636174696F6E2E4D6573736167
      65426F782827D4E0E9EB20E1FBEB20E8E7ECE5EDE5ED2E20D1EEF5F0E0EDE8F2
      FC3F272C206170706E616D652C206D625F7965736E6F63616E63656C2B6D625F
      69636F6E7175657374696F6E293B0D0A6966206E6F66696C6520616E64202869
      64203D206964596573290D0A207468656E0D206F6E206120746578742066696C
      650D0A6C6162656C206C6C3B0D0A626567696E0D0A666F726D312E6F70656E44
      69616C6F67312E7469746C65203A3D2027273B0D0A6966202863666163743D66
      616C736529207B6F7220286E6F66696C653D74727565297D207468656E20676F
      746F206C6C3B0D0A6964203A3D206170706C65723A20544F626A656374293B0D
      0A7661722020692C6A2C69643A20696E74656765723B2042203A20737472696E
      675B385D3B206262203A20737472696E673B206D203A2073696E676C653B0D0A
      202020663A2066696C65206F6620427974653B202F2F63617573652046696C65
      53697A652063616E277420626520757365647465726D696E6174653B0D0A2020
      2020656E643B0D0A20373A206170706C69636174696F6E2E7465726D696E6174
      653B202F2F69644E6F0D0A656E643B0D0A41707043616E436C6F7365203A3D20
      46616C73653B0D0A656E643B0D0A0D0A70726F6365647572652054466F726D31
      2E6D6E754F70656E436C69636B2853656E6420656E643B0D0A63617365206964
      206F660D0A20363A20626567696E202F2F69645965730D0A2F2F202020202052
      657772697465284346696C65293B0D0A20202020204D656D6F536176696E6728
      414D4E293B0D0A2F2F2020202020436C6F736546696C65284346696C65293B0D
      0A20202020206170706C69636174696F6E2E0000000000000000000000000000
      0000766520776861742077617320696E2074686520312D7374206D656D6F0D0A
      202020206D6E75736176656173636C69636B2873656E646572293B0D0A202020
      2069662069657272207468656E20657869743B0D0A202020206170706C696361
      74696F6E2E7465726D696E6174653B0D0A20007C007C007C0000000000000000
      000000000000000000000000007C007C007CE003E003E0030000000000000000
      000000000000000000000000E003E003E003734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E0000000000000000000000000F00
      000000000000000000000000000000000000007C007C00000000000000000000
      0000000000000000000000000000007C007CE003E00300000000000000000000
      0000000000000000000000000000E003E003734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E000000000000000000000F000F00
      000000000000000000000000000000000000007C000000000000000000000000
      00000000000000000000000000000000007CE003000000000000000000000000
      00000000000000000000000000000000E003734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E00000000000000000F000F000F00
      000000000000000000000000000000000000007C000000000000000000000000
      00000000000000000000000000000000007CE003000000000000000000000000
      00000000000000000000000000000000E0030000000000000000000000000000
      0000000000000000000000000000000000000000000000000F000F000F000F00
      0F000F000F000F000F000F000F000F000F00007C000000000000000000000000
      00000000000000000000000000000000007CE003000000000000000000000000
      00000000000000000000000000000000E003000000000000EF3D000000000000
      EF3D000000000000EF3D000000000000000000000000000000000F000F000F00
      000000000000000000000000000000000000007C000000000000000000000000
      00000000000000000000000000000000007CE003000000000000000000000000
      00000000000000000000000000000000E003000000000000EF3D000000000000
      EF3D000000000000EF3D0000000000000000000000000000000000000F000F00
      000000000000000000000000000000000000007C007C00000000000000000000
      0000000000000000000000000000007C007CE003E00300000000000000000000
      0000000000000000000000000000E003E0030000EF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000000000000000000000000F00
      000000000000000000000000000000000000007C007C00000000000000000000
      0000000000000000000000000000007C007CE003E00300000000000000000000
      0000000000000000000000000000E003E003000000000000EF3D000000000000
      EF3D000000000000EF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C00000000000000000000
      0000000000000000000000000000007C007CE003E00300000000000000000000
      0000000000000000000000000000E003E003000000000000EF3D000000000000
      EF3D000000000000EF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C000000000000007C007C
      007C007C007C007C000000000000007C007CE003E003000000000000E003E003
      E003E003E003E003000000000000E003E0030000EF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000000000000000000000000000
      000000000F00000000000000000000000000007C007C000000000000007C007C
      007C007C007C007C000000000000007C007CE003E003000000000000E003E003
      E003E003E003E003000000000000E003E003000000000000EF3D000000000000
      EF3D000000000000EF3D00000000000000000000000000000000000000000000
      000000000F000F0000000000000000000000007C007C000000000000007C007C
      007C007C007C007C000000000000007C007CE003E003000000000000E003E003
      E003E003E003E003000000000000E003E003000000000000EF3D000000000000
      EF3D000000000000EF3D00000000000000000000000000000000000000000000
      000000000F000F000F000000000000000000007C007C0000000000000000007C
      007C007C00000000000000000000007C007CE003E0030000000000000000E003
      E003E00300000000000000000000E003E0030000EF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000F000F000F000F000F000F000F00
      0F000F000F000F000F000F00000000000000007C007C007C0000000000000000
      000000000000000000000000007C007C007CE003E003E0030000000000000000
      000000000000000000000000E003E003E00300000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F0000000000000000000000000000000000
      000000000F000F000F000000000000000000007C007C007C007C000000000000
      00000000000000000000007C007C007C007CE003E003E003E003000000000000
      00000000000000000000E003E003E003E00300000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F0000000000000000000000000000000000
      000000000F000F0000000000000000000000007C007C007C007C007C00000000
      000000000000007C007C007C007C007C007CE003E003E003E003E00300000000
      000000000000E003E003E003E003E003E0030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F00
      0F000F000F000F000F000F000F000F000F000000000000000000000000000000
      00000000000000000000000000000000000000008C3139670F000F000F000F00
      3967396739673967000000000000000000000000000000000000000000000000
      0F000F000F000F000F000F000F000F000F000000000000000000000000000F00
      396739673967396739673967396739670F000000000000000000000000000000
      00000000000000000000000000000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000000000000000000000000
      0F0039673967396739673967396739670F0000008C31E03D8C31E03D8C310F00
      396700000000000000000000000039670F000000000000000000000000000000
      00000000000000000000000000000000000000008C310F000F000F000F000F00
      0F000F000F000F00000000000000000000000000000000000000000000000000
      0F0039670000000000000000000039670F000000E03D8C31E03D8C31E03D0F00
      396739673967396739673967396739670F000000000000000000000000000000
      00000000000000000000000000000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000000000000000000000000
      0F0039673967396739673967396739670F0000008C31E03D8C31E03D8C310F00
      396700000000000039670F000F000F000F000000000000000000000000000000
      000000000000000000000F0000000000000000008C3139670F000F000F000F00
      0F00396739673967000000000000000000000000000039673967396739673967
      0F0039670000000000000000000039670F000000E03D8C31E03D8C31E03D0F00
      396739673967396739670F0039670F000000000000000F000F000F000F000F00
      000000000000000000000F0000000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000039670000000000000000
      0F0039673967396739673967396739670F0000008C31E03D8C31E03D8C310F00
      396739673967396739670F000F0000000000000000000F000F000F000F000000
      0000000000000000000000000F000000000000008C3139670F000F000F000F00
      3967396739673967000000000000000000000000000039673967396739673967
      0F0039670000000039670F000F000F000F000000E03D8C31E03D8C31E03D0F00
      0F000F000F000F000F000F00000000000000000000000F000F000F0000000000
      0000000000000000000000000F000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000039670000000000000000
      0F0039673967396739670F0039670F00000000008C31E03D8C31E03D8C31E03D
      8C31E03D8C31E03D8C31E03D000000000000000000000F000F0000000F000000
      0000000000000000000000000F000000000000008C3139670F000F000F000F00
      0F00396739673967000000000000000000000000000039673967396739673967
      0F0039673967396739670F000F00000000000000E03D39670000000000000000
      00000000000000008C318C31000000000000000000000F000000000000000F00
      0F0000000000000000000F0000000000000000008C3139673967396739673967
      3967396739673967000000000000000000000000000039670000000039670000
      0F000F000F000F000F000F0000000000000000008C318C310000000000000000
      00000000000000008C31E03D0000000000000000000000000000000000000000
      00000F000F000F000F0000000000000000008C318C318C318C318C318C318C31
      8C318C318C318C318C31000000008C3100000000000039673967396739670000
      3967000000000000000000000000000000000000E03D8C31E03D0000E07F0000
      0000E07F00008C31E03D8C310000000000000000000000000000000000000000
      0000000000000000000000000000000000008C3139670F000F000F000F000F00
      39673967396739673967396739678C3100000000000039673967396739670000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C3139670F003967396739670F00
      39670F000F000F003967396739678C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C3139670F000F000F000F000F00
      396739673967396739673967396739678C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C318C318C318C318C318C318C31
      8C318C318C318C318C318C318C318C318C31734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F000F000000
      000000000000000000000000000000000000734E734E08210821082108210821
      082108210821082108210821734E734E734E734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E00000000E03DE03D000000000000
      0000000000000000734E0000E03D000000000000000000000F00000000000F00
      000000000F000F0000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E0000000000000000000000000000
      0000000000000000734E934E734E934E734E00000000E03DE03D000000000000
      000000000000734E00000000E03D000000000000000000000F00000000000F00
      00000F00000000000F000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E00000000E03DE03DE03DE03DE03D
      E03DE03DE03DE03D0000734E934E734E934E00000000E03DE03D000000000000
      0000000000000000734E0000E03D000000000000000000000F00000000000F00
      00000F00000000000F000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E0000E07F0000E03DE03DE03DE03D
      E03DE03DE03DE03DE03D0000734E934E734E00000000E03DE03D000000000000
      000000000000000000000000E03D0000000000000000000000000F000F000F00
      00000F00000000000F000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E00005967E07F0000E03DE03DE03D
      E03DE03DE03DE03DE03DE03D0000734E934E00000000E03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03DE03D000000000000000000000000000000000F00
      00000F000F000F0000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E0000E07F5967E07F0000E03DE03D
      E03DE03DE03DE03DE03DE03DE03D0000734E00000000E03DE03D000000000000
      00000000000000000000E03DE03D000000000000000000000000000000000F00
      00000F000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E00005967E07F5967E07F00000000
      00000000000000000000000000000000000000000000E03D00000000734E0000
      734E0000734E0000734E0000E03D000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E0000E07F5967E07F5967E07F5967
      E07F5967E07F0000734E934E734E934E734E00000000E03D0000734E0000734E
      0000734E0000734E00000000E03D000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0821734E734E734E00005967E07F5967E07F5967E07F
      5967E07F59670000934E734E934E734E934E00000000E03D00000000734E0000
      734E0000734E0000734E0000E03D000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7F0821082108210821734E734E734E0000E07F5967E07F000000000000
      0000000000000000734E934E734E934E734E00000000E03D0000734E0000734E
      0000734E0000734E00000000E03D000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7F0821FF7F0821FF7F734E734E734E734E000000000000734E934E734E
      934E734E934E734E934E000000000000934E00000000E03D00000000734E0000
      734E0000734E0000734E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E0821FF7FFF7FFF7FFF7F
      FF7FFF7F08210821FF7FFF7F734E734E734E934E734E934E734E934E734E934E
      734E934E734E934E734E934E00000000734E00000000E03D0000734E0000734E
      0000734E0000734E000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E08210821082108210821
      082108210821FF7FFF7FFF7F734E734E734E734E934E734E934E734E934E734E
      934E0000934E734E934E0000934E0000934E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734E734E734E734E734E734E734E
      734E734E734E734E734E734E734E734E734E934E734E934E734E934E734E934E
      734E934E000000000000934E734E934E734E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00934E734E934E734E934E734E934E734E
      FF7F734E734E734EFF7F08210821FF7FFF7FFF7FFF7FFF7F734E734E0821FF7F
      3967396739673967396739673967396739673967396700003967396739673967
      0000000000000000000000000000000000000000000000000000000000000000
      0000934E0000934E0000934E734E934E00001FF80000FDFF00003FFC0000F9FF
      00007FFE0000F1FF00007FFE0000E00000007FFE6EEEF1FF00007FFE6EEEF9FF
      00003FFC0000FDFF00003FFC6EEEFFFF00003FFC6EEEFFFF0000381C0000FFBF
      0000381C6EEEFF9F0000381C6EEEFF8F00003C7C0000000700001FF80000FF8F
      00000FF00000FF9F000007C00000FFBFFFFFFFFFFFFF800FFFFFFC00FFFF800F
      FE008000FFFF800FFE000000FFFF800FFE000000FFFF800F80000000FFF7800F
      80000001C1F7800F80000003C3FB800F80000003C7FB800F80010003CBFB800F
      80030003DCF7800F80070FC3FF0F0001807F0003FFFF000180FF8007FFFF0000
      81FFF87FFFFF0000FFFFFFFFFFFF000000000000FFFFFFFF00000000C001F3FF
      000000008021ED9F000000008011ED6F000000008021ED6F000000008001F16F
      000000008001FD1F000000008001FC7F000000008AA1FEFF000000008551FC7F
      000000008AA1FD7F000000008551F93F000000008AA1FBBF000000008555FBBF
      000000008001FBBF00000000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 224
    object PN1: TMenuItem
      Caption = '��������� ������� ��� ��������� �����'
      OnClick = PN1Click
    end
    object PN2: TMenuItem
      Caption = '��������� ������� � �������� ������'
      OnClick = PN2Click
    end
    object PN3: TMenuItem
      Caption = '��������� ������� � ������� �������������'
      OnClick = PN3Click
    end
    object PN4: TMenuItem
      Caption = '���������� �������'
      OnClick = PN4Click
    end
    object PN5: TMenuItem
      Caption = '����� ��������'
      OnClick = PN5Click
    end
    object PN6: TMenuItem
      Caption = '������� ������� �����������'
      OnClick = PN6Click
    end
    object PN7: TMenuItem
      Caption = '������� ������ � �������� ������'
      OnClick = PN7Click
    end
    object PN8: TMenuItem
      Caption = '������� ���������'
      OnClick = PN8Click
    end
    object PN9: TMenuItem
      Caption = '����� ��������'
      OnClick = PN9Click
    end
    object PN10: TMenuItem
      Caption = 'DES'
      OnClick = PN10Click
    end
  end
end
