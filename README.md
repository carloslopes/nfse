# NFS-e

Gem para realizar diversas ações relacionadas a nota fiscal de **serviço** eletrônica.

## Features prontas

### Campinas/SP

* Geração do xml de envio de lote
* Geração do xml de consulta de lote
* Geração do xml de cancelamento de nota

### Rio de Janeiro/RJ

Atenção: O layout do Rio de Janeiro ainda está sendo desenvolvido e não foi homologado. **Não use em produção!**

* Geração do xml de envio de lote

### TODO
* Assinar os XML gerados
* Enviar os XML gerados e assinados para o WebService
* Consulta de notas
* Consulta sequencial RPS
* Refatorar testes do initialize da RPS (usar um describe apenas)
* Instanciar os default values dos atributos apenas para os que não receberam nada pelo initialize

**Atualmente a gem só gera NFS-e seguindo os padrões da prefeitura de Campinas/SP e do Rio de Janeiro/RJ**

## Links de referências

### Campinas

[Manual de uso do WebService](http://nfse.campinas.sp.gov.br/NotaFiscal/cpqPDF/WebService.pdf)  
[Exemplos de XML e XSD](http://www.dsfnet.com.br/nfse_lote/exemplosws.zip)

### Rio de Janeiro

[Manual de uso do WebService](https://notacarioca.rio.gov.br/files/manuais/WsNFSeNacional.pdf)  
[Manual de Integração ABRASF](https://notacarioca.rio.gov.br/files/manuais/nfse_abrasf_integracao.pdf)  
[Manual Conceitual da ABRASF](https://notacarioca.rio.gov.br/files/manuais/nfse_abrasf_conceitual.pdf)  
[Schemas XML](https://notacarioca.rio.gov.br/files/WSNacional/schemas.zip)  
[Exemplos de XML](https://notacarioca.rio.gov.br/files/WSNacional/exemplos.zip) 

## Instalação

Adicione essa linha ao arquivo Gemfile:

    gem 'nfse'

e depois execute:

    $ bundle

Ou instale diretamente:

    $ gem install nfse

## Modo de Uso

* Todas as classes podem receber um Hash contendo o valor de seus atributos ao serem inicializadas (como mostra o exemplo do Cancelamento de nota abaixo)
* Todas as classes principais de cada método do WebService podem receber tanto um Hash como um JSON de atributos (como mostra o exemplo da Consulta de lote abaixo)

### Campinas/SP

#### Envio de lote

```ruby
require 'nfse'

# Lote
lote = Nfse::Envio::Lote.new
lote.id = '1ABCDZ'
lote.cod_cidade = '6291'
lote.cnpj = '02646676000182'
lote.razao_social = 'Empresa Resp. Modelo'

# RPS
rps = Nfse::Envio::Rps.new
rps.numero = '109'
rps.data_emissao = Time.new(2009, 10, 1)
rps.situacao = 'N'
rps.serie_rps_substituido = '123'
rps.num_rps_substituido = '0'
rps.num_nfse_substituida = '1'
rps.data_nfse_substituida = '1900-01-01'
rps.cod_atividade = '412040000'
rps.aliquota_atividade = '5.0'
rps.tipo_recolhimento = 'R'
rps.cod_municipio_prestacao = '0006291'
rps.municipio_prestacao = 'CAMPINAS'
rps.operacao = 'A'
rps.tributacao = 'T'
rps.valor_pis = 0.0
rps.valor_cofins = 1.1
rps.valor_inss = 2.2
rps.valor_ir = 3.3
rps.valor_csll = 4.4
rps.aliquota_pis = 5.5
rps.aliquota_cofins = 6.6
rps.aliquota_inss = 7.7
rps.aliquota_ir = 8.8
rps.aliquota_csll = 9.9
rps.descricao = 'TESTE'
rps.motivo_cancelamento = 'motivo exemplo'
rps.cnpj_intermediario = '123456789'

# Prestador
prestador = rps.prestador
prestador.inscricao_municipal = '0370835'
prestador.razao_social        = 'EMPRESA MODELO'
prestador.ddd                 = '035'
prestador.telefone            = '40405050'

# Tomador
tomador = rps.tomador
tomador.inscricao_municipal = '0000000'
tomador.cnpj                = '27394162000108'
tomador.razao_social        = 'EMPRESA DE TESTE'
tomador.tipo_logradouro     = 'RUA'
tomador.logradouro          = 'logradouro exemplo'
tomador.num_endereco        = '9'
tomador.tipo_bairro         = 'BAIRRO'
tomador.bairro              = 'bairro exemplo'
tomador.cod_cidade          = '00062910'
tomador.cidade              = 'SAO PAULO'
tomador.cep                 = '05010040'
tomador.email               = 'foo@example.com'
tomador.ddd                 = '011'
tomador.telefone            = '923156467'

# Deducoes
deducao = Nfse::Envio::Deducao.new

deducao.por = 'Valor'
deducao.tipo = 'Despesas com Materiais'
deducao.cnpj_ref = '001002003'
deducao.num_nf_ref = '100200301'
deducao.valor_total_ref = 100.00
deducao.percentual = 20.0
deducao.valor = 25.0

rps.deducoes << deducao

# Itens
rps.itens << Nfse::Envio::Item.new({
  discriminacao:  'Item exemplo',
  quantidade:     '1',
  valor_unitario: '100.00',
  tributavel:     'S'
})

lote.rps << rps

xml = lote.render
puts xml
```

#### Consulta de lote

```ruby
require 'nfse'

consulta_lote = Nfse::ConsultaLote.new('{
  "cod_cidade": "6291",
  "cnpj": "27394162000108",
  "versao": "2",
  "num_lote": "7105"
}')

xml = consulta_lote.render
puts xml
```

#### Cancelamento de nota

```ruby
require 'nfse'

cancelamento = Nfse::Cancelamento.new({
  id:         '1ABCDZ',
  cod_cidade: '6291',
  cnpj:       '04659416000177',
  transacao:  'false',
  versao:     '2',
  notas: [
    {
      numero:              '5',
      inscricao_municipal: '000000108',
      cod_verificacao:     '98d0e61d9396b60e5a847a361cb9264e4b6d0c9f',
      motivo_cancelamento: 'Teste de cancelamento'
    }
  ]
})

xml = cancelamento.render
puts xml
```

### Rio de Janeiro/RJ

#### Envio de lote

```ruby
require 'nfse'

Nfse::Base.prefeitura = :rio_de_janeiro

lote = Nfse::Envio::Lote.new

lote.numero = '3'
lote.cnpj = '02646676000182'
lote.inscricao_municipal = '001002003'

rps = Nfse::Envio::Rps.new

rps.numero = '109'
rps.serie = "A"
rps.tipo = "1"
rps.data_emissao = Time.new(2009, 10, 1)
rps.optante_simples_nacional = '2'
rps.incentivador_cultural = '1'
rps.status_rps = '1'
rps.cod_atividade = '1405'
rps.aliquota_atividade = '0.05'
rps.tipo_recolhimento = '140520'
rps.cod_municipio_prestacao = '3304557'
rps.operacao = '1'
rps.valor_pis = 0.0
rps.valor_cofins = 1.11
rps.valor_inss = 2.22
rps.valor_ir = 3.33
rps.valor_csll = 4.44
rps.valor_iss = 5.0
rps.descricao = 'Exemplo de Discriminacao de RPS'

prestador = rps.prestador
prestador.cnpj                = '01073249816200'
prestador.inscricao_municipal = '0370835'

tomador = rps.tomador
tomador.inscricao_municipal = '0000000'
tomador.cnpj                = '27394162000108'
tomador.razao_social        = 'Nome do Tomador'
tomador.logradouro          = 'Av. Rio Branco'
tomador.num_endereco        = '123'
tomador.complemento_endereco = 'Andar 1'
tomador.bairro              = 'Centro'
tomador.cod_cidade          = '3304557'
tomador.uf                  = 'RJ'
tomador.cep                 = '05010040'
tomador.email               = 'foo@example.com'

rps.itens << Nfse::Envio::Item.new({
  discriminacao:  'Item exemplo',
  quantidade:     '1',
  valor_unitario: '100.00',
  tributavel:     'S'
})

lote.rps << rps

xml = lote.render
puts xml
```

## Autores

[Carlos Lopes](https://github.com/carloslopes)  
[Rafael Lima](https://github.com/rafaelp)

## Como Contribuir?

1. Fazer um fork do projeto
1. Instalar as dependências: bundle install (Se não tiver o bundler instalado, faça antes: gem install bundler)
1. Criar um *feature branch* (`git checkout -b my-new-feature`)
1. Fazer os devidos ajustes com os respectivos testes
1. Comitar as mudanças, se possível tente fazer commits atômicos (`git commit -am 'Added some feature'`)
1. Atualizar o repositório no Github (`git push origin my-new-feature`)
1. Fazer pull request
