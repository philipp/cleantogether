class Team < ActiveRecord::Base
  belongs_to :captain,
  :class_name  => "User",
  :foreign_key => "captain_id"

  has_and_belongs_to_many :users

  validates_presence_of :name
  validates_uniqueness_of :name


end
