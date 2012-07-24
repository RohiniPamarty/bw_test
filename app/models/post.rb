class Post < ActiveRecord::Base
 #require 'fb_graph'
belongs_to :user
  has_attached_file :photo,
    :styles => {
    :thumb  => "100x100",
    :medium => "200x200",
    :large => "600x400"
}
#after_create :postFB


#('AAACEdEose0cBAIcadWBvutLyuyubUuZAnCppE42GKrinYT892uo89PoHQ4VNpZCGbi3rqzcB7mRSBEXVee4ACSeQHtwbNfJlstUJeOzQAyM4qoXgVO')



end
