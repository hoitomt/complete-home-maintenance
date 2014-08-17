class TestimonialsController < ApplicationController
  # GET /testimonials
  # GET /testimonials.json
  def index
    @testimonials = Testimonial.where(:visible => "Y")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testimonials }
    end
  end

  # GET /testimonials/1
  # GET /testimonials/1.json
  def show
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/new
  # GET /testimonials/new.json
  def new
    @testimonial = Testimonial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/1/edit
  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  # POST /testimonials
  # POST /testimonials.json
  def create
    @testimonial = Testimonial.new(tesimonial_params)
    @testimonial.visible = "N"
    respond_to do |format|
      if @testimonial.save
        TestimonialMailer.confirm_testimonial(@testimonial).deliver
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully created.' }
        format.json { render json: @testimonial, status: :created, location: @testimonial }
      else
        format.html { render action: "new" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testimonials/1
  # PUT /testimonials/1.json
  def update
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      if @testimonial.update_attributes(tesimonial_params)
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    respond_to do |format|
      format.html { redirect_to testimonials_url }
      format.json { head :ok }
    end
  end

  def confirm
    @testimonial = Testimonial.find_by_id(params[:id])
    if @testimonial
      @testimonial.update_attributes(:visible => "Y")
      redirect_to @testimonial
    else
      redirect_to testimonials_path
    end
  end

  private
  def tesimonial_params
    params.require(:testimonial).permit(:first_name, :comment, :location, :email, :password)
  end
end
