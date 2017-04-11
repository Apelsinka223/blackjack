# encoding: UTF-8
require_relative 'state'

module StartState
  extend State

  class << self
    def check_state(*); end

    # Return available choices for player
    # @return [Hash]
    def get_choices(game)
      {:bet => 'Сделать ставку'}
    end
  end
end