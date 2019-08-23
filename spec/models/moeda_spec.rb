#TESTE DE MODELO
#TESTA VALIDAÇÕES, ASSOCIAÇÕES, MÉTODOS
#
#*****************VALIDAÇÕES ************************
# Olhar as validações do model
# Valida se os campos estão preechidos
RSpec.describe Moeda, type: :model do
      describe 'VALIDAÇÃO' do
        let!(:moeda) { FactoryBot.create :moeda }
        subject { moeda }
        it { is_expected.to validate_presence_of(:description) }
        it { is_expected.to validate_presence_of(:acronym) }
        it { is_expected.to validate_presence_of(:url_image) }
        it 'é válido' do
# expect(subject).to be_valid
          expect(moeda).to be_valid
        end
      end
end


