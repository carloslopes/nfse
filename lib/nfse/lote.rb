require 'json'

module Nfse
	class Lote
		attr_accessor :id, :cod_cidade, :cpf_cnpj, :razao_social
		attr_writer :transacao, :versao, :metodo_envio
		attr_reader :data_inicio, :data_fim, :qtd_rps, :valor_total_servicos, :valor_total_deducoes

		def initialize(json = '')
			@id = "#{self.object_id}#{Time.now.to_i}"

			unless json.empty?
				attributes = JSON.parse(json)
				attributes.each do |k,v|
					send("#{k}=", v)
				end
			end
		end

		def transacao
			@transacao ||= 'true'
		end

		def versao
			@versao ||= '1'
		end

		def metodo_envio
			@metodo_envio ||= 'WS'
		end
	end
end