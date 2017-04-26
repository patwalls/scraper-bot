class Scraper
  attr_accessor :hits
  attr_reader :targets, :threshold, :page

  def initialize(targets, threshold)
    @targets = targets
    @threshold = threshold
    @hits = []
    @page = Nokogiri::HTML(open("https://reddit.com/r/hiphopheads", 'User-Agent' => 'Patty'))
  end

  def scrape
    page.css("div.thing").each do |link_thing|
      score = link_thing.css(".score.unvoted").text
      title = link_thing.css("a.title").text
      hits << title if hit?(title, score)
    end
    hits
  end

  def hit?(title, score)
    targets.any? do |target|
      contains_fresh?(title, target) && over_threshold?(score)
    end
  end

  def contains_fresh?(title, target)
    title.include?('[FRESH]') && title.include?(target)
  end

  def over_threshold?(score)
    score.to_i > threshold
  end
end
