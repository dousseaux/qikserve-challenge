class Cart

    attr_accessor :products
    attr_accessor :total
    attr_accessor :total_promos
    attr_accessor :total_payables

    def initialize(session_cart)
        if session_cart.blank?
            session_cart = []
        end
        self.products = []
        self.total = 0
        self.total_promos = 0
        self.total_payables = 0
        session_cart.each do |prod|
            unless prod[:id].blank?
                product = Product.get(prod[:id])
                product.apply_discount(prod[:qtt])
                self.total = self.total + product.price_total
                self.total_payables = self.total_payables + product.price_liquid
                self.total_promos = self.total_promos + product.discount
                self.products.push(product)
            end
        end
    end

end
