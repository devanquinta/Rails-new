class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.integer :matricula
      t.string :nome
      t.string :email
      t.timestamps
    end
  end
end
