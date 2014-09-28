require 'spec_helper'

describe 'Account#initalize' do
  it 'assigns an address' do
    puts Ampercoin::Account.new.address
    expect(Ampercoin::Account.new.address.length).to be > 12
  end
end
