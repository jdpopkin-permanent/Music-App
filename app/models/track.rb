class Track < ActiveRecord::Base
  attr_accessible :name, :album_id, :regular_or_bonus, :lyrics

  validates :name, :regular_or_bonus, presence: true
  validates :regular_or_bonus, inclusion: { in: %w(bonus regular) }

  belongs_to(
    :album,
    class_name: "Album",
    primary_key: :id,
    foreign_key: :album_id
  )

  has_one :band, through: :album
end
