class TransactionsController < ApplicationController
  def new
    post_title
  end

  def create
    # POST only. /transaction
    begin
      param = transaction_params
      Transaction.create! param
      flash[:notice] = "Payment succeed!"
      if param['post_type'] == 'buy'
        redirect_to buy_post_path(param['buy_post'].id)
      else
        redirect_to sell_post_path(param['sell_post'].id)
      end
    rescue Exception => e
      flash[:notice] = "Payment failed: #{e.message}"
      redirect_back fallback_location: static_page_home_path
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.nil?
      flash[:notice] = "payment does not exist"
      redirect_back fallback_location: static_page_home_path
      return
    end
    transaction.destroy
    flash[:notice] = "$#{transaction.amount} has been refunded."
    redirect_back fallback_location: static_page_home_path
  end

  private
  def post_title
    if params['post_type'] == 'sell'
      @post_title = SellPost.find(params['post_id']).title
    elsif params['post_type'] == 'buy'
      @post_title = BuyPost.find(params['post_id']).title
    end
  end
  def transaction_params
    transaction_para = params.require(:transaction)
                     .permit(:payer_id, :payee_id, :buy_post_id, :sell_post_id, :post_type, :amount,
                             :payment_type, :card_number, :card_holder, :expiration_date, :cvv, :zip_code)
    payer_id = transaction_para.delete "payer_id"
    if payer_id.nil?
      raise "payer_id is null"
    end
    transaction_para["payer"] = User.find_by_email(payer_id)

    payee_id = transaction_para.delete "payee_id"
    if payee_id.nil?
      raise "payee_id is null"
    end
    transaction_para["payee"] = User.find_by_email(payee_id)

    if transaction_para["post_type"] == 'buy'
      buy_post_id = transaction_para.delete "buy_post_id"
      if buy_post_id.nil?
        raise "buy_post_id is null"
      end
      transaction_para["buy_post"] = BuyPost.find(buy_post_id)
    elsif transaction_para["post_type"] == 'sell'
      sell_post_id = transaction_para.delete "sell_post_id"
      if sell_post_id.nil?
        raise "sell_post_id is null"
      end
      transaction_para["sell_post"] = SellPost.find(sell_post_id)
    else
      raise "post_type is illegal"
    end
    transaction_para
  end
end
