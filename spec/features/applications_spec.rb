require 'rails_helper'

feature 'application', type: :feature do
  describe "ヘッダー" do
    describe "検索" do
      describe "検索ワード有" do
        given!(:drama01) { create(:drama, name: "太陽の末裔") }
        given!(:drama02) { create(:drama, name: "トッケビ") }
        given!(:drama03) { create(:drama, name: "ボーイフレンド") }
        describe '検索結果有' do
          before do
            visit dramas_path
            fill_in 'keyword', with: "太陽の末裔"
            click_on "検索"
          end
          it '検索件数が登録ドラマ件数で表示されること' do
            within("div.search_drama") do
              expect(page).to have_content("検索結果:1件")
            end
          end

          it '検索ワードが表示されること' do
            within("div.search_drama") do
              expect(page).to have_content("太陽の末裔")
            end
          end

          it '検索結果が存在する場合ドラマ情報が表示されること' do
            within("div.drama_list") do
              expect(page).to have_content(drama01.name)
            end
          end

          it '検索結果以外のドラマ情報が表示されないこと' do
            within("div.drama_list") do
              expect(page).to_not have_content(drama02.name)
              expect(page).to_not have_content(drama03.name)
            end
          end

          it 'ドラマ一覧ページへのリンクが正しくされていること' do
            within("div.drama_list") do
            end
          end
        end
        describe '検索結果無' do
          before do
            visit dramas_path
            fill_in 'keyword', with: "梨泰院クラス"
            click_on "検索"
          end
          it '検索件数が登録0件で表示されること' do
            within("div.search_drama") do
              expect(page).to have_content("検索結果:0件")
            end
          end

          it '検索ワードが表示されること' do
            within("div.search_drama") do
              expect(page).to have_content("梨泰院クラス")
            end
          end

          it 'ドラマ情報が表示されないこと' do
            expect(page).to_not have_content(drama01.name)
            expect(page).to_not have_content(drama02.name)
            expect(page).to_not have_content(drama03.name)
          end

          it 'ドラマ一覧ページへのリンクが正しくされていること' do
            within("div.return_link_position") do
              click_on "一覧に戻る"
              expect(current_path).to eq dramas_path
            end
          end
        end
      end

      describe "検索ワード無" do
        given!(:drama01) { create(:drama, name: "太陽の末裔") }
        given!(:drama02) { create(:drama, name: "トッケビ") }
        given!(:drama03) { create(:drama, name: "ボーイフレンド") }
        before do
          visit dramas_path
          fill_in 'keyword', with: ""
          click_on "検索"
        end

        it '検索件数が登録ドラマ件数で表示されること' do
          within("div.search_drama") do
            expect(page).to have_content("検索結果:3件")
          end
        end

        it '全ドラマが表示されること' do
          expect(page.all('.drama_img').count).to eq 3
        end

        it 'ドラマタイトルが表示されること' do
          within("div.list") do
            expect(page).to have_content(drama01.name)
            expect(page).to have_content(drama02.name)
            expect(page).to have_content(drama03.name)
          end
        end

        it 'ドラマ画像が表示されること' do
          within("div.list") do
            expect(page).to have_selector("img,[src$='#{drama01.image.filename}']")
            expect(page).to have_selector("img,[src$='#{drama02.image.filename}']")
            expect(page).to have_selector("img,[src$='#{drama02.image.filename}']")
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

    describe "メニューバー" do
      describe "管理者ログイン" do
        given!(:admin) { create :user, :admin }
        given!(:drama) { create(:drama) }
        before do
          sign_in admin
          visit dramas_path
        end

        it '管理者ユーザーが表示されること' do
          within("div.header_name") do
            expect(page).to have_content(admin.name)
          end
        end

        it '管理者ユーザー用のナビバーが表示されること' do
          within("ul.header-nav-menu") do
            expect(page).to have_content("管理者ページ")
            expect(page).to have_content("ドラマ管理ページ")
            expect(page).to have_content("レビュー管理ページ")
            expect(page).to have_content("ログアウト")
          end
        end

        it '管理者ページのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "管理者ページ"
            expect(current_path).to eq homes_path
          end
        end

        it 'ドラマ管理ページのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "ドラマ管理ページ"
            expect(current_path).to eq admin_dramas_path
          end
        end

        it 'レビュー管理ページのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "レビュー管理ページ"
            expect(current_path).to eq comments_path
          end
        end

        it 'ログアウトのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "ログアウト"
            expect(current_path).to eq dramas_path
          end
        end
      end

      describe "一般ログイン" do
        given!(:general) { create :user, :general }
        given!(:drama) { create(:drama) }
        before do
          sign_in general
          visit dramas_path
        end

        it 'ログインユーザー表示されること' do
          within("div.header_name") do
            expect(page).to have_content(general.name)
          end
        end

        it '一般ユーザー用のナビバーが表示されること' do
          within("ul.header-nav-menu") do
            expect(page).to have_content("マイページ")
            expect(page).to have_content("アカウント編集")
            expect(page).to have_content("ログアウト")
          end
        end

        it 'マイページのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "マイページ"
            expect(current_path).to eq users_path
          end
        end

        it 'アカウント編集ページのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "アカウント編集"
            expect(current_path).to eq edit_user_path(general)
          end
        end

        it 'ログアウトのリンクが正しくされていること' do
          within("ul.header-nav-menu") do
            click_on "ログアウト"
            logout general
            binding.pry
            expect(page).to have_current_path(dramas_path)
            expect(current_path).to eq dramas_path
          end
        end
      end
    end

    describe 'ナビバー開閉（js）', js: true do
      describe "管理者ログイン" do
        given!(:admin) { create :user, :admin }
        given!(:drama) { create(:drama) }
        before do
          sign_in admin
          visit dramas_path
        end
        it 'クリックするとナビバーが表示されること' do
          expect(page).to_not have_text("管理者ページ")
          expect(page).to_not have_text("ドラマ管理ページ")
          expect(page).to_not have_text("レビュー管理ページ")
          expect(page).to_not have_text("ログアウト")
          find('.hamburger_wide').click
          expect(page).to have_text("管理者ページ")
          expect(page).to have_text("ドラマ管理ページ")
          expect(page).to have_text("レビュー管理ページ")
          expect(page).to have_text("ログアウト")
        end
      end

      describe "一般ログイン" do
        given!(:general) { create :user, :general }
        given!(:drama) { create(:drama) }
        before do
          sign_in general
          visit dramas_path
        end

        it 'クリックするとナビバーが表示されること' do
          expect(page).to_not have_text("マイページ")
          expect(page).to_not have_text("アカウント編集")
          expect(page).to_not have_text("ログアウト")
          find('.hamburger_wide').click
          expect(page).to have_text("マイページ")
          expect(page).to have_text("アカウント編集")
          expect(page).to have_text("ログアウト")
        end
      end
    end
  end
end
