object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form3'
  ClientHeight = 240
  ClientWidth = 463
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 392
    Top = 24
  end
end
