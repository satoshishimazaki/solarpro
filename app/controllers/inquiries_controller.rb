class InquiriesController < ApplicationController
	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.new(inquiry_params)
		if @inquiry.save
			# NotificationMailer.send_notification(@inquiry).deliver
			# redirect_to inquiries_thank_path(id:@inquiry.id)
			render 'thank'
			# @test = Writespread.new
			# @test.test(@inquiry[:email])
		else
			render 'new'
		end
	end

	def thank
		@inquiry = Inquiry.find(params[:id])
	end

	private
		def inquiry_params
			params.require(:inquiry).permit(:name, :email, :tel, :servicecategories)
		end
end