class Prize < ActiveRecord::Base
  
  validates :name, :presence => true, :length => { :in => 6..24 }, 
    :uniqueness => true
  validates_format_of :name, :with => /^([\u0621-\u0652 ])+$/
  validates :level, :presence => true, :numericality => { 
    :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100 }
  validates :score, :presence => true, :numericality => { 
    :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000000 }
                              # This will probably be changed when we figure
                              # the scoring system the game will have
  # validates :photo, :presence => true
  # validates_attachment_size :photo, :in => 0.megabytes..0.5.megabytes
  
  has_and_belongs_to_many :gamers

  attr_accessible :name, :level, :score, :photo

  # has_attached_file :photo

  def self.get_new_prizes_for_gamer(gamer_id, score, level)
    prizes_for_score = []
    prizes_gamer = Gamer.find(gamer_id).prizes
    prizes_of_level = Prize.where(:level => level)
    new_prizes = prizes_of_level - prizes_gamer
    new_prizes.map { |nt| prizes_for_score << nt if nt.score <= score }
    return prizes_for_score
  end

end