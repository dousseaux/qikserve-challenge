require 'test_helper'

class ProductTest < ActiveSupport::TestCase

    test 'product listing' do
        products = Product.list
        assert(products.length == 4, 'did not list the correct amount of products')
        products.each do |prod|
            assert_instance_of(Product, prod, 'result is not instance of product')
        end
    end

    test 'product get' do
        product = Product.get('Dwt5F7KAhi')
        assert_instance_of(Product, product, 'not instance of product')
        assert(product.name == 'Amazing Pizza!', 'name is wrong')
        assert(product.price == 1099, 'name is wrong')
    end

    test 'product discount - QTY_BASED_PRICE_OVERRIDE' do
        product = Product.get('Dwt5F7KAhi')

        assert(product.quantity == 1, 'quantity is wrong for quantity = 1')
        assert(product.price_total == 1099, 'total price is wrong for quantity = 1')
        assert(product.price_liquid == 1099, 'liquid price is wrong for quantity = 1')
        assert(product.discount == 0, 'discount amount is wrong for quantity = 1')

        product.apply_discount(2)
        assert(product.quantity == 2, 'quantity is wrong for quantity = 2')
        assert(product.price_total == 2198, 'total price is wrong for quantity = 2')
        assert(product.price_liquid == 1799, 'liquid price is wrong for quantity = 2')
        assert(product.discount == 399, 'discount amount is wrong for quantity = 2')

        product.apply_discount(3)
        assert(product.quantity == 3, 'quantity is wrong for quantity = 3')
        assert(product.price_total == 3297, 'total price is wrong for quantity = 3')
        assert(product.price_liquid == 2898, 'liquid price is wrong for quantity = 3')
        assert(product.discount == 399, 'discount amount is wrong for quantity = 3')
    end

    test 'product discount - BUY_X_GET_Y_FREE' do
        product = Product.get('PWWe3w1SDU')

        assert(product.quantity == 1, 'quantity is wrong for quantity = 1')
        assert(product.price_total == 999, 'total price is wrong for quantity = 1')
        assert(product.price_liquid == 999, 'liquid price is wrong for quantity = 1')
        assert(product.discount == 0, 'discount amount is wrong for quantity = 1')

        product.apply_discount(2)
        assert(product.quantity == 2, 'quantity is wrong for quantity = 2')
        assert(product.price_total == 1998, 'total price is wrong for quantity = 2')
        assert(product.price_liquid == 999, 'liquid price is wrong for quantity = 2')
        assert(product.discount == 999, 'discount amount is wrong for quantity = 2')

        product.apply_discount(3)
        assert(product.quantity == 3, 'quantity is wrong for quantity = 3')
        assert(product.price_total == 2997, 'total price is wrong for quantity = 3')
        assert(product.price_liquid == 1998, 'liquid price is wrong for quantity = 3')
        assert(product.discount == 999, 'discount amount is wrong for quantity = 3')
    end

    test 'product discount - FLAT_PERCENT' do
        product = Product.get('C8GDyLrHJb')

        assert(product.quantity == 1, 'quantity is wrong for quantity = 1')
        assert(product.price_total == 499, 'total price is wrong for quantity = 1')
        assert(product.price_liquid == 450, 'liquid price is wrong for quantity = 1')
        assert(product.discount == 49, 'discount amount is wrong for quantity = 1')

        product.apply_discount(2)
        assert(product.quantity == 2, 'quantity is wrong for quantity = 2')
        assert(product.price_total == 998, 'total price is wrong for quantity = 2')
        assert(product.price_liquid == 899, 'liquid price is wrong for quantity = 2')
        assert(product.discount == 99, 'discount amount is wrong for quantity = 2')

        product.apply_discount(3)
        assert(product.quantity == 3, 'quantity is wrong for quantity = 3')
        assert(product.price_total == 1497, 'total price is wrong for quantity = 3')
        assert(product.price_liquid == 1348, 'liquid price is wrong for quantity = 3')
        assert(product.discount == 149, 'discount amount is wrong for quantity = 3')
    end

end
