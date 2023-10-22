EMAIL = "bude@yahoo.com"
PASSWORD = "gobude"
PASSWORD_VAULT = {aws:{username:"farha", password:"GOBUDE"}} #nasted hash

def wlc_msg
  puts "welcome to programm Manager"
end  

def prompt_user_for_email
  puts "Please sign in to continue"  
  print "Enter Email:"
  gets.chomp #to store the EMAIL& remove newline chr
end  


def verify_email(user_email)
  if user_email != EMAIL
    puts "Invalid Email"
    exit
  end
end

def prompt_user_for_pass
  print"Enter your password:"
  gets.chomp
end  




def verify_user_pass(user_pass)
  if user_pass != PASSWORD
    puts"Invalid password"
    exit
  end
end 


def greet_user(user_email)
  puts "Hello, #{user_email}"
  puts "Enter Your choice:"
end

def menue_options
  puts "1.Add new service credentials "
  puts "2.Retrieve an existing service’s credentials"
  puts "3.Exit"
end

def get_selection  
  gets.chomp # local var to store user choice
end


def handle_user_selection(user_sele)
  case user_sele 
  when "1"
    new_service = set_new_service_name
    set_username_for(new_service)
    set_pass_for(new_service)

  when "2"
    requested_service_name = retrieve_service_name
    credentials=retrieve_service_credentials(requested_service_name) 
    #to_sym is a method to cinvert string into symbol as it is       immutable, once is created it cannot be modified, and in           comparison they faster than string.
    display_service_credentials(requested_service_name, credentials)  
  else
   exit_program
  end 
end 




###Methods

def set_new_service_name
  print "Enter the name of service:" #this case to create a new     credential
  new_ser = gets.chomp #for storing
  PASSWORD_VAULT[new_ser.to_sym] = {}#here we assign a new key     to the hash and this hash points to an empy value
  new_ser
end  

def set_username_for(service)
  print "Enter UserName: "
  new_ser_username = gets.chomp #local var to store username
  PASSWORD_VAULT[service.to_sym][:username]= new_ser_username       #here we assign a new hash for the user, and the value is the     input for the user
end  


def set_pass_for(service)
  print "Please Enter your password: "
  new_ser_password = gets.chomp #local var to store the pass
  PASSWORD_VAULT[service.to_sym][:password]= new_ser_password
end  


def retrieve_service_name
  print "Enter the name service you want to access:"
  gets.chomp
end  


def retrieve_service_credentials(service_name)
  PASSWORD_VAULT[service_name.to_sym]
end  


def display_service_credentials(service_name, credentials)
  puts "here are the credentials for #{service_name}:"   
  #to iterate into hash for printing the info from hash
  credentials.each do |key,value|
    puts "#{key}: #{value}"
  end
end  


def exit_program
  puts "Existing the program, GoodBye."
  exit
end


wlc_msg
user_email = prompt_user_for_email
verify_email(user_email)
user_pass = prompt_user_for_pass
verify_user_pass(user_pass)
greet_user(user_email)

loop do
  menue_options
  user_sele = get_selection
  handle_user_selection(user_sele)
end 



  
  
  