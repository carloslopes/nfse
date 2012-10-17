require_relative '../../../test_helper'

describe Nfse::Envio::Rps do

  subject { Nfse::Envio::Rps.new }

  describe 'prestador attribute' do
    it 'must have the reader method' do
      subject.must_respond_to :prestador
    end

    it 'must have the right value' do
      subject.prestador.must_be_instance_of Nfse::Envio::Prestador
    end
  end

  describe 'tomador attribute' do
    it 'must have the reader method' do
      subject.must_respond_to :tomador
    end

    it 'must have the right value' do
      subject.tomador.must_be_instance_of Nfse::Envio::Tomador
    end
  end

  describe 'itens attribute' do
    it 'must have the reader method' do
      subject.must_respond_to :itens
    end

    it 'must have the right value' do
      subject.itens.must_be_instance_of Array
    end
  end

  describe 'deducoes attribute' do
    it 'must have the reader method' do
      subject.must_respond_to :deducoes
    end

    it 'must have the right value' do
      subject.deducoes.must_be_instance_of Array
    end
  end

  describe 'tipo attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tipo
      subject.must_respond_to :tipo=
    end

    it 'must have the right default value' do
      subject.tipo.must_equal 'RPS'
    end

    it 'must respect if a new value is defined' do
      value = 'foobar'
      subject.tipo = value
      subject.tipo.must_equal value
    end
  end

  describe 'serie attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :serie
      subject.must_respond_to :serie=
    end

    it 'must have the right default value' do
      subject.serie.must_equal 'NF'
    end

    it 'must respect if a new value is defined' do
      value = 'foobar'
      subject.serie = value
      subject.serie.must_equal value
    end
  end

  describe 'numero attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :numero
      subject.must_respond_to :numero=
    end
  end

  describe 'data_emissao attribute' do
    it 'must be now if no value was passed' do
      now = DateTime.now
      DateTime.expects(:now).returns(now)

      subject.data_emissao.must_equal now.strftime('%Y-%m-%dT%H:%M:%S')
    end

    it "must keep the old value if is passed an invalid date" do
      value = '2012-10-10'
      subject.data_emissao = value
      subject.data_emissao = ''
      subject.data_emissao.must_equal DateTime.parse(value).strftime('%Y-%m-%dT%H:%M:%S')
    end

    it "must keep the old value if is passed an invalid object" do
      value = '2012-10-10'
      subject.data_emissao = value
      subject.data_emissao = false
      subject.data_emissao.must_equal DateTime.parse(value).strftime('%Y-%m-%dT%H:%M:%S')
    end

    it 'must convert correctly if is passed a valid datetime value' do
      value = '2012-10-10 14:32:45'
      subject.data_emissao = value
      subject.data_emissao.must_equal DateTime.parse(value).strftime('%Y-%m-%dT%H:%M:%S')
    end
  end

  describe 'situacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :situacao
      subject.must_respond_to :situacao=
    end
  end

  describe 'serie_rps_substituido attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :serie_rps_substituido
      subject.must_respond_to :serie_rps_substituido=
    end
  end

  describe 'num_rps_substituido attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_rps_substituido
      subject.must_respond_to :num_rps_substituido=
    end
  end

  describe 'num_nfse_substituida attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_nfse_substituida
      subject.must_respond_to :num_nfse_substituida=
    end
  end

  describe 'data_nfse_substituida attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :data_nfse_substituida
      subject.must_respond_to :data_nfse_substituida=
    end
  end

  describe 'serie_prestacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :serie_prestacao
      subject.must_respond_to :serie_prestacao=
    end

    it 'must have the right default value' do
      subject.serie_prestacao.must_equal '99'
    end

    it 'must respect if a new value is defined' do
      value = 10
      subject.serie_prestacao = value
      subject.serie_prestacao.must_equal value
    end
  end

  describe 'cod_atividade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cod_atividade
      subject.must_respond_to :cod_atividade=
    end
  end

  describe 'aliquota_atividade attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_atividade
      subject.must_respond_to :aliquota_atividade=
    end
  end

  describe 'tipo_recolhimento attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tipo_recolhimento
      subject.must_respond_to :tipo_recolhimento=
    end
  end

  describe 'cod_municipio_prestacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cod_municipio_prestacao
      subject.must_respond_to :cod_municipio_prestacao=
    end
  end

  describe 'municipio_prestacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :municipio_prestacao
      subject.must_respond_to :municipio_prestacao=
    end
  end

  describe 'operacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :operacao
      subject.must_respond_to :operacao=
    end
  end

  describe 'tributacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :tributacao
      subject.must_respond_to :tributacao=
    end
  end

  describe 'valor_pis attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_pis
      subject.must_respond_to :valor_pis=
    end
  end

  describe 'valor_cofins attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_cofins
      subject.must_respond_to :valor_cofins=
    end
  end

  describe 'valor_inss attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_inss
      subject.must_respond_to :valor_inss=
    end
  end

  describe 'valor_ir attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_ir
      subject.must_respond_to :valor_ir=
    end
  end

  describe 'valor_csll attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_csll
      subject.must_respond_to :valor_csll=
    end
  end

  describe 'aliquota_pis attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_pis
      subject.must_respond_to :aliquota_pis=
    end
  end

  describe 'aliquota_cofins attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_cofins
      subject.must_respond_to :aliquota_cofins=
    end
  end

  describe 'aliquota_inss attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_inss
      subject.must_respond_to :aliquota_inss=
    end
  end

  describe 'aliquota_ir attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_ir
      subject.must_respond_to :aliquota_ir=
    end
  end

  describe 'aliquota_csll attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_csll
      subject.must_respond_to :aliquota_csll=
    end
  end

  describe 'descricao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :descricao
      subject.must_respond_to :descricao=
    end
  end

  describe 'motivo_cancelamento attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :motivo_cancelamento
      subject.must_respond_to :motivo_cancelamento=
    end
  end

  describe 'cnpj_intermediario attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :cnpj_intermediario
      subject.must_respond_to :cnpj_intermediario=
    end
  end

  describe '#assinatura' do
    it 'must generate the right signature' do
      subject.prestador.inscricao_municipal = '0317330'
      subject.serie                         = 'NF'
      subject.numero                        = '38663'
      subject.data_emissao                  = '2009-09-05'
      subject.tributacao                    = 'T'
      subject.situacao                      = 'N'
      subject.tipo_recolhimento             = 'A'
      subject.cod_atividade                 = '829979900'
      subject.tomador.cnpj                  = '8764130000102'

      subject.itens << stub(valor_total: 1686)

      assinatura = '6bcbb93fd7e6d7f0417656f4931ba9f92a7ac1da'
      subject.assinatura.must_equal assinatura
    end
  end

  describe '#valor_deducao' do
    it 'must return the sum of the value of all deducoes' do
      subject.deducoes << stub(valor: 1000)
      subject.deducoes << stub(valor: 500)

      subject.valor_deducao.must_equal 1500
    end
  end

  describe '#valor_servico' do
    it 'must return the sum of the value of all itens' do
      subject.itens << stub(valor_total: 1000)
      subject.itens << stub(valor_total: 500)

      subject.valor_servico.must_equal 1500
    end
  end

  describe 'initialize passing a hash of attributes' do
    before do
      data_emissao = Time.now.to_s
      @attr = {
        numero:                  '109',
        data_emissao:            data_emissao,
        situacao:                'N',
        serie_rps_substituido:   '123',
        num_rps_substituido:     '456',
        num_nfse_substituida:    '789',
        data_nfse_substituida:   Time.new(2012, 2, 2).to_s,
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

      @rps = Nfse::Envio::Rps.new(@attr)

      # Formata o valor para ele bater corretamente com o retorno do getter
      @attr[:data_emissao] = DateTime.parse(data_emissao).strftime('%Y-%m-%dT%H:%M:%S')
    end

    it 'must have the right attributes' do
      @attr.each do |k,v|
        @rps.send(k).must_equal v
      end
    end
  end

  describe 'initialize passing a hash of attributes with Prestador data' do
    before do
      @prestador = {
        inscricao_municipal: '1234567',
        razao_social:        'Empresa exemplo',
        ddd:                 '019',
        telefone:            '987654321'
      }

      attributes = { 'prestador' => @prestador }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes' do
      @prestador.each do |k,v|
        @rps.prestador.send(k).must_equal v
      end
    end
  end

  describe 'initialize passing a hash of attributes with Tomador data' do
    before do
      @tomador = {
        inscricao_municipal:  '123456789',
        doc_estrangeiro:      '123',
        complemento_endereco: '456',
        cod_cidade:           '789',
        cidade:               'Exemplo',
        ddd:                  '019',
        telefone:             '987654321',
        cnpj:                 '321456987',
        razao_social:         'Empresa exemplo',
        tipo_logradouro:      'Avenida',
        logradouro:           'Exemplo logradouro',
        tipo_bairro:          'Bairro',
        bairro:               'Exemplo bairro',
        email:                'email@example.com',
        num_endereco:         '925',
        cep:                  '82947296'
      }

      attributes = { 'tomador' => @tomador }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes' do
      @tomador.each do |k,v|
        @rps.tomador.send(k).must_equal v
      end
    end
  end

  describe 'initialize passing a hash of attributes with Itens data' do
    before do
      @item1 = {
        discriminacao:  'Item exemplo',
        quantidade:     '10',
        valor_unitario: '1.00',
        tributavel:     'S'
      }

      @item2 = @item1.merge(discriminacao: 'Item exemplo 2', quantidade: '3')

      attributes = { 'itens' => [@item1, @item2] }
      @rps = Nfse::Envio::Rps.new(attributes)

      # Formata os valores para eles baterem corretamente com o retorno dos getters
      @item1[:quantidade]     = @item1[:quantidade].to_f
      @item1[:valor_unitario] = @item1[:valor_unitario].to_f

      @item2[:quantidade]     = @item2[:quantidade].to_f
      @item2[:valor_unitario] = @item2[:valor_unitario].to_f
    end

    it 'must have the right attributes' do
      @item1.each do |k,v|
        @rps.itens[0].send(k).must_equal v
      end

      @item2.each do |k,v|
        @rps.itens[1].send(k).must_equal v
      end
    end
  end

  describe 'initialize passing a hash of attributes with Deducoes data' do
    before do
      @deducao1 = {
        por:             'Valor',
        tipo:            'Despesas com Materiais',
        cnpj_ref:        '123456789',
        num_nf_ref:      '987654321',
        valor_total_ref: '100.00',
        percentual:      '20.00',
        valor:           '25.00'
      }

      @deducao2 = @deducao1.merge(por: 'Percentual', tipo: 'Outro tipo', valor: '55.0')

      attributes = { 'deducoes' => [@deducao1, @deducao2] }
      @rps = Nfse::Envio::Rps.new(attributes)

      # Formata os valores para eles baterem corretamente com o retorno dos getters
      @deducao1[:valor] = @deducao1[:valor].to_f
      @deducao2[:valor] = @deducao2[:valor].to_f
    end

    it 'must have the right attributes' do
      @deducao1.each do |k,v|
        @rps.deducoes[0].send(k).must_equal v
      end

      @deducao2.each do |k,v|
        @rps.deducoes[1].send(k).must_equal v
      end
    end
  end

  describe '#render' do
    it 'must render the right xml' do
      subject.numero = 109
      subject.data_emissao = Time.new(2009, 10, 1)
      subject.situacao = 'N'
      subject.serie_rps_substituido = '123'
      subject.num_rps_substituido = '0'
      subject.num_nfse_substituida = '1'
      subject.data_nfse_substituida = '1900-01-01'
      subject.cod_atividade = '412040000'
      subject.aliquota_atividade = 5.0
      subject.tipo_recolhimento = 'R'
      subject.cod_municipio_prestacao = '0006291'
      subject.municipio_prestacao = 'CAMPINAS'
      subject.operacao = 'A'
      subject.tributacao = 'T'
      subject.valor_pis = 0.0
      subject.valor_cofins = 1.1
      subject.valor_inss = 2.2
      subject.valor_ir = 3.3
      subject.valor_csll = 4.4
      subject.aliquota_pis = 5.5
      subject.aliquota_cofins = 6.6
      subject.aliquota_inss = 7.7
      subject.aliquota_ir = 8.8
      subject.aliquota_csll = 9.9
      subject.descricao = 'TESTE'
      subject.motivo_cancelamento = 'motivo exemplo'
      subject.cnpj_intermediario = '123456789'

      # Assinatura
      subject.expects(:assinatura).returns('02bc34ff87f8112295e56901832a4a87b5c4fb6a')

      # Prestador
      prestador = subject.prestador
      prestador.inscricao_municipal = '0370835'
      prestador.razao_social        = 'EMPRESA MODELO'
      prestador.ddd                 = '035'
      prestador.telefone            = '40405050'

      # Tomador
      tomador = subject.tomador
      tomador.inscricao_municipal = '0000000'
      tomador.cnpj                = '27394162000108'
      tomador.razao_social        = 'EMPRESA DE TESTE'
      tomador.tipo_logradouro     = 'RUA'
      tomador.logradouro          = 'logradouro exemplo'
      tomador.num_endereco        = '9'
      tomador.tipo_bairro         = 'BAIRRO'
      tomador.bairro              = 'bairro exemplo'
      tomador.cod_cidade          = '00062910'
      tomador.cidade              = 'SAO PAULO'
      tomador.cep                 = '05010040'
      tomador.email               = 'foo@example.com'
      tomador.ddd                 = '011'
      tomador.telefone            = '923156467'

      # Deducao
      subject.deducoes << stub(render: xml('Deducao[1]'))
      subject.deducoes << stub(render: xml('Deducao[2]'))

      # Item
      subject.itens << stub(render: xml('Item[1]'))
      subject.itens << stub(render: xml('Item[2]'))

      xml('RPS', subject.render).must_equal xml('RPS[1]')
    end
  end

end
