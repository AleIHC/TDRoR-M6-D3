class CcLike < ApplicationRecord
  belongs_to :cc_post, optional: true
  belongs_to :cc_user
  belongs_to :cc_comment, optional: true

  
end
