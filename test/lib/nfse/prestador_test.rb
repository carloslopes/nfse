require_relative '../../test_helper'

describe Nfse::Prestador do

  subject { Nfse::Prestador.new }

  describe 'inscricao_municipal attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :inscricao_municipal
      subject.must_respond_to :inscricao_municipal=
    end
  end

  describe 'razao_social attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :razao_social
      subject.must_respond_to :razao_social=
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
        inscricao_municipal: '1234567',
        razao_social:        'Empresa exemplo',
        ddd:                 '019',
        telefone:            '987654321'
      }

      @prestador = Nfse::Prestador.new(@attr)
    end

    it 'must have the right attributes' do
      @attr.each do |k,v|
        @prestador.send(k).must_be :==, v
      end
    end
  end

end