require_relative '../../test_helper'
require 'json'

describe Nfse::Lote do

	subject { Nfse::Lote.new }

	describe 'id attribute' do
		it 'must have the accessors methods' do
			subject.must_respond_to :id
			subject.must_respond_to :id=
		end

		it 'must have a default value' do
			puts subject.id
			subject.id.wont_be_nil
		end
	end

	describe 'cod_cidade attribute' do
		it 'must have the accessors methods' do
			subject.must_respond_to :cod_cidade
			subject.must_respond_to :cod_cidade=
		end
	end

	describe 'cpf_cnpj attribute' do
		it 'must have the accessors methods' do
			subject.must_respond_to :cpf_cnpj
			subject.must_respond_to :cpf_cnpj=
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

	describe 'data_inicio attribute' do
		it 'must have the reader method' do
			subject.must_respond_to :data_inicio
		end
	end

	describe 'data_fim attribute' do
		it 'must have the reader method' do
			subject.must_respond_to :data_fim
		end
	end

	describe 'qtd_rps attribute' do
		it 'must have the reader method' do
			subject.must_respond_to :qtd_rps
		end
	end

	describe 'valor_total_servicos attribute' do
		it 'must have the reader method' do
			subject.must_respond_to :valor_total_servicos
		end
	end

	describe 'valor_total_deducoes attribute' do
		it 'must have the reader method' do
			subject.must_respond_to :valor_total_deducoes
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

	describe 'initialize passing a JSON string as parameter' do
		before do
			@values = {
				cod_cidade:   '6291',
				cpf_cnpj:     '02646676000182',
				razao_social: 'Empresa Resp Modelo',
				transacao:    'false',
				versao: 			'2.5',
				metodo_envio: 'other_method'
			}

			@lote = Nfse::Lote.new(JSON.generate(@values))
		end

		it 'must have the right cod_cidade' do
			@lote.cod_cidade.must_be :==, @values[:cod_cidade]
		end

		it 'must have the right cpf_cnpj' do
			@lote.cpf_cnpj.must_be :==, @values[:cpf_cnpj]
		end

		it 'must have the right razao_social' do
			@lote.razao_social.must_be :==, @values[:razao_social]
		end

		it 'must have the right transacao' do
			@lote.transacao.must_be :==, @values[:transacao]
		end

		it 'must have the right versao' do
			@lote.versao.must_be :==, @values[:versao]
		end

		it 'must have the right metodo_envio' do
			@lote.metodo_envio.must_be :==, @values[:metodo_envio]
		end
	end

end