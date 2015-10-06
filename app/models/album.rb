class Album < ActiveRecord::Base
	mount_uploader :cover, AvatarUploader

	has_many :songs, :dependent => :destroy
	belongs_to :artist
	belongs_to :user,
	class_name: "User",
	foreign_key: "user_id"

	validates :artist_id, :name, :release_date, :presence => true
	validates :name, :uniqueness => {:scope => :artist_id}

  before_save :update_search_text

  def to_s
    name
  end

  private

  def update_search_text
    self[:search_text] = [name, release_date, created_at, updated_at].join(" ")
  end
end
