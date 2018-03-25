require "google_drive"

class GoogleDriveWrapper
  # ワークシート取得
  # (フォルダ/スプレッドシート/ワークシートがなければ作成)
  def self.get_worksheet(folder_name, spreadsheet_name, worksheet_name)
    session = GoogleDrive::Session.from_config("google_drive_config.json")

    folders = session.collections("q" => ["name = ? and trashed = false", folder_name])
    folder = nil
    if folders.length == 0
      folder = session.root_collection.create_subcollection(folder_name)
      puts "フォルダ '" + folder_name + "' を作成しました。"
    else
      folder = folders[0]
    end

    spreadsheets = folder.files("q" => ["name = ? and mimeType = 'application/vnd.google-apps.spreadsheet' and trashed = false", spreadsheet_name])
    worksheet = nil
    if spreadsheets.length == 0
      # スプレッドシートをrootに作成、指定フォルダに追加、rootから削除
      spreadsheet = session.create_spreadsheet(spreadsheet_name)
      folder.add(spreadsheet)
      session.root_collection.remove(spreadsheet)
      puts "スプレッドシート '" + spreadsheet_name + "' を作成しました。"
      # ワークシートを追加、元からあった1シート目は削除
      worksheet = spreadsheet.add_worksheet(worksheet_name)
      spreadsheet.worksheets[0].delete
      puts "ワークシート '" + worksheet_name + "' を作成しました。"
    else
      spreadsheet = spreadsheets[0]
      worksheet = spreadsheet.worksheet_by_title(worksheet_name)
      if worksheet.nil?
        worksheet = spreadsheet.add_worksheet(worksheet_name)
        puts "ワークシート '" + worksheet_name + "' を作成しました。"
      end
    end
    worksheet
  end
end