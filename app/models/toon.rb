class Toon < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :user

  validates_presence_of :name, :server
  validates_presence_of :klass, :primary_spec
  validates_inclusion_of :server, in: REALMS.map { |r| r['name'].parameterize }
  validates_inclusion_of :klass, in: KLASSES.map { |k| k['name'].parameterize }

  def slug_candidates
    [ "#{name}-#{server}".parameterize ]
  end
end