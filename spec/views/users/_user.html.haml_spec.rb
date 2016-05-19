require 'rails_helper'

RSpec.describe 'users/_user' do
  describe 'rendering' do
    let(:users) { [build_stubbed(:user), build_stubbed(:user, :captain)] }

    before { render partial: 'user', collection: users }

    it 'is successful' do
      users.each_with_index do |user, index|
        row = index + 1
        expect(rendered).to have_css("#{user_table_xpath(row, 1)} i.fa.fa-pencil")
        expect(rendered).to have_selector(user_table_xpath(row, 2), text: user.name)
        expect(rendered).to have_selector(user_table_xpath(row, 3), text: user.email)
        expect(rendered).to have_selector(user_table_xpath(row, 4), text: user.role)
        expect(rendered).to have_selector(user_table_xpath(row, 5), text: user.confirmed?)
      end
    end
  end

  def user_table_xpath(row, cell)
    "tr:nth-of-type(#{row}) td:nth-of-type(#{cell})"
  end
end
