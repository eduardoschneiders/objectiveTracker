class User < ActiveRecord::Base
  has_many :tasks
  has_many :groups

  validates :email, uniqueness: true
  validates_presence_of :name, :email, :password
  validates_confirmation_of :password

  before_create :encrypt_password!

  def encrypt_password!
      self.password = User.encrypted_password(password)
  end

  def self.encrypted_password(password)
    CaesarEncrypt.encrypt(password, 5)
  end
end
