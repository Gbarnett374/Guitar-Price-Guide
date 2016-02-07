require 'httparty'
# Module will contain several classes that are price guide specific.
module PriceGuide
  # Reverb Specific Class.
  class ReverbPriceGuide
    def initialize
      @url = 'https://reverb.com/api/priceguide'
    end

    def search_price_guides(query)
      HTTParty.get("#{@url}?query=#{query}")
    end

    def get_price_guide(price_guide_id)
      HTTParty.get("#{@url}/#{price_guide_id}")
    end

    def get_transactions(price_guide_id, condition = 'used')
      query = "#{@url}/#{price_guide_id}/transactions?condition="
      query << condition.to_s
      HTTParty.get(query)
    end

    def get_transaction_summary(
      price_guide_id, number_of_months = 12, condition = 'used')
      query = "#{@url}/#{price_guide_id}/transactions/summary?"
      query << "number_of_months=#{number_of_months}&condition=#{condition}"
      HTTParty.get(query)
    end
  end
end
