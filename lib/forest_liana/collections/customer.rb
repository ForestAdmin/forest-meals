class Forest::Customer
  include ForestLiana::Collection

  collection :customers

  segment 'VIP' do
    { id: Customer
      .joins(:orders)
      .group('customers.id')
      .having('count(orders.id) > 5')
      .map(&:id) }
  end
end

