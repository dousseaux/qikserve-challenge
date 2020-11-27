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
        products_ids = []
        session_cart.each do |prod|
            unless prod.blank?
                pindex = products_ids.index(prod['id'])
                if pindex.blank?
                    product = Product.get(prod['id'])
                    product.apply_discount(prod['qtt'])
                    products_ids.push(prod['id'])
                    self.products.push(product)
                else
                    product = self.products[pindex]
                    product.apply_discount(product.quantity + prod['qtt'])
                end
                self.total = self.total + product.price_total
                self.total_payables = self.total_payables + product.price_liquid
                self.total_promos = self.total_promos + product.discount
            end
        end
    end

end
