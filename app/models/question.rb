class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :body, presence: true, length: { in: 10..255 }
  validates :solved, inclusion: {in: [true, false]}

  def self.unsolved(params)
  	where(solved: false).paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def self.search(params)
  	where("body LIKE ?", "%#{params[:keyword]}%").paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

end
