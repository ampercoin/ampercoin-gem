module Ampercoin
  class Address
    CURVE = 'secp256k1'
    include OpenSSL
    attr_reader :public_key
    attr_reader :private_key

    def initialize(public_key: nil, private_key: nil)
      @key = PKey::EC.new(CURVE)
      @key.group.point_conversion_form = :compressed

      if public_key
        @key.private_key = nil
        @key.public_key = point(public_key)
      else
        @key.generate_key
      end

      @public_key ||= @key.public_key.to_bn.to_i.to_s(16)
      @private_key ||= @key.private_key.to_i.to_s(16)

    end

    def verify(message, signature)
      if signature.present?
        @key.dsa_verify_asn1(
          Digest::SHA256.digest(message),
          Base64.decode64(signature)
        )
      else
        false
      end
      rescue OpenSSL::PKey::ECError
        false
    end

    def to_s
      public_key
    end

    def sign(message)
      Base64.encode64(
        @key.dsa_sign_asn1(Digest::SHA256.digest(message))
      )
    end

    private


    def point(public_key)
      PKey::EC::Point.new(
        curve_group,
        OpenSSL::BN.new(public_key, 16)
      )
    end

    def curve_group
      PKey::EC::Group.new(CURVE)
    end
  end
end
