# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :description, :moderator_id, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User
end
