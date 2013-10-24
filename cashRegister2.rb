

=begin Basic sales tax is applicable at a rate of 10% on all goods, except
books, food, and medical products that are exempt. Import duty is an additional
sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items
and their price (including tax), finishing with the total cost of the items, and
the total amounts of sales taxes paid. The rounding rules for sales tax are that
for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the
nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping
baskets...

INPUT:

Input 1: 1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85

Input 2: 1 imported box of chocolates at 10.00 1 imported bottle of perfume at
47.50

Input 3: 1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1
packet of headache pills at 9.75 1 box of imported chocolates at 11.25

OUTPUT

Output 1: 1 book : 12.49 1 music CD: 16.49 1 chocolate bar: 0.85 Sales Taxes:
1.50 Total: 29.83

Output 2: 1 imported box of chocolates: 10.50 1 imported bottle of perfume:
54.65 Sales Taxes: 7.65 Total: 65.15

Output 3: 1 imported bottle of perfume: 32.19 1 bottle of perfume: 20.89 1
packet of headache pills: 9.75 1 imported box of chocolates: 11.85 Sales Taxes:
6.70 Total: 74.68
	
=end

#--------------------------------------------------------------------------------------------



class Product
	attr_accessor :price, :name

	def initialize(price, name)
		@price = price
		@name = name
	end
end

class SalesItem < Product
	attr_accessor :isImported, :isTaxable, :quantity, :lineItemPrice
	
	def initialize(isImported, isTaxable, quantity, price, name)
		super(price, name)
		@isImported = isImported
		@isTaxable = isTaxable
		@quantity = quantity
		@lineItemPrice = 0
	end
end

class Transaction
	attr_accessor :salesItems, :salesTaxes, :totalPrice

	def initialize(salesItems)
		@salesItems = salesItems
		@salesTaxes = 0
		@totalPrice = 0
	end
end

class PaymentProcessor
	attr_accessor :transaction
	#@transaction
	def initialize(transaction)
		@transaction = transaction
	end

	def printReceipt()
		puts "\nPrinting Receipt...\n"
		@transaction.salesItems.each do |a| 
			if a.isImported 
				a.name = "imported " + a.name
			end
			puts "#{a.quantity} #{a.name} : #{"%.2f" % a.price}"
		end
		puts "Sales Taxes: #{"%.2f" % @transaction.salesTaxes}\nTotal: #{"%.2f" % @transaction.totalPrice}"
	end

	def processTransanction()
		
		@transaction.salesItems.each do |a|
			totPrice = a.price
			tax = a.isTaxable ? a.price.to_f * 0.1 : 0
			totPrice = totPrice + tax
			if a.isImported
				totTaxRate = a.isTaxable ? 0.15 : 0.05  
				
				tax = a.price.to_f * totTaxRate
				totPrice = a.price.to_f + tax
			
				#@salesTaxes = @salesTaxes + addlTax
			end
			@transaction.salesTaxes = @transaction.salesTaxes + tax
			@transaction.totalPrice = @transaction.totalPrice + totPrice
			a.price = totPrice
		end
		self.printReceipt
	end


end

#class TestTransaction

#Input 1:
#1 book at 12.49
#1 music CD at 14.99
#1 chocolate bar at 0.85

#1st transaction ------------------------------------------------------
	
	aBook = SalesItem.new(false, false, 1, 12.49, "book")
	aMusicCD = SalesItem.new(false, true, 1, 14.99, "music CD")
	aChocoBar = SalesItem.new(false, false, 1, 0.85, "chocolate bar")

	transaction1 = Transaction.new([aBook, aMusicCD, aChocoBar])
	cashCounter = PaymentProcessor.new(transaction1)
	cashCounter.processTransanction()

#2nd transaction --------------------------------------------------------
	boxOfChoco = SalesItem.new(true, false, 1, 10.00, "box of chocolates")
	perfume = SalesItem.new(true, true, 1, 47.50, "bottle of perfume")
	
	transaction2 = Transaction.new([boxOfChoco, perfume])
	cashCounter.transaction = transaction2
	cashCounter.processTransanction()

#3nd transaction --------------------------------------------------------
	importedPerfume = SalesItem.new(true, true, 1, 27.99, "bottle of perfume")
	perfume = SalesItem.new(false, true, 1, 18.99, "bottle of perfume")
	pills = SalesItem.new(false, false, 1, 9.75, "packet of headache pills")
	choco = SalesItem.new(true, false,1, 11.25, "box of chocolates")

	transaction3 = Transaction.new([importedPerfume, perfume, pills, choco])
	cashCounter.transaction = transaction3
	cashCounter.processTransanction()
#end
