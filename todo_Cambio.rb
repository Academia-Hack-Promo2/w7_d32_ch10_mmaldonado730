require 'httparty'

class Consumer
  include httparty  
  base_uri '45.55.172.121:3000/api/users'

  def list
    self.class.get('')
  end

  def get(identity)
    self.class.get('/' + identity.to_s)
  end

  def add(user)
    options = {body: user}
    self.class.post('', options)    
  end

  def edit(identity, user)
    options = {body: user}
    self.class.put('/'+ identity.to_s, options)
  end

  def delete(identity)
    self.class.delete('/' + identity.to_s)
  end

end

consumer = Consumer.new

consumer.add
{ 
  "identity" : "16433730", 
  "firstName" : "Marco", 
  "lastName" : "Maldonado", 
  "gender" : "male", 
  "email" : "maldonmarco@gmail.com", 
  "phone" : "04142555815" 
  
 }

puts consumer.list