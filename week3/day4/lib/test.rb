a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
]
p a.reduce Hash.new, :merge