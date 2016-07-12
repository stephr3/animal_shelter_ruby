require 'spec_helper'

describe(Animal) do

  describe('#name') do
    it "returns the name of the animal" do
    test_animal = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => nil})
    expect(test_animal.name()).to(eq('Boo'))
    end
  end

  describe('#id') do
    it "returns the id of the animal" do
    test_animal = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
    test_animal.save()
    expect(test_animal.id.class).to(eq(Fixnum))
    end
  end

  describe('.all') do
    it "returns an empty array at first" do
      test_animal1 = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
      test_animal1.save()
      test_animal2 = Animal.new({:name => 'Caw', :entry_date => '2016-07-13', :gender => 'f', :type => 'bird', :breed => 'goldfinch', :friend_id => 1})
      test_animal2.save()
      expect(Animal.all).to(eq([test_animal1,test_animal2]))
    end
  end

  describe('#save') do
    it "saves an animal into the database" do
      test_animal = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe '#==' do
    it "compares two animals to decide if they are the same animal" do
      test_animal1 = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
      test_animal_too = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
      test_animal1.eql?(test_animal_too)
    end
  end

  describe '.sort_by_breed' do
    it "returns a list of animals sorted by breed" do
      test_animal1 = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => 1})
      test_animal1.save()
      test_animal2 = Animal.new({:name => 'Caw', :entry_date => '2016-07-13', :gender => 'f', :type => 'bird', :breed => 'goldfinch', :friend_id => 1})
      test_animal2.save()
      expect(Animal.sort_by_breed).to(eq([test_animal2,test_animal1]))
    end
  end

end
