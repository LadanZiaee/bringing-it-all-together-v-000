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
      sql = "INSERT INTO dogs (name, breed) VALUES (?, ?)"
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
    self
  end
  
  def update
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
  
  def self.create(name:, breed:)
    dogs = Dog.new(name: name, breed: breed)
    dogs.save
    dogs
  end
  
  def self.new_from_db(row)
    dogs = Dog.new(row[0], row[1], row[2])
  end
  
  def self.find_by_id(num)
    sql = "SELECT * FROM dogs WHERE id = ? LIMIT 1;"
    DB[:conn].execute(sql, num).map do |row|
      Dog.new(row[0], row[1], row[2])
    end
  end
  


end
