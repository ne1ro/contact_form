describe ContactBuilder do
  let(:user) { create :user }
  let(:contact) { ContactBuilder.new(user).contact }
  let(:empty_contact) { ContactBuilder.new.contact }

  it 'creates a new contact form' do
    expect(ContactBuilder.new.contact).to be_a(Contact)
  end

  context 'sets by default user`s' do
    it '#email' do
      expect(contact.email).to eq(user.email)
    end

    it '#name' do
      expect(contact.name).to eq(user.name)
    end
  end

  context 'sets by default empty values for' do
    it '#email' do
      expect(empty_contact.email).to eq('')
    end

    it '#name' do
      expect(empty_contact.name).to eq('')
    end
  end
end
