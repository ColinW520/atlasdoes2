class ContactFormSubmissionsController < ApplicationController
  skip_before_action :authenticate_user!

   def create
     unless params['spam_check'] == 'opie'
       redirect_to root_path, notice: 'This looks like spam...call us if you disagree' and return
     end

     submission = ContactFormSubmission.create(contact_form_submission_params)

     respond_to do |format|
      if submission.save
        format.html {
          redirect_to root_path, notice: 'Thank you for your submission! We will get back to you asap.'
        }
      else
        format.html {
          redirect_to root_path, notice: 'There was a problem with your submission. Please try again.'
        }
      end
    end
  end

private

  def contact_form_submission_params
    params.require(:contact_form_submission).permit(:name, :email, :message)
  end
end
