Rubarb.define(Array) do |g = Arbitrary(:rubarb_generator)|
  (0..(rand 100)).map { Arbitrary(g) }
end
