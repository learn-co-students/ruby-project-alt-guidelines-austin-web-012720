require "tty-prompt"

class User < ActiveRecord::Base

  has_many :schedules, :dependent => :delete_all
  has_many :events, through: :schedules

  def self.login_or_create_user
    puts "\nMake a selection:
    1. Returning User - Login
    2. New User - Create Profile
    ".colorize(:cyan)
    selection = gets.chomp
    if selection == "1" 
        User.enter_email
    elsif selection == "2" 
        User.create_user
    else
      login_or_create_user
    end
  end

  def self.enter_email 
    print "Enter your email:".colorize(:blue)
        email = gets.chomp
        if user = User.find_by(email_address: email)
            User.enter_password(user)
        else
            puts "\nInvalid Email".colorize(:red)
            User.login_or_create_user
        end
    end

  def self.enter_password(user)
    prompt = TTY::Prompt.new
    password = prompt.mask("\nEnter password:".colorize(:blue))
      if user.password == password
        puts "\nSuccess! Hi #{user.first_name} #{user.last_name}!".colorize(:green)
        return user
      else
      puts "Error: Invalid Password".colorize(:red)
          User.enter_password(user)
      end
  end

  def self.create_user
    print "\nEnter your first name: ".colorize(:purple)
        first_name = gets.chomp     
    print "Enter your last name: ".colorize(:purple)
        last_name = gets.chomp
    
    email = nil
    loop do   ### new
      print "Enter your email: ".colorize(:purple)
      email = gets.chomp
      break if validate_email(email)
    end

    prompt = TTY::Prompt.new 
    password = prompt.mask("Enter a password: ".colorize(:purple))
    user = User.create(first_name: first_name, last_name: last_name, email_address: email, password: password)
    puts "\nSaved! Welcome to Do512".colorize(:green)
    return user
  end

  def self.update_email(cur_user)
    puts "Enter your new email address:".colorize(:blue)
    email = gets.chomp
    cur_user.update(email_address: email)
    puts "Email address updated!".colorize(:green)
    
   end

   def self.validate_email(email)                   ####  New!!!
    if User.all.exists?(email_address: email) 
      puts "Email already exists. Try again!\n".colorize(:red)
      false
    else
      true
    end
   end

   def self.update_password(cur_user)
    prompt = TTY::Prompt.new
    password = prompt.mask("Enter a new password: ").colorize(:blue)
    cur_user.password = password
   end

   def self.delete_user(cur_user)
    User.delete(cur_user)
    puts "Deleted current user".colorize(:purple)
   end

   def self.list_users
    puts "\nAll Registered Users\n"
    User.all.each.with_index(1) do |user, index|
      puts "#{index}. #{user.first_name} #{user.last_name}"
    end
  end

end