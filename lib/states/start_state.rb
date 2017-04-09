# encoding: UTF-8
require_relative 'state'

module StartState
  extend State

  class << self
    def check_state(*); end

    def get_choices(game)
      {:bet => 'Сделать ставку'}
    end
  end
end