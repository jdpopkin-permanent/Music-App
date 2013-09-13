class Album < ActiveRecord::Base
  attr_accessible :name, :band_id, :live_or_studio

  validates :name, :band_id, :live_or_studio, presence: true
  validates :live_or_studio, inclusion: {in: %w(live studio)}

  belongs_to(
    :band,
    class_name: "Band",
    primary_key: :id,
    foreign_key: :band_id
  )

  # has_many tracks
end
