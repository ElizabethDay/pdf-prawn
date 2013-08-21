require 'prawn'

Prawn::Document.generate('page.pdf') do
  text "Hello, BarCamp!"
end


