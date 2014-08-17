class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :first_name
      t.text :comment
      t.string :location

      t.timestamps
    end
  end
end
