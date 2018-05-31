class ShortendUrl < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url
  before_create :sanitize

  def generate_short_url
    url= ([*('a'..'z'),*('0'..'9')]).sample(6).join
    old_url = ShortendUrl.where(short_url: url).last
    puts "Old URL"
    puts old_url
    if old_url.present?
      self.generate_short_url
    else
      self.short_url = url
    end
    puts self.short_url
  end

  def find_duplicate
    puts self.short_url
    ans = ShortendUrl.find_by_short_url(self.short_url)
    puts "Checking"
    puts ans
    ans
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize
    self.original_url.strip!
    self.sanitized_url  = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.sanitized_url .slice!(-1) if self.sanitized_url [-1] == "/"
    self.sanitized_url  = "http://#{self.sanitized_url }"
    puts self.sanitized_url
  end
end
