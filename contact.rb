class Contact

  @@contacts = []
  @@id = 10000

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # a getter (*get* the value of an attribute)

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def id
    @id
  end

    # a setter (*set* the value of an attribute)
  def note=(note)
    @note = note
  end

  def email=(email)
    @email = email
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end


  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    contact_to_return = nil
    @@contacts.each do |contact|
      # puts "Logging out the current contact."
      # puts contact.full_name
      # puts contact.id
      if contact.id == id
        contact_to_return = contact
      end
    end
    return contact_to_return
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,value)
    if attribute == first_name
      @first_name = value
    elsif attribute == last_name
      @last_name = value
    elsif attribute == email
      @email = value
    elsif attribute == note
      @note = value
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(first_name)
    @@contacts.each do |contact|
      contact.first_name == first_name
      return contact.inspect
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
      @@contacts.clear
  end

  def full_name
     "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(id)
    @@contacts.delete_if do |contact|
      contact.id == id
    end
    return @@contacts
  end

  # Feel free to add other methods here, if you need them.

end

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
