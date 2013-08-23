require 'prawn'

class Page
  attr_accessor :pdf

  def initialize(pdf)
    @pdf = pdf
    @background = "parchment.jpg"
  end

  def add_background
    @pdf.canvas do
      @pdf.image @background, at: [0, @pdf.bounds.height],
        width: @pdf.bounds.width, height: @pdf.bounds.height
    end
  end

  def add_bounding_box
    @pdf.bounding_box([0, @pdf.bounds.height], 
      width: @pdf.bounds.width, height: @pdf.bounds.height) do
      @pdf.image "mangatar.jpg", height: 250
      @pdf.stroke_bounds
    end
  end

end

Prawn::Document.generate('page.pdf') do |pdf|
  page = Page.new(pdf)
  page.add_background
  pdf.move_down 10
  
  page.add_bounding_box
end
