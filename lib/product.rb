class Product
	attr_reader :title

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

	#need in_stock class method

	private

	def add_to_products
		count = 0
		@@products.each do |product|
			if product.title == @title
				count += 1
			end
		end 
		# LEGO Iron Man vs. Ultron already exists. (DuplicateProductError)
		if count == 0
			@@products << self
		else
			raise DuplicateProductError, "#{@title} already exists Kelly."
		end		
	end	
end	