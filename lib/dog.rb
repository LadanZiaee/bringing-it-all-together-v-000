class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed 
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY, name TEXT, breed TEXT);"
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    drop = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(drop)
  end
  
  def save
    if self.id
      self.update
    else
      sql = 
  end
  def self.new_from_db(row)
    dogs = Dog.new(row[0], row[1], row[2])
  end
  
  
end
