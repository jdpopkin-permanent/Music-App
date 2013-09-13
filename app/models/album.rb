class Album < ActiveRecord::Base
  attr_accessible :name, :band_id, :live_or_studio

  # class hash associating these two values with strings?
  # or just a method
  validates :name, :band_id, :live_or_studio, presence: true
  validates :live_or_studio, inclusion: {in: %w(live studio)}

  belongs_to(
    :band,
    class_name: "Band",
    primary_key: :id,
    foreign_key: :band_id,
    dependent: :destroy
  )

  has_many :tracks, class_name: "Track",
    primary_key: :id, foreign_key: :album_id
end
