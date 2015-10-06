require 'spec_helper'

describe User do
  subject {create(:user)}
  it { expect(subject).to respond_to :artists }
  it { expect(subject).to respond_to :albums }
  it { expect(subject).to respond_to :songs }

  context "full name" do
    it "is alphabetic" do
      subject.email = "example@example.com"
      expect(subject).to be_valid

      subject.email = "&**^&%^*)"
      expect(subject).not_to be_valid
    end

    it "is more than 2 characters if present" do
      subject.email = ""
      expect(subject).not_to be_valid

      subject.email = "A"
      expect(subject).not_to be_valid
    end
  end

  it "returns user admin value" do
    expect(subject.admin).to be(false)

    s_usr = create(:super_user)
    expect(s_usr.admin).to be(true)
  end

  it { expect(subject).to respond_to :reset_password_token } # Token authentication


  context ".to_s" do
    let(:user) {create(:user)}
    email = Faker::Internet.email()
    it "returns the users email if it's present" do
      user.email = email
      expect(email).to eq(user.email)
    end
  end
end
