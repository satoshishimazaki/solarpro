module ApplicationHelper
	def full_title(page_title='')
		base_title = "太陽光発電メンテナンスなら太陽光メンテプロ"
		if current_page?(:controller => "inquiries", :action => "new")
			"太陽光発電メンテナンス専門の業者紹介・選定サービス　太陽光メンテプロ"
		else 
			if page_title.empty?
				base_title
			else
				page_title + "|" + base_title
			end
		end
	end
end
