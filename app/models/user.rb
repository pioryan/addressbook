class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, :dependent => :delete_all


  def apply_omniauth(auth)
    # binding.pry
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = "#{auth['extra']['raw_info']['name'].split(" ").first.downcase}@spark.com"
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
