class Startup
  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  #helper method to find all funding rounds for the startup
  def all_funding_rounds
    FundingRound.all.select {|fundinground| fundinground.startup == self}
  end

  #changes domain and name (funding_round = SST)
  def pivot(domain, name)
    self.all_funding_rounds.each {|fundinground| fundinground.startup.domain = domain, fundinground.startup.name = name}
  end

  #given founder name, finds FIRST startup matched
  def self.find_by_founder(founder_name)
    @@all.find {|startup| startup.founder == founder_name}
  end

  #returns an array of all the different startup domains
  def self.domains
    @@all.map {|startup| startup.domain}.uniq
  end

  #creates new FundingRound, making sure investment is positive
  def sign_contract(venture_capitalist, type, investment)
    investment > 0 ? FundingRound.new(self, venture_capitalist, type, investment) : "Investment must not be negative"
  end

  #returns total number of funding rounds startup has
  def num_funding_rounds
    self.all_funding_rounds.count
  end

  #returns sum of investments startup has gotten
  def total_funds
    self.all_funding_rounds.map {|fundinground| fundinground.investment }.sum
  end

  #returns array of all venture capitalists for this startup
  def investors
    self.all_funding_rounds.map {|fundinground| fundinground.venture_capitalist }.uniq
  end

  #returns array of all venture capitalists for this startup that are in the Trés Commas club
  def big_investors
    self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end
end
