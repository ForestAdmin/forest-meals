class Forest::StatController < ForestLiana::ApplicationController
  def vip_customers
    stat = ForestLiana::Model::Stat.new({
      value: Customer
        .joins(:orders)
        .group('customers.id')
        .having('count(orders.id) > 5')
        .count.keys.count
    })

    render json: serialize_model(stat)
  end

  def mrr_this_month
    mrr = Order
      .where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
      .sum(&:total)

    stat = ForestLiana::Model::Stat.new({
      value: mrr
    })

    render json: serialize_model(stat)
  end

  def mrr
    months = {}
    Order.all.map do |order|
      if months[order.created_at.beginning_of_month].blank?
        months[order.created_at.beginning_of_month] = 0
      end

      months[order.created_at.beginning_of_month] += order.total
    end

    stat = ForestLiana::Model::Stat.new({
      value: months.keys.sort.map do |month|
        {
          label: month.strftime('%m-%Y'),
          values: { value: months[month].round }
        }
      end
    })

    render json: serialize_model(stat)
  end
end
