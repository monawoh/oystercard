class Oystercard 
    DEFAULT_BALANCE = 0 
    LIMIT = 90
    attr_reader :balance, :limit, :journey
    
    def initialize
        @balance = DEFAULT_BALANCE
        @limit = LIMIT
        @journey = false
    end

    def top_up(amount)
        fail "Cannot up anymore, you will exceed your limit of #{limit}" if balance + amount > limit
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def touch_in
        @journey = true if @journey == false
    end

    def touch_out
        @journey = false if @journey == true
    end

    def in_journey?
        @journey
    end


end
