module ApplicationHelper
	def full_title(page_title='')
		base_title = "太陽光メンテナンス、点検、洗浄、草刈りなら太陽光メンテプロ"
		if current_page?(:controller => "inquiries", :action => "new")
			"太陽光メンテナンス、点検、洗浄、草刈り専門の業者紹介サービス　太陽光メンテプロ"
		else 
			if page_title.empty?
				base_title
			else
				page_title + "|" + base_title
			end
		end
	end
end
