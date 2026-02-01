unit UnitServicoPais;

interface

uses
  System.SysUtils, System.JSON, System.Net.HttpClientComponent, System.Net.HttpClient,
  System.Net.URLClient, System.NetEncoding; // Adicionado Net.Encoding

type
  TPaisInfo = record
    NomeOficial: string;
    Capital: string;
    Regiao: string;
    Populacao: string;
    Moeda: string;
  end;

  TPaisService = class
  public
    class function ConsultarPais(const APais: string): TPaisInfo;
  end;

implementation

class function TPaisService.ConsultarPais(const APais: string): TPaisInfo;
var
  HTTP: TNetHTTPClient;
  Response: string;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  JSONObject, NameObj, CurrenciesObj, CurrencyObj: TJSONObject;
  LResponse: IHTTPResponse;
begin
  Result := Default(TPaisInfo);
  HTTP := TNetHTTPClient.Create(nil);
  try
    // Correção da sintaxe e encoding
    LResponse := HTTP.Get('https://restcountries.com/v3.1/translation/'
    + TNetEncoding.URL.Encode(APais));
    Response := LResponse.ContentAsString(TEncoding.UTF8);

    JSONValue := TJSONObject.ParseJSONValue(Response);
    if not Assigned(JSONValue) then
      raise Exception.Create('Resposta inválida da API');

    try
      if not (JSONValue is TJSONArray) then
        raise Exception.Create('País não encontrado ou erro na requisição');

      JSONArray := JSONValue as TJSONArray;
      JSONObject := JSONArray.Items[0] as TJSONObject;

      // Nome Oficial
      if JSONObject.TryGetValue('name', NameObj) then
        Result.NomeOficial := NameObj.GetValue('official').Value;

      // Capital (é um array)
      if JSONObject.TryGetValue('capital', JSONArray) then
        Result.Capital := JSONArray.Items[0].Value;

      // Região
      Result.Regiao := JSONObject.GetValue('region').Value;

      // População
      Result.Populacao := JSONObject.GetValue('population').Value;

      // Moeda (Dinâmico)
      if JSONObject.TryGetValue('currencies', CurrenciesObj) and (CurrenciesObj.Count > 0) then
      begin
        CurrencyObj := CurrenciesObj.Pairs[0].JsonValue as TJSONObject;
        Result.Moeda := CurrencyObj.GetValue('name').Value;
      end;

    finally
      JSONValue.Free;
    end;
  finally
    HTTP.Free;
  end;
end;

end.
