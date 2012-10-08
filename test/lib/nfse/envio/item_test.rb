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
    it 'must be 0.0 if no value was passed' do
      subject.quantidade.must_be :==, 0.0
    end

    it "must keep the old value if is passed a object that doesn't respond to #to_f" do
      subject.quantidade = 2.5
      subject.quantidade = false
      subject.quantidade.must_be :==, 2.5
    end

    it 'must convert correctly if is passed a valid float value' do
      subject.quantidade = '13.67'
      subject.quantidade.must_be :==, 13.67
    end
  end

  describe 'valor_unitario attribute' do
    it 'must be 0.0 if no value was passed' do
      subject.valor_unitario.must_be :==, 0.0
    end

    it "must keep the old value if is passed a object that doesn't respond to #to_f" do
      subject.valor_unitario = 2.5
      subject.valor_unitario = false
      subject.valor_unitario.must_be :==, 2.5
    end

    it 'must convert correctly if is passed a valid float value' do
      subject.valor_unitario = '13.67'
      subject.valor_unitario.must_be :==, 13.67
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
      subject.valor_total.must_be :==, valor_total
    end
  end

  describe 'initialize passing a hash of attributes' do
    before do
      @attr = {
        discriminacao:  'Item exemplo',
        quantidade:     '10',
        valor_unitario: '1.00',
        tributavel:     'S'
      }

      @item = Nfse::Envio::Item.new(@attr)

      # Formata os valores para eles baterem corretamente com o retorno dos getters
      @attr[:quantidade]     = @attr[:quantidade].to_f
      @attr[:valor_unitario] = @attr[:valor_unitario].to_f
    end

    it 'must have the right attributes' do
      @attr.each do |k,v|
        @item.send(k).must_be :==, v
      end
    end
  end

end
