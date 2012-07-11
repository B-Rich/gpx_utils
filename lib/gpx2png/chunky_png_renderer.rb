require 'rubygems'
require 'chunky_png'

$:.unshift(File.dirname(__FILE__))

module Gpx2png
  class ChunkyPngRenderer
    def initialize
      @color = ChunkyPNG::Color.from_hex('#FF0000')
    end

    # Create new (full) image
    def new_image(x, y)
      @image = ChunkyPNG::Image.new(
        x,
        y,
        ChunkyPNG::Color::WHITE
      )
    end

    # Add one tile to full image
    def add_tile(blob, x_offset, y_offset)
      tile_image = ChunkyPNG::Image.from_blob(blob)
      @image.compose!(
        tile_image,
        x_offset,
        y_offset
      )
    end

    def line(xa, ya, xb, yb)
      @image.line(
        xa, ya,
        xb, yb,
        @color
      )
    end

    def save(filename)
      @image.save(filename)
    end

    def to_png
      # TODO
    end

  end
end