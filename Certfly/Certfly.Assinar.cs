using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Xml;
using System.IO;
using System.Security;
using System.Deployment.Internal.CodeSigning;

namespace Certfly
{
    public static class AssinaturaSHA256
    {
        public static int Assinar(string AFilexml, string AFilexmlOut, string AtagAssinatura, string AAtributoId, string ANumeroSerie, string Apin)
        {
            System.IO.StreamReader SR = null;

            try
            {
                // Carrega xml 
                SR = File.OpenText(AFilexml);
                string xmlString = SR.ReadToEnd();
                SR.Close();
                SR = null;
                // Criar um novo XML document.
                XmlDocument doc = new System.Xml.XmlDocument();

                // Iguinorar os espaços em branco
                doc.PreserveWhitespace = false;

                // carrega o arquivo no documentoXML
                doc.LoadXml(xmlString);
                
                // Carregar o certificado do store de acordo com a serie
                X509Certificate2 x509Cert = GetCertificate(ANumeroSerie);

                //  Assinar arquivo passando o pin
                var doc2 = SignXML(doc.OuterXml, x509Cert, AAtributoId, Apin);

                // Gravar o xml assinado
                string conteudoXMLAs = doc2.OuterXml;

                using (StreamWriter sw = File.CreateText(AFilexmlOut))
                {
                    sw.Write(conteudoXMLAs);
                    sw.Close();
                }

                if (doc2.OuterXml != string.Empty)
                {
                    return 0;
                }
                else
                {
                    return 1;
                }

            }
            finally
            {
                if (SR != null)
                    SR.Close();
            }
        }

        // Passagem do PIN para o não precisar do dialog da senha
        static RSACryptoServiceProvider LerDispositivo(RSACryptoServiceProvider key, string APin)
        {
            CspParameters csp = new CspParameters(key.CspKeyContainerInfo.ProviderType, key.CspKeyContainerInfo.ProviderName);
            SecureString ss = new System.Security.SecureString();
            foreach (char a in APin)
            {
                ss.AppendChar(a);
            }
            csp.ProviderName = key.CspKeyContainerInfo.ProviderName;
            csp.ProviderType = key.CspKeyContainerInfo.ProviderType;
            csp.KeyNumber = key.CspKeyContainerInfo.KeyNumber == KeyNumber.Exchange ? 1 : 2;
            csp.KeyContainerName = key.CspKeyContainerInfo.KeyContainerName;
            csp.KeyPassword = ss;
            csp.Flags = CspProviderFlags.NoPrompt | CspProviderFlags.UseDefaultKeyContainer;

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(csp);
            return rsa;
        }

        // definição da Signature a utilizar 
        static XmlDocument SignXML(string mensagemXML, X509Certificate2 certificado, string AAtributoId, string APin)
        {
            CryptoConfig.AddAlgorithm(typeof(RSAPKCS1SHA256SignatureDescription), "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256");

            System.Xml.XmlDocument xmlDoc = new XmlDocument();
            RSACryptoServiceProvider Key = new RSACryptoServiceProvider();
            SignedXml SignedDocument = default(SignedXml);
            KeyInfo keyInfo = new KeyInfo();
            xmlDoc.LoadXml(mensagemXML);

            Key = (RSACryptoServiceProvider)certificado.PrivateKey;
            keyInfo.AddClause(new KeyInfoX509Data(certificado));
            SignedDocument = new SignedXml(xmlDoc);

            SignedDocument.SigningKey = Key;
            SignedDocument.KeyInfo = keyInfo;
            SignedDocument.SigningKey = LerDispositivo(Key, APin);
            SignedDocument.SignedInfo.CanonicalizationMethod = "http://www.w3.org/TR/2001/REC-xml-c14n-20010315";
            SignedDocument.SignedInfo.SignatureMethod = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";

            Reference reference = new Reference();
             if (AAtributoId == "0")
             {
                 reference.Uri = string.Empty;
             } 
             else
             {
                 reference.Uri = "#" + AAtributoId;
             }           
            reference.AddTransform(new XmlDsigEnvelopedSignatureTransform());
            reference.AddTransform(new XmlDsigC14NTransform(false));
            SignedDocument.AddReference(reference);
            SignedDocument.ComputeSignature();
            System.Xml.XmlElement xmlDigitalSignature = SignedDocument.GetXml();
            xmlDoc.DocumentElement.AppendChild(xmlDoc.ImportNode(xmlDigitalSignature, true));

            return xmlDoc;
        }

        // metodo para retornar o certificado de acordo com a serie passada
        static X509Certificate2 GetCertificate(string ASerie)
        {
            X509Certificate2 myCert = null;
            var store = new X509Store(StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly);
            var certificates = store.Certificates;
            foreach (var certificate in certificates)
            {
                if (certificate.SerialNumber.ToUpper() == ASerie.ToUpper())
                {
                    myCert = certificate;
                    break;
                }
            }
            return myCert;
        }
    }
}
