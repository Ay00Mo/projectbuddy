require 'rails_helper'

RSpec.describe 'MyPage', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @case = FactoryBot.create(:case, reference_number: 'Ref#001', instruction_date: nil, user: @user, internal_contact: @user)
    page.driver.browser.authorize(ENV['BASIC_AUTH_USER'], ENV['BASIC_AUTH_PASSWORD'])
    sign_in @user
    visit user_path(@user.id)
  end

  context '案件番号のリンク' do
    it 'クリックすると案件詳細ページに遷移する' do
      expect(page).to have_link('Ref#001', href: case_path(@case))
      click_link 'Ref#001'
      expect(page).to have_current_path(case_path(@case))
    end
  end

  context 'ログインしている場合のマイページ' do
    it 'マイページに遷移できる' do
      expect(page).to have_content('未処理案件一覧')
    end
  end

  context 'ログインしている場合のみマイページに遷移できること' do
    it 'マイページに遷移できる' do
      visit user_path(@user.id)
      expect(page).to have_content('未処理案件一覧')
    end
  end
end
