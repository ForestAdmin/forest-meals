Rails.application.routes.draw do
  namespace :forest do
    post '/actions/generate-invoice' => 'order#generate_invoice'
    post '/actions/send-invoice' => 'order#send_invoice'
    post '/actions/cancel-order' => 'order#cancel_order'
    post '/actions/cancel-delivery' => 'delivery_men#cancel_delivery'
    post '/stats/vip_customers' => 'stat#vip_customers'
    post '/stats/mrr_this_month' => 'stat#mrr_this_month'
    post '/stats/mrr' => 'stat#mrr'
  end

  mount ForestLiana::Engine => '/forest'
end
