# NFS-e

Gem para realizar diversas ações relacionadas a nota fiscal de **serviço** eletrônica.

#### Features prontas
* Geração do xml de envio de lote
* Geração do xml de consulta de lote

#### Todo
* Assinar os XML gerados
* Enviar os XML gerados e assinados para o WebService
* Cancelamento de nota
* Consulta de notas
* Consulta sequencial RPS
* Usage instructions

**Atualmente a gem só gera NFS-e seguindo os padrões da prefeitura de Campinas/SP**

## Links de referências
[Manual de uso do WebService](http://nfse.campinas.sp.gov.br/NotaFiscal/cpqPDF/WebService.pdf)
[Exemplos de XML e XSD](http://www.dsfnet.com.br/nfse_lote/exemplosws.zip)

## Installation

Add this line to your application's Gemfile:

    gem 'nfse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfse

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
