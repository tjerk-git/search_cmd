class Canva < ApplicationRecord
  require 'thread'
  validates :name, presence: true
  before_validation :create_slug

  def create_slug
    if slug.blank? && name.present?
      self.slug = to_slug
    end
  end

  def to_slug
    fil_name = Faker::GreekPhilosophers.name.parameterize(separator: '-')
    rand_string = rand(36**8).to_s(36)
    name = self.name.parameterize(separator: '-')
    url = name + '-' + fil_name + '-' + rand_string
    "#{url.downcase}"
  end

end
