class PostmanWorker < Delayed::Worker
  
  attr_accessor :called_method
  attr_accessor :args
  
  def initialize(called_method, *args)
    self.called_method = called_method
    self.args = *args
  end
  
  perform do
    Postman.send(self.called_method, self.args)
  end
  
end