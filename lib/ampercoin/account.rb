module Ampercoin
  class Account < ActiveRecord::Base
    after_initialize :set_keys

    def set_keys
      key = OpenSSL::PKey::EC.new('secp521r1')
      key.generate_key
      self.public_key ||= key.public_key.to_bn.to_i.to_s(16)
      self.private_key ||= key.private_key.to_i.to_s(16)
    end

    def to_s
      address
    end

    def balance
      0
    end

    def address
      "&#{readably_encode(hashed_key)}"
    end

    def readably_encode(data)
      Base58.encode(data)
    end

    def hashed_key
      Digest::RMD160.new.hexdigest(public_key).hex
    end

    def sign
    end
  end
end
