require './lib/priceguide.rb'
RSpec.describe PriceGuide do
  it 'Querys for price guides and returns a response' do
    # Setup
    stub_request(:get, 'https://reverb.com/api/priceguide?query=Gibson')
      .to_return(status: 200, body: '', headers: {})
    # Excercise
    price_guide = PriceGuide::ReverbPriceGuide.new
    query = 'Gibson'
    response = price_guide.search_price_guides(query)
    # Verify
    expect(response.code).to eq(200)
  end

  it 'Querys for a particular price guide and returns a response' do
    # Setup
    stub_request(:get, 'https://reverb.com/api/priceguide/153')
      .to_return(status: 200, body: '', headers: {})
    price_guide = PriceGuide::ReverbPriceGuide.new
    price_guide_id = 153
    # Exercise
    response = price_guide.get_price_guide(price_guide_id)
    # Verify
    expect(response.code).to eq(200)
  end

  it 'Querys for transactions per price guide and returns a response' do
    # Setup
    stub_request(:get, 'https://reverb.com/api/priceguide/153/transactions?condition=used')
      .to_return(status: 200, body: '', headers: {})
    price_guide = PriceGuide::ReverbPriceGuide.new
    price_guide_id = 153
    # Exercise
    response = price_guide.get_transactions(price_guide_id)
    # Verify
    expect(response.code).to eq(200)
  end

  it 'Querys transaction summarys for a price guide and returns a response' do
    # Setup
    stub_request(:get, 'https://reverb.com/api/priceguide/153/transactions/summary?condition=used&number_of_months=12')
      .to_return(status: 200, body: '', headers: {})
    price_guide = PriceGuide::ReverbPriceGuide.new
    price_guide_id = 153
    # Exercise
    response = price_guide.get_transaction_summary(price_guide_id)
    # Verify
    expect(response.code).to eq(200)
  end
end
