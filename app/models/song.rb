class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :user,
	class_name: "User",
	foreign_key: "user_id"

  validates :album_id, :presence => true
  validates :title, :presence => true, :uniqueness => {:scope => :album_id}
  validates :duration,  :presence => true, :numericality => true

  before_save :update_search_text

  def to_s
    title
  end

  private

  def update_search_text
    self[:search_text] = [title, duration,created_at, updated_at].join(" ")
  end

end
