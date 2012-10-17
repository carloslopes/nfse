require_relative '../../../test_helper'
require 'json'

describe Nfse::Envio::Lote do

  subject { Nfse::Envio::Lote.new }

  describe 'id attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :id
      subject.must_respond_to :id=
    end

    it 'must have a default value' do
      subject.id.wont_be_nil
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

  describe 'razao_social attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :razao_social
      subject.must_respond_to :razao_social=
    end
  end

  describe 'transacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :transacao
      subject.must_respond_to :transacao=
    end

    it 'must have the right default value' do
      subject.transacao.must_be :==, 'true'
    end

    it 'must respect if a new value is defined' do
      value = 'false'
      subject.transacao = value
      subject.transacao.must_be :==, value
    end
  end

  describe 'rps attribute' do
    it 'must have the reader method' do
      subject.must_respond_to :rps
    end

    it 'must have the right value' do
      subject.rps.must_be_instance_of Array
    end
  end

  describe 'versao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :versao
      subject.must_respond_to :versao=
    end

    it 'must have the right default value' do
      subject.versao.must_be :==, '1'
    end

    it 'must respect if a new value is defined' do
      value = '2'
      subject.versao = value
      subject.versao.must_be :==, value
    end
  end

  describe 'metodo_envio attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :metodo_envio
      subject.must_respond_to :metodo_envio=
    end

    it 'must have the right default value' do
      subject.metodo_envio.must_be :==, 'WS'
    end

    it 'must respect if a new value is defined' do
      value = 'Foobar'
      subject.metodo_envio = value
      subject.metodo_envio.must_be :==, value
    end
  end

  describe '#qtd_rps' do
    it "must return the count of rps's that the lote has" do
      subject.rps.push(*(1..10).to_a)
      subject.qtd_rps.must_be :==, 10
    end
  end

  describe '#valor_servicos' do
    it 'must return the sum of all Rps#valor_servico' do
      rps = MiniTest::Mock.new
      rps.expect(:valor_servico, 1000)
      subject.rps << rps

      rps = MiniTest::Mock.new
      rps.expect(:valor_servico, 500)
      subject.rps << rps

      subject.valor_servicos.must_be :==, 1500
    end
  end

  describe '#valor_deducoes' do
    it 'must return the sum of all Rps#valor_deducao' do
      rps = MiniTest::Mock.new
      rps.expect(:valor_deducao, 1000)
      subject.rps << rps

      rps = MiniTest::Mock.new
      rps.expect(:valor_deducao, 500)
      subject.rps << rps

      subject.valor_deducoes.must_be :==, 1500
    end
  end

  describe '#data_inicio' do
    it "must return the #data_emissao of the first Lote's RPS" do
      date = Time.now

      rps = MiniTest::Mock.new
      rps.expect(:data_emissao, date)
      subject.rps << rps

      rps = MiniTest::Mock.new
      rps.expect(:data_emissao, Time.new(2012, 1, 1))
      subject.rps << rps

      subject.data_inicio.must_be :==, date.strftime('%Y-%m-%d')
    end
  end

  describe '#data_fim' do
    it "must return the #data_emissao of the last Lote's RPS" do
      date = Time.new(2012, 1, 1)

      rps = MiniTest::Mock.new
      rps.expect(:data_emissao, Time.now)
      subject.rps << rps

      rps = MiniTest::Mock.new
      rps.expect(:data_emissao, date)
      subject.rps << rps

      subject.data_fim.must_be :==, date.strftime('%Y-%m-%d')
    end
  end

  describe 'initialize passing a JSON of attributes' do
    before do
      @attr = {
        cod_cidade:   '6291',
        cnpj:         '02646676000182',
        razao_social: 'Empresa Exemplo',
        transacao:    'false',
        versao:       '2.5',
        metodo_envio: 'Metodo Exemplo'
      }

      @lote = Nfse::Envio::Lote.new(JSON.generate(@attr))
    end

    it 'must have the right attributes' do
      @attr.each do |k,v|
        @lote.send(k).must_be :==, v
      end
    end
  end

  describe 'initialize passing a JSON of attributes with RPSes data' do
    before do
      data_emissao = Time.now.to_s
      @rps1 = {
        numero:                  '109',
        data_emissao:            data_emissao,
        situacao:                'N',
        serie_rps_substituido:   '123',
        num_rps_substituido:     '456',
        num_nfe_substituida:     '789',
        data_nfe_substituida:    Time.new(2012, 2, 2).to_s,
        cod_atividade:           '412040000',
        aliquota_atividade:      '5.00',
        tipo_recolhimento:       'R',
        cod_municipio_prestacao: '0006291',
        municipio_prestacao:     'CAMPINAS',
        operacao:                'A',
        tributacao:              'T',
        valor_pis:               '0.00',
        valor_cofins:            '1.11',
        valor_inss:              '2.22',
        valor_ir:                '3.33',
        valor_csll:              '4.44',
        aliquota_pis:            '5.55',
        aliquota_cofins:         '6.66',
        aliquota_inss:           '7.77',
        aliquota_ir:             '8.88',
        aliquota_csll:           '9.99',
        descricao:               'TESTE',
        motivo_cancelamento:     'motivo exemplo',
        cnpj_intermediario:      '123456789',
        tipo:                    'Tipo Exemplo',
        serie:                   'Serie Exemplo',
        serie_prestacao:         '21'
      }

      @rps2 = @rps1.merge(numero: '110', descricao: 'Teste 2')

      attributes = { rps: [@rps1, @rps2] }
      @lote = Nfse::Envio::Lote.new(JSON.generate(attributes))

      # Formata os valores para eles baterem corretamente com o retorno dos getters
      @rps1[:data_emissao] = DateTime.parse(@rps1[:data_emissao]).strftime('%Y-%m-%dT%H:%M:%S')
      @rps2[:data_emissao] = DateTime.parse(@rps2[:data_emissao]).strftime('%Y-%m-%dT%H:%M:%S')
    end

    it 'must have the right attributes' do
      @rps1.each do |k,v|
        @lote.rps[0].send(k).must_be :==, v
      end

      @rps2.each do |k,v|
        @lote.rps[1].send(k).must_be :==, v
      end
    end
  end

  describe '#render' do
    it 'must render the right xml' do
      subject.id = '1ABCDZ'
      subject.cod_cidade = 6291
      subject.cnpj = '02646676000182'
      subject.razao_social = 'EMPRESA RESP. MODELO'
      subject.expects(:data_inicio).returns('2009-10-01')
      subject.expects(:data_fim).returns('2009-10-01')
      subject.expects(:qtd_rps).returns(2)
      subject.expects(:valor_servicos).returns('11.00')
      subject.expects(:valor_deducoes).returns('49.30')

      # Rps
      subject.rps << stub(render: xml('RPS[1]'))
      subject.rps << stub(render: xml('RPS[2]'))

      xml('ns1:ReqEnvioLoteRPS', subject.render).must_equal xml('ns1:ReqEnvioLoteRPS')
    end
  end

end
