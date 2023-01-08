# frozen_string_literal: true

class GameDecorator < ApplicationDecorator
  delegate_all

  def payout_amount(place)
    percent = payout_schedule[place]
    return 0.00 unless percent

    h.number_to_currency(percent.to_f * 0.01 * total_pot, precision: 2)
  end

  def buy_in_amount
    h.number_to_currency(buy_in, precision: 0)
  end

  def pot_size
    h.number_to_currency(estimated_player_count * buy_in, precision: 0)
  end

  def add_on_text
    add_ons ? "Add-ons or Rebuys allowed" : "No"
  end

  def formatted_date
    date_time.strftime("%b %d, %Y")
  end

  def formatted_time
    date_time.strftime("%I:%M %p")
  end

  def league_name
    league.name
  end
end
