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

    it 'must respect if a new value is defined' do
      subject.id = '1'

      subject.id.must_equal '1'
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

    it 'must respect if a new value is defined' do
      subject.transacao = 'false'

      subject.transacao.must_equal 'false'
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

    it 'must respect if a new value is defined' do
      subject.versao = '2'

      subject.versao.must_equal '2'
    end
  end

  describe 'notas attribute' do
    it "won't have the writer method" do
      subject.wont_respond_to :notas=
    end

    it 'must be an instance of Array' do
      subject.notas.must_be_instance_of Array
    end
  end

  describe 'initialize' do
    before do
      @nota1 = { numero: 1 }
      @nota2 = { numero: 2 }

      @attrs = {
        id:         '1ABCDZ',
        cod_cidade: '6291',
        cnpj:       '04659416000177',
        transacao:  'false',
        versao:     '2',
        notas:      [@nota1, @nota2]
      }
    end

    describe 'passing a JSON of attributes' do
      before do
        @lote = Nfse::Cancelamento::Lote.new(JSON.generate(@attrs))
        @attrs.delete(:notas)
      end

      it 'must have the right attributes values' do
        @attrs.each do |k,v|
          @lote.send(k).must_equal v
        end
      end

      it "must have the right notas' values" do
        notas_lote = @lote.notas

        notas_lote.first.numero.must_equal @nota1[:numero]
        notas_lote.last.numero.must_equal @nota2[:numero]
      end
    end
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
