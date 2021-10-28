require_relative './../lib/oystercard.rb'

describe Oystercard do
    let(:entry_station) { double :entry_station }
    let(:exit_station) { double :exit_station }

    it 'balance default value 0' do
        expect(subject.balance).to eq(0)
    end

    it 'expects oystercard journey history to be empty' do
        expect(subject.journey_list).to be_empty
    end


    describe '#top_up' do
        it 'increases the balance by the passed amount' do
            subject.top_up(10)
            expect(subject.balance).to eq(10)
        end

        it 'raises error if balance would exceed limit' do
            subject.limit.times {subject.top_up(1)}
            expect {subject.top_up(1)}.to raise_error("Cannot up anymore, you will exceed your limit of #{subject.limit}")
        end
    end

    # deduct moved to private so test removed.
    # describe '#deduct' do
    #     it 'decreases amount in card' do
    #     expect{ subject.send(:deduct, 2.50)}.to change{ subject.balance }.from(0).to(-2.50)
    #     end
    # end

    describe '#touch_in' do
        # it 'sets in_journey? to true if currently false' do
        #     top_up_and_touch(10, false) 
        #     expect(subject.journey).to be true
        # end

        it 'requires the minimum amount to begin a journey' do
            expect { subject.touch_in(:entry_station) }.to raise_error "Not enough money on card"
        end

        it 'records the entry station' do
            top_up_and_touch(10, false)
            expect(subject.entry_station).to eq :entry_station
        end
    end

    def top_up_and_touch(amount, touch_out_after)
        subject.top_up(amount)
        subject.touch_in(:entry_station)
        subject.touch_out if touch_out_after
    end

    describe "#touch_out" do
        # it { is_expected.to respond_to(:touch_out).with(1).argument }

        it 'expects exit station' do
            subject.top_up(10)
            subject.touch_in(:entry_station)
            subject.touch_out(:exit_station)
            expect(subject.exit_station).to eq :exit_station
        end

        it 'sets in_journey? to false if currently true' do
            top_up_and_touch(10, true)   
            expect(subject).to_not be_in_journey
        end

        it 'deducts money on use' do
            top_up_and_touch(10, false)
            expect{ subject.touch_out }.to change{subject.balance}.by(-2)
        end

        it 'sets entry_station to nil' do
            top_up_and_touch(10, true)
            expect(subject.entry_station).to eq nil
        end
    end
    
end










# failure error -unintialised constant oystercard 
# file path: # ./spec/oystercard_spec.rb:1:in `<top (required)>'
# create lib folder, with class oystercard and that should fix the error. 