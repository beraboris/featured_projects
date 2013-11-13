require_relative '../spec_helper'

describe Project do
  subject { FactoryGirl.create :project }

  it { should respond_to :is_featured }
  it { should respond_to :is_featured= }

  describe 'class' do
    subject { Project }

    it { should respond_to :featured }
    it { should respond_to :not_featured }

    context 'with a featured project' do
      let!(:project) { FactoryGirl.create :featured_project }
      
      describe '#featured' do
        subject { Project.featured }

        it { should_not be_empty }
        it { should include project }
      end

      describe '#not_featured' do
        subject { Project.not_featured }

        it { should be_empty }
      end
    end

    context 'with a not featured project' do
      let!(:project) { FactoryGirl.create :not_featured_project }
      
      describe '#featured' do
        subject { Project.featured }

        it { should be_empty }
      end

      describe '#not_featured' do
        subject { Project.not_featured }

        it { should_not be_empty }
        it { should include project }
      end
    end
  end
end
