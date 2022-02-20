require "rails_helper"

feature "admin::drama", type: :feature do
  describe "ドラマ管理ページ" do
    describe "ドラマ１つ登録" do
      given!(:admin) { create :user, :admin }
      given!(:drama) { create(:drama) }
      before do
        sign_in admin
        visit admin_dramas_path
      end

      it "ドラマタイトルが表示されること" do
        within("table.admin_index") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマ画像が表示されること" do
        within("table.admin_index") do
          expect(page).to have_selector("img,[src$="#{drama.image.filename}"]")
        end
      end

      it "ドラマ編集ページへのリンクが正しくされていること" do
        within("table.admin_index") do
          click_on "編集"
          expect(current_path).to eq edit_admin_drama_path(drama)
        end
      end

      it "削除後、ドラマ管理者ページへのリンクが正しくされていること" do
        within("table.admin_index") do
          click_on "削除"
          expect(current_path).to eq admin_dramas_path
        end
      end

      it "ドラマ新規登録ページへのリンクが正しくされていること" do
        within("div.admin_btn_position") do
          click_on "新規登録"
          expect(current_path).to eq new_admin_drama_path
        end
      end

      it "管理者ページへのリンクが正しくされていること" do
        within("div.return_link") do
          click_on "管理者ページへ戻る"
          expect(current_path).to eq homes_path
        end
      end
    end

    describe "ドラマ複数登録" do
      given!(:admin) { create :user, :admin }
      given!(:drama01) { create(:drama) }
      given!(:drama02) { create(:drama) }
      given!(:drama03) { create(:drama) }
      before do
        sign_in admin
        visit admin_dramas_path
      end

      it "ドラマタイトルが登録ドラマの数分表示されること" do
        within("table.admin_index") do
          expect(page).to have_content(drama01.name)
          expect(page).to have_content(drama02.name)
          expect(page).to have_content(drama03.name)
        end
      end

      it "ドラマ画像が登録ドラマの数分表示されること" do
        within("table.admin_index") do
          expect(page).to have_selector("img,[src$="#{drama01.image.filename}"]")
          expect(page).to have_selector("img,[src$="#{drama02.image.filename}"]")
          expect(page).to have_selector("img,[src$="#{drama03.image.filename}"]")
        end
      end

      it "ドラマ編集リンクが登録ドラマの数分表示されること" do
        within("table.admin_index") do
          expect(page).to have_content("編集", count: 3)
        end
      end

      it "ドラマ編集ページへのリンクが正しくされていること" do
        within("table.admin_index") do
          click_on "編集", match: :first
          expect(current_path).to eq edit_admin_drama_path(drama01)
        end
      end

      it "削除後、ドラマ管理者ページへのリンクが正しくされていること" do
        within("table.admin_index") do
          click_on "削除", match: :first
          expect(current_path).to eq admin_dramas_path
        end
      end

      it "ドラマ新規登録ページへのリンクが正しくされていること" do
        within("div.admin_btn_position") do
          click_on "新規登録"
          expect(current_path).to eq new_admin_drama_path
        end
      end

      it "管理者ページへのリンクが正しくされていること" do
        within("div.return_link") do
          click_on "管理者ページへ戻る"
          expect(current_path).to eq homes_path
        end
      end
    end

    describe "ドラマ未登録" do
      given!(:admin) { create :user, :admin }
      before do
        sign_in admin
        visit admin_dramas_path
      end

      it "編集・削除が表示されていないこと" do
        expect(page).to_not have_content("編集")
        expect(page).to_not have_content("削除")
      end

      it "ドラマ新規登録ページへのリンクが正しくされていること" do
        within("div.admin_btn_position") do
          click_on "新規登録"
          expect(current_path).to eq new_admin_drama_path
        end
      end

      it "管理者ページへのリンクが正しくされていること" do
        within("div.return_link") do
          click_on "管理者ページへ戻る"
          expect(current_path).to eq homes_path
        end
      end
    end
  end

  describe "ドラマ新規登録ページ" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    before do
      sign_in admin
      visit new_admin_drama_path
    end
    describe "フォームの入力" do
      context "フォームの入力値が正常" do
        it "新規登録できること" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: 2019
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録しました"
        end
      end

      context "タイトル未記入" do
        it "新規登録できないこと" do
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: 2019
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "タイトルを入力してください"
        end
      end

      context "公開年未記入" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "公開年を入力してください"
          expect(page).to have_content "公開年は数値で入力してください"
          expect(page).to have_content "公開年は4文字で入力してください"
        end
      end

      context "画像未記入" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: 2019
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "画像を入力してください"
        end
      end

      context "あらすじ未記入" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: 2019
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "あらすじを入力してください"
        end
      end

      context "出演者未記入" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_release_day", with: 2019
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "出演者を入力してください"
        end
      end

      context "公開年が文字型" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: "aaaa"
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "公開年は数値で入力してください"
        end
      end

      context "公開年が4文字以上" do
        it "新規登録できないこと" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: "99999999"
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/star_img.png"
          click_on "登録"
          expect(page).to have_content "ドラマを登録できませんでした"
          expect(page).to have_content "公開年は4文字で入力してください"
        end
      end
    end
    describe "リンク先" do
      it "ドラマ管理ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "ドラマ管理ページへ戻る"
          expect(current_path).to eq admin_dramas_path
        end
      end

      it "管理者ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "管理者ページへ戻る"
          expect(current_path).to eq homes_path
        end
      end
    end
  end

  describe "ドラマ更新ページ" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama, name: "トッケビ") }
    before do
      sign_in admin
      visit edit_admin_drama_path(drama)
    end

    describe "フォームの入力" do
      context "フォームの入力値が正常" do
        it "ドラマタイトルの更新ができること" do
          fill_in "drama_name", with: "愛の不時着"
          fill_in "drama_summary", with: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。"
          fill_in "drama_cast", with: "ヒョンビン、ソン・イェジン、ソ・ジヘ"
          fill_in "drama_release_day", with: 2019
          attach_file "drama_image", "#{Rails.root}/spec/fixtures/files/pig_img.png"
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新しました"
          expect(page).to have_content "愛の不時着"
          expect(page).to have_selector("img[src$="pig_img.png"]")
          expect(page).to_not have_content "トッケビ"
        end
      end

      context "タイトル未記入" do
        it "更新ができないこと" do
          fill_in "drama_name", with: ""
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "タイトルを入力してください"
        end
      end

      context "公開年未記入" do
        it "更新ができないこと" do
          fill_in "drama_release_day", with: ""
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "公開年を入力してください"
        end
      end

      context "あらすじ未記入" do
        it "更新ができないこと" do
          fill_in "drama_summary", with: ""
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "あらすじを入力してください"
        end
      end

      context "出演者未記入" do
        it "更新ができないこと" do
          fill_in "drama_cast", with: ""
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "出演者を入力してくださ"
        end
      end

      context "公開年が文字型" do
        it "更新ができないこと" do
          fill_in "drama_release_day", with: "aaaa"
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "公開年は数値で入力してください"
        end
      end

      context "公開年が4文字以上" do
        it "更新ができないこと" do
          fill_in "drama_release_day", with: "99999999"
          click_on "更新"
          expect(page).to have_content "ドラマ登録内容を更新できませんでした"
          expect(page).to have_content "公開年は4文字で入力してください"
        end
      end
    end

    describe "リンク先" do
      it "ドラマ管理ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "ドラマ管理ページへ戻る"
          expect(current_path).to eq admin_dramas_path
        end
      end

      it "管理者ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "管理者ページへ戻る"
          expect(current_path).to eq homes_path
        end
      end
    end
  end
end
