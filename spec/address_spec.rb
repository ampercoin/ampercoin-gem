require 'spec_helper'

describe 'Address#initalize' do
  it 'assigns an public_key' do
    expect(Ampercoin::Address.new.public_key.length).to be > 12
  end
end

describe 'Address#verify' do
  it 'returns true if the signature is valid' do
    address = Ampercoin::Address.new
    message = 'hi'
    signature = address.sign(message)
    public_key = address.public_key

    address = Ampercoin::Address.new(public_key: public_key)

    expect(address.verify(message, signature)).to eq true
  end

  it 'returns false if the signature is incorrect' do
    address = Ampercoin::Address.new
    message = 'evil message'
    signature = address.sign(message)
    public_key = address.public_key

    address = Ampercoin::Address.new(public_key: public_key)

    expect(address.verify('hi', signature)).to eq false
  end

  it 'returns false if the signature is invalid' do
    address = Ampercoin::Address.new

    expect(address.verify('hi', 'invalid_signature')).to eq false
  end
end
