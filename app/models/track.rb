class Track < ActiveRecord::Base
  attr_accessible :name, :album_id, :type, :lyrics

  validates :name, :type, presence: true
  validates :type, inclusion: { %w(bonus regular) }

  belongs_to(
    :album,
    class_name: "Album",
    primary_key: :id,
    foreign_key: :album_id
  )

end
