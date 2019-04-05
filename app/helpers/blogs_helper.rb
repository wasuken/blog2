module BlogsHelper
  def from_root(path)
    ENV["RACK_ENV"] + path
  end
end
