class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  has_many :artists,
  class_name: 'Artist',
  foreign_key: 'user_id',
  dependent: :destroy

  has_many :albums,
  through: :artists,
  class_name: "Album"

  has_many :songs,
  through: :albums,
  class_name: "Song"

end
