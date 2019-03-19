class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  #returns array of all venture capitalists that have more than 1,000,000,000 total_worth
  def self.tres_commas_club
    @@all.select {|venturecapitalist| venturecapitalist.total_worth > 1000000000}
  end

  #creates a new funding round as long as investment is positive
  def offer_contract(startup, type, investment)
    investment > 0 ? FundingRound.new(startup, self, type, investment) : "Investment must not be negative"
  end

  #returns array of all funding rounds for venture capitalist
  def funding_rounds
    FundingRound.all.select {|fundinground| fundinground.venture_capitalist == self}
  end

  #returns array of all startups this venture capitalist has funded
  def portfolio
    self.funding_rounds.map {|fundinground| fundinground.startup}.uniq
  end

  #returns the largest funding round of this venture capitalist
  def biggest_investment
    largest_funding_round = 0
    biggest_investor = nil
    self.funding_rounds.each {|fundinground|
      if fundinground.investment > largest_funding_round
        largest_funding_round = fundinground.investment
        biggest_investor = fundinground
      end}
    biggest_investor
  end

  #given a domain string, returns the total amount invested in that domain
  def invested(domain)
    total_invested = 0
    self.funding_rounds.each {|fundinground| fundinground.startup.domain == domain ? total_invested += fundinground.investment : nil}
    total_invested
  end

end
