class Canva < ApplicationRecord
  require 'thread'
  validates :name, presence: true
  before_validation :create_slug

  def create_slug
    self.slug = to_slug
  end

  def to_slug
    # comps = {
    #   "Onderzoeken-N1" => '11',
    #   "Onderzoeken-N2" => '12',
    #   "Onderzoeken-N3" => '13',
    #   "Creeren-N1" => '21',
    #   "Creeren-N2" => '22',
    #   "Creeren-N3" => '23',
    #   "Communiceren-N1" => '31',
    #   "Communiceren-N2" => '32',
    #   "Communiceren-N3" => '33',
    #   "Organiseren-N1" => '41',
    #   "Organiseren-N2" => '42',
    #   "Organiseren-N3" => '43',
    #   "Leren-N1" => '51',
    #   "Leren-N2" => '52',
    #   "Leren-N3" => '53',
    # }

    if slug.blank?
      fil_name = Faker::GreekPhilosophers.name.parameterize(separator: '-')
      rand_string = rand(36**8).to_s(36)
      name = self.name.parameterize(separator: '-')
      url = name + '-' + fil_name + '-' + rand_string
      "#{url.downcase}"
    end
  end

end
