class Keyword < ApplicationRecord

  def self.check_reddit
    Scraper.new(all_keywords, 500).scrape.each do |hit|
      Notification.create!(name: hit) unless Notification.find_by_name(hit)
    end
  end

  def self.all_keywords
    all.pluck(:keyword)
  end
end
