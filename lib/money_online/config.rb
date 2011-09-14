module MoneyOnline
  class Config
    include ActiveSupport::Configurable

    config_accessor :project, :secret

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end
    end

  end
end
