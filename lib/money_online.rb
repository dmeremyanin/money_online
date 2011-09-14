require "uri"
require "yaml"
require "digest/md5"
require "money_online/config"
require "money_online/request"
require "money_online/response"
require "money_online/version"

module MoneyOnline
  extend self

  attr_accessor :config_path

  def config
    @config ||= MoneyOnline::Config.new(config_hash)
  end

  def build_query(params)
    params.map do |key, value|
      "#{escape(key)}=#{escape(value)}" if value
    end.compact.join("&")
  end

  def escape(string)
    URI.encode_www_form_component(string)
  end

  def config_hash
    YAML.load_file(config_path)
  end

end
