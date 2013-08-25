require 'prawn'

class Page
  attr_accessor :pdf

  def initialize(pdf)
    @pdf = pdf
  end

  def add_hello_text
    @pdf.text "Hello, BarCamp!"
  end
end

Prawn::Document.generate('page.pdf') do |pdf|
  page = Page.new(pdf)
  page.add_hello_text
end


