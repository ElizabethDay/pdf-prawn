require 'prawn'

class Page
  attr_accessor :pdf

  HEADER_HEIGHT = 100

  def initialize(pdf)
    @pdf         = pdf
    @base_height = @pdf.bounds.height
    @base_width  = @pdf.bounds.width
    @background  = "parchment.jpg"
  end

  def add_background
    @pdf.canvas do
      @pdf.image @background, at: [0, @base_height],
        width: @base_width, height: @base_height
    end
  end

  def add_header
    pdf.move_down 10
    add_left_text_box
    add_right_image
    add_divider
  end

  def add_left_text_box
    @pdf.bounding_box([40, @base_height],
        width: (@base_width - HEADER_HEIGHT), height: HEADER_HEIGHT) do
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
    @pdf.bounding_box([(@base_width - 40 - HEADER_HEIGHT), @base_height],
        width: HEADER_HEIGHT, height: HEADER_HEIGHT) do
      @pdf.image "mangatar.jpg", height: HEADER_HEIGHT
      @pdf.stroke_bounds
    end
  end

  def add_divider
    @pdf.bounding_box([0, @base_height - 115],
        width: @base_width, height: 15) do
      @pdf.image "page-divider.png", height: 15, position: :center
    end
  end

  def add_profile
    @pdf.bounding_box([40, @base_height - 150], width: 150, height: 100) do
      @pdf.text "Profile", style: :bold
    end
    @pdf.bounding_box([190, @base_height - 150],
      width: @base_width, height: 100) do
    end
  end
end

Prawn::Document.generate('page.pdf') do |pdf|
  page = Page.new(pdf)

  page.add_background
  page.add_header
  page.add_profile
end
