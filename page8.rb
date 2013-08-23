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
    @pdf.bounding_box([20, @pdf.bounds.height],
        width: (@pdf.bounds.width - HEADER_HEIGHT), height: HEADER_HEIGHT) do
      @pdf.move_down 22
      add_name_text
    end
  end

  def add_name_text
    @pdf.text "Elizabeth Day", size: 25, style: :bold
    add_email_address
    add_twitter_handle
  end

  def add_email_address
    @pdf.formatted_text [ { text: "elizabeth.d.day@gmail.com",
                            link: "mailto:elizabeth.d.day@gmail.com",
                            size: 16, color: "0000AA", styles: [:underline] } ]
  end

  def add_twitter_handle
    @pdf.formatted_text [ { text: "@bsunrise",
                            link: "https://twitter.com/bsunrise",
                            size: 16, color: "0000AA", styles: [:underline] } ]
  end

  def add_right_image
    @pdf.bounding_box([(@pdf.bounds.width - 20 - HEADER_HEIGHT), @pdf.bounds.height],
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
