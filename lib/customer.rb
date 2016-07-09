class Customer
	attr_reader :name, :age, :sex

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		@age = options[:age]
		@sex = options[:sex]
		add_to_customers
	end	

	def self.all 
		@@customers
	end	

	def self.find_by_name(search_name)
		@@customers.each do |customer|
			if customer.name == search_name
				return customer
			end
		end
	end	

	def purchase(product)
		if product.in_stock?
			Transaction.new(@name, product)
		else
			raise OutOfStockError, "'#{product.title}' is out of stock."	
		end	
	end	

	private

	def add_to_customers
		# count = 0
		# @@customers.each do |customer|
		# 	if customer.name == @name
		# 		count += 1
		# 	end
		# end 
		# if count == 0
		# 	@@customers << self
		# else
		# 	raise DuplicateCustomerError, "'#{@name}' already exists."
		# end	
		if @@customers.find {|customer| customer.name == @name}
			raise DuplicateCustomerError, "'#{@name}' already exists."
		else
			@@customers << self
		end				
	end	
end	

