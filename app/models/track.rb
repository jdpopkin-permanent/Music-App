class Track < ActiveRecord::Base
  attr_accessible :name, :album_id, :regular_or_bonus, :lyrics

  # again, can have a boolean for regular vs bonus
  validates :name, :regular_or_bonus, presence: true
  validates :regular_or_bonus, inclusion: { in: %w(bonus regular) }

  has_many :notes, class_name: "Note", primary_key: :id,
    foreign_key: :track_id, dependent: :destroy

  belongs_to(
    :album,
    class_name: "Album",
    primary_key: :id,
    foreign_key: :album_id
  )

  has_one :band, through: :album, source: :band
end
