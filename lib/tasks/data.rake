namespace :meals do
  task :seed => :environment do |t, args|
    DeliveryMan.destroy_all
    Chef.destroy_all
    ChefAvailability.destroy_all
    Customer.destroy_all
    Menu.destroy_all
    Order.destroy_all

    def random_geoloc
      coord = [37.7869148, -122.3998675]
      Geocoder::Calculations.random_point_near(coord, 1).join(',')
    end

    # Delivery man
    (1..100).each do
      DeliveryMan.create(firstname: Faker::Name.first_name,
                         lastname: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         location: Faker::Address.city,
                         available: [true, false].sample,
                         phone: Faker::PhoneNumber.cell_phone,
                         geoloc: random_geoloc)
    end

    # Chef
    (1..25).each do
      chef = Chef.create(firstname: Faker::Name.first_name,
                  lastname: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  address: Faker::Address.street_address,
                  phone: Faker::PhoneNumber.cell_phone)

      (5..rand(10..50)).each do
        date = rand(0..31).days.from_now.change({
          hour: [9, 12, 19].sample, min: 0, sec: 0
        })
        ChefAvailability.create(chef: chef,
                                available_at: date)
      end
    end

    # Menu
    100.times.each do
      chef = Chef.order('RANDOM()').first
      date = rand(0..31).days.from_now.change({ hour: 0, min: 0, sec: 0 })
      menu = Menu.create(chef: chef, available_at: date)

      (1..rand(2..4)).each do
        menu.products << Product.order('RANDOM()').first
      end
    end

    # Customer
    (1..50).each do
      stripe_customer = Stripe::Customer.create()
      stripe_customer.sources.create(card: {
          number: '4242424242424242',
          exp_month: 1,
          exp_year: 2018,
          cvc: '314'
      })

      customer = Customer.create(firstname: Faker::Name.first_name,
                                 lastname: Faker::Name.last_name,
                                 address: Faker::Address.street_address,
                                 phone: Faker::PhoneNumber.cell_phone,
                                 stripe_id: stripe_customer.id)

      (1..rand(1..10)).each do
        order = Order.create(customer: customer,
                             delivery_address: Faker::Address.street_address,
                             created_at: rand(3.months).seconds.ago,
                             status: [
                               :payment_processing,
                               :payment_confirmed,
                               :processed].sample)

        (1..rand(1..10)).each do
          product = Product.order('RANDOM()').first
          order.products << product
        end

        if order.payment_confirmed?
          Stripe::Charge.create(
            amount: (order.total * 100).round,
            currency: 'usd',
            customer: stripe_customer.id,
            description: "Order #{order.id}"
          )
        end
      end
    end
  end
end
