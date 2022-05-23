class CanvasController < ApplicationController
  before_action :set_canvas, only: %i[new show destroy]

  def index
    @canvas = Canva.new
  end

  def show

  end

  def old
    @canvas = Canva.last
  end

  def update
    @canvas = Canva.find_by_slug(params[:slug])
    @canvas.update(canvas_params)
    redirect_to canvas_show_path(@canvas.slug), flash: {notice: "Je canvas is opgeslagen!"}
  end

  def create
    @canvas = Canva.new(canvas_params)

    if @canvas.save
      redirect_to canvas_show_path(@canvas.slug)
    end
  end

  def list
    @canvas = Canva.all.order('updated_at DESC')
  end

  private

  def set_canvas
    @canvas = Canva.find_by_slug(params[:slug])
  end

  def canvas_params
    params.require(:canva).permit(:name, :slug, :reason, :goals, :feedback, :inspiration, :practice, :consults, :foundation, :summary, :ec, :comp, :lvl)
  end
end
