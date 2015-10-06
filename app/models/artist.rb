class Artist < ActiveRecord::Base
  has_many :albums ,:dependent => :destroy
  belongs_to :user,
  class_name: "User",
  foreign_key: "user_id"

  validates :name, :uniqueness => true, :presence => true

  before_save :update_search_text

  def to_s
    name
  end

  private

  def update_search_text
    self[:search_text] = [name, created_at, updated_at].join(" ")
  end

end
