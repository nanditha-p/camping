require 'rails_helper'

RSpec.describe Hike, type: :model do

  let(:hike) { FactoryGirl.create(:hike, length: 20) }

  describe '#complete!' do

    context 'difficulty level is easy' do
      let(:time_taken) { 2 }
      let(:rating) { 1 }
      it 'should not save, since it was too easy' do
        expect(hike).to_not receive(:update_attributes!)

        hike.complete!(rating, time_taken)
      end
    end

    context 'difficulty level is hard' do
      let(:time_taken) { 8 }
      let(:rating) { 4 }
      it 'should save since it was steep' do

        expect(hike).to receive(:update_attributes!)

        hike.complete!(rating, time_taken)
      end
    end
  end

  describe '#can_mark_as_complete?' do

    context 'difficulty level is easy' do
      let(:time_taken) { 2 }
      it 'should not mark as complete since it was too easy' do
        expect(hike.can_mark_as_complete?(time_taken)).to eq(false)
      end
    end

    context 'difficulty level is hard' do
      let(:time_taken) { 8 }
      it 'should not mark as complete since it was steep' do
        expect(hike.can_mark_as_complete?(time_taken)).to eq(true)
      end
    end

  end

  describe '#look_up' do
    let!(:hike_1) { FactoryGirl.create(:hike, :rating => 3, :difficulty => 3) }
    let!(:hike_2) { FactoryGirl.create(:hike, :rating => 1, :difficulty => 2) }
    let!(:hike_3) { FactoryGirl.create(:hike, :rating => 2, :difficulty => 3) }

     it "should look up by difficulty filter" do
      filter_options = { difficulty: '3' }
      results = Hike.look_up(filter_options)
      expect(results.size).to eq(2)
      expect(results.include?(hike_1)).to eq(true)
      expect(results.include?(hike_3)).to eq(true)
    end

    it " should look up by rating filter" do
      filter_options = { rating: '1' }
      results = Hike.look_up(filter_options)
      expect(results.size).to eq(1)
      expect(results.first).to eq(hike_2)
    end

    it " should return all hikes, since no filtes are present" do
      filter_options = {}
      results = Hike.look_up(filter_options)
      expect(results.size).to eq(3)
    end

  end




end
