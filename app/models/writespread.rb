require 'google_drive'
# require 'google_drive_wrapper'

class Writespread < GoogleDriveWrapper
	def test(hoge)
		worksheet = GoogleDriveWrapper.get_worksheet("test", "test", "ワークシート1")
		worksheet[1, 4] = hoge # 1行目4列目に書き込み
		worksheet.save # 保存
	end
end