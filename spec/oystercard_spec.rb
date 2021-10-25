require_relative './../lib/oystercard.rb'
describe Oystercard do
    it 'balance default value 0' do
        expect(subject.balance).to eq(0)
    end

    it 'responds to top_up method' do
        card = Oystercard.new
        card.top_up(10)
        expect(card.balance).to eq(10)
    end
end









# failure error -unintialised constant oystercard 
# file path: # ./spec/oystercard_spec.rb:1:in `<top (required)>'
# create lib folder, with class oystercard and that should fix the error. 