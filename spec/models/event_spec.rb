require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    specify { expect(subject).to validate_presence_of(:name) }

    context 'starts_before_ends' do
      let(:ends) { 2.days.from_now }

      subject { build(:event, starts: starts, ends: ends) }

      context 'when starts is nil' do
        let(:starts) { nil }

        specify do
          subject.valid?
          expect(subject.errors[:starts].size).to eq(0)
        end
      end

      context 'when ends is nil' do
        let(:starts) { Time.zone.now }
        let(:ends)   { nil }

        specify do
          subject.valid?
          expect(subject.errors[:starts].size).to eq(0)
        end
      end

      context 'when starts and ends is nil' do
        let(:starts) { nil }
        let(:ends)   { nil }

        specify do
          subject.valid?
          expect(subject.errors[:starts].size).to eq(0)
        end
      end

      context 'starts is before ends' do
        let(:starts) { Time.zone.now }

        specify do
          subject.valid?
          expect(subject.errors[:starts].size).to eq(0)
        end
      end

      context 'starts is after ends' do
        let(:starts) { ends + 1.day }

        specify do
          subject.valid?
          expect(subject.errors[:starts].size).to eq(1)
          expect(subject.errors[:starts].first).to eq('cannot be after ends')
        end
      end
    end
  end

  describe "when 'starts' not provided" do
    let(:event_without_starts) { build(:event, starts: nil) }
    let(:populated_starts) { Time.zone.now }

    before do
      Timecop.freeze(populated_starts) do
        event_without_starts.save
      end
    end

    specify { expect(event_without_starts.starts).to eq(populated_starts) }
  end

  describe 'scopes' do
    describe 'active' do
      let!(:past_event)    { create(:event, name: 'past', ends: 1.day.ago) }
      let!(:present_event) { create(:event, name: 'present', ends: 1.hour.from_now) }
      let!(:future_event)  { create(:event, name: 'future', ends: 1.day.from_now) }

      subject { described_class.active.pluck(:name) }
      specify do
        expect(subject.size).to eq(2)
        is_expected.to include present_event.name
        is_expected.to include future_event.name
        is_expected.to_not include past_event.name
      end
    end
  end

  describe 'time_before_event' do
  end
end
