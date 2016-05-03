require './lib/priceguide.rb'
# Price Guide Controller.
class PriceGuideSearchController < ApplicationController

  def index
  end

  def search_price_guides
    # This will call reverb and return all priceguides based on a string.
    price_guide = PriceGuide::ReverbPriceGuide.new
    @price_guides = JSON.parse(price_guide.search_price_guides(params[:query]))
    render :partial => 'price_guide_results'
  end

  def price_guide_details
    # This will take in the price guide id and return a specfic price guide.
    price_guide = PriceGuide::ReverbPriceGuide.new
    @price_guide_details = price_guide.get_price_guide(params[:price_guide_id])
  end

  def price_guide_transactions
    # This will take a price guide id and return the transactions & a Summary.
    price_guide = PriceGuide::ReverbPriceGuide.new
    @price_guide_transactions = price_guide.get_transactions(params[:price_guide_id])
    # Summary of transactions over a certain period of time.
    @transaction_summary = price_guide.get_transaction_summary(params[:price_guide_id])
  end
end
