class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(keywords)
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY, name, TEXT, breed TEXT);"
    
  end
end
