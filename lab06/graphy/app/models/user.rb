class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :facebook_uid, :photo_url
  # attr_accessible :title, :body

  has_many :user_action_items
  has_many :action_items, :through => :user_action_items
  has_many :user_relationships
  has_many :friends, :through => :user_relationships

  def self.find_for_facebook_oauth omniauth, user
    logger.warn "OMNIAUTH: #{omniauth.to_json}"
    logger.warn "OMNIAUTH: #{omniauth['uid']}"
    logger.warn "OMNIAUTH: #{user}"
    user = User.find_by_facebook_uid(omniauth['uid'])
    if user.nil?
      # create new user based on login
      user = User.create({ :first_name => omniauth[:info][:first_name], 
                           :last_name => omniauth[:info][:last_name],
                           :facebook_uid => omniauth[:uid],
                           :email => omniauth[:info][:email],
                           :photo_url => omniauth[:info][:image],
                           # Don't really _NEED_ a password, but this will let us
                           # save the model
                           :password => omniauth[:credentials][:token]
                         })
      user.save!
    end
    user
  end

  def add_item_if_new action_item
    self.action_items << action_item unless self.action_items.include? action_item
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
