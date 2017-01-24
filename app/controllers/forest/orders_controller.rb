class Forest::OrderController < ForestLiana::ApplicationController
  def generate_invoice
    render json: { success: 'Invoice successfuly generated.' }
  end

  def send_invoice
    render json: { success: "Invoice successfuly sent." }
  end
end
