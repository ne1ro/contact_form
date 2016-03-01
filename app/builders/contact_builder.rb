# Builds contact form
class ContactBuilder
  attr_reader :contact

  def initialize(user = nil)
    @contact = Contact.new

    @contact.email = user.try(:email) || ''
    @contact.name = user.try(:name) || ''
  end
end
