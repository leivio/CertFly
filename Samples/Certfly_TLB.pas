unit Certfly_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 31/08/2017 08:49:48 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Fontes\Certfly\Certfly\Certfly\bin\Release\Certfly.tlb (1)
// LIBID: {828BA0EC-B91C-4F06-AFE2-B36372DA4C17}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: TypeInfo 'Certfly' changed to 'Certfly_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CertflyMajorVersion = 1;
  CertflyMinorVersion = 0;

  LIBID_Certfly: TGUID = '{828BA0EC-B91C-4F06-AFE2-B36372DA4C17}';

  IID_ICertfly: TGUID = '{97D1968E-DC7F-45BD-BD0E-1AC822D95264}';
  CLASS_Certfly_: TGUID = '{E8D53EED-3B2F-45A8-BB29-CC111BB426D1}';
  IID__AssinaturaSHA256: TGUID = '{3EDC851F-0819-3574-BC98-3F0B1B10E5E1}';
  CLASS_AssinaturaSHA256: TGUID = '{50AEF51F-F2CB-3BC1-AC3B-BA8F60016590}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICertfly = interface;
  ICertflyDisp = dispinterface;
  _AssinaturaSHA256 = interface;
  _AssinaturaSHA256Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Certfly_ = ICertfly;
  AssinaturaSHA256 = _AssinaturaSHA256;


// *********************************************************************//
// Interface: ICertfly
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97D1968E-DC7F-45BD-BD0E-1AC822D95264}
// *********************************************************************//
  ICertfly = interface(IDispatch)
    ['{97D1968E-DC7F-45BD-BD0E-1AC822D95264}']
    function AssinarSha256A3(const AFilexml: WideString; const AFilexmlOut: WideString; 
                             const tagAssinatura: WideString; const AAtributoId: WideString; 
                             const ANumeroSerie: WideString; const Apin: WideString): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICertflyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97D1968E-DC7F-45BD-BD0E-1AC822D95264}
// *********************************************************************//
  ICertflyDisp = dispinterface
    ['{97D1968E-DC7F-45BD-BD0E-1AC822D95264}']
    function AssinarSha256A3(const AFilexml: WideString; const AFilexmlOut: WideString; 
                             const tagAssinatura: WideString; const AAtributoId: WideString; 
                             const ANumeroSerie: WideString; const Apin: WideString): Integer; dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _AssinaturaSHA256
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3EDC851F-0819-3574-BC98-3F0B1B10E5E1}
// *********************************************************************//
  _AssinaturaSHA256 = interface(IDispatch)
    ['{3EDC851F-0819-3574-BC98-3F0B1B10E5E1}']
  end;

// *********************************************************************//
// DispIntf:  _AssinaturaSHA256Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3EDC851F-0819-3574-BC98-3F0B1B10E5E1}
// *********************************************************************//
  _AssinaturaSHA256Disp = dispinterface
    ['{3EDC851F-0819-3574-BC98-3F0B1B10E5E1}']
  end;

// *********************************************************************//
// The Class CoCertfly_ provides a Create and CreateRemote method to          
// create instances of the default interface ICertfly exposed by              
// the CoClass Certfly_. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCertfly_ = class
    class function Create: ICertfly;
    class function CreateRemote(const MachineName: string): ICertfly;
  end;

// *********************************************************************//
// The Class CoAssinaturaSHA256 provides a Create and CreateRemote method to          
// create instances of the default interface _AssinaturaSHA256 exposed by              
// the CoClass AssinaturaSHA256. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAssinaturaSHA256 = class
    class function Create: _AssinaturaSHA256;
    class function CreateRemote(const MachineName: string): _AssinaturaSHA256;
  end;

implementation

uses System.Win.ComObj;

class function CoCertfly_.Create: ICertfly;
begin
  Result := CreateComObject(CLASS_Certfly_) as ICertfly;
end;

class function CoCertfly_.CreateRemote(const MachineName: string): ICertfly;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Certfly_) as ICertfly;
end;

class function CoAssinaturaSHA256.Create: _AssinaturaSHA256;
begin
  Result := CreateComObject(CLASS_AssinaturaSHA256) as _AssinaturaSHA256;
end;

class function CoAssinaturaSHA256.CreateRemote(const MachineName: string): _AssinaturaSHA256;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AssinaturaSHA256) as _AssinaturaSHA256;
end;

end.
