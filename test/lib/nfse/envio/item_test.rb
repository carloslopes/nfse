require_relative '../../../test_helper'

describe Nfse::Envio::Item do

  subject { Nfse::Envio::Item.new }

  describe 'discriminacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :discriminacao
      subject.must_respond_to :discriminacao=
    end
  end

  describe 'quantidade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :quantidade
      subject.must_respond_to :quantidade=
    end

    it 'must have the right default value' do
      subject.quantidade.must_equal 0
    end

    it 'must coerce the value to float' do
      subject.quantidade = '1.2'
      subject.quantidade.must_equal 1.2
    end
  end

  describe 'valor_unitario attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_unitario
      subject.must_respond_to :valor_unitario=
    end

    it 'must have the right default value' do
      subject.valor_unitario.must_equal 0
    end

    it 'must coerce the value to float' do
      subject.valor_unitario = '1.2'
      subject.valor_unitario.must_equal 1.2
    end
  end

  describe 'tributavel attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tributavel
      subject.must_respond_to :tributavel=
    end
  end

  describe '#valor_total' do
    it 'must be the multiplication of valor_unitario and quantidade' do
      quantidade     = 5
      valor_unitario = 2.5
      valor_total    = quantidade * valor_unitario

      subject.quantidade     = quantidade
      subject.valor_unitario = valor_unitario

      subject.valor_total.must_equal valor_total
    end
  end

  describe '#render' do
    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      it 'must render the right xml' do
        subject.discriminacao  = 'Item 1'
        subject.quantidade     = 2.0
        subject.valor_unitario = 3.0
        subject.tributavel     = 'S'

        xml('Item', str: subject.render).must_equal xml('Item[1]', prefeitura: :campinas, file: :envio)
      end
    end
  end

end
