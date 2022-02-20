require "rails_helper"

feature "drama", type: :feature do
  describe "ドラマ一覧ページ" do
    given!(:drama01) { create(:drama, name: "太陽の末裔") }
    given!(:drama02) { create(:drama, name: "トッケビ") }
    given!(:drama03) { create(:drama, name: "ボーイフレンド") }
    before do
      visit dramas_path
    end

    it "ドラマタイトルが表示されること" do
      within("div.list") do
        expect(page).to have_content(drama01.name)
        expect(page).to have_content(drama02.name)
        expect(page).to have_content(drama03.name)
      end
    end

    it "ドラマ画像が表示されること" do
      within("div.list") do
        expect(page).to have_selector("img,[src$='#{drama01.image.filename}']")
        expect(page).to have_selector("img,[src$='#{drama02.image.filename}']")
        expect(page).to have_selector("img,[src$='#{drama02.image.filename}']")
      end
    end

    it "ドラマ編集ページへのリンクが正しくされていること" do
      within("div.list") do
        click_on "dramas-img", match: :first
        expect(current_path).to eq drama_path(drama01)
      end
    end

    it "登録ドラマが３つ取得されていること" do
      expect(page.all(".drama_list").count).to eq 3
    end
  end

  describe "ドラマ詳細ページ" do
    describe "ログイン前" do
      given!(:general) { create :user, :general }
      given!(:drama) { create(:drama) }
      given!(:comment) { create(:comment) }
      given!(:favorite) { create(:favorite, user_id: general.id, drama_id: drama.id) }
      before do
        drama.comments << comment
        visit drama_path(drama)
      end

      it "ドラマ画像が表示されること" do
        within("div.drama_left") do
          expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
        end
      end

      it "ドラマタイトルが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.name)
        end
      end

      it "ドラマあらすじが表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.summary)
        end
      end

      it "ドラマ出演者が表示されること" do
        within("div.drama_right") do
          expect(page).to have_content(drama.cast)
        end
      end

      it "お気に入り登録を押すとログインページへのリンクが正しくされていること" do
        within("div.drama_right") do
          click_on "お気に入り"
          expect(current_path).to eq new_user_session_path
        end
      end

      it "レビュー投稿を押すとログインページへのリンクが正しくされていること" do
        within("div.drama_right") do
          click_on "レビューを投稿"
          expect(current_path).to eq new_user_session_path
        end
      end

      it "レビューが表示されること" do
        within("table.review_table") do
          drama.comments.each{|drama_comment|
            expect(page).to have_content(drama_comment.content)
          }
        end
      end

      it "レビュー記載者情報が表示されること" do
        within("table.review_table") do
          drama.comments.each{|drama_comment|
            expect(page).to have_content(drama_comment.user.name)
          expect(page).to have_selector("img,[src$='#{drama_comment.user.image.filename}']")
          }
        end
      end

      it "ドラマ一覧ページへのリンクが正しくされていること" do
        within("div.return_link_position") do
          click_on "一覧に戻る"
          expect(current_path).to eq dramas_path
        end
      end
    end

    describe "ログイン後" do
      describe "管理者" do
        given(:admin) { create :user, :admin }
        given(:general) { create :user, :general }
        given!(:drama) { create(:drama) }
        given!(:comment) { create(:comment) }
        given!(:favorite) { create(:favorite, user_id: general.id, drama_id: drama.id) }
        before do
          sign_in admin
          drama.comments << comment
          visit drama_path(drama)
        end

        it "お気に入り・レビュー投稿が表示されていないこと" do
          expect(page).to_not have_content("レビューを投稿")
          expect(page).to_not have_content("お気に入り登録")
        end

        it "ドラマ画像が表示されること" do
          within("div.drama_left") do
            expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
          end
        end

        it "ドラマタイトルが表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.name)
          end
        end

        it "ドラマあらすじが表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.summary)
          end
        end

        it "ドラマ出演者が表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.cast)
          end
        end

        it "レビューが表示されること" do
          within("table.review_table") do
            drama.comments.each{|drama_comment|
              expect(page).to have_content(drama_comment.content)
            }
          end
        end

        it "レビュー記載者情報が表示されること" do
          within("table.review_table") do
            drama.comments.each{|drama_comment|
              expect(page).to have_content(drama_comment.user.name)
            expect(page).to have_selector("img,[src$='#{drama_comment.user.image.filename}']")
            }
          end
        end

        it "ドラマ一覧ページへのリンクが正しくされていること" do
          within("div.return_link_position") do
            click_on "一覧に戻る"
            expect(current_path).to eq dramas_path
          end
        end
      end

      describe "一般" do
        given(:general) { create :user, :general }
        given!(:drama) { create(:drama) }
        given!(:comment) { create(:comment) }
        given!(:favorite) { create(:favorite, user_id: general.id, drama_id: drama.id) }
        before do
          sign_in general
          drama.comments << comment
          visit drama_path(drama)
        end

        it "ドラマ画像が表示されること" do
          within("div.drama_left") do
            expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
          end
        end

        it "ドラマタイトルが表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.name)
          end
        end

        it "ドラマあらすじが表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.summary)
          end
        end

        it "ドラマ出演者が表示されること" do
          within("div.drama_right") do
            expect(page).to have_content(drama.cast)
          end
        end

        it "レビュー投稿ページへのリンクが正しくされていること" do
          within("div.drama_right") do
            click_on "レビューを投稿"
            expect(current_path).to eq new_comment_path
          end
        end

        it "レビューが表示されること" do
          within("table.review_table") do
            drama.comments.each{|drama_comment|
              expect(page).to have_content(drama_comment.content)
            }
          end
        end

        it "レビュー記載者情報が表示されること" do
          within("table.review_table") do
            drama.comments.each{|drama_comment|
              expect(page).to have_content(drama_comment.user.name)
            expect(page).to have_selector("img,[src$='#{drama_comment.user.image.filename}']")
            }
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
end
