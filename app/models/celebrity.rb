class Celebrity < ApplicationRecord
  belongs_to :user

  # add photo { has_many_attached ? :photo} w cloudinary
  
  # validate :photo presence true

  # must add add celebrity user story validations
end
