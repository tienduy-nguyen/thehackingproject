require 'pry'
class User
  attr_accessor :email, :age
  @@users = []
  def initialize(email,age)
    @email =email
    @age = age
    @@users.push(self)
  end

  def self.all
    return @@users
  end
  def self.find_by_email(email)
    return @@users.select{|user| user.email == email}
  end

end

# binding.pry
# puts "End of file"

