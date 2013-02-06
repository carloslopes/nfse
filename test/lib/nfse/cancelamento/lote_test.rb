require_relative '../../../test_helper'

describe Nfse::Cancelamento::Lote do

  subject { Nfse::Cancelamento::Lote.new }

  describe 'id attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :id
      subject.must_respond_to :id=
    end

    it 'must have the right default value' do
      time = Time.now.to_i
      Time.expects(:now).returns(time)

      subject.id.must_equal "#{subject.object_id}#{time}"
    end
  end

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

  describe 'transacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :transacao
      subject.must_respond_to :transacao=
    end

    it 'must have the right default value' do
      subject.transacao.must_equal 'true'
    end
  end

  describe 'versao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :versao
      subject.must_respond_to :versao=
    end

    it 'must have the right default value' do
      subject.versao.must_equal 1
    end
  end

  describe 'notas attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :notas
      subject.must_respond_to :notas=
    end

    it 'must be an array' do
      subject.notas.must_be_instance_of Array
    end

    it 'should build a new Nota when append a hash of attributes' do
      subject.notas = [{}]

      nota = subject.notas.first
      nota.must_be_instance_of Nfse::Cancelamento::Nota
    end
  end

  it 'initialize passing a JSON of attributes' do
    attributes = {
      id: '1',
      notas: [{ numero: 2 }]
    }

    lote = Nfse::Cancelamento::Lote.new(JSON.generate(attributes))
    lote.id.must_equal '1'

    nota = lote.notas[0]
    nota.numero.must_equal 2
  end

  describe '#render' do
    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
      end

      it 'must render the right xml' do
        subject.id         = '1ABCDZ'
        subject.cod_cidade = '6291'
        subject.cnpj       = '04659416000177'

        subject.notas << stub(render: xml('Nota[1]', prefeitura: :campinas, file: :cancelamento))
        subject.notas << stub(render: xml('Nota[2]', prefeitura: :campinas, file: :cancelamento))

        xml('ns1:ReqCancelamentoNFSe', str: subject.render).must_equal xml('ns1:ReqCancelamentoNFSe', prefeitura: :campinas, file: :cancelamento)
      end
    end
  end

end
