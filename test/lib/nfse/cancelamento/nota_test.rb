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

  describe '#formatted_inscricao_municipal' do
    it 'must return the inscricao_municipal with the right format' do
      subject.inscricao_municipal = '108'

      subject.formatted_inscricao_municipal.must_equal '000000108'
    end
  end

  describe '#render' do
    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      it 'must render the right xml' do
        subject.numero              = 5
        subject.inscricao_municipal = '108'
        subject.cod_verificacao     = '98d0e61d9396b60e5a847a361cb9264e4b6d0c9f'
        subject.motivo_cancelamento = 'Teste de cancelamento'

        xml('Nota', str: subject.render).must_equal xml('Nota[1]', prefeitura: :campinas, file: :cancelamento)
      end
    end
  end

end
