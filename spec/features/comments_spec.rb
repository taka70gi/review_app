require 'rails_helper'

feature 'comment', type: :feature do
  describe "レビュー管理ページ" do
    describe "レビューが存在" do
      given!(:admin) { create :user, :admin }
      given!(:user01) { create :user, name: "ユーザー１" }
      given!(:user02) { create :user, name: "ユーザー2" }
      given!(:drama01) { create(:drama) }
      given!(:drama02) { create(:drama) }
      given!(:comment01) { create(:comment, user_id: user01.id, drama_id: drama01.id) }
      given!(:comment02) { create(:comment, user_id: user02.id, drama_id: drama02.id) }

      before do
        sign_in admin
        visit comments_path
      end

      it '登録されているレビューが全て表示されること' do
        within("table.admin_index") do
          expect(page).to have_content(comment01.content)
          expect(page).to have_content(comment02.content)
        end
      end

      it 'レビューに対応するユーザーが表示されること' do
        within("table.admin_index") do
          expect(page).to have_content(comment01.user.name)
          expect(page).to have_content(comment02.user.name)
        end
      end

      it 'レビューに対応するドラマタイトル・画像が表示されること' do
        within("table.admin_index") do
          expect(page).to have_content(comment01.drama.name)
          expect(page).to have_content(comment02.drama.name)
          expect(page).to have_selector("img,[src$='#{comment01.drama.image.filename}']")
          expect(page).to have_selector("img,[src$='#{comment02.drama.image.filename}']")
        end
      end

      it '削除後、管理者ページへのリンクが正しくされていること' do
        within("table.admin_index") do
          click_on "削除", match: :first
          expect(current_path).to eq comments_path
        end
      end

      it '管理者ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "管理者ページへ戻る", match: :first
          expect(current_path).to eq homes_path
        end
      end
    end

    describe "レビューが非存在" do
      given!(:admin) { create :user, :admin }
      before do
        sign_in admin
        visit comments_path
      end

      it '削除が表示されていないこと' do
        expect(page).not_to have_content '削除'
      end

      it '管理者ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "管理者ページへ戻る", match: :first
          expect(current_path).to eq homes_path
        end
      end
    end
  end

  describe "レビュー新規作成ページ" do
    context 'フォームの入力値が正常' do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      before do
        sign_in general
        visit new_comment_path(id: drama.id)
      end

      it 'ドラマ詳細画面へ遷移すること' do
        fill_in 'comment_content', with: "テストデータを投稿しました"
        click_button 'レビューを投稿'
        expect(current_path).to eq drama_path(drama)
        expect(page).to have_content "レビューを投稿しました"
      end

      it 'ドラマタイトルが表示されること' do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it 'ドラマ画像が表示されること' do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it 'ドラマ詳細ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq drama_path(drama)
        end
      end

      it 'ドラマ一覧ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end

    context 'レビュー未入力' do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      before do
        sign_in general
        visit new_comment_path(id: drama.id)
      end

      it 'レビュー新規作成ページへ遷移すること' do
        fill_in 'comment_content', with: ""
        click_button 'レビューを投稿'
        expect(page).to have_content "レビューを投稿できませんでした"
      end

      it 'ドラマタイトルが表示されること' do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it 'ドラマ画像が表示されること' do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it 'ドラマ詳細ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq drama_path(drama)
        end
      end

      it 'ドラマ一覧ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end
  end

  describe "レビュー更新ページ" do
    context 'フォームの入力値が正常' do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      given!(:comment) { create(:comment, user_id: general.id, drama_id: drama.id) }
      before do
        sign_in general
        visit edit_comment_path(comment)
      end

      it 'マイページへ遷移すること' do
        fill_in 'comment_content', with: "テストデータを投稿しました"
        click_button 'レビューを投稿'
        expect(current_path).to eq user_path(general)
        expect(page).to have_content "レビューを更新しました"
      end

      it 'ドラマタイトルが表示されること' do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it 'ドラマ画像が表示されること' do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it 'マイページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq user_path(general)
        end
      end

      it 'ドラマ一覧ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end

    context 'レビュー未入力' do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      given!(:comment) { create(:comment, user_id: general.id, drama_id: drama.id) }
      before do
        sign_in general
        visit edit_comment_path(comment)
      end

      it 'マイページへ遷移すること' do
        fill_in 'comment_content', with: ""
        click_button 'レビューを投稿'
        expect(page).to have_content "レビューを更新できませんでした"
      end

      it 'ドラマタイトルが表示されること' do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it 'ドラマ画像が表示されること' do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it 'マイページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "戻る"
          expect(current_path).to eq user_path(general)
        end
      end

      it 'ドラマ一覧ページへのリンクが正しくされていること' do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end
  end
end
