

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

	def computeTaxesAndTotal
		puts "\nComputing Taxex and Total..."
		@salesTaxes = 0
		@totalPrice = 0

		@salesItems.each do |a|
			@a = (SalesItem)a
			totPrice = @a.price
			tax = @a.isTaxable ? @a.price.to_f * 0.1 : 0
			totPrice = totPrice + tax
			if @a.isImported
				addlTax = totPrice.to_f * 0.05
				tax = tax + addlTax
				totPrice = totPrice + addlTax
				@salesTaxes = @salesTaxes + addlTax
			end
			@salesTaxes = @salesTaxes + tax
			@totalPrice = @totalPrice + totPrice
			@a.price = totPrice
		end

	end

	def printReceipt
		@salesItems.each do |a| 
			puts "#{@a.quantity} #{@a.name} : #{@a.price}"
		end
		puts "Sales Taxes: #{@salesTaxes}\nTotal: #{@totalPrice}"
	end
end

#class TestTransaction

#Input 1:
#1 book at 12.49
#1 music CD at 14.99
#1 chocolate bar at 0.85

	aBook = SalesItem.new(false, false, 1, 12.49, "book")
	aMusicCD = SalesItem.new(false, true, 1, 14.99, "music CD")
	aChocoBar = SalesItem.new(false, false, 1, 0.85, "chocolate bar")

	transaction1 = Transaction.new
	transaction1.salesItems = [aBook, aMusicCD, aChocoBar]
	transaction1.computeTaxesAndTotal
	transaction1.printReceipt
#end
