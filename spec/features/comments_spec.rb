require "rails_helper"

feature "comment", type: :feature do
  describe "レビュー新規作成ページ" do
    context "フォームの入力値が正常" do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      before do
        sign_in general
        visit new_comment_path(id: drama.id)
      end

      it "ドラマ詳細画面へ遷移すること" do
        fill_in "comment_content", with: "テストデータを投稿しました"
        click_button "レビューを投稿"
        expect(current_path).to eq drama_path(drama)
        expect(page).to have_content "レビューを投稿しました"
      end

      it "ドラマタイトルが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマ画像が表示されること" do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it "ドラマ詳細ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq drama_path(drama)
        end
      end

      it "ドラマ一覧ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end

    context "レビュー未入力" do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      before do
        sign_in general
        visit new_comment_path(id: drama.id)
      end

      it "レビュー新規作成ページへ遷移すること" do
        fill_in "comment_content", with: ""
        click_button "レビューを投稿"
        expect(page).to have_content "レビューを投稿できませんでした"
      end

      it "ドラマタイトルが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマ画像が表示されること" do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it "ドラマ詳細ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq drama_path(drama)
        end
      end

      it "ドラマ一覧ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end
  end

  describe "レビュー更新ページ" do
    context "フォームの入力値が正常" do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      given!(:comment) { create(:comment, user_id: general.id, drama_id: drama.id) }
      before do
        sign_in general
        visit edit_comment_path(comment)
      end

      it "マイページへ遷移すること" do
        fill_in "comment_content", with: "テストデータを投稿しました"
        click_button "レビューを投稿"
        expect(current_path).to eq user_path(general)
        expect(page).to have_content "レビューを更新しました"
      end

      it "ドラマタイトルが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマ画像が表示されること" do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it "マイページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq user_path(general)
        end
      end

      it "ドラマ一覧ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end

    context "レビュー未入力" do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      given!(:comment) { create(:comment, user_id: general.id, drama_id: drama.id) }
      before do
        sign_in general
        visit edit_comment_path(comment)
      end

      it "マイページへ遷移すること" do
        fill_in "comment_content", with: ""
        click_button "レビューを投稿"
        expect(page).to have_content "レビューを更新できませんでした"
      end

      it "ドラマタイトルが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマ画像が表示されること" do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it "マイページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq user_path(general)
        end
      end

      it "ドラマ一覧ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end
  end
end
