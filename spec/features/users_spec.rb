require 'rails_helper'

feature 'users', type: :feature do
  describe 'ログイン前' do
    describe '新規登録' do
      given(:general) { create :user, :general }

      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功すること' do
          visit new_user_registration_path
          fill_in 'user_name', with: "test0"
          fill_in 'user_email', with: "test0@example.com"
          fill_in 'user_password', with: "password"
          fill_in 'user_password_confirmation', with: "password"
          click_button '登録'
          expect(current_path).to eq dramas_path
          expect(page).to have_content "アカウント登録が完了しました。"
        end
      end

      context 'メールアドレス未記入' do
        it 'ユーザーの新規作成が失敗すること' do
          visit new_user_registration_path
          fill_in 'user_name', with: "test0"
          fill_in 'user_password', with: "password"
          fill_in 'user_password_confirmation', with: "password"
          click_button '登録'
          expect(current_path).to eq users_path
          expect(page).to have_content " ユーザー は保存されませんでした。"
        end
      end

      context '登録済メールアドレス' do
        it 'ユーザーの新規作成が失敗すること' do
          visit new_user_registration_path
          fill_in 'user_name', with: "test0"
          fill_in 'user_email', with: general.email
          fill_in 'user_password', with: "password"
          fill_in 'user_password_confirmation', with: "password"
          click_button '登録'
          expect(current_path).to eq users_path
          expect(page).to have_content " ユーザー は保存されませんでした。"
          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end

      context '名前未記入' do
        it 'ユーザーの新規作成が失敗すること' do
          visit new_user_registration_path
          fill_in 'user_email', with: "test0@example.com"
          fill_in 'user_password', with: "password"
          fill_in 'user_password_confirmation', with: "password"
          click_button '登録'
          expect(current_path).to eq users_path
          expect(page).to have_content " ユーザー は保存されませんでした。"
          expect(page).to have_content "名前を入力してください"
        end
      end
    end

    describe 'ログイン' do
      given(:general) { create :user, :general }

      context 'フォームの入力値が正常' do
        it 'ログインが成功すること' do
          visit new_user_session_path
          fill_in 'user_email', with: general.email
          fill_in 'user_password', with: general.password
          click_button 'ログイン'
          expect(current_path).to eq dramas_path
          expect(page).to have_content "ログインしました。"
        end
      end

      context 'メールアドレス間違い' do
        it 'ログインが失敗すること' do
          visit new_user_session_path
          fill_in 'user_email', with: "test0@example.com"
          fill_in 'user_password', with: general.password
          click_button 'ログイン'
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content "メールアドレスまたはパスワードが違います。"
        end
      end

      context 'パスワード間違い' do
        it 'ログインが失敗すること' do
          visit new_user_session_path
          fill_in 'user_email', with: general.email
          fill_in 'user_password', with: ""
          click_button 'ログイン'
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content "メールアドレスまたはパスワードが違います。"
        end
      end
    end

    describe '管理者ログイン' do
      given(:admin) { create :user, :admin }

      context 'フォームの入力値が正常' do
        it '管理画面へ遷移すること' do
          visit new_user_session_path
          fill_in 'user_email', with: admin.email
          fill_in 'user_password', with: admin.password
          click_button 'ログイン'
          expect(current_path).to eq homes_path
          expect(page).to have_content "ログインしました。"
        end
      end
    end
  end

  describe 'ログイン後' do
    describe 'ユーザーマイページ' do
      given(:general) { create :user, :general }
      given(:drama) { create(:drama) }
      given(:comment) { create(:comment) }
      given(:favorite) { create(:favorite, user_id: general.id, drama_id: drama.id) }
      before do
        sign_in general
        general.comments << comment
        drama.comments << comment
        visit users_path
      end

      it 'ユーザー編集ページへのリンクが正しくされていること' do
        within("div.mypage_btn") do
          click_on "編集"
          expect(current_path).to eq edit_user_path(general)
        end
        expect(page).to have_content("プロフィール編集")
        expect(page).to have_content(general.name)
        expect(page).to have_content(general.profile)
      end

      it '自分がしたお気に入り一覧が正しく表示されていること' do
        general.favorites.each{|favorite|
          expect(page).to have_content(favorite.drama.name)
          expect(page).to have_selector("img,[src$='#{favorite.drama.image.filename}']")
        }
      end

      it '自分がしたレビュー一覧が正しく表示されていること' do
        general.comments.each{|comment|
          expect(page).to have_content(comment.content)
          expect(page).to have_content(comment.drama.name)
          expect(page).to have_selector("img,[src$='#{comment.drama.image.filename}']")
        }
      end
    end

    describe 'ユーザー情報編集ページ' do
      given(:general) { create :user, :general }
      before do
        sign_in general
        visit edit_user_path(general)
      end

      context 'フォームの入力値が正常' do
        it 'プロフィール更新が成功すること' do
          fill_in 'user_name', with: "ぶた"
          fill_in 'user_profile', with: "ぶたです"
          attach_file "user_image", "spec/fixtures/files/pig_img.png"
          click_button '更新'
          expect(current_path).to eq users_path
          expect(page).to have_content "プロフィールを更新しました"
          expect(page).to have_content "ぶた"
          expect(page).to have_content "ぶたです"
          expect(page).to have_selector("img[src$='pig_img.png']")
          expect(page).to_not have_content "general"
        end
      end

      context '名前未記入' do
        it 'プロフィール更新が失敗すること' do
          fill_in 'user_name', with: ""
          fill_in 'user_profile', with: "ぶたです"
          attach_file "user_image", "spec/fixtures/files/pig_img.png"
          click_button '更新'
          expect(current_path).to eq "/users/#{general.id}"
          expect(page).to have_content "プロフィールを更新できませんでした"
        end
      end
    end
  end
end
