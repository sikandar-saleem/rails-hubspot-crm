module CoreExtensions
  module String
    def is?(value)
      self == value.to_s
    end
  end
end
