class Forest::Order
  include ForestLiana::Collection

  collection :orders
  action 'Cancel order'
  action 'Generate invoice'
  action 'Send invoice'
end
