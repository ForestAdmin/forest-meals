class Forest::DeliveryMenController < ForestLiana::ApplicationController
  def cancel_delivery
    delivery_man = DeliveryMan.find(params.dig('data', 'attributes', 'ids').first)
    render json: { success: "#{delivery_man.email} is now available." }
  end
end
