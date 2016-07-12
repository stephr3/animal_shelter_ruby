require 'spec_helper'

describe(Friend) do

  describe '#name' do
    it 'returns the name of the customer' do
      test_person = Friend.new({:name => 'Tad',:phone => 5552221111,:fav_animal => 'fish',:fav_breed => 'goldfish', :animal_id => nil})
      expect(test_person.name()).to(eq('Tad'))
    end
  end

  describe '.all' do
    it 'returns an array of all friends' do
      expect(Friend.all).to(eq([]))
    end
  end

  describe '#save' do
    it 'saves a friend to an array of all friends' do
      test_person = Friend.new({:name => 'Tad',:phone => 5552221111,:fav_animal => 'fish',:fav_breed => 'goldfish', :animal_id => 1})
      test_person.save()
      expect(Friend.all()).to(eq([test_person]))
    end
  end

  describe '#id' do
    it 'returns the id of the customer' do
      test_person = Friend.new({:name => 'Tad',:phone => 5552221111,:fav_animal => 'fish',:fav_breed => 'goldfish', :animal_id => 1})
      test_person.save()
      expect(test_person.id().class()).to(eq(Fixnum))
    end
  end

  describe '#==' do
    it "compares two people to decide if they are the same person" do
      test_person1 = Friend.new({:name => 'Tad',:phone => 5552221111,:fav_animal => 'fish',:fav_breed => 'goldfish', :animal_id => 1})
      test_person_too = Friend.new({:name => 'Tad',:phone => 5552221111,:fav_animal => 'fish',:fav_breed => 'goldfish', :animal_id => 1})
      test_person1.eql?(test_person_too)
    end
  end
end
