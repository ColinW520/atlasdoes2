class ContactFormSubmission < ApplicationController
   def create
    @contact_form_submission = ContactFormSubmission.create(contact_form_submission_params.except(:secret_thing))
    unless params {:secret_thing == 'spam_check'
      flash[:alert] = 'We think this might be spam... Call us if you disagree!'
      redirect_to root_path and return
    end

    respond_to do |format|
      if @organization.save
        format.json { head :no_content }
        format.js { flash[:success] = 'Organization has been created.' }
        format.html {
          flash[:success] = 'Your organization has been created! Now you can set your billing preferences.'
          render :show
        }
      else
        format.json { render json: @solution.errors.full_messages, status: :unprocessable_entity }
      end

    end
  end
  
    private

  def contact_form_submission_params
    params.require(:contact_form_submission).permit(:name, :email, :message, :secret_thing)
  end
end    
