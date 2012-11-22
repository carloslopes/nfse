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

      it 'must respect if a new value is defined' do
        value = '000100020003'
        subject.cnpj = value
        subject.cnpj.must_equal value
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

      it 'must respect if a new value is defined' do
        value = 'Bairro'
        subject.tipo_logradouro = value
        subject.tipo_logradouro.must_equal value
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

      it 'must respect if a new value is defined' do
        value = 'Logradouro exemplo'
        subject.logradouro = value
        subject.logradouro.must_equal value
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

      it 'must respect if a new value is defined' do
        value = '123'
        subject.num_endereco = value
        subject.num_endereco.must_equal value
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

      it 'must respect if a new value is defined' do
        value = 'Bairro'
        subject.tipo_bairro = value
        subject.tipo_bairro.must_equal value
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

      it 'must respect if a new value is defined' do
        value = 'Bairro exemplo'
        subject.bairro = value
        subject.bairro.must_equal value
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

      it 'must respect if a new value is defined' do
        value = '123456789'
        subject.cep = value
        subject.cep.must_equal value
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

      it 'must respect if a new value is defined' do
        value = 'email@example.com'
        subject.email = value
        subject.email.must_equal value
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

  describe 'initialize passing a hash of attributes' do
    before do
      @attr = {
        inscricao_municipal:  '123456789',
        doc_estrangeiro:      '123',
        complemento_endereco: '456',
        cod_cidade:           '789',
        cidade:               'Exemplo',
        ddd:                  '019',
        telefone:             '987654321',
        cnpj:                 '321456987',
        razao_social:         'Empresa exemplo',
        tipo_logradouro:      'Avenida',
        logradouro:           'Exemplo logradouro',
        tipo_bairro:          'Bairro',
        bairro:               'Exemplo bairro',
        email:                'email@example.com',
        num_endereco:         '925',
        cep:                  '82947296'
      }

      @tomador = Nfse::Envio::Tomador.new(@attr)
    end

    it 'must have the right attributes values' do
      @attr.each do |k,v|
        @tomador.send(k).must_equal v
      end
    end
  end

  describe '#tem_contato' do
    before do
      Nfse::Base.prefeitura = :rio_de_janeiro
    end

    describe 'without any attribute' do
      subject { Nfse::Envio::Tomador.new }

      it 'should return false' do
        subject.tem_contato.must_equal false
      end
    end

    describe 'with email' do
      subject { Nfse::Envio::Tomador.new(email: 'email@example.com') }

      it 'should return true' do
        subject.tem_contato.must_equal true
      end

    end

    describe 'with telefone' do
      subject { Nfse::Envio::Tomador.new(telefone: '-') }

      it 'should return true' do
        subject.tem_contato.must_equal true
      end
    end
  end

  describe '#tem_endereco' do
    before do
      Nfse::Base.prefeitura = :rio_de_janeiro
    end

    describe 'without any attribute' do
      subject { Nfse::Envio::Tomador.new }

      it 'should return false' do
        subject.tem_endereco.must_equal false
      end
    end

    describe 'with logradouro' do
      subject { Nfse::Envio::Tomador.new(logradouro: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with num_endereco' do
      subject { Nfse::Envio::Tomador.new(num_endereco: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with complemento_endereco' do
      subject { Nfse::Envio::Tomador.new(complemento_endereco: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with bairro' do
      subject { Nfse::Envio::Tomador.new(bairro: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with cod_cidade' do
      subject { Nfse::Envio::Tomador.new(cod_cidade: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with uf' do
      subject { Nfse::Envio::Tomador.new(uf: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end

    describe 'with cep' do
      subject { Nfse::Envio::Tomador.new(cep: '-') }

      it 'should return true' do
        subject.tem_endereco.must_equal true
      end
    end
  end

end
