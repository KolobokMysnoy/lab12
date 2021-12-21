# frozen_string_literal: true

class IndController < ApplicationController
  def main; end

  def view
    @current_answers = find_answers
  end

  private

  def find_answers
    data = []
    number2 = 1
    it = 1
    fact = 1
    found = 1
    while found < 4
      alls = number2 * (number2 - 1) * (number2 + 1)
      while fact < alls
        fact *= it
        it += 1
      end

      if fact == alls
        tmp_data = { iteration: it, factorial: fact, number: number2 }
        data.push(tmp_data)
        found += 1
      end
      number2 += 1
    end
    data
  end
end
