class Group < ApplicationRecord
    has_many :group_users, dependent: :destroy
    attachment :image
    
    def group_me?(user)
      group_users.includes(user_id: user.id)
    end
end
