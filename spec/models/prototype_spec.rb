require 'rails_helper'
require 'pry'

RSpec.describe Prototype, type: :model do
  describe '#create' do
    #新規投稿の保存が出来る場合
    context 'can save' do
      #title, catch_copy, conceptがあれば保存出来る
      it 'is valid with title' do
        expect(build(:prototype)).to be_valid
      end
    end

    #新規投稿の保存が出来ない場合
    context 'can NOT save' do
      #case1 : no title entered
      it 'is invalid without title' do
        proto = build(:prototype, title: nil)
        proto.valid?
        expect(proto.errors[:title]).to include("translation missing: ja.activerecord.errors.models.prototype.attributes.title.blank")
      end
      #case2 : no catch_copy entered
      it 'is invalid without catch_copy' do
        proto = build(:prototype, catch_copy: nil)
        proto.valid?
        expect(proto.errors[:catch_copy]).to include("translation missing: ja.activerecord.errors.models.prototype.attributes.catch_copy.blank")
      end
      #case3 : no concept entered
      it 'is invalid without concept' do
        proto = build(:prototype, concept: nil)
        proto.valid?
        expect(proto.errors[:concept]).to include("translation missing: ja.activerecord.errors.models.prototype.attributes.concept.blank")
      end

      #case4 : no title, catch_copy, and concept entered
      it 'is invalid without title catch_copy, and concept' do
        proto = build(:prototype, title: nil, catch_copy: nil, concept: nil)
        proto.valid?
        # binding.pry
        # expect(proto.errors[:prototype].to include("translation missing: ja.activerecord.errors.models.prototype.attributes.concept.blank")
      end
    end
  end
end
