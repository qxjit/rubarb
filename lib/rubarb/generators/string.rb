Rubarb.define(String) do
  (0..50).map { ('a'..'z').to_a[rand(26)] }.join
end
