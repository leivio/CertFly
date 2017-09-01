using RGiesecke.DllExport;
using System;
using System.Runtime.InteropServices;

namespace Certfly
{
    [ComVisible(true)]
    [ClassInterface(ClassInterfaceType.None)]
    [ComDefaultInterface(typeof(ICertfly))]
    [Guid("E8D53EED-3B2F-45A8-BB29-CC111BB426D1")]
    public class Certfly: ICertfly
    {
        [DllExport]
        public int AssinarSha256A3(string AFilexml, string AFilexmlOut, string tagAssinatura, string AAtributoId, string ANumeroSerie, string Apin)
        {
            return AssinaturaSHA256.Assinar(AFilexml, AFilexmlOut, tagAssinatura, AAtributoId, ANumeroSerie, Apin);
        }
    }

    [ComVisible(true)]
    [Guid("97D1968E-DC7F-45BD-BD0E-1AC822D95264")]
    public interface ICertfly
    {
        int AssinarSha256A3(string AFilexml, string AFilexmlOut, string tagAssinatura, string AAtributoId, string ANumeroSerie, string Apin);
    }
}
