require 'prawn'

class Page
  attr_accessor :pdf

  def initialize(pdf)
    @pdf = pdf
  end

  def add_hello_text
    ["Courier", "Helvetica", "Times-Roman"].each do |font|
      @pdf.font font
      @pdf.text "Hello, BarCamp!", size: 20
    end
  end
end

Prawn::Document.generate('page.pdf') do |pdf|
  page = Page.new(pdf)
  page.add_hello_text
end


