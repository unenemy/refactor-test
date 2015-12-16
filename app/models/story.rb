class Story < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :ratings

  def rating
    ratings.average(:rate).to_f.to_d.ceil(1)
  end
end
