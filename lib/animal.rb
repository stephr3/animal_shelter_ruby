class Animal
  attr_reader(:id, :name, :entry_date, :gender, :type, :breed, :friend_id)

  define_method (:initialize) do |attributes|
    @id = attributes[:id]
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
    returned_animals = DB.exec("SELECT id, name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      id = animal.fetch("id").to_i()
      name = animal.fetch('name')
      entry_date = animal.fetch('entry_date')
      gender = animal.fetch('gender')
      type = animal.fetch('type')
      breed = animal.fetch('breed')
      friend_id = animal.fetch('friend_id').to_i()
      animals.push(Animal.new({:id => id, :name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO animals (name,entry_date,gender,type,breed,friend_id) VALUES    ('#{@name}','#{@entry_date}','#{@gender}','#{@type}','#{@breed}',#{@friend_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_singleton_method(:sort_by_breed) do
    animals = []
    returned_animals = DB.exec("SELECT id, name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals ORDER BY breed ASC;")
    returned_animals.each() do |animal|
      id = animal.fetch("id").to_i()
      name = animal.fetch("name")
      entry_date = animal.fetch("entry_date")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      friend_id = animal.fetch("friend_id").to_i()
      animals.push(Animal.new({:id => id, :name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end
  define_singleton_method(:sort_by_type) do
    animals = []
    returned_animals = DB.exec("SELECT id, name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals ORDER BY type ASC;")
    returned_animals.each() do |animal|
      id = animal.fetch("id").to_i()
      name = animal.fetch("name")
      entry_date = animal.fetch("entry_date")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      friend_id = animal.fetch("friend_id").to_i()
      animals.push(Animal.new({:id => id, :name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end
  define_singleton_method(:sort_by_name) do
    animals = []
    returned_animals = DB.exec("SELECT id, name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals ORDER BY name ASC;")
    returned_animals.each() do |animal|
      id = animal.fetch("id").to_i()
      name = animal.fetch("name")
      entry_date = animal.fetch("entry_date")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      friend_id = animal.fetch("friend_id").to_i()
      animals.push(Animal.new({:id => id, :name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end
  define_singleton_method(:sort_by_entry_date) do
    animals = []
    returned_animals = DB.exec("SELECT id, name, cast(entry_date AS date), gender, type, breed, friend_id FROM animals ORDER BY entry_date ASC;")
    returned_animals.each() do |animal|
      id = animal.fetch("id").to_i()
      name = animal.fetch("name")
      entry_date = animal.fetch("entry_date")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      friend_id = animal.fetch("friend_id").to_i()
      animals.push(Animal.new({:id => id, :name => name, :entry_date => entry_date, :gender => gender, :type => type, :breed => breed, :friend_id => friend_id}))
    end
    animals
  end
end
