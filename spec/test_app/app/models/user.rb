class User < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  has_many :blocks, dependent: :destroy
  belongs_to :current_block, class_name: 'Block'
end

