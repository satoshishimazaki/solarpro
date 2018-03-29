class NotificationMailer < ApplicationMailer
	def send_notification(inquiry)
		@inquiry = inquiry
		mail(
			# to: %w(s-shimazaki@zielson.com zielson.info@gmail.com),
			# to: "s-shimazaki@zielson.com",
			to: "zielson.info@gmail.com",
			subject: "solarpro新規問い合わせのお知らせ"
		) do |format|
			format.text
		end
	end
end
