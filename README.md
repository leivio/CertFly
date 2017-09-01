# CertFly - lib COM .NET #

# Descrição

- Certificação de arquivo XML usando certificado do tipo A3.

- Lib para ser usada por qualquer liguagem com suporte a COM.

- Lib COM desenvolvida em C# .NET 4.6.1.

**Metodo de chamada**
  
 - AssinarSha256A3(string AFilexml,    //  **{Caminho do Arquivo xml para ser assinado}**
                string AFilexmlOut,    //  **{Caminho do destino do arquivo xml assinado}**
		string tagAssinatura,  //  **{Tag Assiantura}**
		string AAtributoId,    //  **{Atributo Reference ID se necessario. Passe 0 para vazio}**
		string ANumeroSerie,   //  **{Numero Serie Certificado A3}**
		string Apin)           //  **{Senha ou PIN do certificado A3}**

