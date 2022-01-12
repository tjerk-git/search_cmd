class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true

    before_validation :create_slug
    before_validation :make_teacher
    before_validation :create_teams_link

    # Validates for NHLSTENDEN.com and STUDENT.NHLSTENDEN.COM
    validates :email, format: {
      with: /\b[A-Z0-9._%a-z\-]+@(?:student.)?nhlstenden\.com\z/, message: "must be a nhlstenden.com account"
    }

    def make_teacher
      if !email.include? "student"
          self.role = 1
      end
   end

   def create_teams_link
      self.teams_link = "https://teams.microsoft.com/l/chat/0/0?users=" + self.email
   end

    def create_slug
        if slug.blank? && name.present?
          self.slug = name_to_slug
        end
      end
    
    def name_to_slug
    "#{name.to_s.downcase.parameterize.tr('_', '')}"
    end

    scope :filter_by_name, -> (name) {
         where('name ILIKE ?', "%#{name}%")
         .or(where('bio ILIKE ?', "%#{name}%"))
         }
end
