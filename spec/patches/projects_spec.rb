require_relative '../spec_helper'

describe Project do
  describe 'class' do
    subject { Project }

    it { should respond_to :featured }
    it { should respond_to :not_featured }
  end
end
