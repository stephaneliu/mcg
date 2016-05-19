require 'rails_helper'

RSpec.describe 'users/index' do
  describe 'displays user list' do
    let(:user)             { create :user }
    let(:advisor)          { create :user, :advisor }
    let(:captain)          { create :user, :captain }
    let(:users)            { [user, advisor, captain] }
    let(:user_row_partial) { 'User row partial' }

    let(:roles) { User.assignable_roles }

    before do
      assign(:users, users)
      assign(:roles, roles)
      stub_template 'users/_user.html.haml' => user_row_partial
      render
    end

    it 'renders user partial' do
      expect(rendered =~ /#{user_row_partial}/).to be_truthy
    end

    it 'includes table heading' do
      expect(rendered).to have_selector(user_table_xpath(1, 1), text: '')
      expect(rendered).to have_selector(user_table_xpath(1, 2), text: 'Name')
      expect(rendered).to have_selector(user_table_xpath(1, 3), text: 'Email')
      expect(rendered).to have_selector(user_table_xpath(1, 4), text: 'Role')
      expect(rendered).to have_selector(user_table_xpath(1, 5), text: 'Email Confirmed?')
    end
  end

  def user_table_xpath(row, cell)
    "table.table.table-striped.user-list thead tr:nth-of-type(#{row}) th:nth-of-type(#{cell})"
  end
end
