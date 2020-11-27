require 'test_helper'

class ProductTest < ActiveSupport::TestCase

    test 'product listing' do
        products = Product.list
        assert(products.length == 4, 'did not list the correct amount of products')
        products.each do |prod|
            assert_instance_of(Product, prod, 'result is not instance of product')
        end
    end

end
