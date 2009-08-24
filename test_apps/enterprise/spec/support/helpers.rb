def login(user = Factory(:user))
  @current_user = user
  activate_authlogic
  UserSession.create(user)
end

def current_user
  @current_user
end

def uploaded_file(path, content_type="application/octet-stream", filename=nil)
  filename ||= File.basename(path)
  t = Tempfile.new(filename)
  FileUtils.copy_file(path, t.path)
  (class << t; self; end;).class_eval do
    alias local_path path
    define_method(:original_filename) { filename }
    define_method(:content_type) { content_type }
  end
  return t
end