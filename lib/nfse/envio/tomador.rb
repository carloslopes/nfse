module Nfse
  module Envio
    class Tomador
      attr_accessor :inscricao_municipal, :doc_estrangeiro, :complemento_endereco,
        :cod_cidade, :cidade, :ddd, :telefone, :cnpj, :razao_social, :tipo_logradouro, :logradouro,
        :tipo_bairro, :bairro, :email, :num_endereco, :cep, :uf, :cpf

      def initialize(attributes = {})
        @razao_social = 'Consumidor'
        @tipo_logradouro = '-'
        @logradouro = '-'
        @tipo_bairro = '-'
        @bairro = '-'
        @email = '-'
        @uf = '-'
        @num_endereco = '0'
        @cep = '00000000'

        if attributes.is_a?(Hash)
          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end
    end
  end
end
