def Arbitrary(klass)
  Rubarb.generator(klass).call
end

def ForAll(klass)
  srand klass.hash
  Rubarb.config[:forall_amount].times do
    yield Arbitrary(klass)
  end
end


