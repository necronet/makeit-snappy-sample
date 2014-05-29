class User < ActiveRecord::Base
	has_many :questions
	has_many :answers
	has_secure_password 

	validates :username, presence: true, uniqueness: {case_sensitive: false},
						length: {in: 4..12}, format: {with: /\A[a-z][a-z0-9]*\Z/, message:'Ca n only contain lower letters and number'}

	validates :password, length: {in: 4..12}

	validates :password_confirmation, length: {in: 4..12}

	def your_questions(params)
		questions.paginate(page: params[:page], per_page: 4).order('created_at DESC')
	end

end
