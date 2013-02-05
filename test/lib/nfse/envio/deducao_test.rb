require_relative '../../../test_helper'

describe Nfse::Envio::Deducao do

  subject { Nfse::Envio::Deducao.new }

  describe 'por attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :por
      subject.must_respond_to :por=
    end
  end

  describe 'tipo attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tipo
      subject.must_respond_to :tipo=
    end
  end

  describe 'cnpj_ref attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cnpj_ref
      subject.must_respond_to :cnpj_ref=
    end
  end

  describe 'num_nf_ref attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_nf_ref
      subject.must_respond_to :num_nf_ref=
    end

    it 'must coerce the value to integer' do
      subject.num_nf_ref = '123'
      subject.num_nf_ref.must_equal 123
    end
  end

  describe 'valor_total_ref attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_total_ref
      subject.must_respond_to :valor_total_ref=
    end

    it 'must coerce the value to float' do
      subject.valor_total_ref = '1.2'
      subject.valor_total_ref.must_equal 1.2
    end
  end

  describe 'percentual attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :percentual
      subject.must_respond_to :percentual=
    end

    it 'must coerce the value to float' do
      subject.percentual = '1.2'
      subject.percentual.must_equal 1.2
    end
  end

  describe 'valor attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor
      subject.must_respond_to :valor=
    end

    it 'must have the right default value' do
      subject.valor.must_equal 0
    end

    it 'must coerce the value to float' do
      subject.valor = '1.2'
      subject.valor.must_equal 1.2
    end
  end

  describe '#render' do
    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      it 'must render the right xml' do
        subject.por             = 'Valor'
        subject.tipo            = 'Despesas com Materiais'
        subject.cnpj_ref        = '27394162000108'
        subject.num_nf_ref      = 321
        subject.valor_total_ref = 25.5
        subject.percentual      = 5
        subject.valor           = 10

        xml('Deducao', str: subject.render).must_equal xml('Deducao[1]', prefeitura: :campinas, file: :envio)
      end
    end
  end

end
