class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed 
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY, name, TEXT, breed TEXT);"
    DB[:conn].execute(sql)
    drop = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(drop)
  end
end
