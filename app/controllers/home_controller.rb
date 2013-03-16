class HomeController < ApplicationController
  def index
    @posts1 = Type.find_by_name('组织结构').posts.limit(5)
    @posts2 = Type.find_by_name('活动简讯').posts.limit(5)
    @posts3 = Type.find_by_name('宣传窗口').posts.limit(5)
    @posts4 = Type.find_by_name('法律公文').posts.limit(5)
  end
end
