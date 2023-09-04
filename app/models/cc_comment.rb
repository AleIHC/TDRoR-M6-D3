class CcComment < ApplicationRecord
  belongs_to :cc_user, optional: true
  belongs_to :cc_post
  has_many :cc_likes, dependent: :destroy
end
