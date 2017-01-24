class Forest::Order
  include ForestLiana::Collection

  collection :orders
  action 'Generate invoice'
  action 'Send invoice'
end
