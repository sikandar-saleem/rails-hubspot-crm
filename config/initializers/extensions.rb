# frozen_string_literals: true

# Requiring all files inside /lib/core_extensions folder
Dir[Rails.root.join('lib/core_extensions/*.rb')].each {|f| require f}

# Applying monkey patching
Integer.include CoreExtensions::Integer
String.include CoreExtensions::String
