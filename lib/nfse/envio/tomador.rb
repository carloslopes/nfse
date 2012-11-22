module Nfse
  module Envio
    class Tomador
      attr_accessor :inscricao_municipal, :doc_estrangeiro, :complemento_endereco,
        :cod_cidade, :cidade, :ddd, :telefone, :uf, :cpf, :razao_social,
        :tipo_logradouro, :logradouro, :num_endereco, :tipo_bairro, :bairro,
        :cep, :email, :cnpj

      def initialize(attributes = {})
        if Nfse::Base.prefeitura == :campinas
          @cnpj = '77777777777'
          @razao_social = 'Consumidor'
          @tipo_logradouro = '-'
          @logradouro = '-'
          @num_endereco = '0'
          @tipo_bairro = '-'
          @bairro = '-'
          @cep = '00000000'
          @email = '-'
        end

        if attributes.is_a?(Hash)
          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end

      def tem_endereco
        [@logradouro, @num_endereco, @complemento_endereco, @bairro, @cod_cidade, @uf, @cep].uniq != [nil]
      end

      def tem_contato
        [@telefone, @email].uniq != [nil]
      end
    end
  end
end
