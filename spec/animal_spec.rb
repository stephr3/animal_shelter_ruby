require 'spec_helper'

describe(Animal) do

  describe('#name') do
    it "returns the name of the animal" do
    test_animal = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => nil})
    expect(test_animal.name()).to(eq('Boo'))
    end
  end

  describe('.all') do
    it "returns an empty array at first" do
    expect(Animal.all()).to(eq([]))
    end
  end

  describe('#save') do
    it "saves an animal into the database" do
      test_animal = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => NULL})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe '#==' do
    it "compares two animals to decide if they are the same animal" do
      test_animal1 = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => nil})
      test_animal_too = Animal.new({:name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => nil})
      test_animal1.eql?(test_animal_too)
    end
  end



  # describe('#id') do
  #   it "returns the gender of the animal" do
  #   test_animal = Animal.new({:id => 1, :name => 'Boo', :entry_date => '2016-07-12', :gender => 'f', :type => 'fish', :breed => 'goldfish', :friend_id => nil})
  #   expect(test_animal.id()).to(eq(1))
  #   end
  # end
end
