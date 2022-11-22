class Movie < ApplicationRecord
    scope :new_title, -> { where(release_date: Time.zone.today.ago(2.month).beginning_of_day..Time.zone.today.end_of_day) }
    scope :old_title, -> { where.not(release_date: Time.zone.today.ago(2.month).beginning_of_day..Time.zone.today.end_of_day) }
    belongs_to :genre
    has_one_attached :image
    has_many :favorite
    has_many :comments, dependent: :destroy

    
def self.search(keyword)
where(["title like? ", "%#{keyword}%"])
end

end
