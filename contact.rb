gem 'activerecord', '=4.2.9'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

    field :first_name, as: :string
    field :last_name, as: :string
    field :email, as: :string
    field :note, as: :text

  def full_name
     "#{first_name} #{last_name}"
  end


end

Contact.auto_upgrade!




contact1 = Contact.create('Lobsang','Tenzin','tenzin@gmail.com',"WD")
contact2 = Contact.create('Dolma','Sonam','sonam@gmail.com',"loves music")
contact3 = Contact.create('Will','Smith','smith2018@gmail.com',"Star")
contact4 = Contact.create('Lobsang','Dharggyal','Dharggyal@gmail.com',"hi")
contact5 = Contact.create('Tenzin','Wangchuk','wangchuk@gmail.com',"teacher")
# puts Contact.all.inspect
puts Contact.all.inspect
# puts Contact.all.inspect
# puts contact5.first_name = "jack"
# puts contact5.inspect
