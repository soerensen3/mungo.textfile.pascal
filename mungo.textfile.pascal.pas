{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit mungo.textfile.pascal;

{$warn 5023 off : no warning about unused units}
interface

uses
  mungo.textfile.pascal.sourceeditor, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('mungo.textfile.pascal', @Register);
end.
