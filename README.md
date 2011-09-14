# MoneyOnline

This gem implements a simple Ruby interface for the [MoneyOnline](http://dengionline.com/eng) service (aka DengiOnline, [Деньги Онлайн](http://dengionline.com)).

## Install

If you're on Rails, add the following line to a Gemfile:

```ruby
gem "money_online"
```

## Using

MoneyOnline requires a config file, add the initializer to config/initializers folder:

```yaml
# config/money_online.yml
project: 1
secret: "password"
```

```ruby
# config/initializers/money_online.rb
MoneyOnline.config_path = Rails.root.join("config", "money_online.yml")
```

List of payment systems you can find [here](http://www.onlinedengi.ru/dev/paymodes.php).

## Example

```ruby
# app/controllers/orders_controller.rb
class OrdersController < ApplicationController

  # POST /orders/1/purchase
  def purchase
    # params #=> amount: 7300, user_id: 107, system_id: 46, order_id: 8964
    request = MoneyOnline::Request.new(params)
    redirect_to request.url
  end

  # POST /orders/1/confirm
  def confirm
    # params #=> amount: 7300, userid: 107, paymentid: 8831914, orderid: 8964, key: "d27f27b54c5c9b944685a111483e68b5"
    response = MoneyOnline::Response.new(params)
    order.confirm! if response.valid?
    render :xml => response
  end

end
```

## TODO

* 10 000 000 $


### Copyright (c) 2011 [Dimko](mailto:deemox@gmail.com).
