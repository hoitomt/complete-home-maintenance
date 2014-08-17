class AddVisibilityToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :visible, :string
  end
end
