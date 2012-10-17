module Nfse
  module Envio
    class Tomador
      attr_accessor :inscricao_municipal, :doc_estrangeiro, :complemento_endereco,
        :cod_cidade, :cidade, :ddd, :telefone

      attr_writer :cnpj, :razao_social, :tipo_logradouro, :logradouro,
        :tipo_bairro, :bairro, :email, :num_endereco, :cep

      def initialize(attributes = {})
        if attributes.is_a?(Hash)
          attributes.each do |k,v|
            send("#{k}=", v)
          end
        end
      end

      def cnpj
        @cnpj ||= '77777777777'
      end

      def razao_social
        @razao_social ||= 'Consumidor'
      end

      def tipo_logradouro
        @tipo_logradouro ||= '-'
      end

      def logradouro
        @logradouro ||= '-'
      end

      def tipo_bairro
        @tipo_bairro ||= '-'
      end

      def bairro
        @bairro ||= '-'
      end

      def email
        @email ||= '-'
      end

      def num_endereco
        @num_endereco ||= '0'
      end

      def cep
        @cep ||= '00000000'
      end
    end
  end
end
