class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :body, presence: true, length: { in: 2..255 }
  
end
