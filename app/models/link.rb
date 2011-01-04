class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  attr_accessible :title, :url, :body, :user

def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    scoped
  end
end



end
