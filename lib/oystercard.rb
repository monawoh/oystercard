class Oystercard 
    DEFAULT_BALANCE = 0
    JOURNEY_MIN = 1 
    LIMIT = 90
    attr_reader :balance, :limit, :entry_station, :journey_list, :exit_station
    
    def initialize
        @balance = DEFAULT_BALANCE
        @minimum = JOURNEY_MIN
        @limit = LIMIT
        @entry_station = nil
        @journey_list = []
        @exit_station = nil
    end

    def top_up(amount)
        fail "Cannot up anymore, you will exceed your limit of #{limit}" if balance + amount > limit
        @balance += amount
    end

    def touch_in(station)
        fail "Not enough money on card" if balance < @minimum
        @entry_station = station
    end

    def touch_out(station)
        fail "fail not in journey" if @journey == false
        deduct(2)
        @exit_station = station
    end

    def in_journey?
        !@entry_station.nil?
        # if @entry_station == nil
        #     return false
        # else
        #     return true
        # end
    end


    private
    
    def deduct(amount)
        @balance -= amount
    end

end
