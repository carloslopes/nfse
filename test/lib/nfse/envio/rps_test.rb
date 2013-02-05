require_relative '../../../test_helper'

describe Nfse::Envio::Rps do

  subject { Nfse::Envio::Rps.new }

  describe 'prestador attribute' do
    it 'must have the accessor methods' do
      subject.must_respond_to :prestador
      subject.must_respond_to :prestador=
    end

    it 'must have the right default value' do
      subject.prestador.must_be_instance_of Nfse::Envio::Prestador
    end
  end

  describe 'tomador attribute' do
    it 'must have the accessor methods' do
      subject.must_respond_to :tomador
      subject.must_respond_to :tomador=
    end

    it 'must have the right default value' do
      subject.tomador.must_be_instance_of Nfse::Envio::Tomador
    end
  end

  describe 'itens attribute' do
    it 'must have the accessor methods' do
      subject.must_respond_to :itens
      subject.must_respond_to :itens=
    end

    it 'must have the right default value' do
      subject.itens.must_be_instance_of Array
    end
  end

  describe 'deducoes attribute' do
    it 'must have the accessor methods' do
      subject.must_respond_to :deducoes
      subject.must_respond_to :deducoes=
    end

    it 'must have the right default value' do
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
  end

  describe 'serie attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :serie
      subject.must_respond_to :serie=
    end

    it 'must have the right default value' do
      subject.serie.must_equal 'NF'
    end
  end

  describe 'numero attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :numero
      subject.must_respond_to :numero=
    end

    it 'must coerce the value to integer' do
      subject.numero = '123'
      subject.numero.must_equal 123
    end
  end

  describe 'data_emissao attribute' do
    it 'must be now if no value was passed' do
      now = DateTime.now
      DateTime.expects(:now).returns(now)

      subject.data_emissao.must_equal now
    end

    it 'must coerce the value to datetime' do
      subject.data_emissao = '20/10/2000'
      subject.data_emissao.must_be_instance_of DateTime
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

    it 'must coerce the value to integer' do
      subject.num_rps_substituido = '123'
      subject.num_rps_substituido.must_equal 123
    end
  end

  describe 'num_nfse_substituida attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :num_nfse_substituida
      subject.must_respond_to :num_nfse_substituida=
    end

    it 'must coerce the value to integer' do
      subject.num_nfse_substituida = '123'
      subject.num_nfse_substituida.must_equal 123
    end
  end

  describe 'data_nfse_substituida attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :data_nfse_substituida
      subject.must_respond_to :data_nfse_substituida=
    end

    it 'must coerce the value to DateTime' do
      subject.data_nfse_substituida = '20/10/2000'
      subject.data_nfse_substituida.must_be_instance_of DateTime
    end
  end

  describe 'serie_prestacao attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :serie_prestacao
      subject.must_respond_to :serie_prestacao=
    end

    it 'must have the right default value' do
      subject.serie_prestacao.must_equal 99
    end

    it 'must coerce the value to integer' do
      subject.serie_prestacao = '12'
      subject.serie_prestacao.must_equal 12
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

    it 'must coerce the value to float' do
      subject.aliquota_atividade = '1.5'
      subject.aliquota_atividade.must_equal 1.5
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

    describe 'rio de janeiro' do
      before do
        Nfse::Base.prefeitura = :rio_de_janeiro
      end

      subject { Nfse::Envio::Rps.new }

      it 'must have the right default value' do
        subject.operacao.must_equal '1'
      end
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

    it 'must coerce the value to float' do
      subject.valor_pis = '1.2'
      subject.valor_pis.must_equal 1.2
    end
  end

  describe 'valor_cofins attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_cofins
      subject.must_respond_to :valor_cofins=
    end

    it 'must coerce the value to float' do
      subject.valor_cofins = '1.2'
      subject.valor_cofins.must_equal 1.2
    end
  end

  describe 'valor_inss attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_inss
      subject.must_respond_to :valor_inss=
    end

    it 'must coerce the value to float' do
      subject.valor_inss = '1.2'
      subject.valor_inss.must_equal 1.2
    end
  end

  describe 'valor_ir attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_ir
      subject.must_respond_to :valor_ir=
    end

    it 'must coerce the value to float' do
      subject.valor_ir = '1.2'
      subject.valor_ir.must_equal 1.2
    end
  end

  describe 'valor_csll attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_csll
      subject.must_respond_to :valor_csll=
    end

    it 'must coerce the value to float' do
      subject.valor_csll = '1.2'
      subject.valor_csll.must_equal 1.2
    end
  end

  describe 'aliquota_pis attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_pis
      subject.must_respond_to :aliquota_pis=
    end

    it 'must coerce the value to float' do
      subject.aliquota_pis = '1.2'
      subject.aliquota_pis.must_equal 1.2
    end
  end

  describe 'aliquota_cofins attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_cofins
      subject.must_respond_to :aliquota_cofins=
    end

    it 'must coerce the value to float' do
      subject.aliquota_cofins = '1.2'
      subject.aliquota_cofins.must_equal 1.2
    end
  end

  describe 'aliquota_inss attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_inss
      subject.must_respond_to :aliquota_inss=
    end

    it 'must coerce the value to float' do
      subject.aliquota_inss = '1.2'
      subject.aliquota_inss.must_equal 1.2
    end
  end

  describe 'aliquota_ir attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_ir
      subject.must_respond_to :aliquota_ir=
    end

    it 'must coerce the value to float' do
      subject.aliquota_ir = '1.2'
      subject.aliquota_ir.must_equal 1.2
    end
  end

  describe 'aliquota_csll attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :aliquota_csll
      subject.must_respond_to :aliquota_csll=
    end

    it 'must coerce the value to float' do
      subject.aliquota_csll = '1.2'
      subject.aliquota_csll.must_equal 1.2
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

  describe 'id attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :id
      subject.must_respond_to :id=
    end

    it 'must have the right default value' do
      date = Time.now
      Time.expects(:now).returns(date)

      subject.id.must_equal "#{subject.object_id}#{date.to_i}"
    end
  end

  describe 'optante_simples_nacional attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :optante_simples_nacional
      subject.must_respond_to :optante_simples_nacional=
    end

    it 'must have the right default value' do
      subject.optante_simples_nacional.must_equal 1
    end
  end

  describe 'incentivador_cultural attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :incentivador_cultural
      subject.must_respond_to :incentivador_cultural=
    end

    it 'must have the right default value' do
      subject.incentivador_cultural.must_equal 2
    end
  end

  describe 'status attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :status
      subject.must_respond_to :status=
    end

    it 'must have the right default value' do
      subject.status.must_equal 1
    end
  end

  describe 'iss_retido attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :iss_retido
      subject.must_respond_to :iss_retido=
    end

    it 'must have the right default value' do
      subject.iss_retido.must_equal 2
    end
  end

  describe 'valor_iss attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_iss
      subject.must_respond_to :valor_iss=
    end

    it 'must coerce the value to float' do
      subject.valor_iss = '1.2'
      subject.valor_iss.must_equal 1.2
    end
  end

  describe 'valor_outras_retencoes attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :valor_outras_retencoes
      subject.must_respond_to :valor_outras_retencoes=
    end

    it 'must have the right default value' do
      subject.valor_outras_retencoes.must_equal 0.0
    end

    it 'must coerce the value to float' do
      subject.valor_outras_retencoes = '1.2'
      subject.valor_outras_retencoes.must_equal 1.2
    end
  end

  describe 'desconto_incondicionado attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :desconto_incondicionado
      subject.must_respond_to :desconto_incondicionado=
    end

    it 'must have the right default value' do
      subject.desconto_incondicionado.must_equal 0.0
    end

    it 'must coerce the value to float' do
      subject.desconto_incondicionado = '1.2'
      subject.desconto_incondicionado.must_equal 1.2
    end
  end

  describe 'desconto_condicionado attribute' do
    it 'must have the accessors methods' do
      subject.must_respond_to :desconto_condicionado
      subject.must_respond_to :desconto_condicionado=
    end

    it 'must have the right default value' do
      subject.desconto_condicionado.must_equal 0.0
    end

    it 'must coerce the value to float' do
      subject.desconto_condicionado = '1.2'
      subject.desconto_condicionado.must_equal 1.2
    end
  end

  describe '#formatted_data_emissao' do
    it 'must return the date with the right format' do
      date = DateTime.new(2012, 10, 10)
      subject.data_emissao = date

      subject.formatted_data_emissao.must_equal date.strftime('%Y-%m-%dT%H:%M:%S')
    end
  end

  describe '#formatted_data_nfse_substituida' do
    it 'must return the date with the right format' do
      date = DateTime.now
      subject.data_nfse_substituida = date

      subject.formatted_data_nfse_substituida.must_equal date.strftime('%Y-%m-%d')
    end
  end

  describe '#assinatura' do
    it 'must generate the right signature' do
      subject.prestador.inscricao_municipal = '0317330'
      subject.serie                         = 'NF'
      subject.numero                        = 38663
      subject.data_emissao                  = '2009-09-05'
      subject.tributacao                    = 'T'
      subject.situacao                      = 'N'
      subject.tipo_recolhimento             = 'A'
      subject.cod_atividade                 = '829979900'
      subject.tomador.cnpj                  = '8764130000102'

      subject.itens << stub(valor_total: 1686)

      expected = '6bcbb93fd7e6d7f0417656f4931ba9f92a7ac1da'
      subject.assinatura.must_equal expected
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

  describe 'initialize passing Prestador data' do
    before do
      @prestador = { inscricao_municipal: '123' }

      attributes = { prestador: @prestador }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes values' do
      @rps.prestador.inscricao_municipal.must_equal @prestador[:inscricao_municipal]
    end
  end

  describe 'initialize passing Tomador data' do
    before do
      @tomador = { email: 'foo@example.com' }

      attributes = { tomador: @tomador }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes values' do
      @rps.tomador.email.must_equal @tomador[:email]
    end
  end

  describe 'initialize passing Itens data' do
    before do
      @item1 = { discriminacao: 'Item 1' }
      @item2 = { discriminacao: 'Item 2' }

      attributes = { itens: [@item1, @item2] }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes values' do
      @rps.itens[0].discriminacao.must_equal @item1[:discriminacao]
      @rps.itens[1].discriminacao.must_equal @item2[:discriminacao]
    end
  end

  describe 'initialize passing Deducoes data' do
    before do
      @deducao1 = { por: 'Valor' }
      @deducao2 = { por: 'Percentual' }

      attributes = { deducoes: [@deducao1, @deducao2] }
      @rps = Nfse::Envio::Rps.new(attributes)
    end

    it 'must have the right attributes values' do
      @rps.deducoes[0].por.must_equal @deducao1[:por]
      @rps.deducoes[1].por.must_equal @deducao2[:por]
    end
  end

  describe '#render' do
    describe 'campinas' do
      before do
        Nfse::Base.prefeitura = :campinas
        subject.numero = 109
        subject.data_emissao = '01/10/2009'
        subject.situacao = 'N'
        subject.serie_rps_substituido = 123
        subject.num_rps_substituido = 0
        subject.num_nfse_substituida = 1
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
        subject.deducoes << stub(render: xml('Deducao[1]', prefeitura: :campinas, file: :envio))
        subject.deducoes << stub(render: xml('Deducao[2]', prefeitura: :campinas, file: :envio))

        # Item
        subject.itens << stub(render: xml('Item[1]', prefeitura: :campinas, file: :envio))
        subject.itens << stub(render: xml('Item[2]', prefeitura: :campinas, file: :envio))
      end

      it 'must render the right xml' do
        xml('RPS', str: subject.render).must_equal xml('RPS[1]', prefeitura: :campinas, file: :envio)
      end
    end

    describe 'rio de janeiro' do
      before do
        Nfse::Base.prefeitura = :rio_de_janeiro
        subject.numero = 109
        subject.serie = 'A'
        subject.tipo = '1'
        subject.data_emissao = '01/10/2009'
        subject.optante_simples_nacional = 2
        subject.incentivador_cultural = 1
        subject.status = 1
        subject.cod_atividade = '1405'
        subject.aliquota_atividade = 0.05
        subject.tipo_recolhimento = '140520'
        subject.cod_municipio_prestacao = '3304557'
        subject.operacao = '1'
        subject.valor_pis = 0.0
        subject.valor_cofins = 1.11
        subject.valor_inss = 2.22
        subject.valor_ir = 3.33
        subject.valor_csll = 4.44
        subject.valor_iss = 5.0
        subject.descricao = 'Exemplo de Discriminacao de RPS'

        # Prestador
        prestador = subject.prestador
        prestador.cnpj                = '01073249816200'
        prestador.inscricao_municipal = '0370835'

        # Tomador
        tomador = subject.tomador
        tomador.inscricao_municipal = '0000000'
        tomador.cnpj                = '27394162000108'
        tomador.razao_social        = 'Nome do Tomador'
        tomador.logradouro          = 'Av. Rio Branco'
        tomador.num_endereco        = '123'
        tomador.complemento_endereco = 'Andar 1'
        tomador.bairro              = 'Centro'
        tomador.cod_cidade          = '3304557'
        tomador.uf                  = 'RJ'
        tomador.cep                 = '05010040'
        tomador.email               = 'foo@example.com'
        tomador.ddd                 = '21'
        tomador.telefone            = '99999999'

        # Item
        subject.itens << Nfse::Envio::Item.new({
          discriminacao:  'Item exemplo',
          quantidade:     '1',
          valor_unitario: '100.00',
          tributavel:     'S'
        })

        subject.expects(:id).returns('21530858201353011970')
      end

      it 'must render the right xml' do
        xml('Rps', str: subject.render).must_equal xml('Rps[1]', prefeitura: :rio_de_janeiro, file: :envio)
      end

      it 'must render the right xml' do
        subject.tomador.cnpj = nil
        subject.tomador.cpf  = '00011122233'
        xml('Rps', str: subject.render).must_equal xml('Rps[1]', prefeitura: :rio_de_janeiro, file: :envio_cpf)
      end
    end
  end

end
