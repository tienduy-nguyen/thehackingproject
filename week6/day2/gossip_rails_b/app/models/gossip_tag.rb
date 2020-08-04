class GossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag

  validates :tag_id,
  presence: true

  validates :gossip_id,
    presence: true
end
