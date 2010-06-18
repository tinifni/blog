class Post < ActiveRecord::Base
  validates_presence_of :title, :body

  def to_s
    title
  end
end
