Rubarb::PrintableCharacters = (0..255).map {|c| "" << c}.select {|s| s =~ /[[:print:]]/}
Rubarb.define(String) do
  (0..(rand 100)).map { Rubarb::PrintableCharacters[rand(Rubarb::PrintableCharacters.length)] }.join
end
