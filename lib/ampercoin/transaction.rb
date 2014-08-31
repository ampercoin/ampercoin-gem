module Ampercoin
  class Transaction
    def initialize(options={})
      @sender = options[:sender]
      @receiver = options[:receiver]
      @amount = options[:amount]
    end

    def mine

    end

    def id
      "1"
    end

    def magic_number
      4
    end
  end
end
