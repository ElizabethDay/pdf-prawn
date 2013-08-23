require 'prawn'

class Page
  attr_accessor :pdf

  HEADER_HEIGHT = 100

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

  def add_header
    add_left_text_box
    add_right_image
  end

  def add_left_text_box
    @pdf.bounding_box([0, @pdf.bounds.height], 
	width: (@pdf.bounds.width - HEADER_HEIGHT), height: HEADER_HEIGHT) do
      @pdf.text "Elizabeth Day", size: 25, style: :bold
      @pdf.text "elizabeth.d.day@gmail.com", size: 16
      @pdf.text "@bsunrise", size: 16
      @pdf.stroke_bounds
    end
  end

  def add_right_image
    @pdf.bounding_box([(@pdf.bounds.width - HEADER_HEIGHT), @pdf.bounds.height],
      width: HEADER_HEIGHT, height: HEADER_HEIGHT, align: :right) do
      @pdf.image "mangatar.jpg", height: HEADER_HEIGHT
      @pdf.stroke_bounds
    end
  end

end

Prawn::Document.generate('page.pdf') do |pdf|
  page = Page.new(pdf)
  page.add_background
  pdf.move_down 10
  
  page.add_header
end
