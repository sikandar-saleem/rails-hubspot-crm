module CoreExtensions
  module Integer
    def is?(value)
      self.to_i == value.to_i
    end
  end
end
