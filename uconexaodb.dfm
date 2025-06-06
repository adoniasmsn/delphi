object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 123
  Width = 262
  object ConexaoDB: TFDConnection
    Params.Strings = (
      'Database=VENDAS'
      'User_Name=sa'
      'Password=1234'
      'Server=localhost'
      'OSAuthent=No'
      'ApplicationName=Architect'
      'Workstation=DESKTOP-0T6UVE4'
      'MARS=yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 16
  end
end
