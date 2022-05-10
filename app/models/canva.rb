class Canva < ApplicationRecord
  require 'thread'
  validates :name, presence: true
  before_validation :create_slug

  def create_slug
    if slug.blank?
      self.slug = to_slug
    end
  end

  def to_slug
    adj = Faker::Hipster.word
    word = Faker::GreekPhilosophers.name
    name = self.name
    thing = word + "-" + adj + "-" + name
    "#{thing.downcase}"
  end
end
