# frozen_string_literal: true

class GameDecorator < ApplicationDecorator
  def formatted_date
    object.date_time.strftime("%b %d, %Y")
  end

  def formatted_time
    object.date_time.strftime("%I:%M %p")
  end
end
