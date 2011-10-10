module MoneyOnline
  class Response
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def amount
      params[:amount].to_i
    end

    def user_id
      params[:userid].to_i
    end

    def user_extra
      params[:userid_extra]
    end

    def money_payment_id
      params[:paymentid].to_i
    end

    def order_id
      params[:orderid].to_i
    end

    def signature
      params[:key]
    end

    def generate_signature_string
      [ params[:amount], user_id, money_payment_id, MoneyOnline.config.secret ].join
    end

    def generate_signature
      Digest::MD5.hexdigest(generate_signature_string)
    end

    def valid?
      generate_signature == signature
    end

    def invalid?
      not valid?
    end

    def to_xml(*args)
      <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<result>
  <id>#{order_id}</id>
  <code>#{code}</code>
  <comment>#{error}</comment>
</result>
      XML
    end

    def code
      valid? ? "YES" : "NO"
    end

    def error
      "Signature is not valid" if invalid?
    end

  end
end
