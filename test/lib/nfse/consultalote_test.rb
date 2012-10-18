require_relative '../../test_helper'
require 'json'

describe Nfse::ConsultaLote do

  subject { Nfse::ConsultaLote.new }

  describe 'cod_cidade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cod_cidade
      subject.must_respond_to :cod_cidade=
    end
  end

  describe 'cnpj attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cnpj
      subject.must_respond_to :cnpj=
    end
  end

  describe 'versao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :versao
      subject.must_respond_to :versao=
    end

    it 'must have the right default value' do
      subject.versao.must_equal '1'
    end
  end

  describe 'num_lote attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_lote
      subject.must_respond_to :num_lote=
    end
  end

  describe 'initialize passing a JSON of attributes' do
    it 'must have the right attributes values' do
      attr = {
        cod_cidade: '6291',
        cnpj:       '27394162000108',
        versao:     '2',
        num_lote:   '7105'
      }

      consulta = Nfse::ConsultaLote.new(JSON.generate(attr))

      attr.each do |k,v|
        consulta.send(k).must_equal v
      end
    end
  end

  describe '#render' do
    it 'must render the right xml' do
      subject.cod_cidade = 6291
      subject.cnpj       = 27394162000108
      subject.num_lote   = 7105

      xml('ns1:ReqConsultaLote', str: subject.render).must_equal xml('ns1:ReqConsultaLote', file: :consultalote)
    end
  end

end
