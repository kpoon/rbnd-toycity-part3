class Customer
	attr_reader :name

	@@customers = []

	def initialize(options={})
		@name = options[:name]
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

	private

	def add_to_customers
		count = 0
		@@customers.each do |customer|
			if customer.name == @name
				count += 1
			end
		end 
		if count == 0
			@@customers << self
		else
			raise DuplicateCustomerError, "'#{@name}' already exists."
		end		
	end	


end	

