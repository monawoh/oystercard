require_relative './../lib/oystercard.rb'

describe Oystercard do
    it 'balance default value 0' do
        expect(subject.balance).to eq(0)
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

    describe '#deduct' do
        it 'decreases amount in card' do
            expect{ subject.deduct(2.50) }.to change{ subject.balance }.from(0).to(-2.50)
        end
    end

end










# failure error -unintialised constant oystercard 
# file path: # ./spec/oystercard_spec.rb:1:in `<top (required)>'
# create lib folder, with class oystercard and that should fix the error. 