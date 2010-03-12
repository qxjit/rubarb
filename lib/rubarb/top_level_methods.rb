def Arbitrary(klass,*args)
  Rubarb.generator(klass).call *args
end

def ForAll(klass,*args)
  srand klass.hash
  Rubarb.config[:forall_amount].times do
    yield Arbitrary(klass,*args)
  end
end


