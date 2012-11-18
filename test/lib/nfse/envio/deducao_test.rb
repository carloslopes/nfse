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
  end

  describe 'valor_total_ref attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_total_ref
      subject.must_respond_to :valor_total_ref=
    end
  end

  describe 'percentual attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :percentual
      subject.must_respond_to :percentual=
    end
  end

  describe 'valor attribute' do
    it 'must be 0.0 if no value was passed' do
      subject.valor.must_equal 0.0
    end

    it "must keep the old value if is passed a object that doesn't respond to #to_f" do
      subject.valor = 2.5
      subject.valor = false

      subject.valor.must_equal 2.5
    end

    it 'must convert correctly if is passed a valid float value' do
      subject.valor = '13.67'

      subject.valor.must_equal 13.67
    end
  end

  describe 'initialize passing a hash of attributes' do
    before do
      @attr = {
        por:             'Valor',
        tipo:            'Despesas com Materiais',
        cnpj_ref:        '123456789',
        num_nf_ref:      '987654321',
        valor_total_ref: '100.00',
        percentual:      '20.00',
        valor:           '25.00'
      }

      @deducao = Nfse::Envio::Deducao.new(@attr)

      # Formata o valor para ele bater corretamente com o retorno do getter
      @attr[:valor] = @attr[:valor].to_f
    end

    it 'must have the right attributes values' do
      @attr.each do |k,v|
        @deducao.send(k).must_equal v
      end
    end
  end

  describe '#render' do
    describe "campinas" do
      before do
        Nfse::Base.prefeitura = :campinas
      end
      it 'must render the right xml' do
        subject.por             = 'Valor'
        subject.tipo            = 'Despesas com Materiais'
        subject.cnpj_ref        = '27394162000108'
        subject.num_nf_ref      = '321'
        subject.valor_total_ref = 25.5
        subject.percentual      = 5
        subject.valor           = 10

        xml('Deducao', str: subject.render).must_equal xml('Deducao[1]', prefeitura: :campinas, file: :envio)
      end
    end
  end

end
