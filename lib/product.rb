class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end	

	def self.all 
		@@products
	end	

	#need find_by_title class method
	def self.find_by_title(search_title)
		@@products.each do |product|
			if product.title == search_title
				return product
			end
		end
	end		

	#need to create in_stock? instance method returns true or false
	def in_stock?
		@stock > 0		
	end	
	
	def decrease_stock
		@stock -= 1
	end

	private

	def add_to_products
		count = 0
		@@products.each do |product|
			if product.title == @title
				count += 1
			end
		end 
		if count == 0
			@@products << self
		else
			raise DuplicateProductError, "#{@title} already exists."
		end		
	end	

	#need in_stock class method
	def self.in_stock
		# @@products.delete_if {|product| product.stock == 0 }	
		@@products.select{|product| product.stock > 0}
	end	
end	