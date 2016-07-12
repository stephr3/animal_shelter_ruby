class Friend
  attr_reader(:id, :name,:phone,:fav_animal,:fav_breed,:animal_id)

  define_method (:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @fav_animal = attributes.fetch(:fav_animal)
    @fav_breed = attributes.fetch(:fav_breed)
    @animal_id = attributes.fetch(:animal_id)
  end

  define_method(:==) do |other| #= mod'ed method from course reading: note =
    same_name = self.name().eql?(other.name())
    same_animal_id = self.animal_id().eql?(other.animal_id())
    same_animal_id.&(same_name)
   end

  define_singleton_method(:all) do
    returned_friends = DB.exec("SELECT * FROM friends;")
    friends = []
    returned_friends.each() do |friend|
      id = friend.fetch("id").to_i()
      name = friend.fetch('name')
      phone = friend.fetch('phone').to_i()
      fav_animal = friend.fetch('fav_animal')
      fav_breed = friend.fetch('fav_breed')
      animal_id = friend.fetch('animal_id').to_i()
      friends.push(Friend.new({:id => id, :name => name, :phone => phone, :fav_animal => fav_animal, :fav_breed => fav_breed, :animal_id => animal_id}))
    end
    friends
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO friends (name, phone, fav_animal, fav_breed, animal_id) VALUES ('#{@name}', #{@phone}, '#{@fav_animal}', '#{@fav_breed}', #{@animal_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_singleton_method(:sort_by_fav_breed) do
    friends = []
    returned_friends = DB.exec("SELECT * FROM friends ORDER BY fav_breed ASC;")
    returned_friends.each() do |friend|
      id = friend.fetch("id").to_i()
      name = friend.fetch('name')
      phone = friend.fetch('phone').to_i()
      fav_animal = friend.fetch('fav_animal')
      fav_breed = friend.fetch('fav_breed')
      animal_id = friend.fetch('animal_id').to_i()
      friends.push(Friend.new({:id => id, :name => name, :phone => phone, :fav_animal => fav_animal, :fav_breed => fav_breed, :animal_id => animal_id}))
    end
    friends
  end

end
