class TestimonialMailer < ActionMailer::Base
  
  def confirm_testimonial(testimonial)
    @testimonial = testimonial
    mail(:to => testimonial.email, 
         :subject => "Please Confirm Testimonial for Complete Home Maintenance", 
         :from => "No_Reply@complete-home-maintenance.com")
  end
  
end
