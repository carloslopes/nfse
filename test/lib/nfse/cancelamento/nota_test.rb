require_relative '../../../test_helper'

describe Nfse::Cancelamento::Nota do

  subject { Nfse::Cancelamento::Nota.new }

  describe 'numero attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :numero
      subject.must_respond_to :numero=
    end
  end

  describe 'inscricao_municipal attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :inscricao_municipal
      subject.must_respond_to :inscricao_municipal=
    end

    it 'must have the right format' do
      subject.inscricao_municipal = '108'

      subject.inscricao_municipal.must_equal '000000108'
    end
  end

  describe 'cod_verificacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cod_verificacao
      subject.must_respond_to :cod_verificacao=
    end
  end

  describe 'motivo_cancelamento attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :motivo_cancelamento
      subject.must_respond_to :motivo_cancelamento=
    end
  end

  describe 'initialize passing a hash of attributes' do
    it 'must have the right attributes values' do
      attr = {
        numero:              '5',
        inscricao_municipal: '000000108',
        cod_verificacao:     '98d0e61d9396b60e5a847a361cb9264e4b6d0c9f',
        motivo_cancelamento: 'Teste de cancelamento'
      }

      nota = Nfse::Cancelamento::Nota.new(attr)

      attr.each do |k,v|
        nota.send("#{k}=", v)
      end
    end
  end

  describe '#render' do
    it 'must render the right xml' do
      subject.numero              = '5'
      subject.inscricao_municipal = '108'
      subject.cod_verificacao     = '98d0e61d9396b60e5a847a361cb9264e4b6d0c9f'
      subject.motivo_cancelamento = 'Teste de cancelamento'

      xml('Nota', str: subject.render).must_equal xml('Nota[1]', file: :cancelamento)
    end
  end

end
