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
  end

  describe 'logradouro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :logradouro
      subject.must_respond_to :logradouro=
    end
  end

  describe 'num_endereco attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_endereco
      subject.must_respond_to :num_endereco=
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
  end

  describe 'bairro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :bairro
      subject.must_respond_to :bairro=
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
  end

  describe 'email attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :email
      subject.must_respond_to :email=
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

  describe :tem_contato do
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

  describe :tem_endereco do
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
