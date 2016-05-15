class User < ActiveRecord::Base
  enum role: [:admin, :advisor, :captain, :guard, :user]

  after_initialize :set_default_role, if: :new_record?

  scope :assignables, -> { where('role != ?', unassignable_role) }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_and_belongs_to_many :oauth_credentials

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.unassignable_role
    roles.keys.select { |role| role == 'admin' }.first
  end
end
