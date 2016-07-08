class Transaction
	attr_reader :id, :customer, :product, :purchase_date
	@@transactions = []
	@@id = 1

	def initialize(customer, product)
		@id = @@id
        @@id += 1
		@customer = customer
		@product = product
		@purchase_date = Time.now.strftime("%m-%d-%Y")
		add_to_transactions
	end	

	def self.all 
		@@transactions
	end	

	def self.find(search_id)
		@@transactions.each do |transaction|
			if transaction.id == search_id
				return transaction
			end
		end
	end		
	
	private

	def add_to_transactions
		@product.decrease_stock
		@@transactions << self
	end	
end	


