module SaveMoneys
  class Balance
    def initialize(options = {})
      @options = options
      @save_money = options[:save_money]
    end

    def call
      balance
    end

    private

    attr_reader :save_money

    def balance
      save_money.wallets.sum(&:value)
    end

  end
end