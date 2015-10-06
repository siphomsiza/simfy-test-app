require 'spec_helper'

describe Album do
  let(:subject) {create(:album)}

  it { expect(subject).to respond_to :artist }
  it { expect(subject).to respond_to :user }
  it { expect(subject).to respond_to :songs }

  context "attrs" do
    it { expect(subject).to respond_to :name }
  end

  it { expect(subject).to respond_to :artist }

  it "should have a valid factory" do
    expect(create(:album)).to be_valid
  end

  context "validate .name" do

    it "must be unique" do
      dup = build(:album, :name => subject.name)
      expect(dup).to be_valid
    end
  end

  context ".to_s" do
    let(:album) {create(:album)}
    it "returns the album's name" do
      expect(album.to_s).to eq(album.name)
    end
  end

  describe "Album cover page using Avatar" do
    include CarrierWave::Test::Matchers
    before(:each) do
      subject.cover = File.open(File.join(Rails.root, '/spec/uploads/test.jpg'))
      #make sure the subject is valid
      expect(subject).to be_valid
    end

    it { expect(subject).to be_valid }
    it { expect(subject).to respond_to(:cover)}

    it "has original filename"do
      expect(subject.cover.file.original_filename).to eq("test.jpg")
    end

    it "has thumb filename" do
      expect(subject.cover.thumb.file.original_filename).to eq("thumb_test.jpg")
    end

    it "has new release filename" do
      expect(subject.cover.new_release.file.original_filename).to eq("new_release_test.jpg")
    end

  end
end
