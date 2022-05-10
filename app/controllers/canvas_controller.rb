class CanvasController < ApplicationController
  before_action :set_canvas, only: %i[new show destroy]

  def index
    @canvas = Canva.new()
  end

  def show

  end

  def update
    @canvas = Canva.update(canvas_params)
    redirect_to canvas_show_path(params[:slug]), flash: {notice: "Je canvas is opgeslagen!"}
  end

  def create
    @canvas = Canva.new(canvas_params)

    if @canvas.save
      redirect_to canvas_show_path(@canvas.slug)
    end
  end

  private

  def set_canvas
    @canvas = Canva.find_by_slug(params[:slug])
  end

  def canvas_params
    params.require(:canva).permit(:name, :slug, :reason, :goals, :feedback, :inspiration, :practice, :consults, :foundation, :summary, :ec, :comp, :lvl)
  end
end
