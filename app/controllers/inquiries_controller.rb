class InquiriesController < ApplicationController
	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.new(inquiry_params)
		if @inquiry.save
			NotificationMailer.send_notification(@inquiry).deliver
			redirect_to root_path
			# @test = Writespread.new
			# @test.test(@inquiry[:email])
		else
			render 'new'
		end
	end



	private
		def inquiry_params
			params.require(:inquiry).permit(:name, :email, :tel, :servicecategories)
		end
end