require 'rails_helper'

RSpec.describe ApplicationController do
  describe '#after_sign_in_path_for' do
    context 'when previous_url exists' do
      before             { @request.session[:previous_url] = previous_url }
      let(:previous_url) { 'home' }
      it                 { expect(subject.after_sign_in_path_for('')).to eq(previous_url) }
    end

    context 'when previous_url does not exist' do
      it { expect(subject.after_sign_in_path_for('')).to eq(dashboard_url) }
    end
  end

  describe '#after_sign_out_path_for' do
    it { expect(subject.after_sign_out_path_for('')).to eq(root_url) }
  end

  describe '#interacting_with_authentication' do
    context 'when request path includes users' do
      before { allow(controller.request).to receive(:fullpath).and_return('//users/sign_in') }
      it     { expect(subject.interacting_with_authentication).to eq(0) }
    end

    context 'when request path does not include users' do
      before { allow(controller.request).to receive(:fullpath).and_return('//path/to/resource') }
      it     { expect(subject.interacting_with_authentication).to eq(nil) }
    end
  end
end
