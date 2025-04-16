[Setup]
AppName=NvimUnity
AppVersion=1.0.0
DefaultDirName={pf}\NvimUnity
DefaultGroupName=NvimUnity
UninstallDisplayIcon={app}\nvimunity.exe
OutputDir=Output
OutputBaseFilename=nvimunity-setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar ícone na área de trabalho"; GroupDescription: "Opções adicionais:"
Name: "startmenu"; Description: "Criar atalho no menu Iniciar"; GroupDescription: "Opções adicionais:"
Name: "envvar"; Description: "Adicionar variável de ambiente NVIMUNITY_PATH"; GroupDescription: "Opções adicionais:"

[Files]
Source: "nvimunity.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\NvimUnity"; Filename: "{app}\nvimunity.exe"; Tasks: startmenu
Name: "{commondesktop}\NvimUnity"; Filename: "{app}\nvimunity.exe"; Tasks: desktopicon

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType: string; ValueName: "NVIMUNITY_PATH"; ValueData: "{app}"; Flags: uninsdeletevalue; Tasks: envvar

