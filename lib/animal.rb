class Animal
  attr_reader(:name, :entry_date, :gender, :type, :breed, :friend_id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @entry_date = attributes.fetch(:entry_date)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @friend_id = attributes.fetch(:friend_id)
  end

  define_method(:==) do |other| #= mod'ed method from course reading: note =
    same_name = self.name().eql?(other.name())
     same_entry_date = self.entry_date().eql?(other.entry_date())
     same_breed = self.breed().eql?(other.breed())
     same_entry_date.&(same_name).&(same_breed)
   end

  define_singleton_method (:all) do
    returned_animals = DB.exec("SELECT name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch('name')
      entry_date = animal.fetch('entry_date')
      gender = animal.fetch('gender')
      type = animal.fetch('type')
      breed = animal.fetch('breed')
      friend_id = animal.fetch('friend_id').to_i()
      animals.push(Animal.new({:name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (name,entry_date,gender,type,breed,friend_id) VALUES ('#{@name}','#{@entry_date}','#{@gender}','#{@type}','#{@breed}',#{@friend_id});")
  end

  define_singleton_method(:sort_by_breed) do
    animals = []
    returned_animals = DB.exec("SELECT name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals ORDER BY breed ASC;")
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      entry_date = animal.fetch("entry_date")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      friend_id = animal.fetch("friend_id")
      animals.push(Animal.new({:name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end
end
