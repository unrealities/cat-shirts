DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/shirt.db")

class Shirt
  include DataMapper::Resource

  property :id,       Serial
  property :filename, String
end

DataMapper.finalize
Shirt.auto_migrate!

# seed db
Shirt.create(filename: "cat123.gif")
Shirt.create(filename: "galaxy-cat-0.jpg")
Shirt.create(filename: "perfect-cat.jpg")
Shirt.create(filename: "surgical-cats-tshirt_design.jpg")
