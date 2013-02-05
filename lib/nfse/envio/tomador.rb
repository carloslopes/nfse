module Nfse
  module Envio
    class Tomador
      include Virtus

      attribute :inscricao_municipal, String
      attribute :cnpj, String, default: :default_cnpj
      attribute :razao_social, String, default: :default_razao_social
      attribute :doc_estrangeiro, String
      attribute :tipo_logradouro, String, default: :default_dash
      attribute :logradouro, String, default: :default_dash
      attribute :num_endereco, String, default: :default_num_endereco
      attribute :complemento_endereco, String
      attribute :tipo_bairro, String, default: :default_dash
      attribute :bairro, String, default: :default_dash
      attribute :cod_cidade, String
      attribute :cidade, String
      attribute :cep, String, default: :default_cep
      attribute :email, String, default: :default_dash
      attribute :ddd, String
      attribute :telefone, String

      # Rio de janeiro
      attribute :cpf, String
      attribute :uf, String

      def tem_endereco?
        [@logradouro, @num_endereco, @complemento_endereco, @bairro, @cod_cidade, @uf, @cep].uniq != [nil]
      end

      def tem_contato?
        [@telefone, @email].uniq != [nil]
      end

      def formatted_cnpj
        return cnpj if cnpj == default_cnpj
        cnpj.rjust(14, '0')
      end

      def formatted_cep
        cep.ljust(8, '0') unless cep.nil?
      end

      # Attributes default values
      def default_cnpj
        '77777777777' if Nfse::Base.prefeitura == :campinas
      end

      def default_razao_social
        'Consumidor' if Nfse::Base.prefeitura == :campinas
      end

      def default_dash
        '-' if Nfse::Base.prefeitura == :campinas
      end

      def default_num_endereco
        '0' if Nfse::Base.prefeitura == :campinas
      end

      def default_cep
        '00000000' if Nfse::Base.prefeitura == :campinas
      end
    end
  end
end
