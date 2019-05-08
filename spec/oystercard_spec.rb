require 'oystercard'
require 'station'

describe Oystercard do

  def topped_up_card
    subject.top_up(10)
    subject.touch_in(:station)
  end

  it 'has 0 balance by default' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }. by 10
  end

  it 'should raise an error if topping up would exceed limit' do
    expect { subject.top_up(100) }.to raise_error("Exceeded maximum balance!")
  end

  it 'should deduct a value from the total balance' do
    topped_up_card
    expect{ subject.send(:deduct, 5) }.to change{ subject.balance }.by -5
  end

  describe '#touch_in' do
    
    it 'should be in journey' do
      topped_up_card
      expect(subject.in_journey?).to be true
    end
    it 'should raise an error if there is not enough money in the account' do
      topped_up_card
      subject.send(:deduct, 10)
      expect { subject.touch_in(:station) }.to raise_error("Insufficient funds!")
    end
  end 
    
  describe 'let' do
    let(:station) { double :station }
    it 'should record the starting station' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.start_station).to eq station
    end
  end

  describe '#touch_out' do

    it 'should end a journey with #touch_out' do
      topped_up_card
      expect{ subject.touch_out }.to change{ subject.in_journey?}.to eq(false)
    end

    it "should deduct a fare at the end of the journey" do
      topped_up_card
      expect{ subject.touch_out }.to change{ subject.balance }.by -Oystercard::FARE
    end

    it 'should not be on a journey' do
      expect(subject.in_journey?).to eq(false)
    end

  end
end
