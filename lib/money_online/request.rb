module MoneyOnline
  class Request
    attr_reader :params

    def initialize(params)
      @params = {
        :currency => "RUB"
      }.merge(params)

      raise ArgumentError, "MoneyOnline::Request requires amount, user_id, system_id, order_id and currency" unless params_valid?
    end

    def mapped_params
      {
        :project         => MoneyOnline.config.project,
        :amount          => params[:amount],
        :nickname        => params[:user_id],
        :nick_extra      => params[:user_extra],
        :mode_type       => params[:system_id],
        :order_id        => params[:order_id],
        :paymentCurrency => params[:currency]
      }
    end

    def url
      "http://www.onlinedengi.ru/wmpaycheck.php?#{MoneyOnline.build_query(mapped_params)}"
    end

    def params_valid?
      not [:amount, :user_id, :system_id, :order_id, :currency].any? { |attribute| params[attribute].blank? }
    end

  end
end
