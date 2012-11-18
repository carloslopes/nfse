module Nfse
  module Envio
    class Tomador
      attr_accessor :inscricao_municipal, :doc_estrangeiro, :complemento_endereco,
        :cod_cidade, :cidade, :ddd, :telefone, :cnpj, :razao_social, :tipo_logradouro, :logradouro,
        :tipo_bairro, :bairro, :email, :num_endereco, :cep, :uf, :cpf

      def initialize(attributes = {})
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
