unit mungo.textfile.pascal.sourceeditor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,

  SynHighlighterPas,

  mungo.intf.filepointer,

  mungo.components.colors,
  mungo.textfile.sourceeditor,

  passrcutil;

type

  { TSourceEditorPascal }

  TSourceEditorPascal = class ( TSourceEditor )
    constructor Create(ARootControl: TObject; AFileInfo: TFilePointer); override; overload;
    class function FileMatch(AFileInfo: TFilePointer): Boolean; override;
  end;


implementation

{ TSourceEditorPascal }


constructor TSourceEditorPascal.Create(ARootControl: TObject; AFileInfo: TFilePointer);
var
  HighLighter: TSynFreePascalSyn;
begin
  inherited Create(ARootControl, AFileInfo);
  HighLighter:= TSynFreePascalSyn.Create( Editor );
  Editor.Highlighter:= HighLighter;

  Editor.Gutter.Color:= White;
  Editor.Color:= White;
//  Editor.BracketMatchColor:= Blue800;
  TSynFreePascalSyn( Editor.Highlighter ).NumberAttri.Foreground:= Blue600;
  TSynFreePascalSyn( Editor.Highlighter ).StringAttri.Foreground:= BlueGray600;
  TSynFreePascalSyn( Editor.Highlighter ).SymbolAttri.Foreground:= Brown600;
  TSynFreePascalSyn( Editor.Highlighter ).CommentAttribute.Foreground:= LightGreen600;
  TSynFreePascalSyn( Editor.Highlighter ).AsmAttri.Foreground:= Red800;
  TSynFreePascalSyn( Editor.Highlighter ).DirectiveAttri.Foreground:= Red400;
end;

class function TSourceEditorPascal.FileMatch(AFileInfo: TFilePointer): Boolean;
begin
  Result:= inherited;
  if ( Result ) then
    Result:= ( AFileInfo.Extension = '.pas' )
          or ( AFileInfo.Extension = '.pp' )
          or ( AFileInfo.Extension = '.p' )
          or ( AFileInfo.Extension = '.lpr' )
          or ( AFileInfo.Extension = '.lfm' );
end;

end.

