require 'spec_helper'

describe Artist do
  let(:user) { create(:user) }
  let(:subject) {create(:artist)}

  it { expect(subject).to respond_to :user }
  it { expect(subject).to respond_to :albums }

  context "attrs" do
    it { expect(subject).to respond_to :name }
  end

  it "should have a valid factory" do
    expect(create(:artist)).to be_valid
  end

  context "validate .name" do
    it "must be unique" do
      dup = build(:artist, :name => subject.name)
      expect(dup).not_to be_valid
    end
  end

  context "validations" do
    it "validates .name" do
      subject.name = nil
      expect(subject).not_to be_valid

      subject.name = ''
      expect(subject).not_to be_valid

      subject.name = "Valid"
      expect(subject).to be_valid
    end
  end

end
