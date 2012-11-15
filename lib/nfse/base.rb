module Nfse
  class Base < Mustache
    @prefeitura = :campinas
    @descendants = []
    class << self
      def prefeitura
        @prefeitura || :campinas
      end
      def prefeitura=(prefeitura)
        @prefeitura = prefeitura
        @descendants.each do |child|
          set_template_path(child)
        end
      end
      def inherited(child)
        set_template_path(child)
        @descendants << child
      end

      private
        def set_template_path(child)
          child.template_path = File.expand_path("../../templates/#{Nfse::Base.prefeitura}/", __FILE__)
        end
    end
  end
end