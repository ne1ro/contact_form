# Contact form with default parameters for signed users
class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
end
