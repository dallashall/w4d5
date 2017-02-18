# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :text
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :sub_ids, presence: true

  attr_reader :sub_ids

  belongs_to :user

  has_many :subs,
    through: :post_subs

  has_many :post_subs

  def sub_ids=(sub_ids)
    @sub_ids = sub_ids
    @sub_ids.each do |sub_id|
      PostSub.new(sub_id: sub_id, post_id: self.id)
    end
  end
end
