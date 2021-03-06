# == Schema Information
#
# Table name: items
#
#  id              :bigint(8)        not null, primary key
#  personalization :string
#  quantity        :integer
#  price           :decimal(, )
#  comment         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_id      :bigint(8)
#  buyable_type    :string
#  buyable_id      :bigint(8)
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to belong_to(:buyable) }
  it { is_expected.to belong_to(:product) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:price) }

  it {
    is_expected.to validate_length_of(:personalization).
      is_at_least(3).is_at_most(60).allow_nil.
      with_short_message('Votre message de personnalisation est trop court. Il doit contenir entre 3 et 60 caractères').
      with_long_message('Votre message de personnalisation est trop long. Il doit contenir entre 3 et 60 caractères')
  }

  it {
    is_expected.to validate_length_of(:comment).
      is_at_least(3).is_at_most(1000).allow_nil.
      with_short_message('Votre commentaire est trop court. Il doit contenir entre 3 et 1000 caractères').
      with_long_message('Votre commentaire est trop long. Il doit contenir entre 3 et 1000 caractères')
  }

  let(:item) { create(:item) }
  it 'is creatable' do
    expect{ item }.to change(Item, :count).by(1)
  end
end
