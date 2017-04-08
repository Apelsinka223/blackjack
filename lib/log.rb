module Log
  def logger
    Log.logger
  end

  def self.logger
    @logger ||= Logger.new('log/app.log')
  end
end