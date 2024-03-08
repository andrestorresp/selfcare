class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_blog, only: %i[show edit update destroy]

  def index

    @blogs = Blog.all

    # if params[:query].present?
    #   @blogs = Blog.blog_search(params[:query])

    # end
  end

  def show

    if current_user.role
      @consultations = Consultation.where(patient_id: @patient)
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      binding.pry # Esto detendrá la ejecución del código aquí
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to patient_path(@blog), notice: 'Blog actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, status: :see_other, notice: 'Blog eliminado exitosamente.'
  end

  private

  def blog_params
    params.require(:patient).permit(:comment, :title)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
