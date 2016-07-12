class Friend
  attr_reader(:id,:name,:phone,:fav_animal,:fav_breed,:animal_id)

  define_method (:initialize) do |attributes|
    @id = attributes.fetch[:id]
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @fav_animal = attributes.fetch(:fav_animal)
    @fav_breed = attributes.fetch(:fav_breed)
    @animal_id = attributes.fetch(:animal_id)
  end

end
