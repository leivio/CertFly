/********************************************************************************/
/* Projeto: Componente CertFly                                                  */
/* Proposta: Lib para assinar documentos XML com A3 e Sha256 para todas as      */
/* liguagens de programação com suporte a COM                                   */
/* Endereço - https://github.com/leivio/CertFly                                 */

/* Direitos Autorais Reservados (c) 2017 Leivio Fontenele                       */

/* Colaboradores nesse arquivo:                                                 */

/*  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     */
/* Componente localizado em https://github.com/leivio/CertFly                   */


/*  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la */
/* sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  */
/* Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) */
/* qualquer versão posterior.                                                   */

/*  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   */
/* NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      */
/* ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor*/
/* do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              */

/*  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto*/
/* com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  */
/* no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          */
/* Você também pode obter uma copia da licença em:                              */
/* http://www.opensource.org/licenses/lgpl-license.php                          */

/* Leivio Ramos de Fontenele  -  leivio@yahoo.com.br  -  www.happysale.com.br   */
/********************************************************************************/

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
