Dir["#{File.dirname(__FILE__)}/../../spec/factories/**"].each do |f|
  load File.expand_path(f)
end
