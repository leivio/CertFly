unit Certfly;

interface

type

  TCertfly = class
  public
    // Função para assinar xml com certificado A3 usando SHA256
    class function Assinar(
      const ArquivoASerAssinado: string;  {Local Arquivo xml para ser assinado}
      const ArquivoDestino: string;       {Local de destino do arquivo xml assinado}
      const ATagAssinatura: string;       {Tag Assiantura}
      const AAtributoId: string;          {Atributo Reference ID se necessario}
      const ANumeroSerie: string;         {Numero Serie Certificado A3}
      const Apin: string                  {Senha ou PIN do certificado A3}
        ): Integer;                       {Retorno: 0 - Sucesso 1- Erro}
  end;
implementation

{ TCertfly }

uses Certfly_TLB;

class function TCertfly.Assinar(const ArquivoASerAssinado, ArquivoDestino, ATagAssinatura, AAtributoId, ANumeroSerie,
  Apin: string): Integer;
var
  CertFly: ICertfly;
begin
  CertFly := CoCertfly_.Create;
  try
    Result := CertFly.AssinarSha256A3(ArquivoASerAssinado, ArquivoDestino, ATagAssinatura , AAtributoId, ANumeroSerie, Apin);
  finally
    CertFly := nil;
  end;
end;

end.
