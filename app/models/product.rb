class Product

    attr_accessor :id
    attr_accessor :name
    attr_accessor :price
    attr_accessor :promotions

    def initialize(id, name, price, promotions=[])
        self.id = id
        self.name = name
        self.price = price
        self.promotions = []
    end

    def get(id)
        resp = JSON.parse(RestClient.get("http://localhost:8081/products/#{id}", {accept: :json}).body)
        return Product.new(resp['id'], resp['name'], resp['price'], resp['promotions'])
    end

    def price_str
        if self.price.present?
            return "#{'USD %.2f' % self.price}"
        else
            return 'N / A'
        end
    end

    def self.list
        products = []
        resp = JSON.parse(RestClient.get('http://localhost:8081/products', {accept: :json}).body)
        resp.each do |prod|
            products.push(Product.new(prod['id'], prod['name'], prod['price']))
        end
        return products
    end

end
