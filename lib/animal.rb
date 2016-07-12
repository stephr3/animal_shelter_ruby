class Animal
  attr_reader(:id, :name, :entry_date, :gender, :type, :breed, :friend_id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @entry_date = attributes.fetch(:entry_date)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @friend_id = attributes.fetch(:friend_id)
  end

  define_singleton_method (:all) do
    []
  end
end
