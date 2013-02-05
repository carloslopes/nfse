require_relative '../../../test_helper'

describe Nfse::Envio::Tomador do

  subject { Nfse::Envio::Tomador.new }

  describe 'inscricao_municipal attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :inscricao_municipal
      subject.must_respond_to :inscricao_municipal=
    end
  end

  describe 'cnpj attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cnpj
      subject.must_respond_to :cnpj=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.cnpj.must_equal '77777777777'
      end
    end
  end

  describe 'cpf attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cpf
      subject.must_respond_to :cpf=
    end
  end

  describe 'razao_social attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :razao_social
      subject.must_respond_to :razao_social=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.razao_social.must_equal 'Consumidor'
      end

      it 'must respect if a new value is defined' do
        value = 'Empresa exemplo'
        subject.razao_social = value
        subject.razao_social.must_equal value
      end
    end
  end

  describe 'doc_estrangeiro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :doc_estrangeiro
      subject.must_respond_to :doc_estrangeiro=
    end
  end

  describe 'tipo_logradouro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tipo_logradouro
      subject.must_respond_to :tipo_logradouro=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.tipo_logradouro.must_equal '-'
      end
    end
  end

  describe 'logradouro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :logradouro
      subject.must_respond_to :logradouro=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.logradouro.must_equal '-'
      end
    end
  end

  describe 'num_endereco attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_endereco
      subject.must_respond_to :num_endereco=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.num_endereco.must_equal '0'
      end
    end
  end

  describe 'complemento_endereco attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :complemento_endereco
      subject.must_respond_to :complemento_endereco=
    end
  end

  describe 'tipo_bairro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tipo_bairro
      subject.must_respond_to :tipo_bairro=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.tipo_bairro.must_equal '-'
      end
    end
  end

  describe 'bairro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :bairro
      subject.must_respond_to :bairro=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.bairro.must_equal '-'
      end
    end
  end

  describe 'cod_cidade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cod_cidade
      subject.must_respond_to :cod_cidade=
    end
  end

  describe 'cidade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cidade
      subject.must_respond_to :cidade=
    end
  end

  describe 'cep attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cep
      subject.must_respond_to :cep=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.cep.must_equal '00000000'
      end
    end
  end

  describe 'email attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :email
      subject.must_respond_to :email=
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'must have the right default value' do
        subject.email.must_equal '-'
      end
    end
  end

  describe 'ddd attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :ddd
      subject.must_respond_to :ddd=
    end
  end

  describe 'telefone attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :telefone
      subject.must_respond_to :telefone=
    end
  end

  describe 'uf attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :uf
      subject.must_respond_to :uf=
    end
  end

  describe '#tem_contato?' do
    before do
      Nfse::Base.prefeitura = :rio_de_janeiro
    end

    describe 'without any attribute' do
      subject { Nfse::Envio::Tomador.new }

      it 'should return false' do
        subject.tem_contato?.must_equal false
      end
    end

    describe 'with email' do
      subject { Nfse::Envio::Tomador.new(email: 'email@example.com') }

      it 'should return true' do
        subject.tem_contato?.must_equal true
      end

    end

    describe 'with telefone' do
      subject { Nfse::Envio::Tomador.new(telefone: '-') }

      it 'should return true' do
        subject.tem_contato?.must_equal true
      end
    end
  end

  describe '#tem_endereco?' do
    before do
      Nfse::Base.prefeitura = :rio_de_janeiro
    end

    describe 'without any attribute' do
      subject { Nfse::Envio::Tomador.new }

      it 'should return false' do
        subject.tem_endereco?.must_equal false
      end
    end

    describe 'with logradouro' do
      subject { Nfse::Envio::Tomador.new(logradouro: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with num_endereco' do
      subject { Nfse::Envio::Tomador.new(num_endereco: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with complemento_endereco' do
      subject { Nfse::Envio::Tomador.new(complemento_endereco: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with bairro' do
      subject { Nfse::Envio::Tomador.new(bairro: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with cod_cidade' do
      subject { Nfse::Envio::Tomador.new(cod_cidade: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with uf' do
      subject { Nfse::Envio::Tomador.new(uf: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end

    describe 'with cep' do
      subject { Nfse::Envio::Tomador.new(cep: '-') }

      it 'should return true' do
        subject.tem_endereco?.must_equal true
      end
    end
  end

  describe '#formatted_cnpj' do
    it 'must return the cnpj with the right format' do
      subject.cnpj = 191
      subject.formatted_cnpj.must_equal '00000000000191'
    end

    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      subject { Nfse::Envio::Tomador.new }

      it 'should not format the default value' do
        subject.formatted_cnpj.must_equal subject.default_cnpj
      end
    end
  end

  describe '#formatted_cep' do
    it 'must return the cpf with the right format' do
      subject.cep = 379
      subject.formatted_cep.must_equal '37900000'
    end

    it 'must return nil if cpf is nil' do
      subject.cep = nil
      subject.formatted_cep.must_be_nil
    end
  end

end
