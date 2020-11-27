class Product

    attr_accessor :id
    attr_accessor :name
    attr_accessor :promotions
    attr_accessor :price
    attr_accessor :price_total
    attr_accessor :price_liquid
    attr_accessor :discount
    attr_accessor :quantity


    def self.get(id)
        resp = JSON.parse(RestClient.get("http://localhost:8081/products/#{id}", {accept: :json}).body)
        return Product.new(resp['id'], resp['name'], resp['price'], resp['promotions'])
    end


    def self.list
        products = []
        resp = JSON.parse(RestClient.get('http://localhost:8081/products', {accept: :json}).body)
        resp.each do |prod|
            products.push(Product.new(prod['id'], prod['name'], prod['price']))
        end
        return products
    end


    def initialize(id, name, price, promotions=[])
        self.id = id
        self.name = name
        self.price = price
        self.promotions = promotions
        self.quantity = 1
        self.apply_discount(self.quantity)
    end


    def apply_discount(qtt=1)
        self.quantity = qtt
        self.discount = 0
        self.price_total = self.price * self.quantity
        self.promotions.each do |promo|
            self.discount = self.discount + calc_promo(promo)
        end
        self.price_liquid = self.price_total - self.discount
    end


    private


    def calc_promo(promo)
        case promo['type']
        when 'QTY_BASED_PRICE_OVERRIDE'
            if self.quantity >= promo['required_qty']
                discounted = (self.quantity / promo['required_qty']).to_i * promo['price']
                discounted = discounted + (self.quantity % promo['required_qty']) * self.price
                return (self.quantity * self.price) - discounted
            end
        when 'BUY_X_GET_Y_FREE'
            if self.quantity >= promo['required_qty']
                frees = (self.quantity / promo['required_qty']).to_i * promo['free_qty']
                return frees * self.price
            end
        when 'FLAT_PERCENT'
            return (promo['amount'] * self.price * self.quantity / 100).to_i
        end
        return 0
    end

end
