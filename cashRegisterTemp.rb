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


=begin
	
I'm commenting all the code below (I might not even need to) to study later.
As per chris' instructions, for the instructions above, we can ignore the part
of parsing the given input statements. 

IMHO, the below exercise moves away a bit from oop concepts...

=end

=begin
class Goods      
	attr_accessor :price, :name

	def initialize(price, name)
	end
end

class TaxableProduct < Goods     
	attr_accessor :tax_rate     

	def initialize()
	@tax_rate = 0.1
#10% end

class TaxFreeProduct < Goods     attr_accessor :tax_rate     @tax_rate = 0.0 #0%
end

class ImportedProduct < Goods     attr_accessor :tax_rate     @tax_rate = 0.05
#5% end

class Book < TaxFreeProduct end

class Food < TaxFreeProduct end

class MedicalProduct < TaxFreeProduct end

class SalesLineItem

end


class CashRegister     @transaction     def   end
=end


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
SalesLineItem, UntaxedPrice, TotalPrice, GoodsType, TaxRate, TaxAmount, SalesTransaction

nontaxable = ["books", "food", "medical"]
taxRate = 0.1
importTaxRate = 0.05

salesItemTypeHash = {
	:book => "books"

}

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
	attr_accessor :salesItems

	def computeTax
	end

	def computeTotal
	end

	def printReceipt
	end
end

class TestTransaction

	transaction1 = Transaction.new

	aBook = SalesItem.new
end
