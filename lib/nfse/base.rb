module Nfse
  class Base < Mustache
    @prefeitura  = :campinas
    @descendants = []

    def self.prefeitura
      @prefeitura ||= :campinas
    end

    def self.prefeitura=(prefeitura)
      @prefeitura = prefeitura
      @descendants.each do |child|
        set_template_path(child)
      end
    end

    def self.inherited(child)
      set_template_path(child)
      @descendants << child
    end

    private
      def self.set_template_path(child)
        child.template_path = File.expand_path("../../templates/#{Nfse::Base.prefeitura}/", __FILE__)
      end
  end
end
