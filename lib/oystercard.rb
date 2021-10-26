class Oystercard 
    DEFAULT_BALANCE = 0 
    LIMIT = 90
    attr_reader :balance, :limit
    
    def initialize
        @balance = DEFAULT_BALANCE
        @limit = LIMIT
    end

    def top_up(amount)
        fail "Cannot up anymore, you will exceed your limit of #{limit}" if balance + amount > limit
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

end
