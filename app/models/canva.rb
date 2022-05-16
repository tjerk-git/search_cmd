class Canva < ApplicationRecord
  require 'thread'
  validates :name, presence: true
  before_validation :create_slug

  def create_slug
    self.slug = to_slug
  end

  def to_slug
    comps = {
      "Onderzoeken-N1" => '11',
      "Onderzoeken-N2" => '12',
      "Onderzoeken-N3" => '13',
      "Creeren-N1" => '21',
      "Creeren-N2" => '22',
      "Creeren-N3" => '23',
      "Communiceren-N1" => '31',
      "Communiceren-N2" => '32',
      "Communiceren-N3" => '33',
      "Organiseren-N1" => '41',
      "Organiseren-N2" => '42',
      "Organiseren-N3" => '43',
      "Leren-N1" => '51',
      "Leren-N2" => '52',
      "Leren-N3" => '53',
    }

    if comp.blank?
      adj = Faker::Hipster.word + "-" + rand(36**8).to_s(36)
      word = Faker::GreekPhilosophers.name
    else
      adj = Faker::Hipster.word + "-" + rand(36**8).to_s(36)
      word = comps.key(comp + lvl)
    end
    name = self.name.parameterize(separator: '-')
    thing = word + '-' + adj + '-' + name
    "#{thing.downcase}"
  end

end
