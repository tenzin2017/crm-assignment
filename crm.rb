require_relative 'contact'
require 'pry'

# puts "\e[H\e[2J"
class CRM

  def initialize(name)
      @name = name

  end

  def main_menu
    while true        # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit!
      # Finish off the rest for 3 through 6
      # To be clear, the methods add_new_contact and modify_existing_contact
      # haven't been implemented yet
      end
  end

  def add_new_contact
      print 'Enter First Name: '
      first_name = gets.chomp

      print 'Enter Last Name: '
      last_name = gets.chomp

      print 'Enter Email Address: '
      email = gets.chomp

      print 'Enter a Note: '
      note = gets.chomp

      Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
     puts 'Enter the ID number'
     id_number = gets.chomp.to_i
      contact = Contact.find(id_number)
    #  Contact.all.each do |contact|
    #    if contact.id == id_number
        print_select_list
        user_input = gets.to_i
        puts " what is the input"
        modify_list(user_input,contact)
  end

  def print_select_list
  puts '[1] First Name'
  puts '[2] Last Name'
  puts '[3] email'
  puts '[4] note'
  puts 'Enter Your Choice'
  end

  def modify_list(user_selected,contact)

    case user_selected
    when 1
      puts "Enter First Name"
      first_name = gets.chomp
      contact.first_name = first_name
    when 2
      puts "Enter Last Name"
      last_name = gets.chomp
      contact.last_name = last_name
    when 3
      puts "Enter email"
      email = gets.chomp
      contact.email = email
    when 4
      puts "Enter note"
      note = gets.chomp
      contact.note = note
    end

  end


  def delete_contact
   puts "Enter the ID number"
   user_input = gets.chomp.to_i
   Contact.all.delete_if do |contact|
     contact.id == user_input
   end
  end

  def display_all_contacts
      puts Contact.all.inspect
  end

  def search_by_attribute
   print_select_list
   user_input = gets.to_i
   puts search_by_choice(user_input).inspect

 end

 def search_by_choice(user_input)
   puts " Enter your search term"
   user_search_term = gets.chomp
   case user_input
   when 1
      Contact.all.each do |contact|
       if   contact.first_name == user_search_term
        return contact
      end
      end
   when 2
       Contact.all.each do |contact|
         contact.last_name == user_search_term
         return contact.inspect
       end
   when 3
       Contact.all.each do |contact|
         contact.email == user_search_term
         return email.inspect
       end
   when 4
       Contact.all.each do |contact|
         contact.note == user_search_term
         return note.inspect
       end
   end
   end


end

at_exit do
  ActiveRecord::Base.connection.close
end



a_crm_app = CRM.new("My CRM app")
a_crm_app.main_menu
# a_crm_app.search_by_choice(1)
