class PagesController < ApplicationController
  before_action :ensure_logged_in, only: [ :new ]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def show
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)
    if logged_in?
      if @page.save
        redirect_to @page, flash: {success: "ページは正常に作成されました"}
      else
        render 'new'
      end
    else
      redirect_to root_url, flash: {danger: "管理者以外はページ作成できません"}
    end
  end

  private
    def ensure_logged_in
      if !logged_in?
        redirect_to root_url, flash: {danger: "管理者以外はページ作成できません"}
      end
    end

    def page_params
      params.require(:page).permit(:title, :tag, :content)
    end
end
