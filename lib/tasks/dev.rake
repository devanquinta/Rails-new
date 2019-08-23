namespace :dev do
  desc "Configuração de ambiente"
   task setup: :environment do
    if Rails.env.development?
     show_spinner("Apagando DB..") {%x(rails db:drop)}
     show_spinner("Criando DB..") {%x(rails db:create)}
     show_spinner("Migrando DB..") {%x(rails db:migrate)}

     %x(rails dev:add_mining_types)
     %x(rails dev:add_moedas)


     else
       puts "Voce não está em um ambiente de desenvolvimento!"
    end
   end


    ################################### rails db:rolback desfaz o banco e CRUD -- importante

    desc "Cadastra as moedas"
    task add_moedas: :environment do
      show_spinner("Cadastrando moedas...") do
        coins = [
            {
                # Campos tem que ser iguais ao do banco -- todos
                description: "Bitcoin",
                acronym: "BTC",
                url_image: "https://imagepng.org/wp-content/uploads/2017/06/moeda-bitcoin-coin.png",
                mining_type: MiningType.find_by(acronym: 'PoW')
            },
            {
                description: "Ethereum",
                acronym: "ETH",
                url_image: "https://www.infomoney.com.br/Assets/Images/crypto/eth_badge.png",
                mining_type: MiningType.all.sample
            },
            {
                description: "Dash",
                acronym: "DASH",
                url_image: "https://media.dash.org/wp-content/uploads/Dash-D-white_on_blue_circle.png",
                mining_type: MiningType.all.sample
            },
            {
                description: "Iota",
                acronym: "IOT",
                url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
                mining_type: MiningType.all.sample
            },
            {
                description: "ZCash",
                acronym: "ZEC",
                url_image: "https://www.cryptocompare.com/media/351360/zec.png",
                mining_type: MiningType.all.sample
            }

        ]

        coins.each do |coin|
          Moeda.find_or_create_by!(coin)
        end
      end
    end

    ######################################

    desc "Cadastra os tipos de mineração"
    task add_mining_types: :environment do
      show_spinner("Cadastrando tipos de mineração...") do
        mining_types = [
            {name: "Proof of Work", acronym: "PoW"},
            {name: "Proof of Stake", acronym: "PoS"},
            {name: "Proof of Capacity", acronym: "PoC"}
        ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
    end

  #########################################

   private

    def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
    end
   end

=begin

namespace :dev do
  desc "Configuração de ambiente"
  task setup: :environment do
    if Rails.env.development?
     show_spinner("Apagando DB..") {%x(rails db:drop)}


     show_spinner("Criando DB..") {%x(rails db:create)}


     show_spinner("Migrando DB..") {%x(rails db:migrate)}


     show_spinner("Inserindo  DB..moeda\n") {%x(rails db:seed)}


    else
      puts "Voce não está em um ambiente de desenvolvimento!"
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído")
     spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
     yield
     spinner.auto_spin
     spinner.success(msg_end)
  end #  yield
end


=end

