class StatsController < ApplicationController
  def stats
    @cards = [
      ['Podział na wiek', :age],
      ['Podział na miasto', :city],
      ['Podział na staż', :skill],
      ['Podział na umowę', :contract],
    ]
  end
end
