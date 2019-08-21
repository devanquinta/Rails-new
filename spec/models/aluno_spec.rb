require 'rails_helper'


RSpec.describe Aluno, type: :model do

  describe 'validations' do
    it 'Valido' do
      aluno = Aluno.new
      aluno.id = 1
      aluno.nome = "João Barbosa"
      aluno.email = "joao@gmail.com"
    end
  end
end











=begin
RSpec.describe Aluno, type: :model do

  describe 'validations' do
    let(:user) { create :user }# factory usar
    subject { user }
    it { is_expected.to validate_presence_of(:matricula) }
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_presence_of(:email) }
    it 'é válido' do
# expect(subject).to be_valid
      expect(user).to be_valid
    end
  end
end

=end