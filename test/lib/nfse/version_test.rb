require_relative '../../test_helper'

describe Nfse do

  it "version number must be defined" do
    Nfse::VERSION.wont_be_nil
  end

end