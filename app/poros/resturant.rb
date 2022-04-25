class Resturant
  attr_reader :name,
              :address

  def initialize(results)
    @name = (results)[:businesses][0][:name]
    @address = (results)[:businesses][0][:location][:display_address].join(' ')
  end
end
