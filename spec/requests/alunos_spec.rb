require 'rails_helper'

RSpec.describe 'Página Inicial', type: :request do
  describe 'requests' do
    describe 'alunos#index' do
      before(:each) { get alunos_path }
      it { expect(response.code).to eq '200' }
    end
  end
end














=begin
begin
RSpec.describe "Alunos", type: :request do
  describe "GET /alunos" do
    it "Passou no request" do
      get alunos_path
      expect(response).to have_http_status(200)
    end
  end
end
end
end

