require 'test_helper'

class CartTest < ActiveSupport::TestCase

    test 'create cart' do
        cart = Cart.new([
            {
                'id' => 'PWWe3w1SDU',
                'qtt' => 1
            },
            {
                'id' => 'Dwt5F7KAhi',
                'qtt' => 5
            }
        ])
        assert_instance_of(Cart, cart, 'not instance of cart')
        assert(cart.total == 6494, 'total price is wrong')
        assert(cart.total_promos == 798, 'total promos is wrong')
        assert(cart.total_payables == 5696, 'total payables is wrong')
    end

end
