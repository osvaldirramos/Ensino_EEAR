object Form_Rel_Aprovados: TForm_Rel_Aprovados
  Left = 224
  Top = 121
  Width = 1148
  Height = 784
  Caption = 'Rela'#231#227'o de Aprovados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000FFF
    FFFFFFF8BBBBBBB8FFFFFFFFFF000FFFFFFFFBBBB77887BBBBFFFFFFFF000FFF
    FFFBBB8888FF88888BB8FFFFFF000FFFFFBB7E888EEEEE88887BBFFFFF000FFF
    FBBEFE777788888778FEBBFFFF000FFFBBE88E88888788888E8FEB8FFF000FF8
    BEFEE86F88F78FF8E8E8F7BFFF000FFB788E8EC788878886CC8E88BBFF000F8B
    E8E8ECEC8888887CECE8EE8BFF000FBB88EECECC688888CCCECEE88BFF000FB7
    8E8CEECEC87786CECE6C8887BF000FB88EECECECC883FCC6ECECEEF8BF0008B8
    8EECECECCECCCECCECCCEE88BF0008BE8EECCC8EEF8CCCE88E8CE888BF0008BE
    E8688F8CEC8F8CE8888CE8E7BF0008BEE8E7C88CE77E88E8876E68E8BF0008BE
    EEE66CEEECCCC6CEEEECEEE8BF0008BEEE867CE8C8EE88C6ECC88EE8BF0008BE
    EE8C68EEEE88EECECECC8EE8BF0008BEEEE8EEECEE776EECEEC8EEE8BF0008BE
    EEEE8ECECC787CCEECE8EEE8BF0008BEEEEE8ECCEC898EECCE8EEEE8BF0008BE
    EEEEEE8CCC888CCC88EEEEE8BF0008BEEEEEEEE88E8F8E88EEEEEEE8BF0008BE
    8888888888E8E888888888E8BF0008B7777777777777777777777777BF0008BC
    CCC3CCCC88C8FEC88FCFCE86BF0008BCC63336CC88EF6FCFEECFFFE6BF0008BC
    6336336C888FCCCF88C88FC7BF0008BC3666663C88CFFFCF88CCF8C6BF0008B6
    666666666666666666666667BF0008BBBBBBBBBBBBBBBBBBBBBBBBBBBF008000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    0003800000038000000380000003800000038000000380000003800000038000
    000380000003800000038000000380000003800000038000000380000003}
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object QuickRep1: TQuickRep
    Left = 4
    Top = 10
    Width = 1111
    Height = 1572
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = Query_RelacaoAlunos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 140
    object QRBand1: TQRBand
      Left = 53
      Top = 349
      Width = 1032
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        153.080357142857100000
        1950.357142857143000000)
      BandType = rbSummary
    end
    object QRBand2: TQRBand
      Left = 53
      Top = 26
      Width = 1032
      Height = 298
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        563.184523809523800000
        1950.357142857143000000)
      BandType = rbPageHeader
      object QRLabel7: TQRLabel
        Left = 7
        Top = 133
        Width = 1018
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          13.229166666666670000
          251.354166666666700000
          1923.898809523810000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'COMANDO DA AERON'#193'UTICA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object TQRShape
        Left = 0
        Top = 273
        Width = 1029
        Height = 1
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.889880952380952000
          0.000000000000000000
          515.937500000000000000
          1944.687500000000000000)
        Shape = qrsHorLine
      end
      object QRImage_Log01: TQRImage
        Left = 433
        Top = 6
        Width = 88
        Height = 98
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          818.318452380952400000
          11.339285714285710000
          166.309523809523800000)
        Stretch = True
      end
      object TQRShape
        Left = 1
        Top = 275
        Width = 1029
        Height = 24
        Frame.Color = clPurple
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142860000
          1.889880952380952000
          519.717261904761900000
          1944.687500000000000000)
        Brush.Color = 15724527
        Pen.Color = 15000804
        Shape = qrsRectangle
      end
      object QRLabel_Serie: TQRLabel
        Left = 799
        Top = 275
        Width = 225
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          1510.014880952381000000
          519.717261904761900000
          425.223214285714300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TEMPOS'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 293
        Top = 275
        Width = 500
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          553.735119047619000000
          519.717261904761900000
          944.940476190476200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DISCIPLINA'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRShape11: TQRShape
        Left = 796
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          1504.345238095238000000
          515.937500000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 106
        Width = 1025
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.136904761904760000
          0.000000000000000000
          200.327380952381000000
          1937.127976190476000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MINIST'#201'RIO DA DEFESA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object QRLabel4: TQRLabel
        Left = 6
        Top = 275
        Width = 139
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          11.339285714285710000
          519.717261904761900000
          262.693452380952400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATA'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 150
        Top = 275
        Width = 139
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          283.482142857142900000
          519.717261904761900000
          262.693452380952400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FALTAS'
        Color = 15724527
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRShape10: TQRShape
        Left = 147
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          277.812500000000000000
          515.937500000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape1: TQRShape
        Left = 1
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          1.889880952380952000
          515.937500000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape2: TQRShape
        Left = 291
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          549.955357142857100000
          515.937500000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape3: TQRShape
        Left = 1028
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          1942.797619047619000000
          515.937500000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRLabel6: TQRLabel
        Left = 7
        Top = 157
        Width = 1018
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          13.229166666666670000
          296.711309523809500000
          1923.898809523810000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ESCOLA DE ESPECIALISTAS DE AERON'#193'UTICA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 7
        Top = 184
        Width = 1018
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          13.229166666666670000
          347.738095238095200000
          1923.898809523810000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SE'#199#195'O DE AVALIA'#199#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 11
      end
      object QRLabel_Descricao: TQRLabel
        Left = 7
        Top = 224
        Width = 1010
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.247023809523810000
          13.229166666666670000
          423.333333333333300000
          1908.779761904762000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RELAT'#211'RIO DE FALTAS DO '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 53
      Top = 324
      Width = 1032
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.247023809523810000
        1950.357142857143000000)
      BandType = rbDetail
      object QRDBText10: TQRDBText
        Left = 296
        Top = 1
        Width = 487
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          559.404761904761900000
          1.889880952380952000
          920.372023809523800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Query_RelacaoAlunos
        DataField = 'IDUNIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 5
        Top = 1
        Width = 132
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          9.449404761904762000
          1.889880952380952000
          249.464285714285700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Query_RelacaoAlunos
        DataField = 'DATACHAMADA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape14: TQRShape
        Left = 817
        Top = 0
        Width = 1
        Height = 36
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.035714285714290000
          1544.032738095238000000
          0.000000000000000000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape4: TQRShape
        Left = 147
        Top = 1
        Width = 1
        Height = 30
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.696428571428570000
          277.812500000000000000
          1.889880952380952000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRDBText2: TQRDBText
        Left = 149
        Top = 1
        Width = 134
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.577380952380950000
          281.592261904761900000
          1.889880952380952000
          253.244047619047600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Query_RelacaoAlunos
        DataField = 'DATACHAMADA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 291
        Top = 1
        Width = 1
        Height = 23
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          549.955357142857100000
          1.889880952380952000
          1.889880952380952000)
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 797
        Top = 1
        Width = 1
        Height = 23
        Frame.Color = clRed
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          43.467261904761900000
          1506.235119047619000000
          1.889880952380952000
          1.889880952380952000)
        Shape = qrsVertLine
      end
    end
  end
  object Query_RelacaoAlunos: TIBQuery
    Database = DM.IBDatabase_Chamada
    Transaction = DM.IBTransaction_Chamada
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = Form_MenuPrincipal.DSQ_ListaChamadaAlunos
    SQL.Strings = (
      
        'Select a.idcurso, a.idturma, a.serie, a.idaluno,c.datachamada, d' +
        '.codmateria, count(*) as Qtd_Faltas'
      'From disciplina d, chamada c, alunoturma a'
      'where c.idaluno = a.idaluno'
      'and   c.iddisciplina = d.iddisciplina'
      'and   c.presenca = '#39'F'#39
      'and   a.idcurso = :IdCurso'
      'and   a.idTurma = :IdTurma'
      'and   a.Serie = :Serie'
      'and   a.idAluno = :IdAluno'
      
        'GROUP BY a.idcurso, a.idturma, a.serie, a.idaluno,c.datachamada,' +
        ' d.codmateria'
      
        'ORDER BY a.idcurso, a.idturma, a.serie, a.idaluno,c.datachamada,' +
        ' d.codmateria')
    Left = 14
    Top = 33
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'IDCURSO'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'IDTURMA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'IDALUNO'
        ParamType = ptUnknown
        Size = 4
      end>
    object Query_RelacaoAlunosIDCURSO: TSmallintField
      FieldName = 'IDCURSO'
      Origin = 'ALUNOTURMA.IDCURSO'
      Required = True
    end
    object Query_RelacaoAlunosIDTURMA: TIntegerField
      FieldName = 'IDTURMA'
      Origin = 'ALUNOTURMA.IDTURMA'
      Required = True
    end
    object Query_RelacaoAlunosSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ALUNOTURMA.SERIE'
      Required = True
      Size = 1
    end
    object Query_RelacaoAlunosIDALUNO: TIntegerField
      FieldName = 'IDALUNO'
      Origin = 'ALUNOTURMA.IDALUNO'
      Required = True
    end
    object Query_RelacaoAlunosDATACHAMADA: TDateTimeField
      FieldName = 'DATACHAMADA'
      Origin = 'CHAMADA.DATACHAMADA'
    end
    object Query_RelacaoAlunosCODMATERIA: TIBStringField
      FieldName = 'CODMATERIA'
      Origin = 'DISCIPLINA.CODMATERIA'
      Required = True
      Size = 6
    end
    object Query_RelacaoAlunosQTD_FALTAS: TIntegerField
      FieldName = 'QTD_FALTAS'
      Required = True
    end
  end
  object DSQ_TurmaAndamento: TDataSource
    DataSet = Query_RelacaoAlunos
    Left = 48
    Top = 32
  end
end
