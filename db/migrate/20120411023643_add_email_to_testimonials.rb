class AddEmailToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :email, :string
  end
end
