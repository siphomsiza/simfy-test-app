require 'spec_helper'

describe Song do
  subject {create(:song)}

  it { expect(subject).to respond_to :album }
  it { expect(subject).to respond_to :user }

  it "should have a valid factory" do
    expect(create(:song)).to be_valid
  end

  context "validate .name" do
    it "must be unique" do
      dup = build(:song, :title => subject.title)
      expect(dup).to be_valid
    end
  end

  context ".to_s" do
    let(:song) {create(:song)}
    it "returns the company's name" do
      expect(song.to_s).to eq(song.title)
    end
  end

end
