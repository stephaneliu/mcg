require 'rails_helper'

RSpec.describe 'users/index' do
  describe 'displays user list' do
    let(:user)    { create :user }
    let(:advisor) { create :user, :advisor }
    let(:captain) { create :user, :captain }
    let(:users)   { [user, advisor, captain] }

    let(:roles)   { User.assignable_roles }

    before do
      assign(:users, users)
      assign(:roles, roles)
      render
    end

    it 'includes table heading' do
      expect(rendered).to have_selector(user_table_xpath(1, 1, 'thead'), text: 'Name')
      expect(rendered).to have_selector(user_table_xpath(1, 2, 'thead'), text: 'Email')
      expect(rendered).to have_selector(user_table_xpath(1, 3, 'thead'), text: 'Email Confirmed?')
      expect(rendered).to have_selector(user_table_xpath(1, 4, 'thead'), text: 'Role')
    end

    it 'in a striped table' do
      users.each_with_index do |user, index|
        row = index + 1
        expect(rendered).to have_link('Edit', href: edit_user_path(user))
        expect(rendered).to have_selector(user_table_xpath(row, 2), text: user.name)
        expect(rendered).to have_selector(user_table_xpath(row, 3), text: user.email)
        expect(rendered).to have_selector(user_table_xpath(row, 4), text: user.confirmed?)
        expect(rendered).to have_selector(user_table_xpath(row, 5), text: user.role)
      end
    end
  end

  def user_table_xpath(row, cell, section = 'tbody')
    row_element = (section == 'tbody') ? 'td' : 'th'

    "table.table.table-striped.user-list #{section} tr:nth-of-type(#{row})\
    #{row_element}:nth-of-type(#{cell})"
  end
end
