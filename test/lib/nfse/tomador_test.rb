require_relative '../../test_helper'

describe Nfse::Tomador do

  subject { Nfse::Tomador.new }

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

    it 'must have the right default value' do
      subject.cnpj.must_be :==, '77777777777'
    end

    it 'must respect if a new value is defined' do
      value = '123456789'
      subject.cnpj = value
      subject.cnpj.must_be :==, value
    end
  end

  describe 'razao_social attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :razao_social
      subject.must_respond_to :razao_social=
    end

    it 'must have the right default value' do
      subject.razao_social.must_be :==, 'Consumidor'
    end

    it 'must respect if a new value is defined' do
      value = 'Empresa exemplo'
      subject.razao_social = value
      subject.razao_social.must_be :==, value
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

    it 'must have the right default value' do
      subject.tipo_logradouro.must_be :==, '-'
    end

    it 'must respect if a new value is defined' do
      value = 'Tipo de logradouro exemplo'
      subject.tipo_logradouro = value
      subject.tipo_logradouro.must_be :==, value
    end
  end

  describe 'logradouro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :logradouro
      subject.must_respond_to :logradouro=
    end

    it 'must have the right default value' do
      subject.logradouro.must_be :==, '-'
    end

    it 'must respect if a new value is defined' do
      value = 'Logradouro exemplo'
      subject.logradouro = value
      subject.logradouro.must_be :==, value
    end
  end

  describe 'num_endereco attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_endereco
      subject.must_respond_to :num_endereco=
    end

    it 'must have the right default value' do
      subject.num_endereco.must_be :==, '0'
    end

    it 'must respect if a new value is defined' do
      value = '123'
      subject.num_endereco = value
      subject.num_endereco.must_be :==, value
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

    it 'must have the right default value' do
      subject.tipo_bairro.must_be :==, '-'
    end

    it 'must respect if a new value is defined' do
      value = 'Tipo do bairro exemplo'
      subject.tipo_bairro = value
      subject.tipo_bairro.must_be :==, value
    end
  end

  describe 'bairro attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :bairro
      subject.must_respond_to :bairro=
    end

    it 'must have the right default value' do
      subject.bairro.must_be :==, '-'
    end

    it 'must respect if a new value is defined' do
      value = 'Bairro exemplo'
      subject.bairro = value
      subject.bairro.must_be :==, value
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

    it 'must have the right default value' do
      subject.cep.must_be :==, '00000000'
    end

    it 'must respect if a new value is defined' do
      value = '123456789'
      subject.cep = value
      subject.cep.must_be :==, value
    end
  end

  describe 'email attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :email
      subject.must_respond_to :email=
    end

    it 'must have the right default value' do
      subject.email.must_be :==, '-'
    end

    it 'must respect if a new value is defined' do
      value = 'email@example.com'
      subject.email = value
      subject.email.must_be :==, value
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

      @tomador = Nfse::Tomador.new(@attr)
    end

    it 'must have the right attributes' do
      @attr.each do |k,v|
        @tomador.send(k).must_be :==, v
      end
    end
  end

end